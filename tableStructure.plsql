-- Create User table
CREATE TABLE "User" (
    AADHARID INT PRIMARY KEY,a
    NAME VARCHAR(50) NOT NULL,
    AGE INT NOT NULL,
    DOORNO VARCHAR(20) NOT NULL,
    STREET VARCHAR(50) NOT NULL,
    CITY VARCHAR(20) NOT NULL,
    STATE VARCHAR(20) NOT NULL,
    PINCODE INT NOT NULL,
    LOGINID VARCHAR(20) UNIQUE NOT NULL,
    PASSWORD VARCHAR(20) NOT NULL
    -- can increase length of password
);

-- Create City table
CREATE TABLE CITY (
    CITYID INT PRIMARY KEY,
    CITYNAME VARCHAR(50) NOT NULL
);

-- Create Locality table
CREATE TABLE LOCALITY (
    LOCALITYID INT PRIMARY KEY,
    LOCALITYNAME VARCHAR(50) NOT NULL,
    CITYID INT REFERENCES CITY(CITYID)
);

-- Create Property table
CREATE TABLE PROPERTY (
    PROPERTYID INT PRIMARY KEY,
    OWNERID INT REFERENCES "User"(AADHARID),
    AVAILABLEFROM DATE NOT NULL,
    AVAILABLETILL DATE,
    RENTPERMONTH NUMERIC(10, 2) NOT NULL,
    ANNUALHIKEPERCENT NUMERIC(5, 2),
    TOTALAREA NUMERIC(10, 2) NOT NULL,
    PLINTHAREA NUMERIC(10, 2) NOT NULL,
    NBEDROOMS INT,
    NFLOORS INT,
    YEAROFCONSTRUCTION INT NOT NULL,
    LOCALITYID INT REFERENCES LOCALITY(LOCALITYID),
    OTHERFACILITIES TEXT
);

-- Create Rent table
CREATE TABLE RENT (
    RENTID INT PRIMARY KEY,
    PROPERTYID INT REFERENCES PROPERTY(PROPERTYID),
    TENANTID INT REFERENCES "User"(AADHARID),
    STARTDATE DATE NOT NULL,
    ENDDATE DATE,
    MONTHLYRENT NUMERIC(10, 2) NOT NULL,
    YEARLYHIKEPERCENT NUMERIC(5, 2),
    AGENCYCOMMISSION NUMERIC(5, 2),
    OTHERDETAILS TEXT
);

CREATE TABLE OWNER(
    OWNERID INT PRIMARY KEY, 
    AADHARID INT REFERENCES "User"(AADHARID)
);

-- Create Tenant table
CREATE TABLE TENANT (
    TENANTID INT PRIMARY KEY REFERENCES "User"(AADHARID)
);

-- Add constraints to ensure business rules
ALTER TABLE PROPERTY ADD CONSTRAINT OWNERPROPERTYCONSTRAINT CHECK (OWNERID = CURRENT_SETTING('app.userid')::VARCHAR
OR CURRENT_SETTING('app.role') = 'admin'
OR CURRENT_SETTING('app.role') = 'manager');

ALTER TABLE RENT ADD CONSTRAINT RENTTENANTCONSTRAINT CHECK (TENANTID != CURRENT_SETTING('app.userid')::VARCHAR);

-- To delete all data from a table:
TRUNCATE TABLE <tableName>

INSERT INTO CITY (
    CITYID,
    CITYNAME
) VALUES (
    1,
    'New Delhi'
),
(
    2,
    'Mumbai'
),
(
    3,
    'Bangalore'
);

INSERT INTO LOCALITY (

    LOCALITYID,
    LOCALITYNAME,
    CITYID
) VALUES (
    1,
    'Pitampura',
    1
),
(
    2,
    'Vikaspuri',
    1
),
(
    3,
    'Andheri',
    2
),
(
    4,
    'Powai',
    2
),
(
    5,
    'Koramangala',
    3
),
(
    6,
    'Whitefield',
    3
);

INSERT INTO "User" (
    AADHARID,
    NAME,
    AGE,
    DOORNO,
    STREET,
    CITY,
    STATE,
    PINCODE,
    LOGINID,
    PASSWORD
) VALUES (
    100000001,
    'John Smith',
    30,
    '123 Main St',
    'Sector 4',
    'New Delhi',
    'Delhi',
    110085,
    'jsmith',
    'password'
),
(
    100000002,
    'Jane Doe',
    25,
    '456 Park Ave',
    'Vikaspuri',
    'New Delhi',
    'Delhi',
    110018,
    'jdoe',
    'password'
),
(
    100000003,
    'Bob Johnson',
    40,
    '789 Elm St',
    'Andheri East',
    'Mumbai',
    'Maharashtra',
    400069,
    'bjohnson',
    'password'
),
(
    100000004,
    'Alice Lee',
    35,
    '1010 Oak St',
    'Powai',
    'Mumbai',
    'Maharashtra',
    400076,
    'alee',
    'password'
),
(
    100000005,
    'Mike Brown',
    28,
    '1212 Maple Ave',
    'Koramangala 4th Block',
    'Bangalore',
    'Karnataka',
    560034,
    'mbrown',
    'password'
),
(
    100000006,
    'Sarah Patel',
    33,
    '1414 Cherry St',
    'Whitefield',
    'Bangalore',
    'Karnataka',
    560066,
    'spatel',
    'password'
);

INSERT INTO TENANT VALUES(
    100000006
);INSERT INTO TENANT VALUES(
    100000003
);

INSERT INTO OWNER VALUES(3, 100000004)
INSERT INTO OWNER VALUES(
    4,
    100000001
)

ALTER TABLE PROPERTY DROP CONSTRAINT "property_ownerid_fkey";

-- adding dummy values from extradummy.plsql

alter table PROPERTY add constraint property_ownerid_fkey FOREIGN KEY(ownerid) references owner;