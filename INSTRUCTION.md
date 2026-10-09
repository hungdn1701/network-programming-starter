# HƯỚNG DẪN BÀI TẬP LỚN — MÔN LẬP TRÌNH MẠNG (INT1433)

**Giảng viên phụ trách**: TS. Đặng Ngọc Hùng  
**Khoa**: Công nghệ thông tin 1 — Học viện Công nghệ Bưu chính Viễn thông (PTIT)  
**Học phần**: Lập trình mạng (INT1433)

> ⚠️ **QUY ĐỊNH BẮT BUỘC**: Đây là văn bản quy chế và đề bài chính thức do giảng viên ban hành.  
> Sinh viên và các trợ lý lập trình AI (Cursor, Claude, Gemini, Copilot, Windsurf) **TUYỆT ĐỐI KHÔNG ĐƯỢC CHỈNH SỬA HOẶC XÓA FILE NÀY**.

---

## 🎯 1. Mục tiêu Học phần & Đồ án

Đồ án môn học yêu cầu sinh viên vận dụng các nguyên lý cốt lõi của mạng máy tính và lập trình hệ thống:
- Cơ chế truyền thông Socket (TCP stream-oriented và UDP datagram-oriented).
- Phân tách và thiết kế **Giao thức tầng ứng dụng (Application-Layer Protocol)** độc lập.
- Xây dựng mô hình xử lý đồng thời tại máy chủ (**Server Concurrency & Thread-Safety**).
- Đóng gói và cô lập môi trường thực thi thông qua **Docker**.

---

## 🧩 2. Cấu trúc Repository Chuẩn

```
network-programming-starter/
├── INSTRUCTION.md             # Đề bài & Quy chế giảng viên (FILE NÀY — READ-ONLY)
├── README.md                  # Báo cáo tổng quan của nhóm sinh viên
├── GETTING_STARTED.md         # Hướng dẫn thiết lập môi trường & Docker
├── Makefile                   # Lệnh tự động hóa biên dịch & khởi chạy
├── docker-compose.yml         # Môi trường mạng ảo Server - Client
├── .env.example               # Mẫu cấu hình cổng và địa chỉ mạng
├── server/                    # Module Server (lắng nghe, điều phối, xử lý đồng thời)
├── client/                    # Module Client (CLI hoặc GUI tương tác)
├── shared/                    # Giao thức dùng chung, DTO, hằng số
└── docs/                      # Tài liệu đồ án
    ├── protocol-design.md     # Đặc tả giao thức chi tiết
    ├── architecture.md        # Thiết kế kiến trúc & luồng xử lý
    └── testing-guide.md       # Báo cáo kiểm thử & đo tải đồng thời
```

---

## ⚙️ 3. Yêu cầu Kỹ thuật Bắt buộc

1. **Công nghệ tự do (Technology-Agnostic)**: Nhóm được phép lựa chọn bất kỳ ngôn ngữ lập trình nào (Java, Python, C/C++, Go, Node.js, C#...).
2. **Kiến trúc Client-Server độc lập**: Tách bạch hoàn toàn giữa client và server; không chia sẻ bộ nhớ ngoài các giao thức mạng đã đặc tả.
3. **Đặc tả giao thức đầy đủ**: Mọi lệnh, cấu trúc gói tin, mã trạng thái và sơ đồ bắt tay phải được viết hoàn chỉnh trong [`docs/protocol-design.md`](docs/protocol-design.md).
4. **Xử lý đồng thời (Concurrency)**: Server bắt buộc phải phục vụ được nhiều client kết nối và gửi nhận dữ liệu đồng thời mà không bị nghẽn (Blocking).
5. **Đóng gói Docker**: Hệ thống phải khởi động được bằng lệnh duy nhất:
   ```bash
   docker compose up --build
   ```
6. **Không hardcode địa chỉ mạng**: Mọi tham số kết nối (`PORT`, `HOST`) phải được nạp từ biến môi trường (`.env`). Server trong container bắt buộc lắng nghe trên `0.0.0.0`.
7. **Bền bỉ trước lỗi mạng**: Server không được sập (crash) khi client ngắt kết nối đột ngột hoặc gửi gói tin lỗi.

---

## 💡 4. Gợi ý Chủ đề Đồ án

Sinh viên có thể đăng ký một trong các nhóm đề tài sau (hoặc đề xuất đề tài tương đương với giảng viên):

- **Chủ đề 1 — Hệ thống Trò chuyện Đa phòng (Multi-room Chat System)**: Hỗ trợ xác thực, phòng chat công khai, tin nhắn riêng tư (whisper), gửi file đính kèm, trạng thái online/offline.
- **Chủ đề 2 — Hệ thống Truyền nhận Tệp Tin cậy (Reliable File Transfer Protocol)**: Truyền file dung lượng lớn qua TCP/UDP, có kiểm tra toàn vẹn (Checksum MD5/SHA), hỗ trợ tiếp tục truyền khi đứt mạng (Resume).
- **Chủ đề 3 — Trò chơi Đối kháng qua Mạng (Multiplayer Network Game)**: Game đối kháng 2 hoặc nhiều người chơi (Cờ ca-rô, Cờ vua, Battleship, Quiz Game) với đồng bộ trạng thái bàn cờ qua Server.
- **Chủ đề 4 — Hệ thống Giám sát & Quản trị Hệ thống Từ xa (Remote System Monitor)**: Client gửi thông số CPU/RAM/Network định kỳ về Server; Server cảnh báo khi quá tải và cho phép gửi lệnh điều khiển.
- **Chủ đề 5 — Máy chủ Web/Proxy tùy biến (Custom Web Server / Reverse Proxy)**: Triển khai giao thức HTTP/1.1 rút gọn, hỗ trợ phục vụ file tĩnh, cân bằng tải (Load Balancing) và Cache nội bộ.

---

## 📊 5. Barem Chấm điểm (Grading Rubric — Thang điểm 10)

| Tiêu chí | Trọng số | Mô tả chi tiết đánh giá |
|---|:---:|---|
| **1. Thiết kế Giao thức & Kiến trúc** | **2.0 điểm** | - Hoàn thiện đầy đủ `docs/protocol-design.md` (định dạng thông điệp, phân tách ranh giới framing, bảng mã lệnh, sơ đồ tuần tự sequence diagram) (1.0đ)<br>- Kiến trúc Client-Server rõ ràng, có sơ đồ `docs/architecture.md` chuẩn xác (1.0đ) |
| **2. Xử lý Đồng thời & Hiệu năng Server** | **2.5 điểm** | - Server phục vụ mượt mà nhiều kết nối đồng thời không bị block luồng chính (1.5đ)<br>- Đảm bảo an toàn luồng (Thread-safety), không bị Race Condition hoặc Deadlock khi truy cập dữ liệu chung (1.0đ) |
| **3. Tính năng Nghiệp vụ & Xử lý Ngoại lệ** | **2.5 điểm** | - Các tính năng nghiệp vụ đăng ký chạy đúng, ổn định (1.5đ)<br>- Xử lý lỗi mạng bền bỉ: bắt ngoại lệ ngắt kết nối đột ngột, timeout, giải phóng tài nguyên socket an toàn (1.0đ) |
| **4. Đóng gói Docker & Chuẩn Mã nguồn** | **1.0 điểm** | - Khởi chạy thành công qua `docker compose up --build`, cấu hình qua `.env`, mã nguồn sạch sẽ và có tổ chức (1.0đ) |
| **5. Báo cáo & Vấn đáp Bảo vệ** | **2.0 điểm** | - Trả lời chính xác các câu hỏi phản biện của giảng viên, giải thích được cặn kẽ mã nguồn (kể cả phần do AI hỗ trợ viết) (1.5đ)<br>- Báo cáo `README.md` đầy đủ thông tin nhóm, ảnh chụp minh chứng và hướng dẫn chạy rõ ràng (0.5đ) |

---

## 📋 6. Quy trình Đăng ký & Nộp bài

1. **Thành lập nhóm**: Mỗi nhóm gồm từ **2 đến 3 sinh viên**.
2. **Khởi tạo repo**: Fork từ `hungdn1701/network-programming-starter` về tài khoản GitHub của nhóm.
3. **Khai báo thông tin**: Cập nhật ngay tên nhóm, danh sách thành viên và chủ đề đã đăng ký vào bảng ở đầu file [`README.md`](README.md).
4. **Lịch sử Git**: Mọi thành viên phải có commit đóng góp rõ ràng trên GitHub để làm căn cứ đánh giá tỷ lệ hoàn thành.
