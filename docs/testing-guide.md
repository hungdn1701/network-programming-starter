# Hướng dẫn Kiểm thử Ứng dụng Mạng (Network Testing Guide)

> 📌 **Tài liệu đồ án**: Lập trình mạng (INT1433)

---

## 1. Kiểm thử Thủ công bằng Công cụ Mạng Thô (Raw Socket Testing)

Trước khi viết ứng dụng Client hoàn chỉnh, bạn có thể kiểm tra Server ngay lập tức bằng các công cụ mạng tiêu chuẩn để xác minh tính đúng đắn của giao thức.

### Sử dụng Netcat (`nc`)
Netcat cho phép gửi chuỗi byte trực tiếp qua kết nối TCP hoặc UDP:

```bash
# Kết nối TCP tới Server đang chạy trên cổng 5000:
nc localhost 5000

# Gửi thử một lệnh theo giao thức:
{"command": "AUTH", "payload": {"username": "test", "password": "123"}}
```

*Nếu giao thức dùng UDP:*
```bash
nc -u localhost 5000
```

### Sử dụng Telnet (trên Windows/Linux)
```bash
telnet localhost 5000
```

---

## 2. Kiểm thử Tải Đồng thời (Concurrency & Stress Testing)

Để chứng minh Server của bạn hỗ trợ nhiều client cùng lúc (không bị nghẽn theo kiểu Iterative), hãy sử dụng script sinh kết nối tự động:

### Script Python giả lập N Client đồng thời:
Tạo file kiểm thử `test_concurrency.py`:

```python
import socket
import threading
import time

SERVER_HOST = 'localhost'
SERVER_PORT = 5000
NUM_CLIENTS = 20

def simulate_client(client_id):
    try:
        s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        s.connect((SERVER_HOST, SERVER_PORT))
        print(f"[Client {client_id}] Đã kết nối thành công")
        
        # Gửi thông điệp
        msg = f'{{"command": "PING", "clientId": {client_id}}}\n'
        s.sendall(msg.encode('utf-8'))
        
        # Nhận phản hồi
        response = s.recv(1024)
        print(f"[Client {client_id}] Nhận phản hồi: {response.decode('utf-8').strip()}")
        
        # Giữ kết nối trong vài giây để kiểm tra tải
        time.sleep(3)
        s.close()
    except Exception as e:
        print(f"[Client {client_id}] Lỗi: {e}")

threads = []
for i in range(NUM_CLIENTS):
    t = threading.Thread(target=simulate_client, args=(i,))
    threads.append(t)
    t.start()
    time.sleep(0.05)  # Tránh tràn SYN queue cục bộ

for t in threads:
    t.join()

print("Kiểm thử tải đồng thời hoàn tất!")
```

---

## 3. Kiểm thử Ngắt Kết nối Đột ngột (Broken Pipe / Abnormal Disconnect)

Server mạng bắt buộc phải bền bỉ trước các tình huống bất thường:

1. **Client tắt máy đột ngột (`SIGKILL` hoặc ngắt cáp)**:
   - Dùng lệnh `Ctrl+C` hoặc `kill -9 <PID_CLIENT>`.
   - **Kỳ vọng**: Server nhận biết được việc đọc trả về `EOF` / `-1` / ngoại lệ `ConnectionResetException` và tiến hành dọn dẹp phiên kết nối, giải phóng thread, không bị văng Exception làm sập Server.
2. **Server tắt đột ngột khi Client đang gửi tin**:
   - Dừng Server bằng `docker compose stop server`.
   - **Kỳ vọng**: Client phát hiện mất kết nối, hiển thị thông báo lỗi rõ ràng và có thể kích hoạt cơ chế thử lại (Retry with Exponential Backoff).

---

## 4. Kiểm thử Độ trễ Mạng (Network Latency Simulation)

Bạn có thể giả lập môi trường mạng chập chờn (Lag/Latency/Packet Loss) ngay trong Docker container bằng công cụ `tc` (Traffic Control của Linux Kernel):

```bash
# Thêm độ trễ 100ms với độ lệch 20ms:
tc qdisc add dev eth0 root netem delay 100ms 20ms

# Giả lập mất gói 5%:
tc qdisc add dev eth0 root netem loss 5%

# Khôi phục trạng thái mạng bình thường:
tc qdisc del dev eth0 root
```
