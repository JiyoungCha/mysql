-- 1. 사원의 사원번호, 이름, 직급코드를 출력해 주세요.
SELECT
	emp.emp_id
	,emp.`name`
	,tite.title_code
FROM 
	employees emp
		JOIN title_emps tite
			ON emp.emp_id = tite.emp_id
			AND tite.end_at IS NULL 
;

-- 2. 사원의 사원번호, 성별, 현재 연봉을 출력해 주세요.
SELECT 
	emp.emp_id
	,emp.gender
	,sal.salary
FROM 
	employees emp
		JOIN salaries sal
			ON emp.emp_id = sal.emp_id
			AND sal.end_at IS NULL 
;

-- 3. 10010 사원의 이름과 과거부터 현재까지 연봉 이력을 출력해 주세요.
SELECT 
	emp.`name`
	,sal.start_at
	,sal.end_at
	,sal.salary
FROM
	employees emp
		JOIN salaries sal
			ON emp.emp_id = sal.emp_id 
WHERE emp.emp_id = 10010
ORDER BY sal.start_at ASC
;

-- 4. 사원의 사원번호, 이름, 소속부서명을 출력해 주세요.
SELECT 
	emp.emp_id
	,emp.`name`
	,dept.dept_name
FROM 
	employees emp
		JOIN department_emps depe
			ON emp.emp_id = depe.emp_id
			AND depe.end_at IS NULL 
		JOIN departments dept
			ON depe.dept_code = dept.dept_code
;

-- 5. 현재 연봉의 상위 10위까지 사원의 사번, 이름, 연봉을 출력해 주세요.
SELECT
	emp.emp_id
	,emp.`name`
	,sal.salary
FROM 
	employees emp
		JOIN salaries sal
			ON emp.emp_id = sal.emp_id
			AND sal.end_at IS NULL 
			AND emp.fire_at IS NULL 
ORDER BY sal.salary DESC
LIMIT 10
;

SELECT
	emp.emp_id
	,emp.`name`
	,tmp_sal.salary
FROM 
	employees emp
		JOIN (
			SELECT 
				sal.emp_id
				,sal.salary
			FROM salaries sal
			WHERE 
				sal.end_at IS null
			ORDER BY sal.salary DESC
			LIMIT 10
		) tmp_sal
			ON emp.emp_id = tmp_sal.emp_id
ORDER BY tmp_sal.salary DESC
;

-- 6. 현재 각 부서의 부서장의 부서명, 이름, 입사일을 출력해 주세요.
SELECT 
	dep.dept_name
	,emp.`name`
	,emp.hire_at
FROM 
	employees emp
		JOIN department_managers depm
			ON emp.emp_id = depm.emp_id
			AND emp.fire_at IS NULL
		JOIN departments dep
			ON depm.dept_code = dep.dept_code  
			AND depm.end_at IS NULL
ORDER BY depm.dept_code ASC
;	

-- 7. 현재 직급이 "부장"인 사원들의 연봉 평균을 출력해 주세요.
-- 현재 각 부장별 이름, 연봉평균
SELECT 
	emp.`name`
	,AVG(sal.salary)
FROM
	titles tite
		JOIN title_emps tiemp
			ON tite.title_code = tiemp.title_code
			AND tite.title = '부장'
			AND tiemp.end_at IS NULL 
		JOIN employees emp
			ON tiemp.emp_id = emp.emp_id
			AND emp.fire_at IS NULL 
		JOIN salaries sal
			ON emp.emp_id = sal.emp_id
GROUP BY emp.`name`, sal.emp_id
;

-- 선생님ver
SELECT
	emp.`name`
	,sub_salaries.avg_sal
FROM employees emp
	JOIN (
		SELECT 
			sal.emp_id
			,AVG(sal.salary) avg_sal
		FROM title_emps tite
			JOIN titles tit
				ON tite.title_code = tit.title_code
				AND tit.title = '부장'
				AND tite.end_at IS NULL 
			JOIN salaries sal
				ON sal.emp_id = tite.emp_id
		GROUP BY sal.emp_id 
	) sub_salaries
		ON emp.emp_id = sub_salaries.emp_id
		AND emp.fire_at IS NULL 
;

-- 8. 부서장직을 역임했던 모든 사원의 이름과 입사일, 사번, 부서번호를 출력해 주세요.
SELECT
	emp.`name`
	,emp.hire_at
	,emp.emp_id
	,depm.dept_code
FROM
	department_managers depm
		JOIN employees emp
			ON depm.emp_id = emp.emp_id
;

-- 9. 현재 각 직급별 평균연봉 중 60,000,000이상인 직급의 직급명, 평균연봉(정수)를을
--		평균연봉 내림차순으로 출력해 주세요.
SELECT 
	tite.title
	,CEILING(AVG(sal.salary)) avg_sal
FROM 
	salaries sal
		JOIN title_emps tiemp
			ON sal.emp_id = tiemp.emp_id
			AND sal.end_at IS NULL
 			AND tiemp.end_at IS NULL 
		JOIN titles tite
			ON tiemp.title_code = tite.title_code
GROUP BY tite.title 
	HAVING avg_sal >= 60000000
ORDER BY avg_sal DESC
;

-- 10. 성별이 여자인 사원들의 직급별 사원수를 출력해 주세요.
SELECT
	tite.title
	,COUNT(emp.gender)
FROM 
	employees emp
		JOIN title_emps tiemp
			ON emp.emp_id = tiemp.emp_id
		JOIN titles tite
			ON tiemp.title_code = tite.title_code
WHERE 
	emp.gender = 'F'
	AND emp.fire_at IS NULL 
	AND tiemp.end_at IS NULL 
GROUP BY tite.title, tite.title_code
ORDER BY tite.title_code ASC
;