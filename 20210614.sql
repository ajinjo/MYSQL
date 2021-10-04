SELECT 1+2;
# 여기서는 FROM 절이 생략 되어 있지요
# 얘 같은 경우에는 뭐가 제공이 되는 거냐면
# 기본은 FROM dual 이게 생략되어있고 내부에서 알아서 이걸 붙여서 처리한다는 소리래 


SELECT 5+5;

SELECT 5+5 FROM dual;

SELECT 7+10;
SELECT 7+10 FROM dual;

SELECT 1+2 FROM dual;
# 해석할때는 프롬먼저 해석한다음 셀렉트 해석하는거래
# 셀렉트문의 전체구조는
/*
[입력순서]
# 데이터 검색 : SELECT 문
SELECT 절
FROM 절
WHERE 절 #조건절
Group by #그룹 설정
Having #그룹 조건 설정
ORDER by # 정렬 설정

[해석순서]
FROM 절
WHERE 절 #조건절
Group by #그룹 설정
Having #그룹 조건 설정
SELECT 절
ORDER by 절 
*/ 


# database 변경 . Use써서 사용할 데이터베이스 입력해주면 됨 
USE classicmodels


# 이 테이블로부터 4개의 컬럼을 검색하는 소리래
# 커스터머 테이블로부터 커스터머넘버, 네임, 폰, 시티를 검색하라 라는 뜻
# 데이터 검색 : SELECT문 사용함
# 기본 셀렉트문의 구조는 SELECT 절, FROM 절 이렇게 구성이 된다 
# 고객 테이블에서 요 4개에 해당되는 데이터만 검색하라 라는 뜻 
SELECT customerNumber,customerName,phone,city
FROM customers;


# 현재 커스터머에서 제공되는 모든 테이블에 대한 정보
# 고객 전체의 정보를 검색하라. 라면 이렇게 하면 됨 
SELECT * FROM customers;


# 커스터머에서 학생전체의 시티정보를 가져오기
# 전체 고객의 모든 시티정보
SELECT city FROM customers;

# 가져와서 보니까 중복된 값이 보여 그러면 어떻게 하느냐? 중복이 안되는 유일한 값만 가져와라
# 중복을 제거해줄 수 있는 distinct 써주래
SELECT distinct city FROM customers;

SELECT count(city) FROM customers;

SELECT count(customerNumber) FROM customers;

SELECT count(customerNumber), count(city) FROM customers;

SELECT amount, amount*2 FROM payments;
SELECT amount, amount*2 AS bonus FROM payments;
# AS는 이럴때 사용합니다 amount*2의 이름을 바꿔주었지요

# 이름이길거나 테이블명길거타
# 두개테이블 참조할때 어떤컬럼에서 어떤테이블참조하는지 명시해야함
# 그럴떄 p.amount 이런식으로 사용함
# 여러개 테이블 참조해야할 시 어느테이블에있는 어떤컬럼인지 명시해줘야하





SELECT *
FROM orderdetails
WHERE priceeach >30;
# orderdetails테이블의 모든 정보를 가져오겠다
# 조건을 주겠다 컬럼이 priceEach이 30보다 큰 것만 가져와라 

SELECT *
FROM orderdetails
WHERE priceeach =32.53;
# SQL에서 WHERE에서 같다 표현할떄는 == 두개 안쓰고 =한개씀

SELECT *
FROM orderdetails
WHERE priceeach >=30 and priceeach <=50;
# 30보다 크거나 같고 50보다 작거나 같으면 

SELECT *
FROM orderdetails
WHERE priceeach between 30 and 50;
# between A and B 으로도 표현할 수 있음
# A보다 크거나 같고 B보다 작거나 같다 일때 대체표현 쓸 수 있음

SELECT customerNumber
FROM customers
WHERE country='USA' OR country='Canada';
# 대소문자 정확하게 써줘야함 데이터 비교에서는
# = OR = 
# 비교하는 컬럼이 다를때는 반드시 이걸 사용하기는 해야겠지
# 한개는 country 한개는 city 이면 

SELECT customerNumber
FROM customers
WHERE country in ('USA', 'Canada');
# 대소문자 정확하게 써줘야함 데이터 비교에서 
# = OR = 을 의미해주는게 in 임 대체로 쓸 수 있음 

SELECT customerNumber
FROM customers
WHERE country NOT in ('USA', 'Canada');

SELECT customerNumber
FROM customers;

SELECT customerNumber,country
FROM customers
WHERE NOT(country='USA' OR country='Canada');

SELECT * FROM classicmodels.employees;

# reportsTO컬럼의 값이 NULL일때 
SELECT employeeNumber, firstName, reportsTO
FROM employees
WHERE reportsTO IS Null; # reportsTO=Null  ##### 이거 중요해요 

# reportsTO컬럼의 값이 NULL이 아닐때 
SELECT employeeNumber, firstName, reportsTO
FROM employees
WHERE reportsTO IS NOT Null; 

SELECT addressLine1
FROM Customers
WHERE addressLine1 LIKE 'ST';
# 정확하게 ST라고 저장되어있는것만 가져오라는 뜻

# 일부분이 ST 인걸 가져와라 일경우
SELECT addressLine1
FROM Customers
WHERE addressLine1 LIKE '%ST';
# 모든거로 시작되서 ST로 끝나는 

# 일부분이 ST 인걸 가져와라 일경우
SELECT addressLine1
FROM Customers
WHERE addressLine1 LIKE 'ST%';
# ST로 시작되는 모든 

SELECT addressLine1
FROM customers
WHERE addressLine1 LiKE '%ST%';
# ST가 들어가는
# 대소구분없이 다 가져오지 

SELECT addressLine1
FROM customers
WHERE addressLine1 LiKE '%_T%';
# 어떤 문자가오고 T가 왓을때
# 언더바는 한자리를 의미함 모든 어떤 한자리가 오고 그다음에 반드시 T가 와야함 

SELECT addressLine1
FROM customers
WHERE addressLine1 LiKE '_T%';
# 첫번째 어떤 글자가 오고 두번째에 T가 와야된다
# 언더바 : 하나를 의미함 

# 대소문자 구분이 오라클은 되는데 MYSQL은 안됨
# 그래서 대소문자 구분해서 검색해야된다라고하면 BINARY 넣어서 처리해주면됨 
SELECT addressLine1
FROM customers
WHERE addressLine1 LiKE BINARY '_T%';

SELECT addressLine1
FROM customers
WHERE addressLine1 LiKE BINARY '%_T%';

SELECT addressLine1
FROM customers
WHERE addressLine1 LiKE '%_T%';

# GROUP by 이용해서 그룹지정해서 사용할 수 있음 
SELECT count(customerNumber), city
FROM customers;
# 커스터머테이블에서 customerNumber의 개수를 카운트하고 city는 그냥 가지고옴 


SELECT count(customerNumber), city
FROM customers;
# city는 그냥 제일 위에있는거 출력해버렸네 

SELECT count(customerNumber), city
FROM customers
GROUP BY city;
# City 별로 개수를 가지고오라는 소리임 
# 부서별 최대값을 구한다 뭐 이런식일때 이렇게 쓰겠지
# 무어별로 뭐별로 사원별로 반별로~평균 등등 뽑아야될때 GROUP BY 사용하면된다 
# 그룹함수, 집계함수 라고 부름 

SELECT sum(CASE WHEN city='Nantes' THEN 1 ELSE 0 END) cnt
FROM customers;
# 위에서 Nantes 2개라고 나왔엇자나

SELECT sum(CASE WHEN city='Nantes' THEN 1 
                WHEN city='Las Vegas' THEN 2
				WHEN city='Stavern' THEN 3 ELSE 0 END) cnt
FROM customers;
# 다중 IF ~ ELSE 라고 생각하면 된대 파이썬으로치면 
# cnt 7개가 나오네
# sum이 합계니까 더해서 나오는거지요~ 

SELECT CASE WHEN city='Nantes' THEN 1 
                WHEN city='Las Vegas' THEN 2
				WHEN city='Stavern' THEN 3 ELSE 0 END cnt
FROM customers;
# sum 지웠더니 이렇게 가져옴

SELECT city, CASE WHEN city='Nantes' THEN 1 
                WHEN city='Las Vegas' THEN 2
				WHEN city='Stavern' THEN 3 ELSE 0 END cnt
FROM customers;

# 다중 조건문 처리 할 경우 # 케이스 왠 이용해서 처리함 
SELECT city, CASE WHEN city='Nantes' THEN 1 
                WHEN city='Las Vegas' THEN 2
				WHEN city='Stavern' THEN 3 ELSE 0 END cnt
FROM customers;


SELECT employeeNumber, firstName, reportsTO
FROM employees
WHERE reportsTO IS Null;
# reportsTO가 지금 가지고있는게 NULL값을 가지고 있지
# 이걸 가져와서 아래

SELECT count(reportsTO), count(*)
FROM employees;
# 실행해보면 개수가 다르게 나오지 

# count(*) : 무조건 전체 레코드 수를 리턴한다. 
# count(컬럼명) : NULL이 아닌 전체 레코드수를 리턴한다. - 왜냐? 카운트를 사용하기 때문이다. 
SELECT  count(employeeNumber), count(reportsTO), count(*)
FROM employees;
# 실행해서 보면 차이가 있지


# 47페이지 JOIN 중요함
# 실제 데이터 저장하는데 하나의 테이블에다가 모든 데이터를 저장하진 않음
# 그래서 나눔
# DB가 있으면 주제별로 테이블을 나누어서 저장을 함
# 이때 테이블이 A B C D 있다고 쳐 이때 예를들어 A,B를 연결해서 가져와야한다 
# 이럴 때 JOIN을 이용하는거야 ~ 

# JOIN에는 여러가지가 있다 


#알리아스:AS 라고 읽나봄 

SELECT SUM(CASE WHEN country='USA' THEN 1 ELSE 0 END) AS N_USA,
       SUM(CASE WHEN country='USA' THEN 1 ELSE 0 END)/COUNT(*) USA_PORTION
FROM customers;
# COUNT(*)는 총 레코드 수를 가져오는 것 
# 36개, 차지하는 비율은 0.2951 이라고 결과값이 나오네 


# 개수다른이유 
# count(reportsTO) 널값뺀거를 리턴함
# count(*) 다리턴함
# count(*) : 무조건 전체 레코드 수를 반환한다. 
# count(컬럼명): NULL이 아닌 전체 레코드 수를 리턴한다.



# JOIN
# 두 테이블 이상을 연결해서 가져와야 하는 경우 
# 두 테이블 가운데에 JOIN사용 
# 일반적으로는 이꼴조인인 이너조인을 많이 사용함 
# 레프트 이너 조인은 
SELECT * FROM orders LEFT JOIN customers
ON orders.customerNumber=customers.customerNumber;

# JOIN
SELECT o.orderNumber, o.customerNumber, c.customerNumber FROM orders o LEFT JOIN customers c
ON o.customerNumber=c.customerNumber;

SELECT o.orderNumber, o.customerNumber, c.customerNumber 
FROM orders o LEFT JOIN customers c
ON o.customerNumber=c.customerNumber;

SELECT o.orderNumber, o.customerNumber, c.customerNumber 
FROM orders o INNER JOIN customers c
ON o.customerNumber=c.customerNumber;
# 레프트 조인이나 이너조인이나 326개 인거 똑같네 
# 무슨말이냐면 A테이블있고 B테이블있는데
# 레프트조인은 A테이블에있는거 다 가지고와
# A 다 가지고오니까 B랑 공통적인+공통적이지않은 다가져온거
# o.customerNumber
# 즉 o.custo~에 저장되어있는거만 c.custo~에 저장되어있는거야alter#
# 정확히 일치하는 값만 가지고 있다는 소리야 
# 이너조인은 테이블의 공통적인것만 가지고온다
# 레프트조인은 일반적으로 언제 사용되냐면
# 두개의 테이블이 있는데 두개의 테이블이있을때
# 뒤에서 가지고오는데 A라는테이블에 있는값은 모두가지고오고
# B는 공통적인거만 가져와서 처리하겠다 
# 예를들면 어떤 회원명단(A-회원번호등 정보) 회원비용납입한사람안한사람(B-회원번호에 따른 납입유무) 있다쳐
# 회원비를 냈든 안냈든 무조건 명단은 다 가져와야되자나
# 이럴때 레프트조인을 이용해서 가지고온다는거야


SELECT CASE WHEN 연령 BETWEEN 2 and 29 THEN '20대'
			WHEN 연령 BETWEEN 40 and 49 THEN '40대'
            WHEN 연령 BETWEEN 50 and 59 THEN '50대' END
FROM Classicmodels.customers;
# ?????????????


SELECT o.orderNumber, o.customerNumber, c.customerNumber
FROM orders o LEFT JOIN customers c
ON o.customerNumber = c.customerNumber;

SELECT o.orderNumber, o.customerNumber, c.customerNumber
FROM orders o INNER JOIN customers c
ON o.customerNumber = c.customerNumber;


## 2021.06.15

# 데이터 순위 매기는 함수


SELECT buyprice
FROM products
ORDER by buyprice ASC;

SELECT buyprice
FROM products
ORDER by buyprice DESC;

# ACS : 오름차순 의미, 기본값 이기 때문에 생략 가능
# DESC : 내림차순 의미, 반드시 써줘야함

SELECT buyprice,
         ROW_NUMBER() OVER(ORDER by buyprice) AS rownumber,
         RANK() OVER(ORDER by buyprice) AS rnk,
         DENSE_RANK() OVER(ORDER by buyprice) AS denserank
FROM products;
# 33.30 부터 같은값에 대해 순위 준 방식이 다르게 나옴












