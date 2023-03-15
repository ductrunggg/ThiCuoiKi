-- Đăng nhập với tài khoản nhân viên QL
use AdventureWorks2008R2;
execute as user = 'QL';

-- Nhân viên QL xem lại kết quả NV1 và NV2 đã làm 
select*from Person.PersonPhone

--Kết thúc quyền nhân viên QL
revert;