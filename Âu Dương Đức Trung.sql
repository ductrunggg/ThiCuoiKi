-- Câu 1a
-- Tạo login cho admin
create login admin with password = 'dt';
go
-- Tạo user cho admin
use AdventureWorks2008R2;
create user admin for login admin;
go 

-- Tạo login cho NV1
create login NV1 with password = 'dt';
go
-- Tạo user cho NV1
use AdventureWorks2008R2;
create user NV1 for login NV1;
go

-- Tạo login cho NV2
create login NV2 with password = 'dt';
go
-- Tạo user cho NV2
use AdventureWorks2008R2;
create user NV2 for login NV2;
go

-- Tạo login cho nhân viên QL
create login QL with password = 'dt';
go
-- Tạo user cho nhân viên QL
use AdventureWorks2008R2;
create user QL for login QL;
go

-- Câu 1b
-- Tạo role NhanVien
create role NHANVIEN;
Role created.

-- Tạo role db_datareader
create role db_datareader;
role db_datareader.

-- Phân quyền cho role NhanVien
use AdventureWorks2008R2;
grant select, update, delete on PersonPhone to NHANVIEN;
go

-- Phân quyền cho nhân viên QL
use AdventureWorks2008R2;
grant select on PersonPhone to db_datareader;
grant select on Person to db_datareader;
go

-- Gán role NHANVIEN cho NV1 và NV2
grant NHANVIEN to NV1, NV2;
grant succeeded.

-- Gán role db_datareader cho QL
grant db_datareader to QL;
grant succeeded.

-- Admin phải có quyền control trên tất cả đối tượng trong cơ sở dữ liệu
use AdventureWorks2008R2;
grant control to [admin];
go

-- Câu 1e. Các nhân viên quản lý NV1, NV2, QL hoàn thành dự án, admin thu hồi quyền đã cấp. 
-- Xóa role NhanVien.

-- Thu hồi quyền
REVOKE Nhanvien FROM NV1,NV2,QL;
Revoke succeeded.
-- Xóa role NhanVien
DROP ROLE NhanVien

--Câu 2: 
--b
delete Purchasing.PurchaseOrderDetail
backup database AdventureWorks2008R2
to disk = 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\Backup'
with differential 

--c
select*from Person.PersonPhone where BusinessEntityID = 0114
insert into Person.PersonPhone values(0114, '050302' , 2 ,getdate())

backup log AdventureWorks2008R2
to disk = 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\Backup'

--d
use master
drop database AdventureWorks2008R2

restore database AdventureWorks2008R2
from disk = 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\Backup'
with file = 1, replace , norecovery