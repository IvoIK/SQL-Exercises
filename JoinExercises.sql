/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [EmployeeID]
      ,[FirstName]
      ,[LastName]
      ,[MiddleName]
      ,[JobTitle]
      ,[DepartmentID]
      ,[ManagerID]
      ,[HireDate]
      ,[Salary]
      ,[AddressID]
  FROM [SoftUni].[dbo].[Employees]

-- 1. Адрес на служител
Select Top(5) e.EmployeeID, e.JobTitle, a.AddressID, a.AddressText from Employees e join Addresses a on e.AddressID=a.AddressID order by a.AddressID;

-- 2. Отдели
Select Top(5) e.EmployeeID, e.FirstName, e.Salary, d.Name as DepartmentName from Employees e join Departments d on d.DepartmentID=e.DepartmentID where e.Salary > 15000 order by d.DepartmentID;

-- 3. Служители без проекти
Select Top (3) e.EmployeeID, e.FirstName from Employees e where e.EmployeeID not in (select ep.EmployeeID from EmployeesProjects ep) order by e.EmployeeID;
Select Top(3) e.EmployeeID, e.FirstName from Employees e left join EmployeesProjects ep on ep.EmployeeID=e.EmployeeID where ep.ProjectID is null order by e.EmployeeID;

