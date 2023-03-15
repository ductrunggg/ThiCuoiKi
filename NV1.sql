-- Đăng nhập với tài khoản NV1
use AdventureWorks2008R2;
execute as user = 'NV1';

-- Nhân viên NV1 sửa số điện thoại của người có BusinessEntityID=(3 ký tự cuối của Mã SV
-- của chính SV dự thi) thành 123-456-7890
update Person.PersonPhone
set PhoneNumber = '123-456-7890'
where BusinessEntityID = 114

-- Kết thúc quyền NV2
revert;