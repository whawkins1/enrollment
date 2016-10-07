
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
     user_postal_code, user_balance, user_year_started, user_fine)
VALUES
    ("johnboy@gmail.com", "john", "Boy", "f34f3f3f43f", "United States",
      "New York", "New York", "Business", "123 Avenue",
      "3045862949", "3993939396", 34585, 193.99, 2012, 5.49)
    );
    
-- -----------------------------------------------------
-- Insert enrolled_2010
-- ------------------------------------------------------
INSERT INTO enrolled_2010
    (user_email_2010, user_grade_2010, user_semester_2010, user_course_code)
VALUES
    ("bpomp@yahoo.com", "B", "Fall", "MATH101"),
    ("jjaso@gmail.com", "C", "Spring", "ENG101"),
    ("jsvens@gmail.com", "A", "Summer", "MATH101"),
    ("mjordan@gmail.com", "F", "Fall", "ENG101"),
    ("up@yahoo.com", "D", "Spring", "MATH101");
    
-- -----------------------------------------------------
-- Insert enrolled_2011
-- ------------------------------------------------------
INSERT INTO enrolled_2011
    (user_email_2011, user_grade_2011, user_semester_2011, user_course_code)
VALUES
    ("bpomp@yahoo.com", "B", "Fall", "MATH101"),
    ("jjaso@gmail.com", "C", "Spring", "ENG101"),
    ("jsvens@gmail.com", "A", "Summer", "MATH101"),
    ("mjordan@gmail.com", "F", "Fall", "ENG101"),
    ("up@yahoo.com", "D", "Spring", "MATH101");
    
-- -----------------------------------------------------
-- Insert enrolled_2012
-- ------------------------------------------------------
INSERT INTO enrolled_2012
    (user_email_2012, user_grade_2012, user_semester_2012, user_course_code)
VALUES
    ("bpomp@yahoo.com", "B", "Fall", "MATH101"),
    ("jjaso@gmail.com", "C", "Spring", "ENG101"),
    ("jsvens@gmail.com", "A", "Summer", "MATH101"),
    ("mjordan@gmail.com", "F", "Fall", "ENG101"),
    ("up@yahoo.com", "D", "Spring", "MATH101");
    
-- -----------------------------------------------------
-- Insert enrolled_2013
-- ------------------------------------------------------
INSERT INTO enrolled_2013
    (user_email_2013, user_grade_2013, user_semester_2013, user_course_code)
VALUES
    ("bpomp@yahoo.com", "B", "Fall", "MATH101"),
    ("jjaso@gmail.com", "C", "Spring", "ENG101"),
    ("jsvens@gmail.com", "A", "Summer", "MATH101"),
    ("mjordan@gmail.com", "F", "Fall", "ENG101"),
    ("up@yahoo.com", "D", "Spring", "MATH101");
    
-- -----------------------------------------------------
-- Insert enrolled_2014
-- ------------------------------------------------------
INSERT INTO enrolled_2014
    (user_email_2014, user_grade_2014, user_semester_2014, user_course_code)
VALUES
    ("bpomp@yahoo.com", "B", "Fall", "MATH101"),
    ("jjaso@gmail.com", "C", "Spring", "ENG101"),
    ("jsvens@gmail.com", "A", "Summer", "MATH101"),
    ("mjordan@gmail.com", "F", "Fall", "ENG101"),
    ("up@yahoo.com", "D", "Spring", "MATH101");
    
-- -----------------------------------------------------
-- Insert enrolled_2015
-- ------------------------------------------------------
INSERT INTO enrolled_2015
    (user_email_2015, user_grade_2015, user_semester_2015, user_course_code)
VALUES
    ("bpomp@yahoo.com", "B", "Fall", "MATH101"),
    ("jjaso@gmail.com", "C", "Spring", "ENG101"),
    ("jsvens@gmail.com", "A", "Summer", "MATH101"),
    ("mjordan@gmail.com", "F", "Fall", "ENG101"),
    ("up@yahoo.com", "D", "Spring", "MATH101");
    
-- -----------------------------------------------------
-- Insert enrolled_2016
-- ------------------------------------------------------
INSERT INTO enrolled_2016
    (user_email_2016, user_grade_2016, user_semester_2016, user_course_code)
VALUES
    ("bpomp@yahoo.com", "B", "Fall", "MATH101"),
    ("jjaso@gmail.com", "C", "Spring", "ENG101"),
    ("jsvens@gmail.com", "A", "Summer", "MATH101"),
    ("mjordan@gmail.com", "F", "Fall", "ENG101"),
    ("up@yahoo.com", "D", "Spring", "MATH101");
    
-- -----------------------------------------------------
-- Insert payments
-- -----------------------------------------------------
INSERT INTO payments
     (id, payment_amount, payment_username)
VALUES
     (1, 102.11, "bpomp@yahoo.com"),
     (2, 12.65, "jsvens@gmail.com"),
     (3, 949.22, "mjordan@gmail.com"),
     (4, 1.44, "jjaso"),
     (5, 1444.00, "up@yahoo.com");

-- -----------------------------------------------------
-- insert charges
-- -----------------------------------------------------
INSERT INTO charges 
   (id, charge_amount, charge_username)
VALUES
     (6, 102.11, "bpomp@yahoo.com"),
     (7, 12.65, "jsvens@gmail.com"),
     (8, 949.22, "mjordan@gmail.com"),
     (9, 1.44, "jjaso"),
     (10, 1444.00, "up@yahoo.com");
     
-- -----------------------------------------------------
-- insert credit_card_american_express
-- -----------------------------------------------------
INSERT INTO credit_card_american_express 
   (american_express_number_hash, american_express_expire, american_express_cvv)
VALUES
     (349493027412456, '2018-04-00', 8823),
     (376789124367894, '2020-06-00', 1287),
     (345858484825353, '2017-03-00', 2435),
     (379555789643345, '2018-12-00', 9176),
     (343453656979423, '2019-02-00', 3754);

-- -----------------------------------------------------
-- insert credit_card_discover
-- -----------------------------------------------------
INSERT INTO credit_card_american_express 
   (american_express_number_hash, american_express_expire, american_express_cvv)
VALUES
     (349493027412456, '2018-04-00', 8823),
     (376789124367894, '2020-06-00', 1287),
     (345858484825353, '2017-03-00', 2435),
     (379555789643345, '2018-12-00', 9176),
     (343453656979423, '2019-02-00', 3754);

-- -----------------------------------------------------
-- insert credit_card_mastercard
-- -----------------------------------------------------
INSERT INTO credit_card_american_express 
   (american_express_number_hash, american_express_expire, american_express_cvv)
VALUES
     (349493027412456, '2018-04-00', 8823),
     (376789124367894, '2020-06-00', 1287),
     (345858484825353, '2017-03-00', 2435),
     (379555789643345, '2018-12-00', 9176),
     (343453656979423, '2019-02-00', 3754);
     
-- -----------------------------------------------------
-- insert credit_card_visa
-- -----------------------------------------------------
INSERT INTO credit_card_american_express 
   (american_express_number_hash, american_express_expire, american_express_cvv)
VALUES
     (349493027412456, '2018-04-00', 8823),
     (376789124367894, '2020-06-00', 1287),
     (345858484825353, '2017-03-00', 2435),
     (379555789643345, '2018-12-00', 9176),
     (343453656979423, '2019-02-00', 3754);

     