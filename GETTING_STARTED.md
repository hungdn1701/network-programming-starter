# Getting Started / Hướng dẫn bắt đầu

Tài liệu này cung cấp hướng dẫn chi tiết để thiết lập và làm việc với repository.
This document provides detailed instructions to set up and work with the repository.

## 🛠 Yêu cầu (Prerequisites)

- [Docker Desktop](https://www.docker.com/products/docker-desktop)
- [Git](https://git-scm.com/)
- Bất kỳ AI Coding Tool nào (Cursor, Windsurf, GitHub Copilot, v.v.)

## 🏃 Quick Start

1. **Fork** repository này về tài khoản GitHub của bạn (không dùng chế độ GitHub Template).
2. **Clone** repository đã fork về máy:
   ```bash
   git clone https://github.com/YOUR_USERNAME/network-programming-starter.git
   cd network-programming-starter
   ```
3. **Initialize** (Khởi tạo):
   ```bash
   make init
   ```
4. **Run** (Chạy):
   ```bash
   make up
   ```

## 📂 Cấu trúc dự án (Project Structure)

- `client/` - Chứa mã nguồn cho Client (Client source code)
- `server/` - Chứa mã nguồn cho Server (Server source code)
- `shared/` - Dữ liệu dùng chung (Protocols, Constants, v.v.)
- `docs/` - Tài liệu thiết kế hệ thống (Architecture, Protocol, Testing)
- `.ai/` - Cấu hình AI Assistant (vibe coding, prompts, agents)

## 🔄 Development Workflow

1. Thiết kế giao thức ở `docs/protocol-design.md`.
2. Lập trình module `server/`.
3. Lập trình module `client/`.
4. Test hệ thống.

Hãy đọc [Vibe Coding Guide](.ai/vibe-coding-guide.md) để biết cách tận dụng AI trong quá trình phát triển.

## ✅ Submission Checklist (Trước khi nộp bài)

- [ ] Cập nhật bảng tên sinh viên trong `README.md`
- [ ] Viết đầy đủ `docs/protocol-design.md`
- [ ] Chắc chắn hệ thống chạy được chỉ bằng lệnh `docker compose up --build`
- [ ] Code không bị hardcode các tham số kết nối (sử dụng Environment Variables)
- [ ] Đẩy code lên nhánh `main` trên repository của nhóm
