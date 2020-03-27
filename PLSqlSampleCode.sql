set serverouput on;
-- printing something for this dumb ass class

--declare

--begin 
   -- DBMS_OUTPUT.PUT_LINE('fuck this shit');
    
--end;

declare

    intX NUMBER(2,0):=10;
    intY intX%type :=4;
    resultAdd intX%type;
    resultMultiply intX%type;
    
begin
    dbms_output.put_line('X is :'||intX);
    dbms_output.put_line('Y is :'|| intY);
    resultAdd := intX+intY;
    dbms_output.put_line('resulting output if added: '|| resultAdd);
    resultMultiply := intX*intY;
    dbms_output.put_line('resulting output if added: '|| resultMultiply);
    
end;


-- branching sample and getting input from the user using "&"


declare
    votingAge NUMBER(2,0) :=18;
    age votingAge%type := &age;
begin
    dbms_output.put_line('Age is: '|| age);
    if(age >= votingAge) then 
        dbms_output.put_line('old as hell. vote now!');
    else
        dbms_output.put_line('sit your ass down. You cant vote yet!');
    end if;
end;


-- nested if else statement: end with end if;


declare 
    grade CHAR(1);
    gradeIn grade%type := &gradeIn;
    
begin
    
    if (gradeIn= 'C') then 
        dbms_output.put_line('Cs get degrees biatch');
    elsif (gradeIn= 'A') then 
        dbms_output.put_line('youre most likely a kiss ass');
    elsif(gradeIn= 'B') then 
        dbms_output.put_line('you dont care enough');
    elsif(gradeIn= 'D') then
        dbms_output.put_line('you might as well dropped');
    else
        dbms_output.put_line('whatever you entered is too damn low');
    end if;
    
end;


-- switch case sample: make sure that case(input) matches whatever is in when 

declare
    oldness NUMBER(3) := &oldness;
    young oldness%type := 40;
begin
    case(oldness)
    
    when 100 then dbms_output.put_line('youre just mad cause your ass is old');
    else dbms_output.put_line('die');
    end case;
end;


-- basic counter using a basic loop
declare
    counter INTEGER :=5;
begin
    loop
        dbms_output.put_line(counter);
        if(counter = 0) then
            dbms_output.put_line('bust it');
            exit;
        else
            counter:= counter-1;
        end if;
    end loop;
end;
*/

-- SQL for loop 

declare

begin 
    for counter in reverse 0..5 loop
        dbms_output.put_line(counter);
    end loop;
    
    dbms_output.put_line('crack nut');
end;


--traversing a table using cursor

DROP TABLE GRADING;
CREATE TABLE GRADING
(
CNumber CHAR(7),
CTitle VARCHAR(20),
SID CHAR(3),
SName VARCHAR(20),
Grade VARCHAR(2),
CONSTRAINT PK_GRADING
PRIMARY KEY (CNumber, SID)
);
INSERT INTO GRADING
VALUES ('CSC 355', 'Database Systems', '111', 'Tanner', 'A-');
INSERT INTO GRADING
VALUES ('CSC 352', 'Database Programming', '111', 'Tanner', 'A-');
INSERT INTO GRADING
VALUES ('CSC 370', 'Intro to Robotics', '222', 'Tanner', 'B+');
INSERT INTO GRADING
VALUES ('CSC 452', 'Database Programming', '333', 'Gibler', 'A');
INSERT INTO GRADING
VALUES ('CSC 355', 'Database Systems', '444', 'Katsopolis', 'A-');
SELECT * FROM GRADING;

declare
    cnum grading.cnumber%type;
    studentName grading.sname%type;
    targetID grading.sname%type := &targetID;
    
    cursor namePointer is Select cnumber, sname, grade from grading;
begin
    SELECT cnumber, sname
    into cnum, studentName
    from grading
    where sname like targetID;
    
    dbms_output.put_line('for name target '|| studentName);
end;


-- using a cursor to iterae through the whole thing

declare
    cnum grading.cnumber%type;
    stugrade grading.grade%type;
    studentName grading.sname%type;
    
    cursor namePointer is Select cnumber, sname, grade from grading;
begin
    open namePointer;
    loop
        fetch namePointer into cnum,studentName,stugrade;
        if namePointer%found then 
            dbms_output.put_line('name is: '|| studentName);
            dbms_output.put_line('cnumber is: '|| cnum);
            dbms_output.put_line('grade is : '|| stugrade);
            dbms_output.put_line(' ');
        else
            exit;
        end if;
        
    end loop;
    close namePointer;
    dbms_output.put_line('finished execution');
end;



-- using a for each loop to iterate through the whole table
-- cursor is everything


declare
    dataInWholeTable grading%rowtype;
    cursor gPointer is Select * from grading;
    
begin
    dbms_output.put_line('Traversing the whole thing');
    
    for dataInWholeTable in gPointer -- for rowtype in pointer
    loop
        dbms_output.put_line('student name: '|| dataInWholeTable.sname);
    end loop;
    dbms_output.put_line('no need to close cursor. done');
end;



--creating a function using pl/sql

create function
    raiseToPower(base in INTEGER, exponent IN INTEGER) RETURN INTEGER
AS
    X INTEGER:=1;
BEGIN
    FOR i IN 1..exponent loop
        x:= x*base;
    END LOOP;
    return x;
END;

--calling the function
declare
    z INTEGER := &z;
    w INTEGER := &w;
    
begin 
    dbms_output.put_line('z'||z);
    dbms_output.put_line('w'||w);
    dbms_output.put_line('exponential of x and y'|| raiseToPower(z,w);
end;