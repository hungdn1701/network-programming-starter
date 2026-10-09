---
title: "Scaffold a Network Client Application"
tool: "any"
category: "scaffolding"
difficulty: "beginner"
---

# Scaffold Network Client

## Context
Bạn đang xây dựng module `client/` cho đồ án Lập trình mạng (INT1433).
Client cần kết nối tới Server, gửi nhận thông điệp theo giao thức đã thiết kế, và cung cấp giao diện tương tác (CLI hoặc GUI).

## Thông tin đầu vào
- Ngôn ngữ lập trình: `[Java / Python / C / Go / Node.js]`
- Host Server đích: `[đọc từ biến môi trường CLIENT_TARGET_HOST, mặc định 'server' trong Docker hoặc 'localhost' ngoài host]`
- Port Server đích: `[đọc từ biến môi trường CLIENT_TARGET_PORT, mặc định 5000]`
- Kiểu giao diện: `[CLI tương tác terminal / GUI Desktop (Java Swing/JavaFX, Tkinter, Qt)]`

## Yêu cầu thực hiện
1. Tạo file khởi động Client trong thư mục `client/src/`.
2. Đọc cấu hình kết nối từ biến môi trường.
3. Thực hiện kết nối Socket tới Server với cơ chế Timeout (tránh treo vô hạn nếu server chưa bật).
4. Thiết lập 2 luồng độc lập:
   - Luồng 1 (Listener Thread): Lắng nghe liên tục dữ liệu từ Server gửi về và hiển thị lên giao diện.
   - Luồng 2 (Sender / Input Thread): Đọc lệnh từ người dùng và đóng gói gửi tới Server.
5. Xử lý kịch bản mất kết nối: thông báo cho người dùng và thoát an toàn hoặc tự động kết nối lại (Reconnection).

## Kết quả mong đợi (Checklist)
- [ ] Kết nối thành công tới Server qua TCP/UDP
- [ ] Gửi/nhận thông điệp không bị nghẽn (non-blocking giữa việc gửi và nhận)
- [ ] Xử lý đúng ký tự kết thúc tin nhắn (Delimiter / Length Prefix)
