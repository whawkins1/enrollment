DELIMITER $$

DROP FUNCTION IF EXISTS getYearsAttended$$
CREATE FUNCTION getYearsAttended (email VARCHAR(30))
RETURNS VARCHAR(100)

BEGIN
      DECLARE years_concat VARCHAR(100) DEFAULT ""; 
      
      IF EXISTS(SELECT 1 FROM enrolled_2010 WHERE user_email_2010 = email LIMIT 1) THEN
           SET years_concat = CONCAT_WS(',', '2010', years_concat);
      END IF;
      
      IF EXISTS(SELECT 1 FROM enrolled_2011 WHERE user_email_2011 = email LIMIT 1) THEN 
          SET years_concat = CONCAT_WS(',', '2011', years_concat);
      END IF;
      
      IF EXISTS(SELECT 1 FROM enrolled_2012 WHERE user_email_2012 = email LIMIT 1) THEN
          SET years_concat = CONCAT_WS(',', '2012', years_concat);
      END IF;
      
      IF EXISTS(SELECT 1 FROM enrolled_2013 WHERE user_email_2013 = email LIMIT 1) THEN
          SET years_concat = CONCAT_WS(',', '2013', years_concat);
      END IF;
      
      IF EXISTS(SELECT 1 FROM enrolled_2014 WHERE user_email_2014 = email LIMIT 1) THEN
          SET years_concat = CONCAT_WS(',', '2014', years_concat);
      END IF;
      
      IF EXISTS(SELECT 1 FROM enrolled_2015 WHERE user_email_2015 = email LIMIT 1) THEN
          SET years_concat = CONCAT_WS(',', '2015', years_concat);
      END IF;
      
      IF EXISTS(SELECT 1 FROM enrolled_2016 WHERE user_email_2016 = email LIMIT 1) THEN
          SET years_concat = CONCAT_WS(',', '2016', years_concat);
      END IF;
         
      SET years_concat = TRIM(TRAILING ',' FROM years_concat);
      
      RETURN years_concat;
END $$

DELIMITER $$
DROP FUNCTION IF EXISTS getSemesterGPA$$
CREATE FUNCTION getSemesterGPA(IN email VARCHAR(30), 
                               IN semester VARCHAR(6), 
                               IN year INT(4))
RETURNS DECIMAL(10, 2)

BEGIN
    DECLARE enrolledTable CHAR(13) DEFAULT CONCAT('enrolled_', year);
    DECLARE userGrade CHAR(15) DEFAULT CONCAT('user_grade_', year);
    DECLARE userSemester CHAR(18) DEFAULT CONCAT('user_semester_', year);
    DECLARE userEmail CHAR(15) DEFAULT CONCAT('user_email_', year);
    SET @gradeTotal = 0;
    SET @creditHours = 0;
    
    SET @sqlText = CONCAT("SELECT SUM(courses.credits), 
                                   SUM(CASE ",userGrade,"
                                            WHEN 'A' THEN 4
                                            WHEN 'B' THEN 3
                                            WHEN 'C' THEN 2
                                            WHEN 'D' THEN 1
                                            WHEN 'F' THEN 0
                                       END)                                         
                          INTO @creditHours, @gradeTotal 
                          FROM ", enrolledTable, " 
                          INNER JOIN courses
                          ON courses.code = user_course_code
                          WHERE ", userEmail, " = '",email,"' AND ",userSemester," = '",semester, "'");
    
    PREPARE stmt FROM @sqlText;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;    
                          
    RETURN (@gradeTotal / @creditHours)
 END$$
delimiter ;    

-- DECLARE subStringLength INT DEFAULT 0;
-- SET SubStrLen = CHAR_LENGTH(SUBSTRING_INDEX(stringYears, ',', 1)) + 2;    

DELIMITER $$
DROP FUNCTION IF EXISTS getTotalGPA$$

CREATE FUNCTION getTotalGPA(email VARCHAR(30), stringYears VARCHAR(100))
RETURNS DECIMAL(10, 2)
   
BEGIN
  DECLARE stringLength INT DEFAULT 0;
  DECLARE year CHAR(4);
  DECLARE enrolledTable CHAR(13) DEFAULT CONCAT("enrolled_", year);
  DECLARE enrolledGrade CHAR(15) DEFAULT CONCAT("user_grade_", year);
  DECLARE enrolledSemester CHAR(18) DEFAULT ("user_semester_", year);        
  DECLARE enrolledEmail CHAR(15) DEFAULT ("user_email_", year);
  DECLARE gradeTotal INT(3) DEFAULT 0;
  DECLARE creditHours INT(3) DEFAULT 0;

  IF stringYears IS NULL THEN
    SET stringYears = '';
  END IF;

perform_totaling:
  LOOP
    SET stringLength = CHAR_LENGTH(stringYears);
    SET year = SUBSTRING_INDEX(stringYears, ',', 1);
    SET stringYears = MID(stringYears, 6, stringLength);

    IF stringYears = '' THEN
      LEAVE perform_totaling;
    ELSE 
        
      CALL getSemesterGPA(email, semester, year, gradeTotal, creditHours);
    END IF;
   END LOOP perform_totaling;
 
   RETURN (gradeTotal/creditHours);
  END$$
  
        