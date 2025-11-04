-- JOIN문
-- 두 개 이상의 테이블을 묶어서 하나의 결과 집합으로 출력

-- INNER JOIN
-- 복수의 테이블이 공통적으로 만족하는 레코드를 출력

-- 전 사원의 사번, 이름, 현재 급여를 출력해주세요.
SELECT 
	emp.emp_id
	,emp.`name`
	,sal.salary
FROM employees emp 
	JOIN salaries sal
-- inner 생략 가능
		ON emp.emp_id = sal.emp_id
			AND sal.end_at IS NULL 
ORDER BY emp.emp_id
;

SELECT 
	emp.emp_id
	,emp.`name`
	,sal.salary
FROM employees emp, salaries sal
WHERE
	emp.emp_id = sal.emp_id
	AND sal.end_at IS NULL 
ORDER BY emp.emp_id
;

-- 3개 join 재직중인 사원의 사번, 이름, 생일, 부서명
-- 왼쪽에 가장 적은 용량의 테이블 넣기 
SELECT
	depe.emp_id
	,emp.`name`
	,emp.birth
	,dept.dept_name	
FROM department_emps depe
	JOIN departments dept
		ON depe.dept_code = dept.dept_code
			AND depe.end_at IS NULL
	JOIN employees emp
		ON depe.emp_id = emp.emp_id
			AND emp.fire_at IS NULL 
;

-- LEFT JOIN 
SELECT 
	emp.emp_id
	,emp.`name`
	,sal.salary
FROM employees emp
	LEFT JOIN salaries sal
		ON emp.emp_id = sal.emp_id
			AND sal.end_at IS NULL 
;

-- RIGHT JOIN
SELECT
	emp.emp_id
	,emp.`name`
	,sal.salary
FROM employees emp
	RIGHT JOIN salaries sal
		ON emp.emp_id = sal.emp_id
;

-- FULL JOIN
SELECT *
FROM 
	employees emp
		LEFT JOIN title_emps title
			 ON emp.emp_id = title.emp_id
UNION
SELECT *
FROM 
	employees emp
		RIGHT JOIN title_emps title
			 ON emp.emp_id = title.emp_id
;

-- 두 개 이상의 쿼리의 결과를 합쳐서 출력
-- UNION			(중복 레코드 제거)
-- UNION ALL	(중복 레코드 제거 안 함)
SELECT * FROM employees WHERE emp_id IN(1, 3)
UNION
SELECT * FROM employees WHERE emp_id IN(3, 5)
;

SELECT * FROM employees WHERE emp_id IN(1, 3)
UNION ALL 
SELECT * FROM employees WHERE emp_id IN(3, 5)
;

-- SELF JOIN
-- 같은 테이블 끼리 JOIN
SELECT
	supemp.emp_id AS supervisor_id
	,supemp.`name` AS supervisor_name
	,emp.emp_id AS junior_id
	,emp.`name` AS junior_name
FROM employees emp 
	JOIN employees supemp
		ON emp.sup_id = supemp.emp_id
		AND emp.sup_id IS NOT NULL 
;










