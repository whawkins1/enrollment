DELIMITER //

CREATE FUNCTION getYearsAttended (email VARCHAR(30))
RETURNS VARCHAR(100)

BEGIN
      DECLARE years_concat VARCHAR(100) DEFAULT ""; 
      
      IF (SELECT EXISTS(SELECT 1 FROM enrolled_2010 WHERE user_email_2010 = email LIMIT 1)) THEN
           SET years_concat = CONCAT_WS(',', '2010', years_concat);
      END IF;
      
      IF (SELECT EXISTS(SELECT 1 FROM enrolled_2011 WHERE email_enrolled = email LIMIT 1)) THEN 
          SET years_concat = CONCAT_WS(',', '2011', years_concat);
      END IF;
      
      IF (SELECT EXISTS(SELECT 1 FROM enrolled_2012 WHERE email_enrolled = email LIMIT 1)) THEN
          SET years_concat = CONCAT_WS(',', '2012', years_concat);
      END IF;
      
      IF (SELECT EXISTS(SELECT 1 FROM enrolled_2013 WHERE email_enrolled = email LIMIT 1)) THEN
          SET years_concat = CONCAT_WS(',', '2013', years_concat);
      END IF;
      
      IF (SELECT EXISTS(SELECT 1 FROM enrolled_2014 WHERE email_enrolled = email LIMIT 1)) THEN
          SET years_concat = CONCAT_WS(',', '2014', years_concat);
      END IF;
      
      IF (SELECT EXISTS(SELECT 1 FROM enrolled_2015 WHERE email_enrolled = email LIMIT 1)) THEN
          SET years_concat = CONCAT_WS(',', '2015', years_concat);
      END IF;
      
      IF (SELECT EXISTS(SELECT 1 FROM enrolled_2016 WHERE email_enrolled = email LIMIT 1)) THEN
          SET years_concat = CONCAT_WS(',', '2016', years_concat);
      END IF;
      
      RETURN years_concat;
END; //

DELIMITER ;