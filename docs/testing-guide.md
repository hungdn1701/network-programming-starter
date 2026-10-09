# Hướng dẫn Kiểm thử (Testing Guide)

Tài liệu này hướng dẫn các cách thức kiểm tra chức năng của hệ thống.

## 1. Kiểm thử thủ công (Manual Testing)

Sử dụng `netcat` (nc) hoặc `telnet` để kiểm tra kết nối thô tới Server (nếu là giao thức dạng Text):

```bash
# Kết nối tới server
nc localhost 5000

# Gõ lệnh
{"command": "LOGIN", "payload": {"user": "admin"}}
```

## 2. Kiểm thử trong môi trường Docker (Docker Networking)

Sử dụng các công cụ có sẵn trong mạng của Docker Compose. Bạn có thể mở shell vào container của client để chạy lệnh gửi tới server.

```bash
# Mở shell client
make client-shell

# Trong shell, ping tới server
ping server
```

## 3. Ý tưởng Kiểm thử tự động (Automated Testing Ideas)
* Viết script Python hoặc Bash nhỏ để gửi hàng loạt request (Stress test / Load test).
* Viết unit test cho các module tiện ích chung.
* Sử dụng một framework test (như pytest, JUnit) giả lập nhiều kết nối client.
