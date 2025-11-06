-- TRANSACTION

-- 트랜잭션 시작
START TRANSACTION;

-- insert
INSERT INTO employees (`name`, birth, gender, hire_at)
VALUES ('차지영', '1994-01-14', 'F', DATE(NOW()))
;

-- select
SELECT * FROM employees WHERE `name` = '차지영';

-- rollback
ROLLBACK;

-- commit
COMMIT;