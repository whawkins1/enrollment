DELIMITER //

DROP FUNCTION IF EXISTS getYearsAttended;//
CREATE FUNCTION getYearsAttended (email VARCHAR(30))
RETURNS VARCHAR(100)

BEGIN
      DECLARE years_concat VARCHAR(100) DEFAULT ""; 
      
      IF SELECT EXISTS(SELECT 1 FROM enrolled_2010 WHERE user_email_2010 = email LIMIT 1) THEN
           SET years_concat = CONCAT_WS(' ', '2010', years_concat);
      END IF;
      
      IF SELECT EXISTS(SELECT 1 FROM enrolled_2011 WHERE email_enrolled = email LIMIT 1) THEN 
          SET years_concat = CONCAT_WS(' ', '2011', years_concat);
      END IF;
      
      IF SELECT EXISTS(SELECT 1 FROM enrolled_2012 WHERE email_enrolled = email LIMIT 1) THEN
          SET years_concat = CONCAT_WS(' ', '2012', years_concat);
      END IF;
      
      IF SELECT EXISTS(SELECT 1 FROM enrolled_2013 WHERE email_enrolled = email LIMIT 1) THEN
          SET years_concat = CONCAT_WS(' ', '2013', years_concat);
      END IF;
      
      IF SELECT EXISTS(SELECT 1 FROM enrolled_2014 WHERE email_enrolled = email LIMIT 1) THEN
          SET years_concat = CONCAT_WS(' ', '2014', years_concat);
      END IF;
      
      IF SELECT EXISTS(SELECT 1 FROM enrolled_2015 WHERE email_enrolled = email LIMIT 1) THEN
          SET years_concat = CONCAT_WS(' ', '2015', years_concat);
      END IF;
      
      IF SELECT EXISTS(SELECT 1 FROM enrolled_2016 WHERE email_enrolled = email LIMIT 1) THEN
          SET years_concat = CONCAT_WS(' ', '2016', years_concat);
      END IF;
      
      RETURN years_concat;
END; //

DROP FUNCTION IF EXISTS getUserSemesterGPA;//

CREATE FUNCTION getUserSemesterGPA(IN email VARCHAR(30), 
                                   IN semester CHAR(6), 
                                   IN year CHAR(4))

BEGIN
    DECLARE gradeTotal INT(2) DEFAULT 0;
    DECLARE creditHours INT(2) DEFAULT 0;
    DECLARE done INT DEFAULT FALSE;
    DECLARE points INT(2) DEFAULT 0;       
       
    IF year = '2010' THEN
       DECLARE cur CURSOR FOR SELECT enrolled_2010.user_grade_2010, SUM(courses.credits) FROM enrolled_2010 
                               INNER JOIN courses
                               ON courses.code = enrolled_2010.user_course_code
                               WHERE enrolled_2010.user_email = email AND enrolled_2010.user_semester_2010 = semester;
    ELSEIF year = '2011' THEN
       DECLARE cur CURSOR FOR SELECT enrolled_2011.user_grade_2011, SUM(courses.credits) FROM enrolled_2011 
                               INNER JOIN courses
                               ON courses.code = enrolled_2011.user_course_code
                               WHERE enrolled_2011.user_email = email AND enrolled_2011.user_semester_2011 = semester;
    ELSEIF year = '2012' THEN
       DECLARE cur CURSOR FOR SELECT enrolled_2012.user_grade_2012, SUM(courses.credits) FROM enrolled_2012 
                               INNER JOIN courses
                               ON courses.code = enrolled_2012.user_course_code
                               WHERE enrolled_2012.user_email = email AND enrolled_2012.user_semester_2010 = semester;
    ELSEIF year = '2012' THEN
        DECLARE cur CURSOR FOR SELECT enrolled_2012.user_grade_2012, SUM(courses.credits) FROM enrolled_2012 
                               INNER JOIN courses
                               ON courses.code = enrolled_2012.user_course_code
                               WHERE enrolled_2012.user_email = email AND enrolled_2012.user_semester_2012 = semester;
    ELSEIF year = '2014' THEN
        DECLARE cur CURSOR FOR SELECT enrolled_2014.user_grade_2014, SUM(courses.credits) FROM enrolled_2014 
                               INNER JOIN courses
                               ON courses.code = enrolled_2014.user_course_code
                               WHERE enrolled_2014.user_email = email AND enrolled_2014.user_semester_2014 = semester;
    ELSEIF year = '2015' THEN
        DECLARE cur CURSOR FOR SELECT enrolled_2015.user_grade_2015, SUM(courses.credits) FROM enrolled_2015 
                               INNER JOIN courses
                               ON courses.code = enrolled_2015.user_course_code
                               WHERE enrolled_2015.user_email = email AND enrolled_2015.user_semester_2015 = semester;
    ELSEIF year = '2016' THEN
         DECLARE cur CURSOR FOR SELECT enrolled_2016.user_grade_2016, SUM(courses.credits) FROM enrolled_2016 
                               INNER JOIN courses
                               ON courses.code = enrolled_2016.user_course_code
                               WHERE enrolled_2016.user_email = email AND enrolled_2016.user_semester_2016 = semester;
    END IF;
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    OPEN cur;
    
    read_loop: LOOP
       FETCH cur INTO grade, credits;
    IF done THEN
        LEAVE read_loop;
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
      
      SET gradeTotal = gradeTotal + points;
    END LOOP;
    SET creditHours = credits;
    CLOSE cur;
END; //

DROP FUNCTION IF EXISTS getTotalGPA;//

CREATE FUNCTON getTotalGPA(email VARCHAR(30), spaceSeparatedYears VARCHAR(100))
RETURNS DECIMAL(10, 2)
   
BEGIN
  DECLARE strLen    INT DEFAULT 0;
  DECLARE SubStrLen INT DEFAULT 0;

  IF spaceSeparatedYears IS NULL THEN
    SET spaceSeparatedYears = '';
  END IF;

do_this:
  LOOP
    SET strLen = CHAR_LENGTH(spaceSeparatedYears);

    UPDATE TestTable SET status = 'C' WHERE Id = SUBSTRING_INDEX(spaceSeparatedYears, ' ', 1);

    SET SubStrLen = CHAR_LENGTH(SUBSTRING_INDEX(spaceSeparatedYears, ',', 1)) + 2;
    SET spaceseparatedYears = MID(spaceSeparatedYears, SubStrLen, strLen);

    IF spaceSeparatedYears = '' THEN
      LEAVE do_this;
    END IF;
  END LOOP do_this;

END;//