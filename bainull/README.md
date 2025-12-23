Bài 1 – Tìm hiểu về Nullable (Lý thuyết)
1. Thế nào là nullable?

Trong Dart (Flutter), nullable là khái niệm chỉ những biến có thể nhận giá trị null.
Giá trị null biểu thị rằng biến chưa có dữ liệu, chưa được khởi tạo hoặc người dùng chưa nhập thông tin.

Một biến nullable được khai báo bằng cách thêm dấu ? sau kiểu dữ liệu.
Ví dụ, String? hoặc int? là các biến có thể nhận giá trị null.

Việc phân biệt rõ nullable và non-nullable giúp tránh các lỗi runtime liên quan đến null trong ứng dụng.

2. Khi nào nên và không nên dùng nullable?

Nên dùng nullable khi:

Dữ liệu chưa chắc tồn tại tại thời điểm sử dụng

Người dùng chưa nhập dữ liệu

Dữ liệu lấy từ API có thể thiếu hoặc không đầy đủ

Trạng thái ban đầu của biến chưa xác định

Không nên dùng nullable khi:

Biến bắt buộc phải có giá trị

Giá trị luôn tồn tại trong suốt vòng đời của chương trình

Việc lạm dụng nullable có thể làm code phức tạp và khó bảo trì.

3. Các cách xử lý null phổ biến

Dart cung cấp nhiều cách để xử lý giá trị null một cách an toàn:

Toán tử ? dùng để truy cập thuộc tính hoặc phương thức của biến nullable mà không gây lỗi khi biến là null.

Toán tử ?? dùng để gán giá trị mặc định khi biến có giá trị null.

Toán tử ??= dùng để gán giá trị cho biến chỉ khi biến đang null.

Toán tử ! dùng để khẳng định rằng biến không null, nhưng có thể gây lỗi nếu sử dụng không đúng.

Cấu trúc kiểm tra điều kiện (if) được sử dụng để kiểm tra null trước khi dùng biến.

Các cách trên giúp ứng dụng tránh bị crash do lỗi null