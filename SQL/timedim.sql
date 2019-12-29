DELIMITER /
CREATE OR REPLACE PROCEDURE filltimeDim ()
BEGIN
    DECLARE vDate DATE;
    DECLARE vYear CHARACTER(6);
    DECLARE vQuarter CHARACTER(6);
    DECLARE vMonth_Name VARCHAR(20);
    DECLARE vWeekday_Name VARCHAR(20);
    DECLARE vMonth_Num SMALLINT;
    DECLARE vWeekday_Num SMALLINT;
    DECLARE birth Date;
    BEGIN
        TRUNCATE TABLE Time_Dim;
        SET vDate =  CONVERT('1998-01-01', DATE);
        WHILE (vDate <=  CONVERT('2000-12-31', DATE)) DO
            SET vYear =  YEAR(vDate);
            SET vQuarter =  QUARTER(vDate);
            SET vMonth_Name =  MONTHNAME(vDate);
            SET vWeekday_Name =  DAYNAME(vDate);
            SET vMonth_Num =  MONTH(vDate);
            SET vWeekday_Num =  DAYOFWEEK(vDate);
            INSERT INTO Time_Dim VALUES 
            (vDate, vYear, vQuarter, vMonth_Name,vWeekday_Name,vMonth_Num,vWeekday_Num);
            SET vDate = vDate + INTERVAL 1 DAY;
        END WHILE;  
        COMMIT;
    END;
END/