delimiter //

CREATE PROCEDURE star_loop()
wholeblock:BEGIN
  SET @n = 20;
  SET @i = 0;

  outer_loop: LOOP
    SET @star = '';
  
    IF @i >= @n THEN
      LEAVE outer_loop;
    END IF;
    
    SET @j = @n - @i;
    
    inner_loop: LOOP
        IF @j <= 0 THEN
            LEAVE inner_loop;
        END IF;
        
        SET @star = CONCAT(@star, '* ');
        
        SET @j = @j - 1;
        ITERATE inner_loop;
    END LOOP;
    
    SELECT @star;
    
    SET @i = @i + 1;
    ITERATE outer_loop;
  END LOOP;

END//

call star_loop()