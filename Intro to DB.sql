CREATE TABLE "customers" (
  "id" int GENERATED AS IDENTITY PRIMARY KEY,
  "name" varchar,
  "address" varchar,
  "phone" varchar,
  "email" varchar
);

CREATE TABLE "cars" (
  "id" int GENERATED AS IDENTITY PRIMARY KEY,
  "make" varchar,
  "model" varchar,
  "year" int,
  "car_plate" varchar,
  "customer_id" int
);

CREATE TABLE "accidents" (
  "id" int GENERATED AS IDENTITY PRIMARY KEY,
  "acc_date" datetime,
  "location" varchar,
  "description" text,
  "cars_id" int
);

CREATE TABLE "students" (
  "id" int GENERATED AS IDENTITY PRIMARY KEY,
  "name" varchar,
  "address" text,
  "phone" int,
  "email" varchar,
  "class_id" int
);

CREATE TABLE "teachers" (
  "id" int GENERATED AS IDENTITY PRIMARY KEY,
  "name" varchar,
  "address" text,
  "phone" int,
  "email" varchar
);

CREATE TABLE "classes" (
  "id" int GENERATED AS IDENTITY PRIMARY KEY,
  "name" varchar,
  "teacher_id" int
);

CREATE TABLE "students_classes" (
  "students_class_id" int,
  "classes_id" int,
  PRIMARY KEY ("students_class_id", "classes_id")
);

ALTER TABLE "cars" ADD FOREIGN KEY ("customer_id") REFERENCES "customers" ("id") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "cars" ADD FOREIGN KEY ("id") REFERENCES "accidents" ("cars_id") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "students_classes" ADD FOREIGN KEY ("students_class_id") REFERENCES "students" ("class_id") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "students_classes" ADD FOREIGN KEY ("classes_id") REFERENCES "classes" ("id") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "teachers" ADD FOREIGN KEY ("id") REFERENCES "classes" ("teacher_id") DEFERRABLE INITIALLY IMMEDIATE;
