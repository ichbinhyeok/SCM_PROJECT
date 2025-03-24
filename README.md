# SCM Project

* 판매업체, 유통업체, 생산업체 간의 식재료 주문 발주/출고를 할 수 있는 SCM API 시스템
* 개발기간 : 24.08.20 ~ 24.09.25
* 참여 인원 : 6명

## 프로젝트 핵심 목표
이 프로젝트의 주된 목표는 단순한 기능 구현을 넘어 **실제 개발 현장의 업무 사이클과 협업 프로세스를 경험**하는 것이었습니다. 클라이언트-PM-개발자 구조를 통해 실무와 유사한 환경에서 전체 개발 생명주기를 체험하고자 했습니다.

### 기술적 목표
* 사용자가 별도로 필요 재료의 수량이나 종류를 따질 필요 없이 맞춤형으로 발주/출고를 할 수 있는 시스템
* 사용자가 알아보기 쉬운 시각화된 그래프 자료 제공
* 주문로그 추적 및 취소/변경 기능 구현
* 업체 간 업무의 낮은 결합도 유지와 명확한 경계 설정

## 기술 스택

### 백엔드 기술 스택
<img src="https://img.shields.io/badge/Java-blue?style=for-the-badge&logo=jameson&logoColor=004027"> <img src="https://img.shields.io/badge/spring-6DB33F?style=for-the-badge&logo=spring&logoColor=white"> <img src="https://img.shields.io/badge/springboot-6DB33F?style=for-the-badge&logo=springboot&logoColor=white"> <img src="https://img.shields.io/badge/mybatis-000000?style=for-the-badge&logo=mybatis&logoColor=white"> <img src="https://img.shields.io/badge/Lombok-000000?style=for-the-badge&logo=framework&logoColor=white">

### 데이터베이스
<img src="https://img.shields.io/badge/mariadb-003545?style=for-the-badge&logo=mariadb&logoColor=white"> <img src="https://img.shields.io/badge/mysql-4479A1?style=for-the-badge&logo=mysql&logoColor=white">

### 프론트엔드
<img src="https://img.shields.io/badge/thymeleaf-005F0F?style=for-the-badge&logo=thymeleaf&logoColor=white"> <img src="https://img.shields.io/badge/Javascript-F7DF1E?style=for-the-badge&logo=Javascript&logoColor=white"> <img src="https://img.shields.io/badge/jquery-0769AD?style=for-the-badge&logo=jquery&logoColor=white"> <img src="https://img.shields.io/badge/chart.js-FF6384?style=for-the-badge&logo=chartdotjs&logoColor=white"> <img src="https://img.shields.io/badge/bootstrap-7952B3?style=for-the-badge&logo=bootstrap&logoColor=white"> <img src="https://img.shields.io/badge/html5-orange?style=for-the-badge&logo=html5&logoColor=white"> <img src="https://img.shields.io/badge/css3-1572B6?style=for-the-badge&logo=css3&logoColor=white">

### 인프라/배포
<img src="https://img.shields.io/badge/amazon web services-232F3E?style=for-the-badge&logo=amazonwebservices&logoColor=white"> <img src="https://img.shields.io/badge/docker-2496ED?style=for-the-badge&logo=docker&logoColor=white">

### 협업 도구
<img src="https://img.shields.io/badge/github-181717?style=for-the-badge&logo=github&logoColor=white"> <img src="https://img.shields.io/badge/slack-4A154B?style=for-the-badge&logo=slack&logoColor=white"> <img src="https://img.shields.io/badge/notion-000000?style=for-the-badge&logo=notion&logoColor=white">

## 실무 개발 사이클 경험

### 역할 기반 개발 프로세스
* 클라이언트-PM-개발자 구조의 실무 환경 시뮬레이션
* 요구사항 수집, 분석, 설계, 개발, 테스트, 배포의 전체 과정 경험
* 슬랙을 통한 비동기 커뮤니케이션, 노션을 활용한 문서화, 회의실 예약제를 통한 체계적인 미팅 진행
* 직접적인 대면 소통 대신 실무와 같은 커뮤니케이션 채널 유지

### 프로젝트 도전과 현실적 해결책

#### 지속적인 요구사항 변경 속 개발 진행
* 프로젝트 진행 중 클라이언트와 PM 사이에서 요구사항이 지속적으로 변경되는 상황 직면
* 데이터베이스 설계가 확정되지 않은 상태에서 개발을 진행해야 하는 실무적 딜레마 경험
* 최초 3차 정규화로 설계했으나 빈번한 변경으로 인해 유지보수의 어려움 발생

#### 실용적 접근법 선택
* 이론적으로 완벽한 설계보다 빠른 개발과 적응성을 위해 Map 자료구조 기반의 유연한 데이터 처리 방식 도입
* "작동하는 소프트웨어"에 우선순위를 두고, 엄격한 데이터 모델링 대신 유연한 구조 채택
* 개발 일정 준수를 위해 때로는 재작성이 필요하더라도 신속하게 변경사항 반영

#### 배운 교훈
* 실무에서는 이론적으로 완벽한 해결책보다 현실적 제약 안에서 최선의 결과를 도출하는 능력이 중요함을 체득
* 변화에 유연하게 대응할 수 있는 개발 마인드셋과 실용적 접근법의 가치 이해
* 문서화와 명확한 커뮤니케이션의 중요성, 그리고 팀원 간 일관된 코딩 컨벤션 확립의 필요성 인식

## 담당업무 
* **창고 관리 시스템 개발** - SCM 프로젝트에서 창고 모듈을 직접 구현하여 전체 시스템의 물류 흐름 지원
* **ERD 설계 및 표준화** - 팀 전체의 데이터베이스 구조를 정리하고 3차 정규화를 통해 중복 값을 제거하여 효율적인 데이터 모델 확립, 개별적으로 진행되던 테이블 설계의 컨벤션을 통일하여 시스템 일관성 확보
* **개발 환경 통합** - 팀원들의 다양한 개발 환경 버전 차이로 인한 문제를 해결하기 위해 Docker Compose 구성으로 일관된 개발 환경 제공
* **AWS 클라우드 배포** - 가비아에서 도메인을 구매하고 AWS 서비스를 활용하여 프로젝트 배포, 실제 운영 환경에서의 애플리케이션 구동 관리

## ERD
![erd2](https://github.com/user-attachments/assets/4db65556-2496-4835-a027-1d19af946d6a) <br>

## 시스템 구조
![diagram](https://github.com/user-attachments/assets/5dba2f3e-4aff-4209-9e92-62edb43ad743) <br><br>

## 페이지별 기능 설명
### 판매측 관리자 페이지
1. 밀키트 주문 추가
   - 관리자는 등록되어 있는 모든 밀키트 업체에 해당하는 새로운 밀키트 주문이 추가 가능
   - 새로운 밀키트 업체 등록 가능
   - 새로운 밀키트와 그에 해당하는 재료를 등록할 수 있음 <br>
2. 밀키트 주문 및 매출 확인
   - 연월 매출액, 처리중인 주문, 처리완료된 주문 확인 가능
   - 각 밀키트 주문에 대한 정보확인, 상태변경, 취소 가능
   - 주문별로 상태가 변경될때마다 로그 확인 가능 <br>

![image](https://github.com/user-attachments/assets/380873f6-0dc2-49ed-aba6-c8c6fcc3ab88)  <br>


3. 창고
   - 밀키트 주문이 완료되면 해당 밀키트 업체에 밀키트 재고가 추가되어 창고로 이동 
   - 밀키트별 누적 판매량을 확인하여 어떤 밀키트가 많이 팔리는지 수요 예측 가능하도록 <br>

![image](https://github.com/user-attachments/assets/4c807da5-f044-4c68-a4fd-dc9fb62c751f)  <br>



4. 밀키트 가격 설정
   - 밀키트의 현재 가격과 밀키트 재료별 최소가격을 통해 밀키트의 최저가를 구하고 최저가로 설정할수 있도록함
   - 밀키트 별로 어떤 재료가 얼마나 필요한지 확인가능
   - 여러 생산 업체에서 동일한 재료를 생산할 수 있기에 생산 업체별 재료 가격을 확인하고 재료별 최저가 확인가능
   - 이를 통해 최대한의 이익을 추구하는 공급망 관리 <br>
   
![image](https://github.com/user-attachments/assets/af652027-8d8c-4f94-bd71-81b9de8d50da)
 <br>


### 판매측 사용자 페이지
- 관리자(admin)이 아닌 밀키트 업체(user)로 로그인할 경우 해당 업체에 대한 정보 확인
- 밀키트 업체의 주문 정보 확인, 취소, 새로운 주문 밀키트 주문 추가
- 밀키트 업체의 매출, 창고재고 확인 <br>
   
![image](https://github.com/user-attachments/assets/b80b4105-ef66-48fa-ba78-76fa97e1f7b3)


## 결론

이 프로젝트는 SCM 시스템 개발이라는 목표 외에도, 실무와 유사한 개발 과정과 협업 경험을 제공했습니다. 요구사항 변경, 팀 내 커뮤니케이션, 인프라 구축 등 실제 개발 현장에서 직면하는 다양한 도전들을 경험하며, 이론적 지식 너머의 실용적인 문제 해결 능력을 기를 수 있었습니다. 특히 배포까지 완료하여 전체 개발 사이클을 경험한 것이 이 프로젝트의 가장 큰 가치였습니다.
