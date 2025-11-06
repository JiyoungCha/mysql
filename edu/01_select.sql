-- 테이블 전체 컬럼 조회
SELECT *
FROM employees;

-- 특정 컬럼만 지정하여 조회
SELECT 
	name
	,birth
	,hire_at
FROM employees;

-- WHERE 절:특정 컬럼의 값이 일치한 데이터만 조회(필터링)
-- 컬럼의 데이터 타입이 숫자일 경우
SELECT *
FROM employees
WHERE
	emp_id = 5
;

-- 컬럼의 데이터 타입이 문자열일 경우
SELECT *
FROM employees
WHERE
	NAME = '강영화'
;

-- 컬럼의 데이터 타입이 데이트일 경우, 표준 날짜 형식인 'YYYY-MM-DD' 사용
SELECT *
FROM employees
WHERE
	birth >= '2000-01-01'
;

-- 컴럼의 데이터가 NULL인 데이터를 획득하고 싶은 경우
SELECT
	*
FROM employees
WHERE
	fire_at IS NULL
;

-- 컴럼의 데이터가 NULL이 아닌 데이터를 획득하고 싶은 경우
SELECT
	*
FROM employees
WHERE
	fire_at IS NOT NULL
;

-- 이름이 강영화 이고, 성별이 M인 사원 조회
SELECT *
FROM employees
WHERE
	NAME = '강영화'
AND gender = 'M'
;

-- 이름이 강영화 또는 손지우인 사원 조회
SELECT *
FROM employees
WHERE
	NAME = '강영화'
OR NAME = '손지우'
;

-- 날짜를 필터링 할 경우
SELECT *
FROM employees
WHERE
	hire_at >= '2023-01-01'
;

-- WHERE 절에서 AND, OR 복합 사용 시 주의
-- 입사일이  20250101이후거나, 20000101이전이고,
-- 이미 퇴사한 직원
SELECT *
FROM employees
WHERE
	(
		hire_at >= '2025-01-01'
		OR hire_at <= '2000-01-01'
	)
	AND fire_at IS NOT NULL
;

-- BETWEEN 연산사 : 지정한 범위 내의 데이터를 조회
SELECT *
FROM employees
WHERE
	emp_id >= 10000
	AND emp_id <= 10010
;

SELECT *
FROM employees
WHERE
 emp_id BETWEEN 10000 AND 10010
;

-- IN 연산사 : 지정한 값과 일치한 데이터를 조회
-- 사번이 5, 7, 9, 12인 사원 조회
SELECT *
FROM employees
WHERE
	emp_id = 5
	OR emp_id =7
	OR emp_id =9
	OR emp_id =12
;

SELECT *
FROM employees
WHERE
	emp_id IN (5, 7, 9, 12)
;

-- LIKE절 : 문자열의 내용을 조회(대소문자를 구별하지 않음)
-- % : 글자수와 상관없이 조회
-- 이름이 '지영'인 사원 조회
SELECT *
FROM employees
WHERE
	NAME LIKE '%지영'
;

-- 성이 '차'인 사원 조회
SELECT *
FROM employees
WHERE
	NAME LIKE '차%'
;

-- 이름에 '영'이 포함된 사원 조회
SELECT *
FROM employees
WHERE
	NAME LIKE '%영%'
;

-- _ : 언더바의 개수만큼 글자의 개수
-- 마지막 글자가 '영'인 사원 조회
SELECT *
FROM employees
WHERE
	NAME LIKE '__영'
;

-- 중간 글자가 '지'인 사원 조회
SELECT *
FROM employees
WHERE
	NAME LIKE '_지_'
;

-- ORDER BY절 : 데이터를 정렬해서 조회
-- ASC : 오름차순
-- DESC : 내림차순
SELECT *
FROM employees
ORDER BY NAME ASC, birth ASC
;

-- 입사일이 2000년 이후인 사원을 
-- 이름, 생일 오름차순으로 정렬해서 조회
SELECT *
FROM employees
WHERE
	hire_at >= '2000-01-01'
ORDER BY NAME ASC, birth ASC
;

-- 근무 중인 여자 사원을 이름, 생일 오름차순으로 정렬
SELECT *
FROM employees
WHERE
	gender = 'F'
AND fire_at IS null
ORDER BY NAME ASC, birth ASC
;

-- DISTINCT 키워드 : 검색 결과에서 중복되는 레코드를 제거
SELECT DISTINCT NAME
FROM employees
ORDER BY NAME asc
;

/*
-- GROUP BY 절 : 그룹으로 묶어서 조회
-- HAVING 절 : GROUP BY 절의 조건 절
	집계함수
		MAX() : 최대값
		MIN() : 최소값
		COUNT() : 개수
		AVG() : 평균
		SUM() : 합계
*/

-- 사원별 최고 연봉
SELECT 
	emp_id
	,MAX(salary)
FROM salaries
GROUP BY emp_id
;

-- AS 키워드: 컬럼에 별칭 부여(생략가능)
SELECT 
	emp_id
	,MAX(salary) AS max_salary
FROM salaries
GROUP BY emp_id
;

-- 사원 별 최고 연봉이 5000만원 이상인 사원 조회
SELECT 
	emp_id
	,MAX(salary) max_salary
FROM salaries
GROUP BY emp_id
	HAVING MAX(salary) >= 50000000
;

-- 성별 사원의 수를 조회해 주세요
SELECT 
	gender
	,COUNT(gender) count_gender
FROM employees
GROUP BY gender
;

-- 재직 중인 성별 사원수를 조회해 주세요.
SELECT 
	gender
	,COUNT(gender) count_gender
FROM employees
WHERE
	fire_at IS NULL
GROUP BY gender 
;

-- LIMIT 절, OFFSET 절 : 출력하는 데이터의 개수를 제한
-- 사원번호로 오름차순 정렬해서 10개 조회
SELECT *
FROM employees
ORDER BY emp_id ASC
LIMIT 10
;

-- 사원번호로 오름차순 정렬해서 21번 부터 10개 조회1
SELECT *
FROM employees
ORDER BY emp_id ASC
LIMIT 20, 10
;

-- 사원번호로 오름차순 정렬해서 21번 부터 10개 조회2
SELECT *
FROM employees
ORDER BY emp_id ASC
LIMIT 10 OFFSET 20
;

-- 현재 받고 있는 급여 중 사원의 연봉 상위 5명 조회
SELECT *
FROM salaries
WHERE 
	end_at IS NULL
ORDER BY salary DESC
LIMIT 5
;

SELECT COUNT(fire_at)
FROM employees
;


