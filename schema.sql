---EMPLOYEE TABLE
drop table if exits employees;
create table employees(
    EmployeeId INT primary key, 
    Name varchar(50), 
    Department varchar(50),
    Role varchar(50), 
    JoiningDate Date, 
    Salary INT, 
    Location varchar(50),
    Attrition varchar(50)
);

---TIMESHEET TABLE
drop table if exits timesheet;
create table timesheet(
    TimesheetId int primary key AUTOINCREMENT,
    EmployeeId int references employees(EmployeeId),
    specificDate date,
    ProjectName varchar(100),
    HoursWorked int,
    BillableHours int,
    TaskType varchar(100)
);

---ATTENDANCE TABLE 
drop table if exists attendance;
create table attendance(
    AttendanceId int primary key AUTOINCREMENT,
    EmployeeId int references employees(EmployeeId),
    SpecificDate date,
    CheckIn timestamp,
    CheckOut timestamp,
    Status varchar(50), ---Present,WFH,Leave
    LateMark timestamp
);

---LEAVE MANAGEMENT TABLE
drop table if exists leave_management;
create table leave_management(
    LeaveId int primary key AUTOINCREMENT,
    EmployeeId int references employees(EmployeeId),
    LeaveType varchar(50), ---Sick,Casual
    FromDate date,
    ToDate date,
    Status varchar(50)
);

---PERFORMANCE & SKILLS
drop table if exists performance;
create table performance(
    SkillId int primary key,
    EmployeeId int references employees(EmployeeId),
    SkillName varchar(50),
    SkillLevel varchar(50), --Beginner,Intermediate,Expert
    LastAssessmentScore int,
    Certification varchar(50)
);

---PROJECT & ALLOCATION TABLE
drop table if exits project;
create table project(
    ProjectId int primary key,
    EmployeeId int references employees(EmployeeId),
    Allocation% int,
    StartDate date,
    EndDate date
);