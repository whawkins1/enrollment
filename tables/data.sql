
-- -----------------------------------------------------
-- Insert courses
-- -----------------------------------------------------
INSERT INTO courses 
    (code, title, days,
     begin_time, end_time, am_pm,
     credits, professor_last_name, 
     professor_first_name, location, department)
VALUES
    ("ENG101", "English I", "MWF",
     "9:00", "9:50", "am", 3, "Smith", 
     "Mike", "Hardway Hall", "English"),
     ("MATH101", "Math 100", "TR",
     "8:00", "9:15", "am", 3, "Hawkins",
     "Jenny", "Colebank Hall", "Math");
     
-- -----------------------------------------------------
-- Insert users
-- -----------------------------------------------------
INSERT INTO users 
    (user_email, user_first_name, user_last_name, user_password,
     user_country, user_state, user_city, user_major,
     user_address, user_home_phone, user_mobile_phone,
     user_postal_code)
VALUES
    ("johnboy@gmai.com", "john", "Boy", "f34f3f3f43f", "United States",
      "New York", "New York", "Business", "123 Avenue",
      "3045862949", "3993939396", 34585
    );