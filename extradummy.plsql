-- Inserting data into the PROPERTY table
INSERT INTO PROPERTY (
    PROPERTYID,
    OWNERID,
    AVAILABLEFROM,
    AVAILABLETILL,
    RENTPERMONTH,
    ANNUALHIKEPERCENT,
    TOTALAREA,
    PLINTHAREA,
    NBEDROOMS,
    NFLOORS,
    YEAROFCONSTRUCTION,
    LOCALITYID,
    OTHERFACILITIES
) VALUES (
    1,
    1,
    '2023-05-01',
    '2024-04-30',
    25000,
    5,
    1200,
    800,
    2,
    4,
    2010,
    1,
    'Swimming pool, gym, security'
),
(
    2,
    2,
    '2023-06-01',
    '2024-05-31',
    30000,
    7,
    1500,
    900,
    3,
    3,
    2015,
    2,
    'Parking, garden, power backup'
),
(
    3,
    2,
    '2023-07-01',
    '2024-06-30',
    35000,
    6,
    2000,
    1000,
    3,
    5,
    2012,
    4,
    'CCTV, intercom, lift'
);

-- Inserting data into the RENT table
INSERT INTO RENT (
    RENTID,
    PROPERTYID,
    TENANTID,
    STARTDATE,
    ENDDATE,
    MONTHLYRENT,
    YEARLYHIKEPERCENT,
    AGENCYCOMMISSION,
    OTHERDETAILS
) VALUES (
    1,
    1,
    100000003,
    '2023-05-01',
    '2024-04-30',
    25000,
    3,
    2,
    'Water and electricity bill not included'
),
(
    2,
    2,
    100000006,
    '2023-06-01',
    '2024-05-31',
    30000,
    4,
    2.5,
    'Furnished apartment, pet-friendly'
);
