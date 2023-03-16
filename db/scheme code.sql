CREATE TABLE "plate" (
  "id" int PRIMARY KEY,
  "name" varchar(30),
  "region_id" int,
  "preparation_id" int,
  "calories_id" int,
  "type_id" int
);

CREATE TABLE "ingredients" (
  "id" int PRIMARY KEY,
  "name" varchar(30),
  "calories_id" int
);

CREATE TABLE "preparation" (
  "id" int PRIMARY KEY,
  "name" varchar(30)
);

CREATE TABLE "region" (
  "id" int PRIMARY KEY,
  "name" varchar(30)
);

CREATE TABLE "calories" (
  "id" int PRIMARY KEY,
  "amount" varchar(30)
);

CREATE TABLE "type" (
  "id" int PRIMARY KEY,
  "name" varchar(30)
);

CREATE TABLE "plateIngredients" (
  "plate_id" int,
  "ingredients_id" int,
  PRIMARY KEY ("plate_id", "ingredients_id")
);

ALTER TABLE "plate" ADD FOREIGN KEY ("region_id") REFERENCES "region" ("id");

ALTER TABLE "preparation" ADD FOREIGN KEY ("id") REFERENCES "plate" ("preparation_id");

ALTER TABLE "plate" ADD FOREIGN KEY ("calories_id") REFERENCES "calories" ("id");

ALTER TABLE "plate" ADD FOREIGN KEY ("type_id") REFERENCES "type" ("id");

ALTER TABLE "ingredients" ADD FOREIGN KEY ("calories_id") REFERENCES "calories" ("id");

CREATE TABLE "plate_plateIngredients" (
  "plate_id" int,
  "plateIngredients_plate_id" int,
  PRIMARY KEY ("plate_id", "plateIngredients_plate_id")
);

ALTER TABLE "plate_plateIngredients" ADD FOREIGN KEY ("plate_id") REFERENCES "plate" ("id");

ALTER TABLE "plate_plateIngredients" ADD FOREIGN KEY ("plateIngredients_plate_id") REFERENCES "plateIngredients" ("plate_id");


CREATE TABLE "ingredients_plateIngredients" (
  "ingredients_id" int,
  "plateIngredients_ingredients_id" int,
  PRIMARY KEY ("ingredients_id", "plateIngredients_ingredients_id")
);

ALTER TABLE "ingredients_plateIngredients" ADD FOREIGN KEY ("ingredients_id") REFERENCES "ingredients" ("id");

ALTER TABLE "ingredients_plateIngredients" ADD FOREIGN KEY ("plateIngredients_ingredients_id") REFERENCES "plateIngredients" ("ingredients_id");

