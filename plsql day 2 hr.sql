set SERVEROUTPUT on;
declare
    varl varchar(20) := 'hey';
    a int:=10;
    b int:=20;
    c int;
    d constant int := 19;
    x int :=10;
    y int := 12;
begin

--    c:=a+b;
--    dbms_output.put_line(varl);
--    if(a>15) then
--            dbms_output.put_line('a value greater than 5');
--            
--    ELSIF(a=10) then
--        dbms_output.put_line('a  is 10') ;  
--    
--    else 
--        dbms_output.put_line('else part');  
--    
--    end if;
--    loop
--        dbms_output.put_line(x);
--        x:=x+1;
--        if (x=15) then 
--            exit;
--        end if;
--    end loop;
--     loop
--        dbms_output.put_line(x);
--        x:=x+1;
--        exit when x>15;
--    end loop;
--        while   y<20 LOOP 
--        dbms_output.put_line(y);
--        y:=y+1;
--    end loop;
    for var in 1..10 loop
        dbms_output.put_line(y);
        y:=y+1;
    end loop;
end;