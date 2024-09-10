package org.example.jhta_2402_2_final.dao.product;

import org.apache.ibatis.annotations.Mapper;
import org.example.jhta_2402_2_final.model.dto.common.SourceDto;
import org.example.jhta_2402_2_final.model.dto.product.ProductCompanyChartDto;

import java.util.List;
import java.util.Map;

@Mapper
public interface ProductCompanyDao {

    // 유저 인증
    String getUserUidByUserId(String userName);
    String getCompanyIdByUserUid(String userUid);

    // 생산업체에 등록된 생산품 리스트 가져옴
    List<Map<String, Object>> getSourcesByCompanyName(String companyId);
    // 모든 재료 리스트
    List<SourceDto> getAllSources(String companyId);

    // 생산업체 생산품 Create, Update, Delete
    int addSourceToCompany(Map<String, Object> paramData);
    int sourcePriceUpdate(Map<String, Object> paramData);
    int sourcePriceHistory(Map<String, Object> paramData);
    int deleteSourceFromCompany(String companySourceId);

    // Source 중복체크겸 id 가져오기 (return: null 이면 중복 없으므로 재료 테이블에 추가 -> addSource)
    String getSourceIdByName(String sourceName);
    int addSource(String sourceId, String sourceName);

    // 생산 창고 리스트
    List<Map<String, Object>> getWarehouseSources(String companyId);
    // 제품 생산
    int produceSource(Map<String, Object> paramData);


    boolean checkDuplicateCompanySource(Map<String, Object> paramData);

    List<Map<String, Object>> getProductOrderList(Map<String, Object> paramData);

    // 주문 처리
    int orderProcess(Map<String, Object> paramData);
    int orderLog(Map<String, Object> paramData);

    int getSourceQuantityFromWarehouse(String sourcePriceId);

    int outboundSource(Map<String, Object> paramData);

    List<ProductCompanyChartDto> getChart(String companyId);
    List<Map<String, Object>> orderChart(Map<String, Object> paramData);

    // 등록된 모든 재료 리스트 (검색용)
    List<String> selectAllCompanySource (String companyId);

    int getOrderStatus(String orderId);
}
