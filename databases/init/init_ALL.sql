-- 1. 밀키트 주문로그 테이블 삭제
DROP TABLE IF EXISTS KIT_ORDER_LOG;

-- 2. 밀키트 주문 테이블 삭제
DROP TABLE IF EXISTS KIT_ORDER;

-- 3. 생산주문(발주) 로그 테이블 삭제
DROP TABLE IF EXISTS PRODUCT_ORDER_LOG;

-- 4. 생산주문(발주) 테이블 삭제
DROP TABLE IF EXISTS PRODUCT_ORDER;

-- 5. 밀키트 재료 가격 테이블 삭제
DROP TABLE IF EXISTS KIT_SOURCE_PRICE;

-- 6. 밀키트 가격 테이블 삭제
DROP TABLE IF EXISTS KIT_TOTAL_PRICE;

-- 7. 생산 업체별 재료 가격 테이블 삭제
DROP TABLE IF EXISTS SOURCE_PRICE;

-- 8. 재료 테이블 삭제
DROP TABLE IF EXISTS SOURCE;

-- 9. 생산업체 테이블 삭제
DROP TABLE IF EXISTS PRODUCT_COMPANY;

-- 10. 밀키트 판매 업체 테이블 삭제
DROP TABLE IF EXISTS KIT_COMPANY;

-- 11. 밀키트 테이블 삭제
DROP TABLE IF EXISTS MEALKIT;

-- 12. 유저 테이블 삭제
DROP TABLE IF EXISTS USER;

-- 13. 권한 테이블 삭제
DROP TABLE IF EXISTS ROLE;

-- 14. 상태 테이블 삭제
DROP TABLE IF EXISTS STATUS;


-- 1. 밀키트 테이블 생성
CREATE TABLE MEALKIT (
                         MEALKIT_ID VARCHAR(50) PRIMARY KEY, -- 밀키트PK
                         NAME VARCHAR(50) NOT NULL -- 밀키트이름
);
-- 2. 밀키트 판매 업체 테이블
CREATE TABLE KIT_COMPANY (
                             KIT_COMPANY_ID VARCHAR(50) PRIMARY KEY, -- 밀키트PK
                             NAME VARCHAR(50) NOT NULL, -- 판매업체이름
                             ADDRESS VARCHAR(50) NOT NULL -- 판매업체주소,
);
-- 3. 생산업체 테이블
CREATE TABLE PRODUCT_COMPANY (
                                 PRODUCT_COMPANY_ID VARCHAR(50) PRIMARY KEY, -- 생산업체PK
                                 NAME VARCHAR(50) NOT NULL, -- 생산업체이름
                                 ADDRESS VARCHAR(50) NOT NULL -- 생산업체주소,
);
-- 4. 재료 테이블
CREATE TABLE SOURCE (
                        SOURCE_ID VARCHAR(50) PRIMARY KEY, -- 재료PK
                        NAME VARCHAR(50) NOT NULL -- 재료이름
);
-- 5. 생산 업체별 재료 가격 테이블
CREATE TABLE SOURCE_PRICE (
                              SOURCE_PRICE_ID VARCHAR(50) PRIMARY KEY, -- 가격PK
                              PRODUCT_COMPANY_ID VARCHAR(50), -- 생산업체FK
                              SOURCE_ID VARCHAR(50), -- 재료FK
                              PRICE INT, -- 가격
                              FOREIGN KEY (PRODUCT_COMPANY_ID) REFERENCES PRODUCT_COMPANY(PRODUCT_COMPANY_ID),
                              FOREIGN KEY (SOURCE_ID) REFERENCES SOURCE(SOURCE_ID)
);

-- 7. 밀키트 재료 가격 테이블
CREATE TABLE KIT_SOURCE_PRICE (
                                  KIT_SOURCE_PRICE_ID VARCHAR(50) PRIMARY KEY, -- 밀키트재료가격PK
                                  MEALKIT_ID VARCHAR(50), -- 밀키트FK
                                  SOURCE_PRICE_ID VARCHAR(50), -- 가격FK
                                  QUENTITY INT, -- 개수
                                  FOREIGN KEY (MEALKIT_ID) REFERENCES MEALKIT(MEALKIT_ID),
                                  FOREIGN KEY (SOURCE_PRICE_ID) REFERENCES SOURCE_PRICE(SOURCE_PRICE_ID)
);
-- 8. 상태 테이블
CREATE TABLE STATUS (
                        STATUS_ID INT PRIMARY KEY, -- 상태 PK
                        STATUS VARCHAR(50) -- 상태
);
-- 9. 생산주문(발주) 테이블
CREATE TABLE PRODUCT_ORDER (
                               PRODUCT_ORDER_ID VARCHAR(50) PRIMARY KEY, -- 발주PK
                               KIT_SOURCE_PRICE_ID VARCHAR(50), -- 밀키트재료가격FK
                               QUENTITY INT, -- 개수
                               PRODUCT_ORDER_DATE DATETIME DEFAULT CURRENT_TIMESTAMP,  -- 주문 일자
                               STATUS_ID INT, -- 상태FK
                               FOREIGN KEY (KIT_SOURCE_PRICE_ID) REFERENCES KIT_SOURCE_PRICE(KIT_SOURCE_PRICE_ID),
                               FOREIGN KEY (STATUS_ID) REFERENCES STATUS(STATUS_ID)
);
-- 10. 생산주문(발주) 로그 테이블
CREATE TABLE PRODUCT_ORDER_LOG (
                                   PRODUCT_ORDER_LOG_ID VARCHAR(50) PRIMARY KEY, -- 발주로그PK
                                   PRODUCT_ORDER_ID VARCHAR(50), -- 발주FK
                                   STATUS_ID INT, -- 상태FK
                                   PRODUCT_ORDER_DATE DATETIME DEFAULT CURRENT_TIMESTAMP,  -- 날짜
                                   FOREIGN KEY (PRODUCT_ORDER_ID) REFERENCES PRODUCT_ORDER(PRODUCT_ORDER_ID),
                                   FOREIGN KEY (STATUS_ID) REFERENCES STATUS(STATUS_ID)
);
-- 11. 밀키트 주문 테이블
CREATE TABLE KIT_ORDER (
                           KIT_ORDER_ID VARCHAR(50) PRIMARY KEY, -- 주문PK
                           KIT_COMPANY_ID VARCHAR(50), -- 밀키트판매업체FK
                           MEALKIT_ID VARCHAR(50), -- 밀키트FK
                           QUENTITY INT, -- 개수
                           PRODUCT_ORDER_DATE DATETIME DEFAULT CURRENT_TIMESTAMP,  -- 주문 일자
                           STATUS_ID INT, -- 상태FK
                           FOREIGN KEY (KIT_COMPANY_ID) REFERENCES KIT_COMPANY(KIT_COMPANY_ID),
                           FOREIGN KEY (MEALKIT_ID) REFERENCES MEALKIT(MEALKIT_ID),
                           FOREIGN KEY (STATUS_ID) REFERENCES STATUS(STATUS_ID)
);
-- 12. 밀키트 주문로그 테이블
CREATE TABLE KIT_ORDER_LOG (
                               KIT_ORDER_LOG_ID VARCHAR(50) PRIMARY KEY, -- 주문로그PK
                               KIT_ORDER_ID VARCHAR(50), -- 주문FK
                               STATUS_ID INT, -- 상태FK
                               PRODUCT_ORDER_DATE DATETIME DEFAULT CURRENT_TIMESTAMP,  -- 날짜
                               FOREIGN KEY (KIT_ORDER_ID) REFERENCES KIT_ORDER(KIT_ORDER_ID),
                               FOREIGN KEY (STATUS_ID) REFERENCES STATUS(STATUS_ID)
);
-- 13. 권한 테이블
CREATE TABLE ROLE (
                      ROLE_ID	INT PRIMARY KEY, -- 권한PK
                      ROLE_NAME VARCHAR(50) NOT NULL -- 권한이름
);
-- 14. 유저 테이블
CREATE TABLE USER (
                      USER_PK	VARCHAR(50) PRIMARY KEY, -- 유저PK
                      USER_NAME VARCHAR(50) NOT NULL, -- 유저이름
                      USER_ID	VARCHAR(50) NOT NULL, -- 유저아이디
                      USER_PASSWORD VARCHAR(128) NOT NULL, -- 유저 비밀번호
                      USER_EMAIL VARCHAR(50) NOT NULL, -- 유저 이메일
                      USER_TEL VARCHAR(50) NOT NULL, -- 전화번호
                      ROLE_NAME VARCHAR(50) -- 권한FK
);


-- 웨어하우스 관련
-- 1. LOGISTICS_WAREHOUSE 테이블 생성

CREATE TABLE `LOGISTICS_WAREHOUSE`
(
    `LOGISTICS_WAREHOUSE_PK` VARCHAR(50) NOT NULL,
    `WAREHOUSE_NAME`         VARCHAR(50) NOT NULL,
    PRIMARY KEY (`LOGISTICS_WAREHOUSE_PK`)
);


-- 2. LOGISTICS_WAREHOUSE_SOURCE 테이블 생성
CREATE TABLE `LOGISTICS_WAREHOUSE_STACK`
(
    `LOGISTICS_WAREHOUSE_STACK_PK` VARCHAR(50) NOT NULL,
    `SOURCE_FK`                     VARCHAR(50) NOT NULL,
    `LOGISTICS_WAREHOUSE_FK`        VARCHAR(50) NOT NULL,
    `QUANTITY`                      INT NULL,
    PRIMARY KEY (`LOGISTICS_WAREHOUSE_STACK_PK`),
    FOREIGN KEY (`SOURCE_FK`) REFERENCES `SOURCE` (`SOURCE_ID`),
    FOREIGN KEY (`LOGISTICS_WAREHOUSE_FK`) REFERENCES `LOGISTICS_WAREHOUSE` (`LOGISTICS_WAREHOUSE_PK`)
);

INSERT INTO MEALKIT (MEALKIT_ID, NAME)
VALUES (UUID(), '불고기 밀키트'),
       (UUID(), '김치찌개 밀키트'),
       (UUID(), '된장찌개 밀키트'),
       (UUID(), '비빔밥 밀키트'),
       (UUID(), '샤브샤브 밀키트');

INSERT INTO KIT_COMPANY (KIT_COMPANY_ID, NAME, ADDRESS)
VALUES (UUID(), '오픈키친', '서울시 강남구'),
       (UUID(), '밀키트컴퍼니', '서울시 서초구'),
       (UUID(), '요리조리', '서울시 송파구'),
       (UUID(), '하이키친', '서울시 마포구'),
       (UUID(), '푸드마트', '서울시 강동구');


INSERT INTO PRODUCT_COMPANY (PRODUCT_COMPANY_ID, NAME, ADDRESS)
VALUES (UUID(), '농심공장', '경기도 평택시'),
       (UUID(), '청정원식품', '충청북도 청주시'),
       (UUID(), 'CJ제일제당', '서울시 영등포구'),
       (UUID(), '대상식품', '서울시 중구'),
       (UUID(), '풀무원식품', '경기도 고양시');

INSERT INTO SOURCE (SOURCE_ID, NAME)
VALUES (UUID(), '소고기'),
       (UUID(), '돼지고기'),
       (UUID(), '김치'),
       (UUID(), '된장'),
       (UUID(), '두부'),
       (UUID(), '버섯'),
       (UUID(), '당근'),
       (UUID(), '양파'),
       (UUID(), '애호박');

INSERT INTO SOURCE_PRICE (SOURCE_PRICE_ID, PRODUCT_COMPANY_ID, SOURCE_ID, PRICE)
VALUES (UUID(), (SELECT PRODUCT_COMPANY_ID FROM PRODUCT_COMPANY WHERE NAME = '농심공장'),
        (SELECT SOURCE_ID FROM SOURCE WHERE NAME = '소고기'), 5000),
       (UUID(), (SELECT PRODUCT_COMPANY_ID FROM PRODUCT_COMPANY WHERE NAME = '청정원식품'),
        (SELECT SOURCE_ID FROM SOURCE WHERE NAME = '돼지고기'), 3000),
       (UUID(), (SELECT PRODUCT_COMPANY_ID FROM PRODUCT_COMPANY WHERE NAME = 'CJ제일제당'),
        (SELECT SOURCE_ID FROM SOURCE WHERE NAME = '김치'), 2000),
       (UUID(), (SELECT PRODUCT_COMPANY_ID FROM PRODUCT_COMPANY WHERE NAME = '대상식품'),
        (SELECT SOURCE_ID FROM SOURCE WHERE NAME = '된장'), 1500),
       (UUID(), (SELECT PRODUCT_COMPANY_ID FROM PRODUCT_COMPANY WHERE NAME = '풀무원식품'),
        (SELECT SOURCE_ID FROM SOURCE WHERE NAME = '두부'), 1000);

INSERT INTO KIT_TOTAL_PRICE (KIT_TOTAL_PRICE_ID, MEALKIT_ID, PURCHASER_PRICE, SALES_PRICE)
VALUES (UUID(), (SELECT MEALKIT_ID FROM MEALKIT WHERE NAME = '불고기 밀키트'), 10000, 15000),
       (UUID(), (SELECT MEALKIT_ID FROM MEALKIT WHERE NAME = '김치찌개 밀키트'), 8000, 12000),
       (UUID(), (SELECT MEALKIT_ID FROM MEALKIT WHERE NAME = '된장찌개 밀키트'), 7000, 11000),
       (UUID(), (SELECT MEALKIT_ID FROM MEALKIT WHERE NAME = '비빔밥 밀키트'), 9000, 13000),
       (UUID(), (SELECT MEALKIT_ID FROM MEALKIT WHERE NAME = '샤브샤브 밀키트'), 15000, 20000);


INSERT INTO KIT_SOURCE_PRICE (KIT_SOURCE_PRICE_ID, MEALKIT_ID, SOURCE_PRICE_ID, QUENTITY)
VALUES (UUID(), (SELECT MEALKIT_ID FROM MEALKIT WHERE NAME = '불고기 밀키트'),
        (SELECT SOURCE_PRICE_ID FROM SOURCE_PRICE WHERE PRICE = 5000), 1),
       (UUID(), (SELECT MEALKIT_ID FROM MEALKIT WHERE NAME = '김치찌개 밀키트'),
        (SELECT SOURCE_PRICE_ID FROM SOURCE_PRICE WHERE PRICE = 2000), 2),
       (UUID(), (SELECT MEALKIT_ID FROM MEALKIT WHERE NAME = '된장찌개 밀키트'),
        (SELECT SOURCE_PRICE_ID FROM SOURCE_PRICE WHERE PRICE = 1500), 1),
       (UUID(), (SELECT MEALKIT_ID FROM MEALKIT WHERE NAME = '비빔밥 밀키트'),
        (SELECT SOURCE_PRICE_ID FROM SOURCE_PRICE WHERE PRICE = 1000), 2),
       (UUID(), (SELECT MEALKIT_ID FROM MEALKIT WHERE NAME = '샤브샤브 밀키트'),
        (SELECT SOURCE_PRICE_ID FROM SOURCE_PRICE WHERE PRICE = 3000), 3);



INSERT INTO STATUS (STATUS_ID, STATUS)
VALUES (1, '처리전'),
       (2, '처리중'),
       (3, '처리후'),
       (4, '배송완료'),
       (5, '취소');

INSERT INTO PRODUCT_ORDER (PRODUCT_ORDER_ID, KIT_SOURCE_PRICE_ID, QUENTITY, STATUS_ID)
VALUES (UUID(), (SELECT KIT_SOURCE_PRICE_ID FROM KIT_SOURCE_PRICE WHERE KIT_SOURCE_PRICE_ID = '특정_ID_1'), 10, 1),
       (UUID(), (SELECT KIT_SOURCE_PRICE_ID FROM KIT_SOURCE_PRICE WHERE KIT_SOURCE_PRICE_ID = '특정_ID_2'), 5, 2),
       (UUID(), (SELECT KIT_SOURCE_PRICE_ID FROM KIT_SOURCE_PRICE WHERE KIT_SOURCE_PRICE_ID = '특정_ID_3'), 7, 3);

INSERT INTO PRODUCT_ORDER_LOG (PRODUCT_ORDER_LOG_ID, PRODUCT_ORDER_ID, STATUS_ID)
VALUES (UUID(), (SELECT PRODUCT_ORDER_ID FROM PRODUCT_ORDER WHERE QUENTITY = 10), 1),
       (UUID(), (SELECT PRODUCT_ORDER_ID FROM PRODUCT_ORDER WHERE QUENTITY = 5), 2),
       (UUID(), (SELECT PRODUCT_ORDER_ID FROM PRODUCT_ORDER WHERE QUENTITY = 7), 3);

INSERT INTO KIT_ORDER (KIT_ORDER_ID, KIT_COMPANY_ID, MEALKIT_ID, QUENTITY, STATUS_ID)
VALUES (UUID(), (SELECT KIT_COMPANY_ID FROM KIT_COMPANY WHERE NAME = '오픈키친'),
        (SELECT MEALKIT_ID FROM MEALKIT WHERE NAME = '불고기 밀키트'), 20, 1),
       (UUID(), (SELECT KIT_COMPANY_ID FROM KIT_COMPANY WHERE NAME = '밀키트컴퍼니'),
        (SELECT MEALKIT_ID FROM MEALKIT WHERE NAME = '김치찌개 밀키트'), 15, 1),
       (UUID(), (SELECT KIT_COMPANY_ID FROM KIT_COMPANY WHERE NAME = '요리조리'),
        (SELECT MEALKIT_ID FROM MEALKIT WHERE NAME = '된장찌개 밀키트'), 10, 2);

INSERT INTO KIT_ORDER_LOG (KIT_ORDER_LOG_ID, KIT_ORDER_ID, STATUS_ID)
VALUES (UUID(), (SELECT KIT_ORDER_ID FROM KIT_ORDER WHERE QUENTITY = 20), 1),
       (UUID(), (SELECT KIT_ORDER_ID FROM KIT_ORDER WHERE QUENTITY = 15), 1),
       (UUID(), (SELECT KIT_ORDER_ID FROM KIT_ORDER WHERE QUENTITY = 10), 2);

INSERT INTO ROLE (ROLE_ID, ROLE_NAME)
VALUES (1, 'ADMIN'),
       (2, 'KIT_MANAGER'),
       (3, 'FARM_MANAGER');

INSERT INTO USER (USER_PK, USER_NAME, USER_ID, USER_PASSWORD, USER_EMAIL, USER_TEL, ROLE_ID)
VALUES (UUID(), '김철수', 'chulsoo', 'password123', 'chulsoo@example.com', '010-1234-5678', 1),
       (UUID(), '이영희', 'younghee', 'password456', 'younghee@example.com', '010-2345-6789', 2),
       ('2fc622e6-64fe-11ef-9a4b-0242ac110002', '신가현', 'admin', '$2a$10$Oe87iYbNOD1PZ/Fav.N6Weijo4/dhwnBCluJg6qBUxf.OkNCtYv1C', 'younghee@example.com', '010-2345-6789', 1),
       (UUID(), '박영수', 'youngsoo', 'password789', 'youngsoo@example.com', '010-3456-7890', 3);
