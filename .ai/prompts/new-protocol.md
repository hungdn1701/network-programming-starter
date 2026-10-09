---
title: "Design and Implement Application Protocol"
tool: "any"
category: "architecture"
difficulty: "beginner"
---

# Design & Implement Application Protocol

## Context
Bạn cần thiết kế hoặc mở rộng giao thức tầng ứng dụng trong `docs/protocol-design.md` và sinh mã nguồn parser/serializer cho Server và Client.

## Thông tin đầu vào
- Tên tính năng / Nghiệp vụ: `[ví dụ: Đăng nhập / Chuyển khoản / Gửi file / Đặt phòng]`
- Chiều truyền: `[Client -> Server / Server -> Client / Broadcast]`
- Dữ liệu gửi đi (Request): `[các trường dữ liệu cần truyền]`
- Dữ liệu phản hồi (Response): `[kết quả thành công / các mã lỗi thất bại]`

## Yêu cầu thực hiện
1. Soạn thảo đặc tả lệnh mới vào bảng Command Reference trong `docs/protocol-design.md`.
2. Vẽ sơ đồ tuần tự (Mermaid Sequence Diagram) cho luồng giao tiếp mới.
3. Viết hàm chuyển đổi gói tin (Serializer & Deserializer) ở `shared/` hoặc `server/` và `client/`.
4. Đảm bảo xử lý đúng các trường hợp dữ liệu rác, gói tin bị cắt vụn (TCP Packet Fragmentation) hoặc dính gói (TCP Packet Sticking).

## Kết quả mong đợi
- [ ] Đặc tả đầy đủ trong `docs/protocol-design.md`
- [ ] Đơn vị kiểm thử (Unit test) parser với dữ liệu hợp lệ và dữ liệu lỗi
