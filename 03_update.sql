-- UPDATE문
UPDATE employees
SET 
	fire_at = NOW()
	,deleted_at = NOW()
WHERE 
	emp_id = 100005
;

-- 내 거 5000만원으로 수정
UPDATE salaries
SET 
	salary = 30000000
WHERE
	sal_id = 1022180
;