use db_2012
ALTER TABLE mrsoft
ADD CONSTRAINT Fkey_ID_2
FOREIGN KEY (ID)
REFERENCES Employee(ID)  
