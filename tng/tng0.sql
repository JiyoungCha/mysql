-- 1. 모든 직원의 이름과 입사일을 조회하세요.
SELECT 
	`name`
	,hire_at
FROM employees
;

-- 2. 'd005' 부서에 속한 모든 직원의 직원 ID를 조회하세요.
SELECT
	emp.emp_id
FROM 
	employees emp
		JOIN department_emps dept
			ON emp.emp_id = dept.emp_id
			AND dept.end_at IS null
			AND dept.dept_code = 'D005'
;
	
-- 3. 1995년 1월 1일 이후에 입사한 모든 직원의 정보를 입사일 
-- 순서대로 정렬하여 조회하세요.
SELECT
	*
FROM employees
WHERE 
	hire_at >= '1995-01-01'
ORDER BY hire_at ASC 
;

-- 4. 각 부서별로 몇 명의 직원이 있는지 계산하고, 
-- 직원 수가 많은 부서부터 순서대로 보여주세요.
SELECT 
	dept.dept_name
	,COUNT(depte.dept_code) count_dept_name	
FROM 
	employees emp
		JOIN department_emps depte
			ON emp.emp_id = depte.emp_id
			AND depte.end_at IS null
		JOIN departments dept
			ON depte.dept_code = dept.dept_code
GROUP BY depte.dept_code
ORDER BY COUNT(depte.dept_code) DESC
;

SELECT
	dept_code
	,COUNT(*) cnt_emps
FROM department_emps
WHERE
	end_at IS null
GROUP BY dept_code
ORDER BY cnt_emps DESC 
;

-- 5. 각 직원의 현재 연봉 정보를 조회하세요.
SELECT
	emp.emp_id
	,emp.`name`
	,sal.salary
FROM 
	employees emp
		JOIN salaries sal
			ON emp.emp_id = sal.emp_id
			AND sal.end_at IS null
;


-- 6. 각 직원의 이름과 해당 직원의 현재 부서 이름을 함께 조회하세요.
SELECT
	emp.`name`
	,dept.dept_name
FROM 
	employees emp
		JOIN department_emps depte
			ON emp.emp_id = depte.emp_id
			AND emp.fire_at IS NULL
			AND depte.end_at IS NULL
		JOIN departments dept
			ON depte.dept_code = dept.dept_code
;

-- 7. '마케팅부' 부서의 현재 매니저의 이름을 조회하세요.
SELECT 
	emp.`name`
FROM departments dep
	JOIN department_managers depm
		ON dep.dept_code = depm.dept_code
		AND dep.dept_name = '마케팅부'
		AND dep.end_at IS NULL
		AND depm.end_at IS NULL
	JOIN employees emp
		ON depm.emp_id = emp.emp_id
		AND emp.fire_at IS NULL
;

-- 8. 현재 재직 중인 각 직원의 이름, 성별, 직책(title)을 조회하세요.
SELECT
	emp.`name`
	,emp.gender
	,tite.title
FROM
	titles tite
		JOIN title_emps tiemp
			ON tite.title_code = tiemp.title_code
			AND tiemp.end_at IS NULL
		JOIN employees emp
			ON emp.emp_id = tiemp.emp_id
			AND emp.fire_at IS NULL
;

-- 9. 현재 가장 높은 연봉을 받는 상위 5명의 직원 ID와 연봉을 조회하세요.
SELECT
	emp.emp_id
	,sal.salary
FROM 
	employees emp
		JOIN salaries sal
			ON emp.emp_id = sal.emp_id
			AND sal.end_at IS NULL 
			AND emp.fire_at IS NULL
ORDER BY sal.salary DESC
LIMIT 5
;

-- 10. 각 부서의 현재 평균 연봉을 계산하고, 
-- 평균 연봉이 6000만 이상인 부서만 조회하세요.
SELECT 
	dept.dept_name
FROM 
	departments dept
		JOIN department_emps depte
			ON dept.dept_code = depte.dept_code
			AND depte.end_at IS NULL
		JOIN salaries sal
			ON sal.emp_id = depte.emp_id
			AND sal.end_at IS null
GROUP BY dept.dept_name
	HAVING AVG(sal.salary) >= 60000000
;

-- 11. 테이블 만들기
CREATE TABLE users (
	userid INT UNSIGNED PRIMARY KEY AUTO_INCREMENT
	,username VARCHAR(30) NOT NULL
	,authflg CHAR(1) DEFAULT '0'
	,birthday DATE NOT NULL
	,created_at DATETIME DEFAULT CURRENT_TIMESTAMP()
);

-- 12. 데이터 입력
INSERT INTO users (
	username
	,birthday
	,created_at
)
VALUES (
	'그린'
	,'2024-01-26'
	,NOW()
);

-- 13. 데이터 갱신
UPDATE users
SET 
	username = '테스터'
	,authflg = '1'
	,birthday = '2007-03-01'
WHERE 
	userid = 1
;

-- 14. 데이터 삭제
DELETE FROM users
WHERE
	userid = 1
;

-- 15. column 추가
ALTER TABLE users
ADD COLUMN addr VARCHAR(100) NOT NULL DEFAULT '-'
;

-- 16. 테이블 삭제
DROP TABLE users;

-- 17. 유저명, 생일, 랭크명 출력
SELECT 
	user.username
	,user.birthday
	,rank.rankname
FROM 
	users user
		JOIN rankmanagement rank
			ON user.userid = rank.userid
;
















