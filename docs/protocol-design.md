# Thiết kế Giao thức (Protocol Design)

Tài liệu này mô tả chi tiết giao thức được sử dụng để giao tiếp giữa Client và Server.

## 1. Tổng quan Giao thức (Protocol Overview)
* Giao thức vận chuyển: TCP / UDP (chọn một)
* Định dạng dữ liệu: JSON / Text thuần / Binary (chọn một)
* Mục đích: ...

## 2. Định dạng Thông điệp (Message Format)

Cấu trúc chung của một thông điệp:
```json
{
  "command": "STRING",
  "payload": { ... }
}
```

## 3. Các lệnh / Thao tác (Commands/Operations)

### 3.1. Lệnh LOGIN
* Chiều: Client -> Server
* Payload: `{"username": "user1", "password": "123"}`
* Phản hồi thành công: `{"status": "success", "token": "..."}`
* Phản hồi thất bại: `{"status": "error", "message": "Sai mật khẩu"}`

### 3.2. Lệnh... (thêm vào)

## 4. Xử lý Lỗi (Error Handling)
Các mã lỗi chung:
* `400`: Yêu cầu không hợp lệ
* `401`: Chưa xác thực
* `500`: Lỗi máy chủ

## 5. Ví dụ Trao đổi (Example Exchange)

```text
Client                                Server
  |                                     |
  |-------- {"command": "LOGIN"} ------>|
  |                                     |
  |<------- {"status": "success"} ------|
  |                                     |
```
