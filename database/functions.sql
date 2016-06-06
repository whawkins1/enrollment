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
      
      RETURN years_concat;
END


<<<<<<< HEAD

DELIMITER $$
DROP PROCEDURE IF EXISTS getSemesterGPA$$
CREATE PROCEDURE getSemesterGPA(IN email VARCHAR(30), 
                                IN semester VARCHAR(6), 
                                IN year INT(4), 
                                INOUT gradeTotal INT(3), 
                                INOUT creditHours INT(3))

BEGIN
    DECLARE tempGradeTotal INT(3) DEFAULT 0;
    DECLARE tempCreditHours INT(3) DEFAULT 0;
    DECLARE enrolledTable CHAR(13) DEFAULT ('enrolled_', year);
    DECLARE userGrade CHAR(15) DEFAULT ('user_grade_', year);
    DECLARE userSemester CHAR(18) DEFAULT ('user_semester_', year);
   
    SELECT SUM(courses.credits), 
                                   SUM(CASE userGrade
                                            WHEN 'A' THEN 4
                                            WHEN 'B' THEN 3
                                            WHEN 'C' THEN 2
                                            WHEN 'D' THEN 1
                                            WHEN 'F' THEN 0
                                       END)                                         
                          INTO tempCreditHours, tempGradeTotal 
                          FROM enrolledTable 
                          INNER JOIN courses
                          ON courses.code = user_course_code
                          WHERE userEmail = email AND userSemester = semester;
                          
    SET gradeTotal = gradeTotal + tempGradeTotal;
    SET creditHours = creditHours + tempCreditHoursCredits;
END$$
   
=======
>>>>>>> cda9f5b6a5042de758da3504fe0f1dd159b62750
    /*DECLARE curGradesCredits2010 CURSOR FOR SELECT enrolled_2010.user_grade_2010, SUM(courses.credits) FROM enrolled_2010 
                                        INNER JOIN courses
                                        ON courses.code = enrolled_2010.user_course_code
                                        WHERE enrolled_2010.user_email = email AND enrolled_2010.user_semester_2010 = semester;

    DECLARE curGradesCredits2011 CURSOR FOR SELECT enrolled_2011.user_grade_2011, SUM(courses.credits) FROM enrolled_2011 
                                            INNER JOIN courses
                                            ON courses.code = enrolled_2011.user_course_code
                                            WHERE enrolled_2011.user_email = email AND enrolled_2011.user_semester_2011 = semester;
   
    DECLARE curGradesCredits2012 CURSOR FOR SELECT enrolled_2012.user_grade_2012, SUM(courses.credits) FROM enrolled_2012 
                                            INNER JOIN courses
                                            ON courses.code = enrolled_2012.user_course_code
                                            WHERE enrolled_2012.user_email = email AND enrolled_2012.user_semester_2010 = semester;
                                            
    DECLARE curGradesCredits2013 CURSOR FOR SELECT enrolled_2013.user_grade_2013, SUM(courses.credits) FROM enrolled_2013 
                                            INNER JOIN courses
                                            ON courses.code = enrolled_2013.user_course_code
                                            WHERE enrolled_2013.user_email = email AND enrolled_2013.user_semester_2013 = semester;         
        
    DECLARE curGradesCredits2014 CURSOR FOR SELECT enrolled_2014.user_grade_2014, SUM(courses.credits) FROM enrolled_2014 
                                            INNER JOIN courses
                                            ON courses.code = enrolled_2014.user_course_code
                                            WHERE enrolled_2014.user_email = email AND enrolled_2014.user_semester_2014 = semester;    
   
    DECLARE curGradesCredits2015 CURSOR FOR SELECT enrolled_2015.user_grade_2015, SUM(courses.credits) FROM enrolled_2015 
                                            INNER JOIN courses
                                            ON courses.code = enrolled_2015.user_course_code
                                            WHERE enrolled_2015.user_email = email AND enrolled_2015.user_semester_2015 = semester;
                               
    DECLARE curGradesCredits2016 CURSOR FOR SELECT enrolled_2016.user_grade_2016, SUM(courses.credits) FROM enrolled_2016 
                                            INNER JOIN courses
                                            ON courses.code = enrolled_2016.user_course_code
                                            WHERE enrolled_2016.user_email = email AND enrolled_2016.user_semester_2016 = semester; */                           
<<<<<<< HEAD
   
   
       
   /*IF year = '2010' THEN
                             
    ELSEIF year = '2011' THEN                      
                         SELECT SUM(courses.credits), 
                                   SUM(CASE enrolled_2011.user_grade_2011
                                            WHEN 'A' THEN 4
                                            WHEN 'B' THEN 3
                                            WHEN 'C' THEN 2
                                            WHEN 'D' THEN 1
                                            WHEN 'F' THEN 0
                                       END)                                         
                          INTO tempCreditHours, tempGradeTotal 
                          FROM enrolled_2011
                          INNER JOIN courses
                          ON courses.code = enrolled_2011.user_course_code
                          WHERE enrolled_2011.user_email_2011 = email AND enrolled_2011.user_semester_2011 = semester;       
    ELSEIF year = '2012' THEN                      
                         SELECT SUM(courses.credits), 
                                   SUM(CASE enrolled_2012.user_grade_2012
                                            WHEN 'A' THEN 4
                                            WHEN 'B' THEN 3
                                            WHEN 'C' THEN 2
                                            WHEN 'D' THEN 1
                                            WHEN 'F' THEN 0
                                       END)                                         
                          INTO tempCreditHours, tempGradeTotal 
                          FROM enrolled_2012 
                          INNER JOIN courses
                          ON courses.code = enrolled_2012.user_course_code
                          WHERE enrolled_2010.user_email_ = email AND enrolled_2010.user_semester_2010 = semester;
=======
    
    DELIMITER $$
       DROP PROCEDURE IF EXISTS getUserSemesterGPA$$

       CREATE PROCEDURE getUserSemesterGPA(IN email VARCHAR(30), 
                                           IN semester CHAR(6), 
                                           IN year CHAR(4),
                                           INOUT gradeTotal INT(3),
                                           INOUT creditHours INT(3))

    BEGIN
        DECLARE done INT DEFAULT FALSE;
        DECLARE tempGradeTotal, tempCreditHours INT(3) DEFAULT 0;                    
        DECLARE enrolledTable CHAR(13) DEFAULT CONCAT("enrolled_", year);
        DECLARE enrolledGrade CHAR(15) DEFAULT CONCAT("user_grade_", year);
        DECLARE enrolledSemester CHAR(16) DEFAULT ("user_semester_", year);        
        DECLARE enrolledEmail CHAR(14) DEFAULT ("user_email_", year);
>>>>>>> cda9f5b6a5042de758da3504fe0f1dd159b62750
       
       IF year = '2010' THEN
                             SELECT SUM(courses.credits), 
                                       SUM(CASE enrolledGrade
                                            WHEN 'A' THEN 4
                                            WHEN 'B' THEN 3
                                            WHEN 'C' THEN 2
                                            WHEN 'D' THEN 1
                                            WHEN 'F' THEN 0
                                            WHEN '-' THEN 0
                                       END)                                         
                              INTO tempCreditHours, tempGradeTotal 
                              FROM enrolledTable
                              INNER JOIN courses
                              ON courses.code = user_course_code
                              WHERE enrolledEmail = email AND enrolledSemester = semester;    
       END IF;
    
<<<<<<< HEAD
=======
    SET gradeTotal = gradeTotal + tempGradeTotal;
    SET creditHours = creditHours + tempCreditHoursCredits;
    END$$
>>>>>>> cda9f5b6a5042de758da3504fe0f1dd159b62750
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    OPEN cur;
    
    perform_totaling:
    LOOP
       FETCH cur INTO grade, credits;
       IF done THEN
            LEAVE perform_totaling;
       END IF;
        
       IF grade == 'A' THEN
          SET points = 4;
       ELSEIF grade == 'B' THEN
          SET points = 3;
       ELSEIF grade == 'C' THEN
          SET points = 2
       ELSEIF grade == 'D' THEN
          SET points = 1;
       ELSEIF grade == 'F' THEN
          SET points = 0;
       END IF; 
    END LOOP;
    CLOSE cur; */


-- DECLARE subStringLength INT DEFAULT 0;
-- SET SubStrLen = CHAR_LENGTH(SUBSTRING_INDEX(stringYears, ',', 1)) + 2;    

DELIMITER $$
DROP FUNCTION IF EXISTS getTotalGPA$$

CREATE FUNCTION getTotalGPA(email VARCHAR(30), stringYears VARCHAR(100))
RETURNS DECIMAL(10, 2)
   
BEGIN
  DECLARE stringLength INT DEFAULT 0;
  DECLARE year CHAR(4);
  DECLARE semester VARCHAR(6);
  DECLARE enrolledTable CHAR(13) DEFAULT CONCAT("enrolled_", year);
  DECLARE enrolledGrade CHAR(15) DEFAULT CONCAT("user_grade_", year);
  DECLARE enrolledSemester CHAR(16) DEFAULT ("user_semester_", year);        
  DECLARE enrolledEmail CHAR(14) DEFAULT ("user_email_", year);
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
         CASE
             WHEN EXISTS(SELECT 1 FROM enrolledTable 
                             WHERE enrolledEmail = email 
                             AND enrolledSemester = 'fall' LIMIT 1) THEN 
             SET semester = 'fall';
         END CASE;    
         CASE 
             WHEN EXISTS(SELECT 1 FROM enrolledTable 
                                 WHERE enrolledEmail = email 
                                 AND enrolledSemester  = 'spring' LIMIT 1) THEN
             SET semester = 'spring';         
         END CASE;   
         CASE
             WHEN EXISTS(SELECT 1 FROM enrolledTable 
                                 WHERE enrolledEmail = email 
                                 AND enrolledSemester  = 'summer' LIMIT 1) THEN
             SET semester = 'spring';    
         END CASE;   
      CALL getSemesterGPA(email, semester, year, gradeTotal, creditHours);
    END IF;
   END LOOP perform_totaling;
 
   RETURN (gradeTotal/creditHours);
  END$$
  
    /*ELSEIF year = '2010' THEN
       IF SELECT EXISTS(SELECT 1 FROM enrolled_2010 
                                 WHERE enrolled_2010.user_email_2010 = email 
                                 AND enrolled_2010.user_semester_2010  = 'fall' LIMIT 1) THEN
           SET semester = 'fall';                                 
       ELSEIF SELECT EXISTS(SELECT 1 FROM enrolled_2010 
                                 WHERE enrolled_2010.user_email_2010 = email 
                                 AND enrolled_2010.user_semester_2010  = 'spring' LIMIT 1) THEN
           SET semester = 'spring';                                 
       ELSEIF SELECT EXISTS(SELECT 1 FROM enrolled_2010 
                                 WHERE enrolled_2010.user_email_2010 = email 
                                 AND enrolled_2010.user_semester_2010  = 'summer' LIMIT 1) THEN
           SET semester = 'summer';                                 
       END IF;   
    ELSEIF year = '2011' THEN
           IF SELECT EXISTS(SELECT 1 FROM enrolled_2011
                                     WHERE enrolled_2011.user_email_2011 = email 
                                     AND enrolled_2011.user_semester_2011 = 'fall' LIMIT 1) THEN
               SET semester = 'fall';                                 
           ELSEIF SELECT EXISTS(SELECT 1 FROM enrolled_2011
                                     WHERE enrolled_2011.user_email_2011 = email 
                                     AND enrolled_2011.user_semester_2011  = 'spring' LIMIT 1) THEN
               SET semester = 'spring';                                 
           ELSEIF SELECT EXISTS(SELECT 1 FROM enrolled_2011
                                     WHERE enrolled_2011.user_email_2011 = email 
                                     AND enrolled_2011.user_semester_2011 = 'summer' LIMIT 1) THEN
               SET semester = 'summer';                                 
           END IF;  
       ELSEIF year = '2012' THEN
           IF SELECT EXISTS(SELECT 1 FROM enrolled_2012
                                     WHERE enrolled_2012.user_email_2012 = email 
                                     AND enrolled_2011.user_semester_2012 = 'fall' LIMIT 1) THEN
               SET semester = 'fall';                                 
           ELSEIF SELECT EXISTS(SELECT 1 FROM enrolled_2012
                                     WHERE enrolled_2012.user_email_2012 = email 
                                     AND enrolled_2012.user_semester_2012 = 'spring' LIMIT 1) THEN
               SET semester = 'spring';                                 
           ELSEIF SELECT EXISTS(SELECT 1 FROM enrolled_2012
                                     WHERE enrolled_2012.user_email_2012 = email 
                                     AND enrolled_2012.user_semester_2012 = 'summer' LIMIT 1) THEN
               SET semester = 'summer';                                 
           END IF;     
       ELSEIF year = '2013' THEN
           IF SELECT EXISTS(SELECT 1 FROM enrolled_2013
                                     WHERE enrolled_2013.user_email_2013 = email 
                                     AND enrolled_2013.user_semester_2013  = 'fall' LIMIT 1) THEN
               SET semester = 'fall';                                 
           ELSEIF SELECT EXISTS(SELECT 1 FROM enrolled_2013
                                     WHERE enrolled_2013.user_email_2013 = email 
                                     AND enrolled_2013.user_semester_2013  = 'spring' LIMIT 1) THEN
               SET semester = 'spring';                                 
           ELSEIF SELECT EXISTS(SELECT 1 FROM enrolled_2013
                                     WHERE enrolled_2013.user_email_2013 = email 
                                     AND enrolled_2013.user_semester_2013 = 'summer' LIMIT 1) THEN
               SET semester = 'summer';                                 
           END IF;
      ELSEIF year = '2014' THEN
           IF SELECT EXISTS(SELECT 1 FROM enrolled_2014
                                     WHERE enrolled_2014.user_email_2014 = email 
                                     AND enrolled_2014.user_semester_2014  = 'fall' LIMIT 1) THEN
               SET semester = 'fall';                                 
           ELSEIF SELECT EXISTS(SELECT 1 FROM enrolled_2014
                                     WHERE enrolled_2014.user_email_2014 = email 
                                     AND enrolled_2014.user_semester_2014  = 'spring' LIMIT 1) THEN
               SET semester = 'spring';                                 
           ELSEIF SELECT EXISTS(SELECT 1 FROM enrolled_2014
                                     WHERE enrolled_2014.user_email_2014 = email 
                                     AND enrolled_2014.user_semester_2014 = 'summer' LIMIT 1) THEN
               SET semester = 'summer';                                 
           END IF;
     ELSEIF year = '2015' THEN
           IF SELECT EXISTS(SELECT 1 FROM enrolled_2015
                                     WHERE enrolled_2015.user_email_2015 = email 
                                     AND enrolled_2015.user_semester_2015  = 'fall' LIMIT 1) THEN
               SET semester = 'fall';                                 
           ELSEIF SELECT EXISTS(SELECT 1 FROM enrolled_2015
                                     WHERE enrolled_2015.user_email_2015 = email 
                                     AND enrolled_2015.user_semester_2015  = 'spring' LIMIT 1) THEN
               SET semester = 'spring';                                 
           ELSEIF SELECT EXISTS(SELECT 1 FROM enrolled_2015
                                     WHERE enrolled_2015.user_email_2015 = email 
                                     AND enrolled_2015.user_semester_2015 = 'summer' LIMIT 1) THEN
               SET semester = 'summer';                                 
           END IF;
     ELSEIF year = '2016' THEN
           IF SELECT EXISTS(SELECT 1 FROM enrolled_2016
                                     WHERE enrolled_2016.user_email_2016 = email 
                                     AND enrolled_2016.user_semester_2016  = 'fall' LIMIT 1) THEN
               SET semester = 'fall';                                 
           ELSEIF SELECT EXISTS(SELECT 1 FROM enrolled_2016
                                     WHERE enrolled_2016.user_email_2016 = email 
                                     AND enrolled_2016.user_semester_2016  = 'spring' LIMIT 1) THEN
               SET semester = 'spring';                                 
           ELSEIF SELECT EXISTS(SELECT 1 FROM enrolled_2016
                                     WHERE enrolled_2016.user_email_2016 = email 
                                     AND enrolled_2016.user_semester_2016 = 'summer' LIMIT 1) THEN
               SET semester = 'summer';                                 
           END IF;
    END IF;
    */
    