# Testing Guide & Test Evidence

> Part 1 shows **how** to test a networked system. Part 2 is **your evidence** — graded under B1/B2.
> All results must come from actually running your system (see `INSTRUCTION.md` §7).

---

## Part 1 — How to Test

### 1.1 Manual testing with raw tools

Talk to the server directly before the client exists:

```bash
nc localhost 5000            # TCP
nc -u localhost 5000         # UDP
# then type a message in your protocol, e.g.:
{"command": "PING", "requestId": "1", "payload": {}}
```

`telnet localhost 5000` also works for TCP text protocols.

### 1.2 Concurrency / load test

Prove the server serves many clients at once. Example script (adapt the message to your protocol and framing):

```python
# tests/load_test.py — run on the host while the server is up
import os, socket, threading, time

HOST = os.getenv("CLIENT_TARGET_HOST", "localhost")
PORT = int(os.getenv("CLIENT_TARGET_PORT", "5000"))
N = int(os.getenv("N_CLIENTS", "50"))
results = []

def client(i):
    start = time.time()
    try:
        with socket.create_connection((HOST, PORT), timeout=5) as s:
            s.sendall(b'{"command": "PING", "requestId": "%d", "payload": {}}\n' % i)
            data = s.recv(4096)          # a real client must loop until a full frame arrives
            results.append((i, True, time.time() - start, data[:60]))
            time.sleep(2)                # hold the connection open to overlap with others
    except Exception as e:
        results.append((i, False, time.time() - start, str(e)))

threads = [threading.Thread(target=client, args=(i,)) for i in range(N)]
for t in threads: t.start()
for t in threads: t.join()
ok = [r for r in results if r[1]]
print(f"{len(ok)}/{N} succeeded, max latency {max(r[2] for r in ok) if ok else 0:.3f}s")
```

If the server were iterative, total time would grow with N; with real concurrency all clients are served in parallel.

### 1.3 Abnormal disconnects

| Scenario | How | Expected |
|----------|-----|----------|
| Client killed | `Ctrl+C`, `kill -9 <pid>`, or `docker kill <container>` | Server detects EOF/reset, cleans up the session, keeps serving others |
| Client goes silent | connect and send nothing | Server times out the connection (if your protocol defines it) |
| Garbage input | `head -c 100000 /dev/urandom \| nc localhost 5000` | Server rejects / closes that connection, does not crash or run out of memory |
| Server stops | `docker compose stop server` | Client shows a clear error; optionally retries with backoff |

### 1.4 Simulating a bad network

Inside a Linux container that has `iproute2` and the `NET_ADMIN` capability
(`cap_add: [NET_ADMIN]` in `docker-compose.yml`):

```bash
tc qdisc add dev eth0 root netem delay 100ms 20ms   # latency + jitter
tc qdisc change dev eth0 root netem loss 5%          # packet loss
tc qdisc del dev eth0 root                           # restore
```

---

## Part 2 — Our Test Evidence

| # | Test | Method | Result (paste output / screenshot link) | Pass? |
|:-:|------|--------|------------------------------------------|:-----:|
| 1 | N concurrent clients | `tests/load_test.py`, N = | | |
| 2 | Client killed mid-session | | | |
| 3 | Malformed / oversized message | | | |
| 4 | Feature: *(name)* | | | |
| 5 | Feature: *(name)* | | | |

*(Add notes on bugs found by these tests and how you fixed them.)*
