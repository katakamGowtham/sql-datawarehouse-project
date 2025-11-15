use master;
go

-- Drop and recreate the 'DataWarehouse' database
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'Datawarehouse')
BEGIN
    ALTER DATABASE Datawarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE Datawarehouse;
END;
GO

--Create the datawarehouse database

create database Datawarehouse;
go

use Datawarehouse;
go


-- Create Schemas

create schema bronze;
go

create schema silver;
go

create schema gold;
go
