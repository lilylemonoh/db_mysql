-- GROUP BY는 기준컬럼을 하나 이상 제시할 수 있고, 기준컬럼에서 동일한 값을 가지는 것끼리
-- 같은 집단으로 보고 집계하는 쿼리문입니다.
-- SELECT 집계컬럼명 FROM 테이블명 GROUP BY 기준컬럼명;

-- 지역별 평균 키를 구해보겠습니다. (지역정보 : user_address)
SELECT 
	user_address AS 지역,
    AVG(user_height) AS 평균키
 FROM 
	user_tbl
GROUP BY
	user_address;

-- 생년별 인원수와 체중 평균을 구해주세요. 
-- 생년, 인원수, 체중 평균컬럼이 노출되어야 합니다.

SELECT 
	user_birth_year AS 생년,
    COUNT(user_num) AS 인원수, 
-- COUNT는 컬럼 내부의 열 개수만 세기 때문에 NULL이 없으면 어떤 컬럼을 넣어도 결과가 동일합니다.
	AVG(user_weight) AS 평균체중
FROM 
	user_tbl
GROUP BY 
	user_birth_year;

SELECT * FROM user_tbl;

-- user_tbl의 가장 큰 키, 가장 빠른 출생년도가 각각 무슨 값인지 구해주세요.
SELECT
	MAX(user_height) AS 가장큰키수치,
    MIN(user_birth_year) AS 가장빨리태어난사람년도,
    MIN(entry_date) AS 가입일자가가장빠른사람
FROM 
	user_tbl;

-- HAVING을 써서 거주자가 2명 이상인 지역만 카운팅
-- 거주지별 생년평균을 보여주겠습니다.
SELECT 
	user_address,
    AVG(user_birth_year) AS 생년평균,
    COUNT(*) AS 거주자수
FROM
	user_tbl
GROUP BY
	user_address
HAVING
	count(*) > 1;
    
-- HAVING 사용 문제
-- 생년 기준으로 평균 키가 160 이상인 생년만 출력해주세요.
-- 생년별 평균 키도 같이 출력해주세요 / 평균키, 생년 출력
SELECT 
	AVG(user_height) AS 생년별평균키, 
    user_birth_year AS 생년
FROM 
	user_tbl
GROUP BY 
	user_birth_year
HAVING
	AVG(user_height) >= 160;
