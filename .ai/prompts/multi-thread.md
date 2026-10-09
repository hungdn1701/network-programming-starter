---
title: "Implement Thread Safety and Concurrency"
tool: "any"
category: "architecture"
difficulty: "intermediate"
---

# Multi-Thread & Concurrency Optimization

## Context
Server của bạn cần quản lý trạng thái chung giữa nhiều luồng (Shared State): danh sách người dùng đang online, danh sách phòng chat, phiên làm việc, tài nguyên dùng chung. Cần đảm bảo an toàn luồng (Thread-Safety), tránh Race Condition và Deadlock.

## Yêu cầu thực hiện
1. Xem xét kiến trúc Server hiện tại trong `server/src/`.
2. Xác định các biến/cấu trúc dữ liệu dùng chung đang bị chia sẻ giữa các luồng.
3. Thay thế các cấu trúc dữ liệu không an toàn (ví dụ `ArrayList`, `HashMap`, Python `dict` khi ghi đồng thời) bằng:
   - Java: `ConcurrentHashMap`, `CopyOnWriteArrayList`, `BlockingQueue`.
   - Python: Sử dụng `threading.Lock` / `asyncio.Lock` để bọc quanh các thao tác đọc-ghi.
   - C/C++: Sử dụng `pthread_mutex_t` với nguyên tắc RAII hoặc `std::mutex` / `std::lock_guard`.
4. Áp dụng Thread Pool (ví dụ `ExecutorService` trong Java, `ThreadPoolExecutor` trong Python) để giới hạn số lượng luồng tối đa, tránh cạn kiệt tài nguyên hệ điều hành.
5. Kiểm tra kỹ không có hiện tượng lồng nhiều Lock có nguy cơ dẫn tới Deadlock.

## Kết quả mong đợi
- [ ] Mọi truy cập vào danh sách client online đều được đồng bộ
- [ ] Không có hiện tượng gửi trùng tin nhắn hoặc mất tin nhắn do xung đột ghi
- [ ] Thử nghiệm với 20 client kết nối cùng lúc không xuất hiện ConcurrentModificationException
