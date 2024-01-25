use master;
alter database RIPD
set
  single_user
with
  rollback immediate;

DROP DATABASE IF EXISTS RIPD;

CREATE DATABASE RIPD;

USE RIPD;

CREATE TABLE
  Users (
    id BIGINT IDENTITY (1, 1) NOT NULL PRIMARY KEY,
    name NVARCHAR (32) NOT NULL UNIQUE,
    displayName NVARCHAR (32) NOT NULL,
    email NVARCHAR (96) NOT NULL,
    password NVARCHAR (256) NOT NULL,
    creationDate TIMESTAMP,
    updateDate DATETIME
  );

/* #region foods */
CREATE TABLE
  Foods (
    id BIGINT IDENTITY (1, 1) NOT NULL PRIMARY KEY,
    barcode NVARCHAR (128) NOT NULL,
    foodname NVARCHAR (256) NOT NULL,
    manufacturer BIGINT NOT NULL,
    contributer BIGINT NOT NULL,
    creationDate TIMESTAMP,
    updateDate DATETIME,
    description NVARCHAR (512),
    image NVARCHAR (256),
  );

CREATE TABLE
  Food_Basics (
    food_id BIGINT NOT NULL,
    energy INT /* KCal */,
    fat DECIMAL(5, 3) /* g, fatty acids included */,
    carbohydrates DECIMAL(5, 3) /* g, sugar included */,
    sugar DECIMAL(5, 3) /* g */,
    protein DECIMAL(5, 3) /* g */,
    salt DECIMAL(5, 3) /* g, detailed in minerals */,
    liquid DECIMAL(5, 3) /* ml */,
    FOREIGN KEY (food_id) REFERENCES Foods (id)
  );

CREATE TABLE
  Food_Minerals (
    food_id BIGINT NOT NULL,
    calcium DECIMAL(5, 3) /* mg */,
    iron DECIMAL(5, 3) /* mg */,
    magnesium DECIMAL(5, 3) /* mg */,
    phosphorus DECIMAL(5, 3) /* mg */,
    potassium DECIMAL(5, 3) /* mg */,
    sodium DECIMAL(5, 3) /* mg */,
    zinc DECIMAL(5, 3) /* mg */,
    copper DECIMAL(5, 3) /* mg */,
    manganese DECIMAL(5, 3) /* mg */,
    selenium DECIMAL(5, 3) /* ug */,
    FOREIGN KEY (food_id) REFERENCES Foods (id)
  );

CREATE TABLE
  Food_Vitamins (
    food_id BIGINT NOT NULL,
    vitaminC DECIMAL(5, 3) /* mg */,
    vitaminB1 DECIMAL(5, 3) /* mg */,
    vitaminB2 DECIMAL(5, 3) /* mg */,
    vitaminB3 DECIMAL(5, 3) /* mg */,
    vitaminB5 DECIMAL(5, 3) /* mg */,
    vitaminB6 DECIMAL(5, 3) /* mg */,
    vitaminB9 DECIMAL(5, 3) /* ug */,
    vitaminB12 DECIMAL(5, 3) /* ug */,
    vitaminA1 DECIMAL(5, 3) /* ug */,
    retinol DECIMAL(5, 3) /* ug */,
    alphaCarotin DECIMAL(5, 3) /* ug */,
    betaCarotin DECIMAL(5, 3) /* ug */,
    betaCryptoxanthin DECIMAL(5, 3) /* ug */,
    lycopene DECIMAL(5, 3) /* ug */,
    lutZea DECIMAL(5, 3) /* ug */,
    vitamninE DECIMAL(5, 3) /* mg */,
    vitaminD DECIMAL(5, 3) /* ug */,
    vitaminK DECIMAL(5, 3) /* ug */,
    choline DECIMAL(5, 3) /* mg */,
    FOREIGN KEY (food_id) REFERENCES Foods (id)
  );

CREATE TABLE
  Food_Alcohols (
    food_id BIGINT NOT NULL,
    ethanol DECIMAL(5, 3) /* ml */,
    FOREIGN KEY (food_id) REFERENCES Foods (id)
  );

CREATE TABLE
  Food_Fats (
    food_id BIGINT NOT NULL,
    fattyAcidsSaturated DECIMAL(5, 3) /* g */,
    fattyAcidsMono DECIMAL(5, 3) /* g */,
    fatyAcidsPoly DECIMAL(5, 3) /* g */,
    cholesterol DECIMAL(5, 3) /* mg */,
    FOREIGN KEY (food_id) REFERENCES Foods (id)
  );

CREATE TABLE
  Food_Extras (
    food_id BIGINT NOT NULL,
    fiber DECIMAL(5, 3) /* g */,
    FOREIGN KEY (food_id) REFERENCES Foods (id)
  );

/* #endregion foods */;

CREATE TABLE
  DietDiaries (
    user_id BIGINT NOT NULL,
    food_id BIGINT NOT NULL,
    ammount INT NOT NULL,
    cunsumtionDate DATETIME,
    entryDate TIMESTAMP,
    privacy INT,
    FOREIGN KEY (user_id) REFERENCES Users (id)
  );

CREATE TABLE
  WorkoutDiaries (
    user_id BIGINT NOT NULL,
    workout_id BIGINT NOT NULL,
    ammount INT NOT NULL,
    activityDate DATETIME,
    entryDate TIMESTAMP,
    privacy INT FOREIGN KEY (user_id) REFERENCES Users (id)
  );

GO