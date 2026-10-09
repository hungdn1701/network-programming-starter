# Mẫu Đồ án: Lập trình mạng (INT1433)

[![Stars](https://img.shields.io/github/stars/YOUR_USERNAME/network-programming-starter)](https://github.com/YOUR_USERNAME/network-programming-starter/stargazers)
[![Forks](https://img.shields.io/github/forks/YOUR_USERNAME/network-programming-starter)](https://github.com/YOUR_USERNAME/network-programming-starter/network/members)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

Đây là kho mã nguồn mẫu (starter repository) cho đồ án môn học Lập trình mạng (INT1433).
Kho mã nguồn này được thiết kế để hỗ trợ bất kỳ ngôn ngữ lập trình nào, đóng gói bằng Docker và tuân theo kiến trúc Client-Server.

## 👥 Danh sách sinh viên thực hiện

| STT | Họ và tên | Mã sinh viên | Vai trò | Mức độ hoàn thành |
|-----|-----------|--------------|---------|-------------------|
| 1   | Nguyễn Văn A | 2002xxxx | Trưởng nhóm | 100% |
| 2   | Trần Thị B   | 2002yyyy | Thành viên | 100% |
| 3   | Lê Văn C     | 2002zzzz | Thành viên | 100% |

## 📝 Mô tả dự án

*TODO: Thêm mô tả ngắn gọn về ứng dụng của bạn ở đây. Ứng dụng giải quyết vấn đề gì? Đối tượng người dùng là ai?*

**Các tính năng chính:**
- [x] Đăng nhập/Đăng ký
- [ ] Tính năng A
- [ ] Tính năng B
- [ ] Tính năng C

## 🏗 Kiến trúc hệ thống

*TODO: Cập nhật sơ đồ kiến trúc cho ứng dụng của bạn. Xem `docs/architecture.md` để biết thêm chi tiết.*

Hệ thống tuân theo mô hình Client-Server cơ bản, giao tiếp qua giao thức TCP/UDP với thông điệp được định nghĩa tùy chỉnh.

## 🚀 Hướng dẫn chạy dự án

### Yêu cầu hệ thống
- [Docker Desktop](https://www.docker.com/products/docker-desktop) (khuyến nghị) hoặc Docker CLI + Docker Compose
- Hệ điều hành: Windows/macOS/Linux

### Các bước thực thi

1. Clone repository:
   ```bash
   git clone https://github.com/YOUR_USERNAME/network-programming-starter.git
   cd network-programming-starter
   ```

2. Khởi tạo môi trường:
   ```bash
   make init
   # Hoặc chạy thủ công: bash scripts/init.sh
   ```

3. Khởi chạy hệ thống bằng Docker Compose:
   ```bash
   make up
   # Hoặc: docker compose up --build
   ```

Xem thêm chi tiết tại [GETTING_STARTED.md](GETTING_STARTED.md).
