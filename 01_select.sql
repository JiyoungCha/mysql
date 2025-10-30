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
	name = '손지우'
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