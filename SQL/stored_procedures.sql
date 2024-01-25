USE RIPD GO;

CREATE PROCEDURE add_user
    @name NVARCHAR (32),
    @displayName NVARCHAR (32),
    @email NVARCHAR (96),
    @password NVARCHAR (256)
AS
BEGIN
  INSERT INTO Users
  (name, displayName, email, password) 
  VALUES
  (@name, @displayName, @email, @password)
END
GO;