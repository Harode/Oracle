create or replace funciton pipe_func (pcode_id in coce_hist.code_id%type)
Return
tab_coce_hist  PIPELINED

IS 

CURSOR cur_coce_hist
	is 
	select legacy_id, lob, grp_type from coce_hist	where code_id = pcode_id;

begin
	open cur_coce_hist;
		fetch cur_coce_hist into tab_coce_hist;
		PIPE ROW(tab_coce_hist);
	close cur_coce_hist;
	
	Return tab_coce_hist;

	Exception

	When 
		NOT_DATA_FOUND
	THEN DBMS_OUTPUT.PUT_LINE('NO DATA FOR THE COMISSION ID');
	raise;
	WHEN OTHERS THEN
	DBMS_OUTPUT.PUT_LINE (SQLERR|| ' '|| SQLMSG);
	RAISE;
END;
/
sHOW ERROR;

/*
FUNCTION total_sales (id_in IN account.account_id%TYPE)
RETURN NUMBER
IS
CURSOR tot_cur
IS
SELECT SUM (sales) total
FROM orders
WHERE account_id = id_in;
AND TO_CHAR (ordered_on, 'YYYY') = TO_CHAR (SYSDATE, 'YYYY');
tot_rec tot_cur%ROWTYPE;
BEGIN
OPEN tot_cur;
FETCH tot_cur INTO tot_rec;
CLOSE tot_cur;
RETURN tot_rec.total;
END;
*/
