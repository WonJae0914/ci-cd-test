<%@	page contentType="text/html;charset=utf-8" language="java" pageEncoding="utf-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@ include file="/WEB-INF/jsp/components/temp_session.jsp"%> 

<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="0" />
<meta http-equiv="Cache-Control" content="no-cache" />

<meta id="_csrf" name="_csrf" content="${_csrf.token}" />
<meta id="_csrf_header" name="_csrf_header"
   content="${_csrf.headerName}" />

<title>재결정보지원센터</title>

<meta name="description" content="재결정보지원센터" />
<meta name="keywords" content="재결정보지원센터" />
<meta name="author" content="재결정보지원센터" />
<meta name="format-detection" content="telephone=no" />
<meta property="og:type" content="website" />
<meta property="og:title" content="재결정보지원센터" />
<meta property="og:site_name" content="재결정보지원센터" />
<meta property="og:description" content="재결정보지원센터" />
<meta property="og:image" content="../css/favicon_1200x630.png" />
<meta name="twitter:description" content="재결정보지원센터" />
<meta name="twitter:image" content="../../css/favicon_270x270.png" />
<link rel="shortcut icon" href="../../css/favicon_seoul.ico" />
<link rel="icon" href="../../css/favicon_seoul.ico" />

<link rel="apple-touch-icon" href="../../css/favicon_seoul.ico" />
<link rel="stylesheet" href="../../css/init.css" />
<link rel="stylesheet" href="../../css/common.css" />
<link rel="stylesheet" href="../../css/layout.css" />
<link rel="stylesheet" href="../../css/sub.css" />
<link rel="stylesheet" href="../../css/owl.carousel.min.css" />
<link rel="stylesheet" href="../../css/jquery-ui.css" />

</head>
<body>

	<form id="fileForm" style="display: none;'">
		<input type="file" class="form-control wd-100p" id="fileSeq" name="file">

	</form>
	<input type="file" id="file1" name="file1" style="display: none;'"> 

		<input type="hidden" class="form-control wd-100p" id="reptSeq" name="0">
		<input type="hidden" class="form-control wd-100p" id="reptOwnerSeq" name="0">
		<input type="hidden" class="form-control wd-100p" id="fileCount" value="0">
		
	<input type="hidden" name="decisionId" id="decisionId"value="${decisionId}">
	<input type="hidden" name="masterId" id="masterId" value="${masterId}">

	<div id="wrap">

		<!-- header start -->
		<jsp:include page="/WEB-INF/jsp/components/header.jsp" flush="false">
			<jsp:param name="login" value="login" />
		</jsp:include>
		<!-- header end -->

		<hr />
		<div id="contents" class="c_sub">
			<div class="wrap">
				<div class="sub_title sub_title02">
					<h2 class="title bold center">재결접수</h2>
				</div>

				<!-- implementer submenu start -->
				<jsp:include page="../includes/submenu.jsp" flush="false">
					<jsp:param name="currentPage" value="${currentPage}" />
				</jsp:include>
				<!-- implementer submenu end -->

				<div class="cs_wrap">
					<div class="cs_head">
						<h3 class="title bold cb">재결의견 상세</h3>
					</div>
					<div class="cs_body">
						<form class="decision_form" name="inquiry_view">

							<!-- step start -->
							<jsp:include page="/WEB-INF/jsp/components/view/step.jsp"
								flush="false">
								<jsp:param name="currentStep" value="${avo.decisionState}" />
							</jsp:include>
							<!-- step end -->

							<div class="cs_title">
								<h4 class="fl title t1 bold cb s1 bullet">사업 정보</h4>
							</div>
							<div class="form t1">
								<div class="f_wrap">
									<div class="f_field div2">
										<div class="ff_title">
											<label>사건번호</label>
										</div>
										<div class="ff_wrap">
											<p>${avo.caseNo}</p>
										</div>
									</div>
									<div class="f_field div2">
										<div class="ff_title">
											<label>사건명</label>
										</div>
										<div class="ff_wrap">
											<p>${avo.title}</p>
										</div>
									</div>
								</div>
								<div class="f_wrap">
									<div class="f_field div2">
										<div class="ff_title">
											<label>접수일자</label>
										</div>
										<div class="ff_wrap">
											<p>${avo.recvDt}</p>
										</div>
									</div>
									<div class="f_field div2">
										<div class="ff_title">
											<label>진행상태</label>
										</div>
										<div class="ff_wrap">
											<p>${avo.decisionStateStr }</p>
										</div>
									</div>
								</div>
								<div class="f_wrap">
									<div class="f_field div2">
										<div class="ff_title">
											<label>시행자가격시점</label>
										</div>
										<div class="ff_wrap">
											<p>${avo.priceDt}</p>
										</div>
									</div>
									<div class="f_field div2">
										<div class="ff_title">
											<label>재결구분</label>
										</div>
										<div class="ff_wrap">
											<p>${avo.judeDivCdName}</p>
										</div>
									</div>
								</div>
								<div class="f_wrap">
									<div class="f_field div2">
										<div class="ff_title">
											<label>수용재결법인</label>
										</div>
										<div class="ff_wrap">
											<p>-</p>
										</div>
									</div>
									<div class="f_field div2">
										<div class="ff_title">
											<label>협의법인</label>
										</div>
										<div class="ff_wrap">
											<p>${avo.consultAppName}</p>
										</div>
									</div>
								</div>
							</div>
							<div class="cs_title">
								<h4 class="fl title t1 bold cb s1 bullet">담당자 정보</h4>
							</div>
							<div class="form t1">
								<div class="f_wrap">
									<div class="f_field div2">
										<div class="ff_title">
											<label>시행자명</label>
										</div>
										<div class="ff_wrap">
											<p>${avo.bizOprtNm}</p>
										</div>
									</div>
									<div class="f_field div2">
										<div class="ff_title">
											<label>사업유형</label>
										</div>
										<div class="ff_wrap">
											<p>${avo.bizTpCd}</p>
										</div>
									</div>
								</div>
								<div class="f_wrap">
									<div class="f_field">
										<div class="ff_title">
											<label>소재지</label>
										</div>
										<div class="ff_wrap">
											<c:if test="${avo.reptLoc ne ''}">
											<p>${avo.reptLoc}</p>
											</c:if>
											<c:if test="${avo.reptLoc eq ''}">
											<p>-</p>
											</c:if>
										</div>
									</div>
								</div>
							</div>
							
							                                <div class="cs_title">
                                    <h4 class="fl title t1 bold cb s1 bullet">
                                       	 조서 정보
                                    </h4>
                                </div>
                                                     <div class="form t1">
                                    <div class="f_wrap">
                                        <div class="f_field div2">
                                            <div class="ff_title">
                                                <label>지장물수</label>
                                            </div>
                                            <div class="ff_wrap">
                                                <p>
                                                    <a href="#" class="cx"  onclick="openPopup('goods','${objectCount}');return false;" >${objectCount}건<i class="icon search"></i ></a>
                                                </p>
                                            </div>
                                        </div>
                                  		<div class="f_field div2">
                                            <div class="ff_title">
                                                <label>필지수</label>
                                            </div>
                                            <div class="ff_wrap">
                                                <p>
                                                    <a href="#" class="cx" onclick="openPopup('land','${landCount}');return false;">${landCount}건<i class="icon search" ></i></a>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="f_wrap">
                                       <div class="f_field div2">
                                            <div class="ff_title">
                                                <label>지장물소유자수</label>
                                            </div>
                                            <div class="ff_wrap">
                                                <p>
                                                    <a href="#" class="cx"  onclick="openPopup('goodsowner','${objectRightCount}');return false;" >${objectRightCount}명<i class="icon search"></i></a>
                                                </p>
                                            </div>
                                        </div>
                                        <div class="f_field div2">
                                            <div class="ff_title">
                                                <label>필지소유자수</label>
                                            </div>
                                            <div class="ff_wrap">
                                                <p>
                                                    <a href="#" class="cx"  onclick="openPopup('landsowner','${landRightCount}');return false;" >${landRightCount}명<i class="icon search"></i ></a>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="f_wrap">
                                        <div class="f_field div2">
                                            <div class="ff_title">
                                                <label>면적</label>
                                            </div>
                                            <div class="ff_wrap">
                                                <p>${totalAreaAmot}㎡</p>
                                            </div>
                                        </div>
                                        <div class="f_field div2">
                                            <div class="ff_title">
                                                <label>종전금액합계(원)</label>
                                            </div>
                                            <div class="ff_wrap">
                                                 <p>${totalCost}</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
							<div class="cs_title">
								<h4 class="fl title t1 bold cb s1 bullet">비고</h4>
							</div>
							<div class="form t2">
								<div class="f_wrap">
									<div class="f_field">
										<div class="ff_title">
											<label for="bw_subject">제출기한
											</label>
										</div>
										<div class="ff_wrap">
											<p>-</p>
										</div>
									</div>
								</div>
								<div class="f_wrap">
									<div class="f_field">
										<div class="ff_title">
											<label for="bw_subject">사업시행자
												담당자(연락처)</label>
										</div>
										<div class="ff_wrap">
											<p>
												${avo.bizOprtIchrNm} <a href="tel:${avo.bizOprtPhoneNo}"
													class="cx">${avo.bizOprtPhoneNo}</a>
											</p>
										</div>
									</div>
								</div>
							</div>

							<div class="cs_title">
								<h4 class="fl title t1 bold cb s1 bullet">
									소유자의견 및 사업시행자 의견
								</h4>
							</div>
							
						    <div id="loaderSection" class="loader_wr loader_wr--section">
						        <svg class="loader__svg" version="1.1" id="L4" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
						            x="0px" y="0px" viewBox="-25 0 100 100" enable-background="new 0 0 0 0" xml:space="preserve">
						            <circle fill="#365978" stroke="none" cx="6" cy="50" r="6"></circle>
						            <circle fill="#365978" stroke="none" cx="26" cy="50" r="6"></circle>
						            <circle fill="#365978" stroke="none" cx="46" cy="50" r="6"></circle>
						        </svg>
						        <p class="loader__txt">
							        데이터를 불러오는 중입니다.<br>
							        잠시만 기다려주세요.
						        </p>
						    </div>
						
					
							<div class="item_result_wr">
								<h5 class="item_result_wr__tit">1. 지연가산금</h5>
								<div class="item_result_wr__con">
									<table class="item_result_wr__table">
										<caption>필지</caption>
										<thead>
											<tr>
												  
												<th>연번</th>
												<th>소유자</th>
												<th>지분</th>
												<th>소재지</th>
												<th>지번</th>
												<th>본번</th>
												<th>부번</th>
												<th>공</th>
												<th>실</th>
												<th>면적</th>
												<th>단가</th> <th>의견</th>
										
											</tr>
										</thead>
										<tbody id="ownerLandItemList1">
	
										</tbody>
									</table>
	
									<table class="item_result_wr__table" id="goodsTable1">
										<caption>지장물</caption>
										<thead>
											<tr>
												  
												<th>연번</th>
												<th>소유자</th>
												<th>지분</th>
												<th>소재지</th>
												<th>본번</th>
												<th>부번</th>
												<th>부번2</th>
												<th>물건종류</th>
												<th>물건구조</th>
												<th>면적/수량</th>
												<th>단가</th> <th>의견</th>
											
											</tr>
										</thead>
										<tbody id="ownerGoodsItemList1">
										</tbody>
									</table>
								</div>
							</div>
							<%-- 항목 결과 끝 01 --%>
							
							<%-- 항목 결과 시작 02 --%>
							<div class="item_result_wr">
								<h5 class="item_result_wr__tit">2. 보상금 증액</h5>
								<div class="item_result_wr__con">
									<table class="item_result_wr__table">
										<caption>필지</caption>
										<thead>
											<tr>
												  
												<th>연번</th>
												<th>소유자</th>
												<th>지분</th>
												<th>소재지</th>
												<th>지번</th>
												<th>본번</th>
												<th>부번</th>
												<th>공</th>
												<th>실</th>
												<th>면적</th>
												<th>단가</th> <th>의견</th>
												
											</tr>
										</thead>
										<tbody id="ownerLandItemList2">
	
										</tbody>
									</table>
	
									<table class="item_result_wr__table">
										<caption>지장물</caption>
										<thead>
											<tr>
												  
												<th>연번</th>
												<th>소유자</th>
												<th>지분</th>
												<th>소재지</th>
												<th>본번</th>
												<th>부번</th>
												<th>부번2</th>
												<th>물건종류</th>
												<th>물건구조</th>
												<th>면적/수량</th>
												<th>단가</th> <th>의견</th>
												
											</tr>
										</thead>
										<tbody id="ownerGoodsItemList2">
										</tbody>
									</table>
								</div>
							</div>
							<%-- 항목 결과 끝 02 --%>
							
							<%-- 항목 결과 시작 03 --%>
							<div class="item_result_wr">
								<h5 class="item_result_wr__tit">3. 허가건축물 등 불법형질변경</h5>
								<div class="item_result_wr__con">
									<table class="item_result_wr__table">
										<caption>필지</caption>
										<thead>
											<tr>
												  
												<th>연번</th>
												<th>소유자</th>
												<th>지분</th>
												<th>소재지</th>
												<th>지번</th>
												<th>본번</th>
												<th>부번</th>
												<th>공</th>
												<th>실</th>
												<th>면적</th>
												<th>단가</th> <th>의견</th>
												
											</tr>
										</thead>
										<tbody id="ownerLandItemList3">
	
										</tbody>
									</table>
	
									<table class="item_result_wr__table">
										<caption>지장물</caption>
										<thead>
											<tr>
												  
												<th>연번</th>
												<th>소유자</th>
												<th>지분</th>
												<th>소재지</th>
												<th>본번</th>
												<th>부번</th>
												<th>부번2</th>
												<th>물건종류</th>
												<th>물건구조</th>
												<th>면적/수량</th>
												<th>단가</th> <th>의견</th>
												
											</tr>
										</thead>
										<tbody id="ownerGoodsItemList3">
										</tbody>
									</table>
								</div>
							</div>
							<%-- 항목 결과 끝 03 --%>
							
							<%-- 항목 결과 시작 04 --%>
							<div class="item_result_wr">
								<h5 class="item_result_wr__tit">4. 일단지 보상</h5>
								<div class="item_result_wr__con">
									<table class="item_result_wr__table">
										<caption>필지</caption>
										<thead>
											<tr>
												  
												<th>연번</th>
												<th>소유자</th>
												<th>지분</th>
												<th>소재지</th>
												<th>지번</th>
												<th>본번</th>
												<th>부번</th>
												<th>공</th>
												<th>실</th>
												<th>면적</th>
												<th>단가</th> <th>의견</th>
												
											</tr>
										</thead>
										<tbody id="ownerLandItemList4">
	
										</tbody>
									</table>
	
									<table class="item_result_wr__table">
										<caption>지장물</caption>
										<thead>
											<tr>
												  
												<th>연번</th>
												<th>소유자</th>
												<th>지분</th>
												<th>소재지</th>
												<th>본번</th>
												<th>부번</th>
												<th>부번2</th>
												<th>물건종류</th>
												<th>물건구조</th>
												<th>면적/수량</th>
												<th>단가</th> <th>의견</th>
												
											</tr>
										</thead>
										<tbody id="ownerGoodsItemList4">
										</tbody>
									</table>
								</div>
							</div>
							<%-- 항목 결과 끝 04 --%>
							
							<%-- 항목 결과 시작 05 --%>
							<div class="item_result_wr">
								<h5 class="item_result_wr__tit">5. 미지금 용지</h5>
								<div class="item_result_wr__con">
									<table class="item_result_wr__table">
										<caption>필지</caption>
										<thead>
											<tr>
												  
												<th>연번</th>
												<th>소유자</th>
												<th>지분</th>
												<th>소재지</th>
												<th>지번</th>
												<th>본번</th>
												<th>부번</th>
												<th>공</th>
												<th>실</th>
												<th>면적</th>
												<th>단가</th> <th>의견</th>
												
											</tr>
										</thead>
										<tbody id="ownerLandItemList5">
	
										</tbody>
									</table>
	
									<table class="item_result_wr__table" id="ownerGoodsItemListTable5">
										<caption>지장물</caption>
										<thead>
											<tr>
												  
												<th>연번</th>
												<th>소유자</th>
												<th>지분</th>
												<th>소재지</th>
												<th>본번</th>
												<th>부번</th>
												<th>부번2</th>
												<th>물건종류</th>
												<th>물건구조</th>
												<th>면적/수량</th>
												<th>단가</th> <th>의견</th>
												
											</tr>
										</thead>
										<tbody id="ownerGoodsItemList5">
										</tbody>
									</table>
								</div>
							</div>
							<%-- 항목 결과 끝 05 --%>
							
							<%-- 항목 결과 시작 06 --%>
							<div class="item_result_wr">
								<h5 class="item_result_wr__tit">6. 사도평가</h5>
								<div class="item_result_wr__con">
									<table class="item_result_wr__table">
										<caption>필지</caption>
										<thead>
											<tr>
												  
												<th>연번</th>
												<th>소유자</th>
												<th>지분</th>
												<th>소재지</th>
												<th>지번</th>
												<th>본번</th>
												<th>부번</th>
												<th>공</th>
												<th>실</th>
												<th>면적</th>
												<th>단가</th> <th>의견</th>
												
											</tr>
										</thead>
										<tbody id="ownerLandItemList6">
	
										</tbody>
									</table>
	
									<table class="item_result_wr__table">
										<caption>지장물</caption>
										<thead>
											<tr>
												  
												<th>연번</th>
												<th>소유자</th>
												<th>지분</th>
												<th>소재지</th>
												<th>본번</th>
												<th>부번</th>
												<th>부번2</th>
												<th>물건종류</th>
												<th>물건구조</th>
												<th>면적/수량</th>
												<th>단가</th> <th>의견</th>
												
											</tr>
										</thead>
										<tbody id="ownerGoodsItemList6">
										</tbody>
									</table>
								</div>
							</div>
							<%-- 항목 결과 끝 06 --%>
							
							<%-- 항목 결과 시작 07 --%>
							<div class="item_result_wr">
								<h5 class="item_result_wr__tit">7. 잔여지 매수청구</h5>
								<div class="item_result_wr__con">
									<table class="item_result_wr__table">
										<caption>필지</caption>
										<thead>
											<tr>
												  
												<th>연번</th>
												<th>소유자</th>
												<th>지분</th>
												<th>소재지</th>
												<th>지번</th>
												<th>본번</th>
												<th>부번</th>
												<th>공</th>
												<th>실</th>
												<th>면적</th>
												<th>단가</th> <th>의견</th>
												
											</tr>
										</thead>
										<tbody id="ownerLandItemList7">
	
										</tbody>
									</table>
	
									<table class="item_result_wr__table">
										<caption>지장물</caption>
										<thead>
											<tr>
												  
												<th>연번</th>
												<th>소유자</th>
												<th>지분</th>
												<th>소재지</th>
												<th>본번</th>
												<th>부번</th>
												<th>부번2</th>
												<th>물건종류</th>
												<th>물건구조</th>
												<th>면적/수량</th>
												<th>단가</th> <th>의견</th>
												
											</tr>
										</thead>
										<tbody id="ownerGoodsItemList7">
										</tbody>
									</table>
								</div>
							</div>
							<%-- 항목 결과 끝 07 --%>
							
							<%-- 항목 결과 시작 08 --%>
							<div class="item_result_wr">
								<h5 class="item_result_wr__tit">8. 잔여지 가치하락</h5>
								<div class="item_result_wr__con">
									<table class="item_result_wr__table">
										<caption>필지</caption>
										<thead>
											<tr>
												  
												<th>연번</th>
												<th>소유자</th>
												<th>지분</th>
												<th>소재지</th>
												<th>지번</th>
												<th>본번</th>
												<th>부번</th>
												<th>공</th>
												<th>실</th>
												<th>면적</th>
												<th>단가</th> <th>의견</th>
												
											</tr>
										</thead>
										<tbody id="ownerLandItemList8">
	
										</tbody>
									</table>
	
									<table class="item_result_wr__table">
										<caption>지장물</caption>
										<thead>
											<tr>
												  
												<th>연번</th>
												<th>소유자</th>
												<th>지분</th>
												<th>소재지</th>
												<th>본번</th>
												<th>부번</th>
												<th>부번2</th>
												<th>물건종류</th>
												<th>물건구조</th>
												<th>면적/수량</th>
												<th>단가</th> <th>의견</th>
												
											</tr>
										</thead>
										<tbody id="ownerGoodsItemList8">
										</tbody>
									</table>
								</div>
							</div>
							<%-- 항목 결과 끝 08 --%>
							
							<%-- 항목 결과 시작 09 --%>
							<div class="item_result_wr">
								<h5 class="item_result_wr__tit">9. 잔여건물 가치감소</h5>
								<div class="item_result_wr__con">
									<table class="item_result_wr__table">
										<caption>필지</caption>
										<thead>
											<tr>
												  
												<th>연번</th>
												<th>소유자</th>
												<th>지분</th>
												<th>소재지</th>
												<th>지번</th>
												<th>본번</th>
												<th>부번</th>
												<th>공</th>
												<th>실</th>
												<th>면적</th>
												<th>단가</th> <th>의견</th>
												
											</tr>
										</thead>
										<tbody id="ownerLandItemList9">
	
										</tbody>
									</table>
	
									<table class="item_result_wr__table">
										<caption>지장물</caption>
										<thead>
											<tr>
												  
												<th>연번</th>
												<th>소유자</th>
												<th>지분</th>
												<th>소재지</th>
												<th>본번</th>
												<th>부번</th>
												<th>부번2</th>
												<th>물건종류</th>
												<th>물건구조</th>
												<th>면적/수량</th>
												<th>단가</th> <th>의견</th>
												
											</tr>
										</thead>
										<tbody id="ownerGoodsItemList9">
										</tbody>
									</table>
								</div>
							</div>
							<%-- 항목 결과 끝 09 --%>
							
							<%-- 항목 결과 시작 10 --%>
							<div class="item_result_wr">
								<h5 class="item_result_wr__tit">10. 잔여건물 매수청구</h5>
								<div class="item_result_wr__con">
									<table class="item_result_wr__table">
										<caption>필지</caption>
										<thead>
											<tr>
												  
												<th>연번</th>
												<th>소유자</th>
												<th>지분</th>
												<th>소재지</th>
												<th>지번</th>
												<th>본번</th>
												<th>부번</th>
												<th>공</th>
												<th>실</th>
												<th>면적</th>
												<th>단가</th> <th>의견</th>
												
											</tr>
										</thead>
										<tbody id="ownerLandItemList10">
	
										</tbody>
									</table>
	
									<table class="item_result_wr__table">
										<caption>지장물</caption>
										<thead>
											<tr>
												  
												<th>연번</th>
												<th>소유자</th>
												<th>지분</th>
												<th>소재지</th>
												<th>본번</th>
												<th>부번</th>
												<th>부번2</th>
												<th>물건종류</th>
												<th>물건구조</th>
												<th>면적/수량</th>
												<th>단가</th> <th>의견</th>
												
											</tr>
										</thead>
										<tbody id="ownerGoodsItemList10">
										</tbody>
									</table>
								</div>
							</div>
							<%-- 항목 결과 끝 10 --%>
							
							<%-- 항목 결과 시작 11 --%>
							<div class="item_result_wr">
								<h5 class="item_result_wr__tit">11. 누락 물건 반영</h5>
								<div class="item_result_wr__con">
									<table class="item_result_wr__table">
										<caption>필지</caption>
										<thead>
											<tr>
												  
												<th>연번</th>
												<th>소유자</th>
												<th>지분</th>
												<th>소재지</th>
												<th>지번</th>
												<th>본번</th>
												<th>부번</th>
												<th>공</th>
												<th>실</th>
												<th>면적</th>
												<th>단가</th> <th>의견</th>
												
											</tr>
										</thead>
										<tbody id="ownerLandItemList11">
	
										</tbody>
									</table>
	
									<table class="item_result_wr__table">
										<caption>지장물</caption>
										<thead>
											<tr>
												  
												<th>연번</th>
												<th>소유자</th>
												<th>지분</th>
												<th>소재지</th>
												<th>본번</th>
												<th>부번</th>
												<th>부번2</th>
												<th>물건종류</th>
												<th>물건구조</th>
												<th>면적/수량</th>
												<th>단가</th> <th>의견</th>
												
											</tr>
										</thead>
										<tbody id="ownerGoodsItemList11">
										</tbody>
									</table>
								</div>
							</div>
							<%-- 항목 결과 끝 11 --%>
							
							<%-- 항목 결과 시작 12 --%>
							<div class="item_result_wr">
								<h5 class="item_result_wr__tit">12. 휴업보상(이전비)평가</h5>
								<div class="item_result_wr__con">
									<table class="item_result_wr__table">
										<caption>필지</caption>
										<thead>
											<tr>
												  
												<th>연번</th>
												<th>소유자</th>
												<th>지분</th>
												<th>소재지</th>
												<th>지번</th>
												<th>본번</th>
												<th>부번</th>
												<th>공</th>
												<th>실</th>
												<th>면적</th>
												<th>단가</th> <th>의견</th>
												
											</tr>
										</thead>
										<tbody id="ownerLandItemList12">
	
										</tbody>
									</table>
	
									<table class="item_result_wr__table">
										<caption>지장물</caption>
										<thead>
											<tr>
												  
												<th>연번</th>
												<th>소유자</th>
												<th>지분</th>
												<th>소재지</th>
												<th>본번</th>
												<th>부번</th>
												<th>부번2</th>
												<th>물건종류</th>
												<th>물건구조</th>
												<th>면적/수량</th>
												<th>단가</th> <th>의견</th>
												
											</tr>
										</thead>
										<tbody id="ownerGoodsItemList12">
										</tbody>
									</table>
								</div>
							</div>
							<%-- 항목 결과 끝 12 --%>
							
							<%-- 항목 결과 시작 13 --%>
							<div class="item_result_wr">
								<h5 class="item_result_wr__tit">13. 폐업보상</h5>
								<div class="item_result_wr__con">
									<table class="item_result_wr__table">
										<caption>필지</caption>
										<thead>
											<tr>
												  
												<th>연번</th>
												<th>소유자</th>
												<th>지분</th>
												<th>소재지</th>
												<th>지번</th>
												<th>본번</th>
												<th>부번</th>
												<th>공</th>
												<th>실</th>
												<th>면적</th>
												<th>단가</th> <th>의견</th>
												
											</tr>
										</thead>
										<tbody id="ownerLandItemList13">
	
										</tbody>
									</table>
	
									<table class="item_result_wr__table">
										<caption>지장물</caption>
										<thead>
											<tr>
												  
												<th>연번</th>
												<th>소유자</th>
												<th>지분</th>
												<th>소재지</th>
												<th>본번</th>
												<th>부번</th>
												<th>부번2</th>
												<th>물건종류</th>
												<th>물건구조</th>
												<th>면적/수량</th>
												<th>단가</th> <th>의견</th>
												
											</tr>
										</thead>
										<tbody id="ownerGoodsItemList13">
										</tbody>
									</table>
								</div>
							</div>
							<%-- 항목 결과 끝 13 --%>
							
							<%-- 항목 결과 시작 14 --%>
							<div class="item_result_wr">
								<h5 class="item_result_wr__tit">14. 영농손실보상</h5>
								<div class="item_result_wr__con">
									<table class="item_result_wr__table">
										<caption>필지</caption>
										<thead>
											<tr>
												  
												<th>연번</th>
												<th>소유자</th>
												<th>지분</th>
												<th>소재지</th>
												<th>지번</th>
												<th>본번</th>
												<th>부번</th>
												<th>공</th>
												<th>실</th>
												<th>면적</th>
												<th>단가</th> <th>의견</th>
												
											</tr>
										</thead>
										<tbody id="ownerLandItemList14">
	
										</tbody>
									</table>
	
									<table class="item_result_wr__table">
										<caption>지장물</caption>
										<thead>
											<tr>
												  
												<th>연번</th>
												<th>소유자</th>
												<th>지분</th>
												<th>소재지</th>
												<th>본번</th>
												<th>부번</th>
												<th>부번2</th>
												<th>물건종류</th>
												<th>물건구조</th>
												<th>면적/수량</th>
												<th>단가</th> <th>의견</th>
												
											</tr>
										</thead>
										<tbody id="ownerGoodsItemList14">
										</tbody>
									</table>
								</div>
							</div>
							<%-- 항목 결과 끝 14 --%>
							
							<%-- 항목 결과 시작 15 --%>
							<div class="item_result_wr">
								<h5 class="item_result_wr__tit">15. 휴직(실직)보상</h5>
								<div class="item_result_wr__con">
									<table class="item_result_wr__table">
										<caption>필지</caption>
										<thead>
											<tr>
												  
												<th>연번</th>
												<th>소유자</th>
												<th>지분</th>
												<th>소재지</th>
												<th>지번</th>
												<th>본번</th>
												<th>부번</th>
												<th>공</th>
												<th>실</th>
												<th>면적</th>
												<th>단가</th> <th>의견</th>
												
											</tr>
										</thead>
										<tbody id="ownerLandItemList15">
	
										</tbody>
									</table>
	
									<table class="item_result_wr__table">
										<caption>지장물</caption>
										<thead>
											<tr>
												  
												<th>연번</th>
												<th>소유자</th>
												<th>지분</th>
												<th>소재지</th>
												<th>본번</th>
												<th>부번</th>
												<th>부번2</th>
												<th>물건종류</th>
												<th>물건구조</th>
												<th>면적/수량</th>
												<th>단가</th> <th>의견</th>
												
											</tr>
										</thead>
										<tbody id="ownerGoodsItemList15">
										</tbody>
									</table>
								</div>
							</div>
							<%-- 항목 결과 끝 15 --%>
							
							<%-- 항목 결과 시작 16 --%>
							<div class="item_result_wr" >
								<h5 class="item_result_wr__tit">16. 사업폐지(취소,변경,중단)</h5>
								<div class="item_result_wr__con">
									<table class="item_result_wr__table">
										<caption>필지</caption>
										<thead>
											<tr>
												<th>연번</th>
												<th>소유자</th>
												<th>지분</th>
												<th>소재지</th>
												<th>지번</th>
												<th>본번</th>
												<th>부번</th>
												<th>공</th>
												<th>실</th>
												<th>면적</th>
												<th>단가</th> <th>의견</th>
												
											</tr>
										</thead>
										<tbody id="ownerLandItemList16">
						
	
										</tbody>
									</table>
	
									<table class="item_result_wr__table">
										<caption>지장물</caption>
										<thead>
											<tr>
												  
												<th>연번</th>
												<th>소유자</th>
												<th>지분</th>
												<th>소재지</th>
												<th>본번</th>
												<th>부번</th>
												<th>부번2</th>
												<th>물건종류</th>
												<th>물건구조</th>
												<th>면적/수량</th>
												<th>단가</th> <th>의견</th>
												 
												
											</tr>
										</thead>
										<tbody id="ownerGoodsItemList16">
										</tbody>
									</table>
								</div>
							</div>
							<%-- 항목 결과 끝 16 --%>
							
							<%-- 항목 결과 시작 17 --%>
							<div class="item_result_wr">
								<h5 class="item_result_wr__tit">17. 이주대책 수립</h5>
								<div class="item_result_wr__con">
									<table class="item_result_wr__table">
										<caption>필지</caption>
										<thead>
											<tr>
												  
												<th>연번</th>
												<th>소유자</th>
												<th>지분</th>
												<th>소재지</th>
												<th>지번</th>
												<th>본번</th>
												<th>부번</th>
												<th>공</th>
												<th>실</th>
												<th>면적</th>
												<th>단가</th> <th>의견</th>
												 
						
											</tr>
										</thead>
										<tbody id="ownerLandItemList17">
	
										</tbody>
									</table>
	
									<table class="item_result_wr__table">
										<caption>지장물</caption>
										<thead>
											<tr>
												  
												<th>연번</th>
												<th>소유자</th>
												<th>지분</th>
												<th>소재지</th>
												<th>본번</th>
												<th>부번</th>
												<th>부번2</th>
												<th>물건종류</th>
												<th>물건구조</th>
												<th>면적/수량</th>
												<th>단가</th> <th>의견</th>
												
											</tr>
										</thead>
										<tbody id="ownerGoodsItemList17">
										</tbody>
									</table>
								</div>
							</div>
							<%-- 항목 결과 끝 17 --%>
							
							<%-- 항목 결과 시작 18 --%>
							<div class="item_result_wr">
								<h5 class="item_result_wr__tit">18. 이주정착금, 주거이전비, 이사비</h5>
								<div class="item_result_wr__con">
									<table class="item_result_wr__table">
										<caption>필지</caption>
										<thead>
											<tr>
												  
												<th>연번</th>
												<th>소유자</th>
												<th>지분</th>
												<th>소재지</th>
												<th>지번</th>
												<th>본번</th>
												<th>부번</th>
												<th>공</th>
												<th>실</th>
												<th>면적</th>
												<th>단가</th> <th>의견</th>
												
											</tr>
										</thead>
										<tbody id="ownerLandItemList18">
	
										</tbody>
									</table>
	
									<table class="item_result_wr__table">
										<caption>지장물</caption>
										<thead>
											<tr>
												  
												<th>연번</th>
												<th>소유자</th>
												<th>지분</th>
												<th>소재지</th>
												<th>본번</th>
												<th>부번</th>
												<th>부번2</th>
												<th>물건종류</th>
												<th>물건구조</th>
												<th>면적/수량</th>
												<th>단가</th> <th>의견</th>
									
											</tr>
										</thead>
										<tbody id="ownerGoodsItemList18">
										</tbody>
									</table>
								</div>
							</div>
							<%-- 항목 결과 끝 18 --%>
							
							<%-- 항목 결과 시작 19 --%>
							<div class="item_result_wr">
								<h5 class="item_result_wr__tit">19. 임료손실</h5>
								<div class="item_result_wr__con">
									<table class="item_result_wr__table">
										<caption>필지</caption>
										<thead>
											<tr>
												  
												<th>연번</th>
												<th>소유자</th>
												<th>지분</th>
												<th>소재지</th>
												<th>지번</th>
												<th>본번</th>
												<th>부번</th>
												<th>공</th>
												<th>실</th>
												<th>면적</th>
												<th>단가</th> <th>의견</th>
												
											</tr>
										</thead>
										<tbody id="ownerLandItemList19">
	
										</tbody>
									</table>
	
									<table class="item_result_wr__table">
										<caption>지장물</caption>
										<thead>
											<tr>
												  
												<th>연번</th>
												<th>소유자</th>
												<th>지분</th>
												<th>소재지</th>
												<th>본번</th>
												<th>부번</th>
												<th>부번2</th>
												<th>물건종류</th>
												<th>물건구조</th>
												<th>면적/수량</th>
												<th>단가</th> <th>의견</th>
												
											</tr>
										</thead>
										<tbody id="ownerGoodsItemList19">
										</tbody>
									</table>
								</div>
							</div>
							<%-- 항목 결과 끝 19 --%>
							
							<%-- 항목 결과 시작 20 --%>
							<div class="item_result_wr">
								<h5 class="item_result_wr__tit">20. 대토보상</h5>
								<div class="item_result_wr__con">
									<table class="item_result_wr__table">
										<caption>필지</caption>
										<thead>
											<tr>
												  
												<th>연번</th>
												<th>소유자</th>
												<th>지분</th>
												<th>소재지</th>
												<th>지번</th>
												<th>본번</th>
												<th>부번</th>
												<th>공</th>
												<th>실</th>
												<th>면적</th>
												<th>단가</th> <th>의견</th>
								
											</tr>
										</thead>
										<tbody id="ownerLandItemList20">
	
										</tbody>
									</table>
	
									<table class="item_result_wr__table">
										<caption>지장물</caption>
										<thead>
											<tr>
												  
												<th>연번</th>
												<th>소유자</th>
												<th>지분</th>
												<th>소재지</th>
												<th>본번</th>
												<th>부번</th>
												<th>부번2</th>
												<th>물건종류</th>
												<th>물건구조</th>
												<th>면적/수량</th>
												<th>단가</th> <th>의견</th>
												
											</tr>
										</thead>
										<tbody id="ownerGoodsItemList20">
										</tbody>
									</table>
								</div>
							</div>
							<%-- 항목 결과 끝 20 --%>
							
							<%-- 항목 결과 시작 21 --%>
							<div class="item_result_wr">
								<h5 class="item_result_wr__tit">21. 구분지상권</h5>
								<div class="item_result_wr__con">
									<table class="item_result_wr__table">
										<caption>필지</caption>
										<thead>
											<tr>
												  
												<th>연번</th>
												<th>소유자</th>
												<th>지분</th>
												<th>소재지</th>
												<th>지번</th>
												<th>본번</th>
												<th>부번</th>
												<th>공</th>
												<th>실</th>
												<th>면적</th>
												<th>단가</th> <th>의견</th>
												
											</tr>
										</thead>
										<tbody id="ownerLandItemList21">
	
										</tbody>
									</table>
	
									<table class="item_result_wr__table">
										<caption>지장물</caption>
										<thead>
											<tr>
												  
												<th>연번</th>
												<th>소유자</th>
												<th>지분</th>
												<th>소재지</th>
												<th>본번</th>
												<th>부번</th>
												<th>부번2</th>
												<th>물건종류</th>
												<th>물건구조</th>
												<th>면적/수량</th>
												<th>단가</th> <th>의견</th>
												
											</tr>
										</thead>
										<tbody id="ownerGoodsItemList21">
										</tbody>
									</table>
								</div>
							</div>
							<%-- 항목 결과 끝 21 --%>
							
							<%-- 항목 결과 시작 22 --%>
							<div class="item_result_wr">
								<h5 class="item_result_wr__tit">22. 10%이상 변동</h5>
								<div class="item_result_wr__con">
									<table class="item_result_wr__table">
										<caption>필지</caption>
										<thead>
											<tr>
												  
												<th>연번</th>
												<th>소유자</th>
												<th>지분</th>
												<th>소재지</th>
												<th>지번</th>
												<th>본번</th>
												<th>부번</th>
												<th>공</th>
												<th>실</th>
												<th>면적</th>
												<th>단가</th> <th>의견</th>
												
											</tr>
										</thead>
										<tbody id="ownerLandItemList22">
	
										</tbody>
									</table>
	
									<table class="item_result_wr__table">
										<caption>지장물</caption>
										<thead>
											<tr>
												  
												<th>연번</th>
												<th>소유자</th>
												<th>지분</th>
												<th>소재지</th>
												<th>본번</th>
												<th>부번</th>
												<th>부번2</th>
												<th>물건종류</th>
												<th>물건구조</th>
												<th>면적/수량</th>
												<th>단가</th> <th>의견</th>
												
											</tr>
										</thead>
										<tbody id="ownerGoodsItemList22">
										</tbody>
									</table>
								</div>
							</div>
							<%-- 항목 결과 끝 22 --%>
							
							<%-- 항목 결과 시작 23 --%>
							<div class="item_result_wr">
								<h5 class="item_result_wr__tit">23. 기타(그 외)</h5>
								<div class="item_result_wr__con">
									<table class="item_result_wr__table">
										<caption>필지</caption>
										<thead>
											<tr>
												  
												<th>연번</th>
												<th>소유자</th>
												<th>지분</th>
												<th>소재지</th>
												<th>지번</th>
												<th>본번</th>
												<th>부번</th>
												<th>공</th>
												<th>실</th>
												<th>면적</th>
												<th>단가</th> <th>의견</th>
												
											</tr>
										</thead>
										<tbody id="ownerLandItemList23">
	
										</tbody>
									</table>
	
									<table class="item_result_wr__table">
										<caption>지장물</caption>
										<thead>
											<tr>
												  
												<th>연번</th>
												<th>소유자</th>
												<th>지분</th>
												<th>소재지</th>
												<th>본번</th>
												<th>부번</th>
												<th>부번2</th>
												<th>물건종류</th>
												<th>물건구조</th>
												<th>면적/수량</th>
												<th>단가</th> <th>의견</th>
												
											</tr>
										</thead>
										<tbody id="ownerGoodsItemList23">
										</tbody>
									</table>
								</div>
							</div>
							<%-- 항목 결과 끝 23 --%>
							
							<%-- 항목 결과 시작 24 --%>
							<div class="item_result_wr">
								<h5 class="item_result_wr__tit">24. 소유자 의견 없음</h5>
								<div class="item_result_wr__con">
									<table class="item_result_wr__table">
										<caption>필지</caption>
										<thead>
											<tr>
												  
												<th>연번</th>
												<th>소유자</th>
												<th>지분</th>
												<th>소재지</th>
												<th>지번</th>
												<th>본번</th>
												<th>부번</th>
												<th>공</th>
												<th>실</th>
												<th>면적</th>
												<th>단가</th> <th>의견</th>
												
											</tr>
										</thead>
										<tbody id="ownerLandItemList24">
	
										</tbody>
									</table>
	
									<table class="item_result_wr__table">
										<caption>지장물</caption>
										<thead>
											<tr>
												  
												<th>연번</th>
												<th>소유자</th>
												<th>지분</th>
												<th>소재지</th>
												<th>본번</th>
												<th>부번</th>
												<th>부번2</th>
												<th>물건종류</th>
												<th>물건구조</th>
												<th>면적/수량</th>
												<th>단가</th> <th>의견</th>
												
										
											</tr>
										</thead>
										<tbody id="ownerGoodsItemList24">
										</tbody>
									</table>
								</div>
							</div>
					

							<div class="mt40 btn_wrap">
								<ul class="btns">



									<li><a href="#" class="btn t1 h50 big"
										onclick="goToImplementerOpinionList();return false;">확인</a>
									</li>
								</ul>

							</div>

							<!-- 체크 팝업 S -->
							<%@ include file="../../implementer/popup/checkbox.jsp"%>
							<!-- 체크 팝업  E -->
							
							<!-- 체크2 팝업 S -->
							<%@ include file="../../implementer/popup/checkbox2.jsp"%>
							<!-- 체크2 팝업  E -->

							<!-- 팝업, 지장물수 검색 S -->
							<%@ include file="../../implementer/popup/goods.jsp"%>
							<!-- 팝업, 지장물수 검색 E -->

							<!-- 팝업, 필지 검색 S -->
							<%@ include file="../../implementer/popup/land.jsp"%>
							<!-- 팝업, 필지 검색 E -->

							<!-- 팝업, 지장물 소유자 검색 S -->
							<%@ include file="../../implementer/popup/goodsowner.jsp"%>
							<!-- 팝업, 지장물 소유자 검색 E -->
							
							<!-- 팝업, 지장물 소유자 체크 S -->
							<%@ include file="../../implementer/popup/goodsownercheck.jsp"%>
							<!-- 팝업, 지장물 소유자 체크 E -->
							
							<!-- 팝업, 필지 소유자 검색 S -->
							<%@ include file="../../implementer/popup/landsowner.jsp"%>
							<!-- 팝업, 필지 소유자 검색 E -->

							<!-- 팝업, 필지 소유자 체크 S -->
							<%@ include file="../../implementer/popup/landsownercheck.jsp"%>
							<!-- 팝업, 필지 소유자 체크 E -->

							<!-- 팝업, 평가사 정보 S -->

							<!-- 팝업, 평가사 정보 E -->

							<!-- 소유자의견 팝업 S -->
							<div id="popupOwnerOpinion" class="popup info_reg" >
								<div class="p_box">
									<div class="p_head">
										<h3 class="p_title">의견 보기</h3>
										<a href="#" class="p_close"
											onclick="closeOwnerOpinion();return false;"> <span
											class="blind">닫기</span></a>
									</div>

									<div class="p_body t2">
										<div class="wrap">
											<!-- 등록 폼 -->
											<div class="c_table t1">
												<div class="reg_wrap">
													<h2><span id="notice"></span></h2>
													<table class="table_editor">
														<tbody>
															<tr>
																<th class="info_reg_th">소유자 의견</th>
																<td><textarea id="ownerOpinion"
																		class="textarea resetPopupVal">${deliberateOpinionDTO.ownerOpinion}</textarea></td>
															</tr>

															<tr>
																<th class="info_reg_th">사업시행자<br />의견
																</th>
																<td><textarea id="executorOpinion"
																		class="textarea resetPopupVal">${deliberateOpinionDTO.executorOpinion}</textarea></td>
															</tr>

														</tbody>
													</table>


													<table id="popupOpinionItemList">
														<tbody id="popupOpinionItem1" class="popupOpinionItem">
															<tr>
																<th class="info_reg_th">설정</th>
																<td>
																	<div class="txt-r">
																	<span>
																	*한글파일다운로드 후 pdf로 변환 후 업로드 해 주시기 바랍니다
																	</span>
																		<button class="btn nohover">
																			<i class="download white icon"></i> PDF 다운로드
																		</button>
																		<button class="btn nohover">
																			<i class="download white icon"></i> 한글파일 다운로드
																		</button>
																		<button class="btn nohover t1"
																			onclick="addOpinionItem();return false;">
																			<i class="pluse icon"></i> 추가
																		</button>
																		<button class="btn nohover t1"
																			onclick="removeOpinionItem('1');return false;">
																			<i class="close icon"></i> 삭제
																		</button>
																	</div>
																</td>
															</tr>
															<tr>
																<th class="info_reg_th">소재지</th>
																<td><input type="text" class="input40 opinionTitle"></td>
															</tr>
															<tr>
																<th class="info_reg_th">이전비 평가 사유</th>
																<td><textarea class="textarea opinionContent"></textarea></td>
															</tr>
															<tr>
																<th class="info_reg_th">파일</th>
																<td class="file_flex"><input
																	class="input40 file_name">
																	<div class="file_btn_wrap">
																		<div style="display: flex">
																			<div class="input40 file_btn popupOpinionItemFile"
																				id="popupOpinionItemFile1" data-seq="0"
																				style="cursor: pointer"
																				onclick="triggerFileUpload('1');return false;">파일
																				없음</div>
																			<button class="btn nohover t4 small"
																				onclick="removeFileTarget('1');return false;">
																				<i class="close icon white"></i>파일삭제
																			</button>
																		</div>
																	</div></td>
															</tr>
														</tbody>
													</table>
												</div>
											</div>

										</div>
									</div>
									<div class="p_foot">
					<!-- 					<button class="btn h50 mr10"
											onclick="closeOwnerOpinion();return false;">확인</button> -->
										<a href="#" class="btn t1 h50"
											onclick="closeOwnerOpinion();return false;">확인</a>
									</div>
								</div>
							</div>

							<!-- 소유자의견 팝업 E -->

						</form>
					</div>
				</div>
			</div>
		</div>
		<hr />

		<!-- footer start -->
		<jsp:include page="/WEB-INF/jsp/components/footer.jsp" flush="false">
			<jsp:param name="login" value="login" />
		</jsp:include>
		<!-- footer end -->

	</div>




	<!-- join popup S -->
	<jsp:include page="/WEB-INF/jsp/components/join.jsp" flush="false">
		<jsp:param name="login" value="login" />
	</jsp:include>
	<!-- join popup E -->

	<!-- 팝업, 로그인 S -->
	<jsp:include page="/WEB-INF/jsp/components/login.jsp" flush="false">
		<jsp:param name="login" value="login" />
	</jsp:include>
	<!-- 팝업, 로그인 E -->



	<script src="../../lib/jquery.3.1.0.min.js"></script>
	<script src="../../lib/owl.carousel.min.js"></script>
	<script src="../../lib/jquery-ui.min.js"></script>
	<script src="../../lib/lib.js"></script>
	<script src="../../lib/form/jquery.form.js"></script>

	<!--common start-->
	<script src="../../js/common.js"></script>

	<script src="../../lib/ckeditor/ckeditor.js"></script>
	<script src="../../js/implementer/content.js"></script>

	<script src="../../js/implementer/opinion/content.js"></script>

	<script src="../../js/implementer/popup/block.js"></script>
	<script src="../../js/implementer/popup/content.js"></script>
	
	
	<script type="text/javascript">

	
	function getJosuList(masterId){
		console.log(masterId);

		let contextPath = $("#contextPath").val();
		let url = contextPath + "/api/implementer/landData";

		$.ajax({
			url: url,
			type: "GET",
			dataType: "json",
			data: {
				"masterId": masterId,
			},
			success: function(data) {

			    $("#josu1").empty();
			    $("#josu2").empty();
			    $("#josu3").empty();
			    $("#josu4").empty();
			    $("#josu5").empty();
			    $("#josu6").empty();
			      
	            let objectCount = String(data.objectCount);
	            let landCount = String(data.landCount);
	            let objectRightCount = String(data.objectRightCount);
	            let landRightCount = String(data.landRightCount);
	            let totalAreaAmot = String(data.totalAreaAmot);
	            let totalCost = String(data.totalCost);

	            let addList1 = new Array();
	            addList1.push("<a class=\"cx\" onclick=\"openPopup('goods', "+objectCount+")\">"+
						""+objectCount+"건" +" <i class=\"icon search\"></i> </a>");

	            let addList2 = new Array();
	            addList2.push("<a class=\"cx\" onclick=\"openPopup('land', "+landCount+")\">"+
						""+landCount+"건" +" <i class=\"icon search\"></i> </a>");

	            let addList3 = new Array();
	            addList3.push("<a class=\"cx\" onclick=\"openPopup('goodsowner', "+objectRightCount+")\">"+
						""+objectRightCount+"명" +" <i class=\"icon search\"></i> </a>");

	            let addList4 = new Array();
	            addList4.push("<a class=\"cx\" onclick=\"openPopup('landsowner', "+landRightCount+")\">"+
						""+landRightCount+"명" +" <i class=\"icon search\"></i> </a>");

	            let addList5 = new Array();
	            addList5.push("<p>" + totalAreaAmot+ "㎡</p>");
	            let addList6 = new Array();
	            addList6.push("<p>" + totalCost+ "원</p>");
	            /* 
	            let row1 = `<a href="#" class="cx"
	                onclick="openPopup('goods', '${objectCount}'); return false;">${objectCount}건<i
	                class="icon search"></i></a>
	            `;
	            let row2 = `<a href="#" class="cx"
	                onclick="openPopup('land', '${landCount}'); return false;">${landCount}건<i
	                class="icon search"></i></a>
	            `;
	            let row3 = `<a href="#" class="cx"
	                onclick="openPopup('goodsowner', '${objectRightCount}'); return false;">${objectRightCount}명<i
	                class="icon search"></i></a>
	            `;
	            let row4 = `<a href="#" class="cx"
	                onclick="openPopup('landsowner', '${landRightCount}'); return false;">${landRightCount}명<i
	                class="icon search"></i></a>
	            `;
	            let row5 = `<p>${totalAreaAmot}㎡</p>`;
	            let row6 = `<p>${totalCost}</p>`; */

	            $("#josu1").append(addList1.join(''));
	            $("#josu2").append(addList2.join(''));
	            $("#josu3").append(addList3.join(''));
	            $("#josu4").append(addList4.join(''));
	            $("#josu5").append(addList5.join(''));
	            $("#josu6").append(addList6.join(''));
	            /* $josu1.empty().append($(row1));
	            $josu2.empty().append($(row2));
	            $josu3.empty().append($(row3));
	            $josu4.empty().append($(row4));
	            $josu5.empty().append($(row5));
	            $josu6.empty().append($(row6)); */
			  },
			  error: function(xhr, status, error) {
			    // Handle errors
			    console.error(error);
			  }
		});
	}
	
        	let opinionItemList = new Array();
        
	        function triggerFileUpload(){
	        /* 	if(document.getElementById('description').value.includes('-')){
	        		alert('파일 설명란에 특수문자 -는 작성이 불가합니다.');
	        		return false;
	        	}
	        	
	        	if(document.getElementById('description').value =='' || document.getElementById('description').value == null){
	        		alert('파일 설명란을 작성해주세요');
	        		return false;
	        	}else{
	        	$('#fileSeq').trigger('click');
	        	} */
	        	
	        	$('#fileSeq').trigger('click');

	        	}
	        function triggerFileUploadPDF(){
				
	        	
	        	$('#fileSeq').trigger('click');
	        	
	        	}
	        

            function saveOpinion(){

        		let csrfToken = $("meta[name='_csrf']").attr("content");
        		let csrfHeader = $("meta[name='_csrf_header']").attr("content");
    	        
            	let contextPath = $('#contextPath').val();
            	let url = contextPath+"/api/implementer/opinion";
            	let msg="재결의견 작성을 완료하시겠습니까?";

            	//BASE START
            	let decisionId = $('#decisionId').val();
            	
            	let addOpinionItemCheck = addOpinionItemArray.length;         
            	
            	if(addOpinionItemCheck==0){
            		alert("항목을 선택해주세요");
            		return false;
            	}
            	
            	const data = {
        			"decisionId" : decisionId,
         			"addOpinionItemArray" : addOpinionItemArray,
        		}
            	
            	
            	console.log(data);
            	
            	if(confirm(msg)) {            		
            		$.ajax({
            			url : url,
            			type : "POST",
            			contentType : "application/json; charset=UTF-8",
            			data : JSON.stringify(data),
            			async: false, 
            			beforeSend : function(xhr){
            				xhr.setRequestHeader(csrfHeader, csrfToken);
            			},
            			success : function(data) {
            				alert("완료됐습니다.");
            				goToImplementerOpinionList();
            			},
            			error : function(xhr, status, error) {
            				//에러!
            				//alert("code:"+xhr.status);
            			}
            		});
            	}

            }
            
            $(document).ready(function () {
            	
            	$('#loaderSection').hide()
            	
            	checkType2();
            	
            	//여기서 지장물이나 필지의 데이터가 없을 경우 table만 따로 숨김 처리 로직 추가
            	checkResultWrTbody();
            	
           /* for(let a=1; a<25; a++){ 	
          if(  document.getElementById('goodsTable' + a).innerText == ''){
        	  document.getElementById('goodsTable'+a).style.display = "none";
          }
           } */
            	const owners = document.querySelectorAll(".owner");
                owners.forEach((owner) => {
                    owner.addEventListener("click", (e) => {
                        const tr =
                            e.target.parentElement.parentElement.parentElement;
                        const checkWrap = tr.nextElementSibling;
                        checkWrap.classList.toggle("on");
                    });
                });
                
              	$('#success').on('click', function(){
              		saveOpinion();
            	});
              	
              	$(".ownerItem").on('change', function() {
              		
              		let getItem =  $(this).val();
              		let getSeq = $(this).attr("data-seq");
             		let getType = $(this).attr("data-type");
             		let reptOwnrSeq = $(this).attr("reptOwnrSeq");
             		let ownrNm = $(this).attr("ownrNm");
             		console.log(ownrNm);
              		if(getItem!=""){
              			let getTitle = $("option:selected", this).text();         			
              		    addOpinion(getSeq,getItem,getType,getTitle,reptOwnrSeq,ownrNm);
              		}      
              	    
              	});
              	
              	
                
     /*          	$('.decision_form').on('submit', function(e){
              		e.preventDefault()
              		console.log('form')
              		//completeOpinion();
              		
              		saveOpinion();
            	}) */
            	
            	$(".opinion_check").on('click', function() {
            		
            		let getType =  $(this).attr("data-type");
              		let getTitle =  $(this).attr("data-title");
              		
              		let sub = new Object();
        			sub['getType'] = getType;
        			sub['getTitle'] = getTitle;
        			
              		if($(this).is(":checked") == true) {
              			opinionItemList.push(sub);
              		}else{
              			for(let i = 0; i < opinionItemList.length; i++) {
            				//삭제 아이디
            				if(opinionItemList[i].getType==getType){
            					opinionItemList.splice(i, 1);
            					break;
            				}
            			}
              		}
            			
              		console.log(opinionItemList);
            	  
            	});
            
            	 //파일 용량 체크
                let fileSize = 1024*1024*50;

                //파입 업로드
                $('#fileSeq').on("change", function(){

                	let csrfToken = $("meta[name='_csrf']").attr("content");
            		let csrfHeader = $("meta[name='_csrf_header']").attr("content");
					let decisionIdParam = document.getElementById("decisionId").value;
                	let contextPath = $("#contextPath").val();
                	let url = contextPath+"/uploadContentFile/opinion?decisionId="+decisionIdParam;
                	
                    let iSize = 0;
                    let total = $("#fileSeq")[0].files.length;

                    for(let i=0; i<total; i++) {
                        iSize += $("#fileSeq")[0].files[i].size;
                        let ext=fileCheck_doc2($("#fileSeq")[0].files[i].name); //common.js에서 확장자검사 함수를 통해 return type으로 유효성 검사
                        if(ext !=="ok") {
                            alert(ext+" 파일은 업로드 하실 수 없습니다.");
                            return false;
                        }
                        
                        fileCheck_ext
                    }

                    let fileName = $("#fileSeq")[0].files[0].name;
                    
                    let inputPosition = $('#fileSeq').attr('data-position');
                    let inputId = $('#fileSeq').attr('data-id');
                    
                    console.log(inputPosition);
                    console.log(inputId);


                	
                    let fullId = inputPosition+"-"+inputId;
                    
                    let notice = document.getElementById('notice').innerText;
					let seq = '';
					switch (notice) {
					  case "지연가산금":
					    seq = '1';
					    break;
					  case "보상금 증액":
						  seq = '2';
					    break;
					  case "허가건축물 등 불법형질변경":
						  seq = '3';
					    break;
					  case "일단지 보상":
						  seq = '4';
					    break;
					  case "미지금 용지":
						  seq = '5';
					    break;
					  case "사도평가":
						  seq = '6';
					    break;
					  case "잔여지 매수청구":
						  seq = '7';
					    break;
					  case "잔여지 가치하락":
						  seq = '8';
					    break;
					  case "잔여건물 가치감소":
						  seq = '9';
					    break;
					  case "잔여건물 매수청구":
						  seq = '10';
					    break;
					  case "누락 물건 반영":
						  seq = '11';
					    break;
					  case "휴업보상(이전비)평가":
						  seq = '12';
					    break;
					  case "폐업보상":
						  seq = '13';
					    break;
					  case "영농손실보상":
						  seq = '14';
					    break;
					  case "휴직(실직)보상":
						  seq = '15';
					    break;
					  case "사업폐지(취소, 변경, 중단)":
						  seq = '16';
					    break;
					  case "이주대책 수립":
						  seq = '17';
					    break;
					  case "이주정착금, 주거이전비, 이사비":
						  seq = '18';
					    break;
					  case "임료손실":
						  seq = '19';
					    break;
					  case "대토보상":
						  seq = '20';
					    break;
					  case "구분지상권":
						  seq = '21';
					    break;
					  case "10%이상 변동":
						  seq = '22';
					    break;
					  case "기타(그 외)":
						  seq = '23';
					    break;
					  case "소유자 의견 없음":
						  seq = '24';
					    break;
					  default:
						  seq='';
					   break;
					}
					
					let reptSeq = document.getElementById('reptSeq').value;
					let reptSeqOwner = document.getElementById('reptOwnerSeq').value;
					
					let description = document.getElementById('description').value;
					
					//java에 순서를 정해주는 내용을 추가할 필요가 있음 (rank) 가 지금 0으로 하드코딩 되어있음
					let rank = document.getElementById('fileCount').value;
					
					document.getElementById('fileSeq').name = 'fileInput'+seq+'-'+rank+'-'+description+'-'+reptSeq+'-'+reptSeqOwner;
					 
					console.log(document.getElementById('fileSeq'));

                    if(iSize > fileSize) {
                        alert("선택한 파일 총용량은 50MB를 초과할 수 없습니다.");
                        return false;
                    }

                    $("#fileForm").ajaxForm({
                        type: "post",
                        dataType: "json",
                        url: url,
                        beforeSend : function(xhr){
                        	xhr.setRequestHeader(csrfHeader, csrfToken);
                        	},
                        complete: function (xhr) {
                            //alert("완료");
                        },
                        success: function(data){
                        	console.log(data);
                        	console.log(document.getElementById('fileSeq').name);
                        	let seq = document.getElementById('fileSeq').name.substring(9,11);
                        	let newseq = parseInt(seq);
                        	let rank = Number(data.rank);
                        	rank = parseInt(rank);
                        	let fileNameOri = data.fileNameOri;
                        	                        			
							console.log(seq);
							console.log(fileNameOri);
							console.log(fileNameOri.slice(-3));
                    
                        	if(! fileNameOri.includes('pdf')){
                        		console.log('false pdf');
                        		//첨부파일 업로드 완료 후 지정되기 때문에 java에 던질 때 어떻게 던지냐가 중요함
                        		console.log("newseq :::>"+newseq);
                        		console.log("rank :::>"+rank);
								try{
                        		console.log(document.getElementById('popupOpinionItemFile'+newseq+'-'+rank));
                        		document.getElementById('popupOpinionItemFile'+newseq+'-'+rank).innerText = fileNameOri;
								}catch(error){
									rank = rank-1;
	                        		document.getElementById('popupOpinionItemFile'+newseq+'-'+rank).innerText = fileNameOri;

								}
                        	}else{
                        		console.log('true pdf');
							console.log(newseq);
                        	document.getElementById('popupOpinionItemFilePDF'+newseq).innerText = fileNameOri;	
                        	}
                     /*    	$("#fileInfo"+fullId).attr("data-seq",newseq);
                        	$("#fileText"+fullId).text(fileNameOri); */

                        },
                        error: function(e) {

                        }
                    });
                    //ajaxForm 이벤트 호출
                    $("#fileForm").submit();

                });
            });
        </script>
</body>
</html>
