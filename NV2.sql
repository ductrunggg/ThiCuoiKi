-- Đăng nhập với tài khoản NV2
use AdventureWorks2008R2;
execute as user = 'NV2';

-- Nhân viên NV2 xóa số điện thoại của người có BusinessEntityID=(3 ký tự đầu của Mã SV
-- của chính SV dự thi).
update Person.PersonPhone
set PhoneNumber = ''
where BusinessEntityID = 095

-- Kết thúc quyền NV1
revert;