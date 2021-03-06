--Will Concatenate years attended separated by comma
DROP FUNCTION IF EXISTS getYearsAttended$$
CREATE FUNCTION getYearsAttended (email VARCHAR(30))
RETURNS VARCHAR(100)
DETERMINISTIC

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

DROP PROCEDURE IF EXISTS getSemesterGPA$$
CREATE PROCEDURE getSemesterGPA(IN email VARCHAR(30),
                                IN semester VARCHAR(6), 
                                IN year INT(4),
                                OUT semesterGPA DECIMAL(10, 2))
DETERMINISTIC

BEGIN
    DECLARE enrolledTable CHAR(13) DEFAULT CONCAT('enrolled_', year);
    DECLARE userGrade CHAR(15) DEFAULT CONCAT('user_grade_', year);
    DECLARE userSemester CHAR(18) DEFAULT CONCAT('user_semester_', year);
    DECLARE userEmail CHAR(15) DEFAULT CONCAT('user_email_', year);
    SET @gpa = 0.00;
    SET @email = email;
    SET @semester = semester;
    
    SET @sqlText = CONCAT("SELECT SUM(courses.credits) * (CASE ",userGrade,"
                                                            WHEN 'A' THEN 4
                                                            WHEN 'B' THEN 3
                                                            WHEN 'C' THEN 2
                                                            WHEN 'D' THEN 1
                                                            WHEN 'F' THEN 0
                                                          END)  
                                                       /  SUM(courses.credits)     
                          INTO @gpa 
                          FROM ", enrolledTable, " 
                          INNER JOIN courses
                          ON courses.code = user_course_code
                          WHERE ", userEmail, " = ? AND ",userSemester," = ?");
    
    PREPARE stmt FROM @sqlText;
    EXECUTE stmt
    USING @email, @semester;
    DEALLOCATE PREPARE stmt;    
    SET semesterGPA = @gpa;
 END$$
 

DELIMITER $$
DROP PROCEDURE IF EXISTS getCumulativeGPA$$
CREATE PROCEDURE getCumulativeGPA(IN email VARCHAR(30),
                                  OUT cumulativeGPA DECIMAL(10, 2))
DETERMINISTIC
   
BEGIN
  DECLARE stringLength INT DEFAULT 0;
  DECLARE year CHAR(4);
  DECLARE enrolledTable CHAR(13);
  DECLARE enrolledGrade CHAR(15);
  DECLARE enrolledEmail CHAR(15);
  DECLARE gradeTotal INT(3) DEFAULT 0;
  DECLARE creditHours INT(3) DEFAULT 0;
  DECLARE yearsAttended VARCHAR(100) DEFAULT getYearsAttended(email);
  
  IF yearsAttended != "" THEN      
    SET @tempGradeTotal = 0;
    SET @tempCreditHours = 0;
    SET @email = email;
    
    perform_totaling:
      LOOP
            SET stringLength = CHAR_LENGTH(yearsAttended);
            SET year = SUBSTRING_INDEX(yearsAttended, ',', 1);
            SET enrolledTable = CONCAT("enrolled_", year);
            SET enrolledGrade = CONCAT("user_grade_", year);
            SET enrolledEmail = CONCAT("user_email_", year);
            SET yearsAttended = MID(yearsAttended, 6, stringLength);
            
            SET @sqlText = CONCAT("SELECT SUM(courses.credits), 
                                       SUM(CASE ",enrolledGrade,"
                                                WHEN 'A' THEN 4
                                                WHEN 'B' THEN 3
                                                WHEN 'C' THEN 2
                                                WHEN 'D' THEN 1
                                                WHEN 'F' THEN 0
                                           END)                                         
                              INTO @tempCreditHours, @tempGradeTotal 
                              FROM ", enrolledTable, " 
                              INNER JOIN courses
                              ON courses.code = user_course_code
                              WHERE ", enrolledEmail, " = ?");
        
                PREPARE stmt FROM @sqlText;
                EXECUTE stmt
                USING @email;
                DEALLOCATE PREPARE stmt;
              
              SET gradeTotal = (gradeTotal + (@tempGradeTotal * @tempCreditHours));
              SET creditHours = (creditHours + @tempCreditHours);
            
            IF yearsAttended = '' THEN
              LEAVE perform_totaling;
            END IF;
       END LOOP perform_totaling;
     SELECT (gradeTotal / creditHours) INTO cumulativeGPA;
   END IF;
  END$$  