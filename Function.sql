#sql
create or replace function data22(dept number)
return number is
total number;
scode student_masters.student_code % type;
dcode student_masters.dept_code % type;
cursor cur is select student_code, dept_code from student_masters;
begin
select count(*) into total
from student_masters
where dept_code = dept;
open cur;
loop
exit when cur % notfound;
fetch cur into scode,dcode;
if dcode=dept then
dbms_output.put_line(scode);
end if;
end loop;
return total;
end;



create or replace function data22(dept number)

return number is
    
total number;
    
flag number :=1;
    
scode student_masters.student_code % type;
    
dcode student_masters.dept_code % type;
cursor cur is select student_code, dept_code from student_masters;
begin
select count(*) into total
from student_masters
where dept_code = dept;
open cur;
loop
fetch cur into scode,dcode;
exit when cur % notfound;
if dcode is null then
dbms_output.put_line('Student id' || scode ||' is null');
flag:=0;
end if;
end loop;
close cur;
if flag=1 then
open cur;
loop
fetch cur into scode,dcode;
exit when cur%notfound;
if dcode=dept then
dbms_output.put_line(scode);
end if;
end loop;
end if;
return total;
end;
