---
title: "Scaffold a Robust Socket Server"
tool: "any"
category: "scaffolding"
difficulty: "beginner"
---

# Scaffold Socket Server

## Context
Bạn đang xây dựng module `server/` cho đồ án môn học Lập trình mạng (INT1433).
Server cần lắng nghe kết nối từ Client, hỗ trợ nhiều Client đồng thời, và đọc cấu hình từ biến môi trường.

## Thông tin đầu vào
- Ngôn ngữ lập trình: `[Java / Python / C / Go / Node.js]`
- Cổng dịch vụ (Port): `[ví dụ: 5000 / đọc từ biến môi trường SERVER_PORT]`
- Giao thức vận chuyển: `[TCP / UDP]`
- Mô hình Concurrency: `[Thread-per-client / Thread Pool / Async I/O]`

## Yêu cầu thực hiện
1. Tạo file khởi động Server trong thư mục `server/src/`.
2. Đọc biến môi trường `SERVER_HOST` (mặc định `0.0.0.0`) và `SERVER_PORT` (mặc định `5000`).
3. Khởi tạo socket lắng nghe (ví dụ `ServerSocket` trong Java, `socket(AF_INET, SOCK_STREAM)` trong Python/C).
4. Xây dựng vòng lặp chấp nhận kết nối (`accept()`) không chặn luồng chính khi xử lý client.
5. Mỗi kết nối Client được chuyển giao cho một bộ xử lý riêng (Worker Thread / Coroutine).
6. Bắt các ngoại lệ mạng (IOException, ConnectionReset) và đóng socket giải phóng tài nguyên khi client ngắt kết nối.
7. Xử lý tín hiệu tắt Server an toàn (Graceful Shutdown khi nhận SIGINT / SIGTERM).

## Kết quả mong đợi (Checklist)
- [ ] Server bind thành công vào `0.0.0.0`
- [ ] Không crash khi 1 client bị disconnect đột ngột
- [ ] Log in ra màn hình rõ ràng: Client IP/Port khi kết nối và ngắt kết nối
- [ ] Cập nhật file `server/Dockerfile` tương ứng để chạy được trong Docker
