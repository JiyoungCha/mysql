-- INSERT 문
-- 신규 데이터를 저장하기 위해 사용하는 문
INSERT INTO employees (
	`name`
	,birth
	,gender
	,hire_at
	,fire_at
	,sup_id
	,created_at
	,updated_at
	,deleted_at
)
VALUES (
	'차지영'
	,'1994-01-14'
	,'F'
	,'2025-10-31'
	,NULL
	,NULL
	,NOW()
	,NOW()
	,NULL
)
;

-- 확인용
SELECT *
FROM employees
WHERE
	NAME = '차지영'
	AND birth = '1994-01-14'
	AND hire_at = '2025-10-31'
;

-- 자신의 연봉 데이터를 넣어주세요.
INSERT INTO salaries (
	emp_id
	,salary
	,start_at
	,end_at
	,created_at
	,updated_at
	,deleted_at
)
VALUES (
	100005
	,31000000
	,'2025-10-31'
	,NULL
	,NOW()
	,NOW()
	,NULL
)
;

-- SELECT INSERT : 
INSERT INTO salaries(
	emp_id
	,salary
	,start_at
)
SELECT 
	emp_id
	,31000000
	,created_at
FROM employees
WHERE
	NAME = '차지영'
	AND birth = '1994-01-14'
	AND hire_at = '2025-10-31'
;

