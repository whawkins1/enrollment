CREATE FUNCTION getYearsAttended (VARCHAR(30) email)
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
      DECLARE years_concat VARCHAR(100);
      SET years_concat = "";
      
      if (SELECT EXISTS(SELECT 1 FROM enrolled_2010 WHERE email_enrolled = 'email' LIMIT 1)) {
          SET years_concat = SELECT CONCAT('2007',', ');
      }
      
      
      RETURN years_concat;
END