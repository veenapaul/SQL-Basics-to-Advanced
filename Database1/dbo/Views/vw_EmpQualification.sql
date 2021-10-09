-- Create view by two base tables
CREATE VIEW vw_EmpQualification
AS
SELECT EmpCode, Name, Designation, Qualification
FROM employees E inner join lib_qualification Q
ON E.qualificationCOde = Q.QualificationCode
WHERE deleted = 0
