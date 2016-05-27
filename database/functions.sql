DELIMITER //

DROP FUNCTION IF EXISTS getYearsAttended;//
CREATE FUNCTION getYearsAttended (email VARCHAR(30))
RETURNS VARCHAR(100)

BEGIN
      DECLARE years_concat VARCHAR(100) DEFAULT ""; 
      
      IF SELECT EXISTS(SELECT 1 FROM enrolled_2010 WHERE user_email_2010 = email LIMIT 1) THEN
           SET years_concat = CONCAT_WS(',', '2010', years_concat);
      END IF;
      
      IF SELECT EXISTS(SELECT 1 FROM enrolled_2011 WHERE email_enrolled = email LIMIT 1) THEN 
          SET years_concat = CONCAT_WS(',', '2011', years_concat);
      END IF;
      
      IF SELECT EXISTS(SELECT 1 FROM enrolled_2012 WHERE email_enrolled = email LIMIT 1) THEN
          SET years_concat = CONCAT_WS(',', '2012', years_concat);
      END IF;
      
      IF SELECT EXISTS(SELECT 1 FROM enrolled_2013 WHERE email_enrolled = email LIMIT 1) THEN
          SET years_concat = CONCAT_WS(',', '2013', years_concat);
      END IF;
      
      IF SELECT EXISTS(SELECT 1 FROM enrolled_2014 WHERE email_enrolled = email LIMIT 1) THEN
          SET years_concat = CONCAT_WS(',', '2014', years_concat);
      END IF;
      
      IF SELECT EXISTS(SELECT 1 FROM enrolled_2015 WHERE email_enrolled = email LIMIT 1) THEN
          SET years_concat = CONCAT_WS(',', '2015', years_concat);
      END IF;
      
      IF SELECT EXISTS(SELECT 1 FROM enrolled_2016 WHERE email_enrolled = email LIMIT 1) THEN
          SET years_concat = CONCAT_WS(',', '2016', years_concat);
      END IF;
      
      RETURN years_concat;
END; //

DROP FUNCTION IF EXISTS getUserSemesterGPA;//

CREATE FUNCTION getUserSemesterGPA(email VARCHAR(30), semester CHAR(6), year CHAR(4))
RETURNS DECIMAL(10, 2)

BEGIN
    DECLARE gradeA CHAR(1) DEFAULT 'A';
    DECLARE gradeB CHAR(1) DEFAULT 'B';
    DECLARE gradeC CHAR(1) DEFAULT 'C';
    DECLARE gradeD CHAR(1) DEFAULT 'D';
    DECLARE gradeF CHAR(1) DEFAULT 'F';
    DECLARE gpa DECIMAL(10, 2) DEFAULT 0.00; 
    
    DECLARE concatYear CHAR(13) DEFAULT CONCAT('enrolled_', year);
    DECLARE concatEmail CHAR(14) DEFAULT CONCAT('user_email_', year);
    DECLARE concatGrade CHAR(15) DEFAULT CONCAT('user_grade_', year);
        
    DECLARE cur1 CURSOR FOR SELECT concatGrade FROM concatYear WHERE concatEmail = email;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    OPEN cur1;
    
    read_loop: LOOP
       FETCH cur1 INTO grade;
    IF done THEN
        LEAVE read_loop;
    END IF;
    -- ADD GRADES HERE IN IF STATEMENT
    
    END LOOP;
    
    IF semester = 'fall' THEN
    
       
    ELSEIF semester = 'spring' THEN
    
    ELSEIF semenster = 'summer' THEN
    
    END IF;
    
END; //