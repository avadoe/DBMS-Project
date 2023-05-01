-- TRIGGER WHEN INSERTING A NEW PROPERTY

CREATE OR REPLACE FUNCTION insertintoproperty_function()
RETURNS TRIGGER AS $$
BEGIN
  RAISE NOTICE 'A new row has been inserted into table Property.';
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER insertintoproperty
AFTER INSERT ON PROPERTY
FOR EACH ROW
EXECUTE FUNCTION insertintoproperty_function();

-- TRIGGER WHEN CREATING A NEW USER

CREATE OR REPLACE FUNCTION insertintouser_function()
RETURNS TRIGGER AS $$
BEGIN
  RAISE NOTICE 'A new row has been inserted into table User.';
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER insertintouser
AFTER INSERT ON "User"
FOR EACH ROW
EXECUTE FUNCTION insertintouser_function();