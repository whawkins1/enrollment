-- -----------------------------------------------------
-- Table users
-- -----------------------------------------------------  
  CREATE TABLE IF NOT EXISTS users (
  user_email VARCHAR(30) NOT NULL,
  user_first_name VARCHAR(30) NOT NULL,
  user_last_name VARCHAR(30) NOT NULL,
  user_password VARCHAR(187) NOT NULL,
  user_country VARCHAR(40) NOT NULL,
  user_state VARCHAR(40) NOT NULL,
  user_city VARCHAR(40) NOT NULL,
  user_major VARCHAR(30) NOT NULL,
  user_address VARCHAR(50) NOT NULL,
  user_home_phone VARCHAR(15) NOT NULL,
  user_mobile_phone VARCHAR(15) DEFAULT NULL,
  user_postal_code INT(5) NOT NULL,
  user_balance DECIMAL(10,2) NOT NULL DEFAULT 0.00,
  user_year_started INT(4) NOT NULL
  PRIMARY KEY (user_email),
  FOREIGN KEY(user_country)
     REFERENCES countries(country_name),
  FOREIGN KEY(user_state)
     REFERENCES states(state_name),
  FOREIGN KEY(user_city)
     REFERENCES cities(city_name),    
  FOREIGN KEY(user_major)
     REFERENCES majors(user_major)
) ENGINE=InnoDB;

-- -----------------------------------------------------
-- Table enrolled_2010
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS enrolled_2010 (
  user_email_2010 VARCHAR(30) NOT NULL,
  user_grade_2010 CHAR(1) NOT NULL DEFAULT "-",
  user_course_code VARCHAR(10) NOT NULL
  PRIMARY KEY(user_email_2010, user_course_code),
  FOREIGN KEY(user_email_2010) 
      REFERENCES users(user_email),
  FOREIGN KEY(user_course_code)
      REFERENCES courses(code)
) ENGINE=InnoDB;

-- -----------------------------------------------------
-- Table enrolled_2011
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS enrolled_2011 (
  user_email_2011 VARCHAR(30),
  user_grade_2011 CHAR(1) NOT NULL DEFAULT "-"
  PRIMARY KEY (user_email_2011),
  FOREIGN KEY(user_email_2011)
      REFERENCES users(user_email),
  FOREIGN KEY(user_course_code)
      REFERENCES courses(code)
) ENGINE=InnoDB;

-- -----------------------------------------------------
-- Table enrolled_2012
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS enrolled_2012 (
  user_email_2012 VARCHAR(30),
  user_grade_2012 CHAR(1) NOT NULL DEFAULT "-"
  PRIMARY KEY (user_email_2012),
  FOREIGN KEY(user_email_2012)
      REFERENCES users(user_email),
  FOREIGN KEY(user_course_code)
      REFERENCES courses(code)
) ENGINE=InnoDB;

-- -----------------------------------------------------
-- Table enrolled_2013
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS enrolled_2013 (
  user_email_2013 VARCHAR(30),
  user_grade_2013 CHAR(1) NOT NULL DEFAULT "-"
  PRIMARY KEY (user_email_2013),
  FOREIGN KEY(user_email_2013)
      REFERENCES users(user_email),
  FOREIGN KEY(user_course_code)
      REFERENCES courses(code)
) ENGINE=InnoDB;

-- -----------------------------------------------------
-- Table enrolled_2014
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS enrolled_2014 (
  user_email_2014 VARCHAR(30),
  user_grade_2014 CHAR(1) NOT NULL DEFAULT "-"
  PRIMARY KEY (user_email_2014),
  FOREIGN KEY(user_email_2014)
      REFERENCES users(user_email),
  FOREIGN KEY(user_course_code)
      REFERENCES courses(code)
) ENGINE=InnoDB;

-- -----------------------------------------------------
-- Table enrolled_2015
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS enrolled_2015 (
  user_email_2015 VARCHAR(30),
  user_grade_2015 CHAR(1) NOT NULL DEFAULT "-"
  PRIMARY KEY (user_email_2015),
  FOREIGN KEY(user_email_2015)
      REFERENCES users(user_email),
  FOREIGN KEY(user_course_code)
      REFERENCES courses(code)
) ENGINE=InnoDB;

-- -----------------------------------------------------
-- Table enrolled_2016
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS enrolled_2016 (
  user_email_2016 VARCHAR(30),
  user_grade_2016 CHAR(1) NOT NULL DEFAULT "-"
  PRIMARY KEY (user_email_2016),
  FOREIGN KEY(user_email_2016)
      REFERENCES users(user_email),
  FOREIGN KEY(user_course_code)
      REFERENCES courses(code)
) ENGINE=InnoDB;

-- -----------------------------------------------------
-- Table credit_card_visa
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS credit_card_visa (
  visa_number_hash VARCHAR(140) NOT NULL,
  visa_expire DATE NOT NULL,
  visa_cvv INT NOT NULL,
  PRIMARY KEY(visa_number_hash)
) ENGINE=InnoDB;

-- -----------------------------------------------------
-- Table credit_card_mastercard
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS credit_card_mastercard (
  mastercard_number_hash VARCHAR(140) NOT NULL,
  mastercard_expire DATE NOT NULL,
  mastercard_cvv INT NOT NULL,
  PRIMARY KEY(mastercard_number_hash)
) ENGINE=InnoDB;

-- -----------------------------------------------------
-- Table credit_card_american_express
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS credit_card_american_express (
  american_express_number_hash VARCHAR(140) NOT NULL,
  american_express_expire DATE NOT NULL,
  american_express_cvv INT NOT NULL,
  PRIMARY KEY(american_express_number_hash)
) ENGINE=InnoDB;

-- -----------------------------------------------------
-- Table credit_card_discover
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS credit_card_discover (
  discover_number_hash VARCHAR(140) NOT NULL,
  discover_expire DATE NOT NULL,
  discover_cvv INT NOT NULL,
  PRIMARY KEY(discover_number_hash)
) ENGINE=InnoDB;

-- -----------------------------------------------------
-- Table online_payment_amazon
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS online_payment_amazon (
  online_amazon_username VARCHAR(50),
  online_amazon_password VARCHAR(50),
  PRIMARY KEY(online_amazon_username)
) ENGINE=InnoDB;

-- -----------------------------------------------------
-- Table online_payment_google
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS online_payment_google (
  online_google_username VARCHAR(50),
  online_google_password VARCHAR(50),
  PRIMARY KEY(online_google_username)
) ENGINE=InnoDB;

-- -----------------------------------------------------
-- Table online_payment_paypal
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS online_payment_paypal (
  online_paypal_username VARCHAR(50),
  online_paypal_password VARCHAR(50),
  PRIMARY KEY(online_paypal_username)
) ENGINE=InnoDB;


-- -----------------------------------------------------
-- Table courses
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS courses (
  code VARCHAR(8) NOT NULL,
  title VARCHAR(10) NOT NULL,
  days VARCHAR(7) NOT NULL,
  begin_time VARCHAR(5) NOT NULL,
  end_time VARCHAR(5) NOT NULL,
  am_pm VARCHAR(2) NOT NULL,
  credits INT(2) NOT NULL,
  professor_last_name VARCHAR(30) NOT NULL,
  professor_first_name VARCHAR(30) NOT NULL,
  location VARCHAR(40) NOT NULL,
  department VARCHAR(40) NOT NULL,
  PRIMARY KEY (code),
  FOREIGN KEY (department) REFERENCES departments(department),
  FOREIGN KEY (professor_last_name, professor_first_name) 
      REFERENCES professors(last_name, first_name)
) ENGINE=InnoDB;

-- -----------------------------------------------------
-- Table payments
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS payments (
  id INT NOT NULL,
  payment_amount DECIMAL(10,2) NOT NULL,
  payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  payment_username VARCHAR(40) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB;

-- -----------------------------------------------------
-- Table charges
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS charges (
  id INT NOT NULL,
  charge_amount DECIMAL(10,2) NOT NULL,
  charge_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  charge_username VARCHAR(40) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB;

-- -----------------------------------------------------
-- Table cities
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS cities (
  city_id int(11) unsigned NOT NULL,
  city_name VARCHAR(60) NOT NULL,
  state_id int(11) unsigned NOT NULL,
  PRIMARY KEY (city_id),
  UNIQUE KEY city_name (city_name),
  KEY state_id (state_id)
) ENGINE=InnoDB;

-- -----------------------------------------------------
-- Table countries
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS countries (
  country_id int(3) unsigned NOT NULL,
  country_name VARCHAR(40) NOT NULL,
  PRIMARY KEY (country_id),
  UNIQUE KEY (country_name)
) ENGINE=InnoDB;

-- -----------------------------------------------------
-- Table states
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS states (
  state_id int(11) unsigned NOT NULL,
  country_id int(3) unsigned NOT NULL,
  state_name VARCHAR(60) NOT NULL,
  PRIMARY KEY (state_id),
  UNIQUE KEY (state_name),
  KEY country_id (country_id)
) ENGINE=InnoDB;

-- -----------------------------------------------------
-- Table user_logs
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS user_logs (
  log_email VARCHAR(40) NOT NULL,
  log_action VARCHAR(40) NOT NULL,
  log_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,  
  PRIMARY KEY (log_email),
   FOREIGN KEY (log_email) REFERENCES users(user_email)
) ENGINE=InnoDB;

