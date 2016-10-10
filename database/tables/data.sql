
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
     (4, 1.44, "jjaso@gmail.com"),
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
     (9, 1.44, "jjaso@gmail.com"),
     (10, 1444.00, "up@yahoo.com");
     
-- -----------------------------------------------------
-- insert credit_card_american_express
-- -----------------------------------------------------
INSERT INTO credit_card_american_express 
   (american_express_number_hash, american_express_expire, american_express_cvv, american_express_balance, american_express_fullname)
VALUES
     (349493027412456, '2018-04-00', 8823, 400.15, 'john l stevens'),
     (376789124367894, '2020-06-00', 1287, 2800.12, 'bob h pompeani'),
     (345858484825353, '2017-03-00', 2435, 384.15, 'michael j jordan'),
     (379555789643345, '2018-12-00', 9176, 908.45, 'john w jaso'),
     (343453656979423, '2019-02-00', 3754, 4045.15, 'ulysses s parker');

-- -----------------------------------------------------
-- insert credit_card_discover
-- -----------------------------------------------------
INSERT INTO credit_card_discover 
   (discover_number_hash, discover_expire, discover_cvv, discover_balance, discover_fullname)
VALUES
     (6011057085920365, '2018-04-00', 823, 8456.12, 'michael j jordan'),
     (6508314038920492, '2020-06-00', 287, 3456.23, 'john w jaso'),
     (6221283237582934, '2017-03-00', 235, 495.12, 'bob h pompeani'),
     (6011245585923345, '2018-12-00', 176, 904.75, 'ulysses s parker'),
     (6508274038920492, '2019-02-00', 374, 12.73, 'john l stevens');

-- -----------------------------------------------------
-- insert credit_card_mastercard
-- -----------------------------------------------------
INSERT INTO credit_card_mastercard 
   (mastercard_number_hash, mastercard_expire, mastercard_cvv, mastercard_balance, mastercard_fullname)
VALUES
     (5474938278319496, '2018-04-00', 423, 5923.56, 'bob h pompeani'),
     (5247691283367394, '2020-06-00', 138, 123.56, 'ulysses s parker'),
     (5492584384845373, '2017-03-00', 864, 67.83, 'john w jaso'),
     (5315552789543375, '2018-12-00', 626, 9.73, 'michael j jordan'),
     (5454536529477453, '2019-02-00', 937, 3739.23, 'john l stevens');
     
-- -----------------------------------------------------
-- insert credit_card_visa
-- -----------------------------------------------------
INSERT INTO credit_card_visa
   (visa_number_hash, visa_expire, visa_cvv, visa_balance, visa_fullname)
VALUES
     (4494950677124563, '2018-04-00', 753, 1894.34, 'michael j jordan'),
     (4767891243679, '2020-06-00', 457, 9485.93, 'john l stevens'),
     (4458584848253532, '2017-03-00', 396, 765.45, 'john w jaso'),
     (4795537443945, '2018-12-00', 946, 345.00, 'ulysses s parker'),
     (4434855697948, '2019-02-00', 283, 649.49, 'bob h pompeani');

-- -----------------------------------------------------
-- insert online_payment_amazon
-- -----------------------------------------------------
INSERT INTO online_payment_amazon 
    (online_amazon_username, online_amazon_password, online_amazon_balance)  
  VALUES
    ('bpomp@yahoo.com', 'pass1', 849.23),
    ('jsvens@gmail', 'pass2', 3945.93),
    ('mjordan@gmail.com', 'pass3', 2390.19),
    ('jjaso.gmail.com', 'pass4', 194.25),
    ('up@yahoo.com', 'pass5', 1834.73);
 
-- -----------------------------------------------------
-- insert online_payment_google
-- -----------------------------------------------------
INSERT INTO online_payment_google
    (online_google_username, online_google_password, online_google_balance)  
  VALUES
    ('bpomp@yahoo.com', 'pass1', 742.23),
    ('jsvens@gmail', 'pass2', 1935.92),
    ('mjordan@gmail.com', 'pass3', 90.19),
    ('jjaso.gmail.com', 'pass4', 4194.25),
    ('up@yahoo.com', 'pass5', 7434.43);

-- -----------------------------------------------------
-- insert online_payment_paypal
-- -----------------------------------------------------
INSERT INTO online_payment_paypal
    (online_paypal_username, online_paypal_password, online_paypal_balance)  
  VALUES
    ('bpomp@yahoo.com', 'pass1', 42.23),
    ('jsvens@gmail', 'pass2', 1632.26),
    ('mjordan@gmail.com', 'pass3', 1256.83),
    ('jjaso.gmail.com', 'pass4', 0.23),
    ('up@yahoo.com', 'pass5', 2535.38);