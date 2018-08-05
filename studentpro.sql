#sql
create or replace procedure ganesh(code number)
is
	scode student_masters.student_code%type;
	sname student_masters.student_name%type;
	dname department_masters.dept_name%type;
	dcode department_masters.dept_code%type;
	cursor cur is 
		select s.student_code, s.student_name,s.dept_code,d.dept_name from student_masters s join department_masters d on 		s.dept_code=d.dept_code 
		where d.dept_code=code;
	begin
		open cur;
		fetch cur into scode,sname,dcode,dname;
		loop
			exit when cur % notfound;
			dbms_output.put_line(scode || sname ||dcode||dname);
			fetch cur into scode,sname,dcode,dname;
		end loop;
	close cur;	
	end;
