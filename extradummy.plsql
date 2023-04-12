-- inserting data into the Property table
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
    20000.00,
    5.00,
    2000.00,
    1000.00,
    2,
    2,
    2010,
    1,
    'Swimming pool, Gym'
),
(
    2,
    2,
    '2023-04-15',
    '2024-04-14',
    25000.00,
    6.00,
    2500.00,
    1200.00,
    3,
    3,
    2015,
    3,
    'Garden, Parking'
);

-- inserting data into the Rent table
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
    222233334444,
    '2023-05-01',
    '2024-04-30',
    20000.00,
    5.00,
    2.00,
    'None'
),
(
    2,
    2,
    111122223333,
    '2023-04-15',
    '2024-04-14',
    25000.00,
    6.00,
    3.00,
    'None'
);