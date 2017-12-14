USE db_2012
UPDATE Student
SET Sage=
CASE WHEN Sex= 'ÄÐ' THEN Sage - 1
WHEN Sex = 'Å®' THEN Sage + 1
END 