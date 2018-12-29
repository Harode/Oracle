create or replace package pkg_glb_variable 

AS

	lv_from_date date;
	
	procedure proc1 (from_date date);

	procedure proc2 (from_date date);

end pkg_glb_variable;
/

Create or Replace Package Body pkg_glb_variable

AS
	dbms_application_info.set_module(module_name=>'Global Variable', Action=>'Starting Procedure1');
	
	Procedure proc1(from_date date)

	AS
		dbms_application_info.set_action(Action=>'Assigning variable');
		
		lv_sp1_from_date date := from_date;
	
	begin
		
		if lv_from_date is null then
		
			lv_sp1_from_date := sysdate;		

			dbms_output.put_line ('SP1 input Date :' || lv_sp1_from_date);
	
		else

			dbms_output.put_line ('Package input Date :' || lv_from_date);
		
		end if;
		
	
  end proc1;
  
  	dbms_application_info.set_action(Action=>'Starting Procedure2');
	
	Procedure proc2(from_date date)

	AS
		
		lv_sp2_from_date date := from_date;
	
	begin
		
		if lv_from_date is null then
		
			lv_sp2_from_date := sysdate;
		
		dbms_output.put_line ('SP1 input Date :' || lv_sp2_from_date);
	
		else

			dbms_output.put_line ('Package input Date :' || lv_from_date);
		
		end if;

	end proc2;

end pkg_glb_variable;
	
	

