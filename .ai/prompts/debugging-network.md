---
title: "Debug Network and Socket Issues"
tool: "any"
category: "debugging"
difficulty: "intermediate"
---

# Debug Network & Socket Issues

## Context
Bạn gặp sự cố kết nối, lỗi truyền nhận hoặc crash trong ứng dụng mạng INT1433.

## Mô tả lỗi gặp phải
- Mã lỗi / Tên ngoại lệ: `[ví dụ: java.net.ConnectException: Connection refused / SocketException: Broken pipe / Address already in use / Timeout]`
- Môi trường xảy ra: `[Chạy qua Docker / Chạy trên máy Host / Kết nối giữa 2 máy trong mạng LAN]`
- Hoạt cảnh: `[Lúc Server khởi động / Lúc Client thứ 2 kết nối vào / Lúc Client tắt đột ngột]`
- Đoạn mã nguồn liên quan:
```
[dán code tại đây]
```

## Yêu cầu chẩn đoán & khắc phục
1. Giải thích nguyên nhân gốc rễ (Root Cause) ở tầng mạng (TCP State, IP Binding, Buffer, Threading).
2. Kiểm tra xem Server đã bind vào `0.0.0.0` hay chưa (nếu chạy trong Docker).
3. Kiểm tra xem Socket đã được đóng đúng cách trong khối `finally` / `try-with-resources` chưa.
4. Đưa ra giải pháp khắc phục cụ thể bằng mã nguồn đã sửa đổi.
5. Cung cấp lệnh kiểm tra trạng thái cổng (ví dụ `netstat -tuln` hoặc `lsof -i :5000`).
