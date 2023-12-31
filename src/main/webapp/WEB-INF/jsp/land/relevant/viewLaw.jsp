<%@	page contentType="text/html;charset=utf-8" language="java" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>

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
<meta name="twitter:image" content="../css/favicon_270x270.png" />
<link rel="shortcut icon" href="../css/favicon_seoul.ico" />
<link rel="icon" href="../css/favicon_seoul.ico" />

<link rel="apple-touch-icon" href="../css/favicon_seoul.ico" />
<link rel="stylesheet" href="../css/init.css" />
<link rel="stylesheet" href="../css/common.css" />
<link rel="stylesheet" href="../css/layout.css" />
<link rel="stylesheet" href="../css/sub.css" />
<link rel="stylesheet" href="../css/owl.carousel.min.css" />
<link rel="stylesheet" href="../css/jquery-ui.css" />

</head>
<body>

	<div id="wrap">
		<!-- header start -->
		<jsp:include page="/WEB-INF/jsp/components/header.jsp" flush="false">
			<jsp:param name="login" value="login" />
		</jsp:include>
		<!-- header end -->

		<div id="contents" class="c_sub">
			<div class="wrap">
				<div class="sub_title sub_title01">
					<h2 class="title bold center">관련 법령</h2>
				</div>

				<!-- land submenu start -->
				<jsp:include page="../includes/submenu.jsp" flush="false">
					<jsp:param name="currentPage" value="${currentPage}" />
				</jsp:include>
				<!-- land submenu end -->
				<div class="wrap">
				<div class="cs_wrap">
					<div class="cs_head">
						<h3 class="title bold cb">관련법령</h3>
					</div>
	            <div class="cs_body">
	                <form id="form" name="form">
	                    <div class="cs_title">
	                        <h4 class="fl title t1 bold cb s1 bullet">법령 상세보기</h4>
	                    </div>
	                    <div class="c_table t1">
	                        <table id="table00">
	                            <caption>관련법령 상세보기</caption>
	                            <thead>
	                            <tr>
	                                <th class="w200">법령</th>
	                                <th class="w120">담당부서</th>
	                                <th class="w80">조</th>
	                                <th class="w80">항</th>
	                                <th>내용</th>
	                            </tr>
	                            </thead>
	                            <tbody>
	                            <tr>
		                        	<td>
		                                <strong>법령</strong>
		                                <span><input type="text" class="input t1 middle" name="title" value="${law.title}"></span>
		                            </td>
		                            <td>
		                                <strong>담당부서</strong>
		                                <span><input type="text" class="input t1 middle" name="department" value="${law.department}"></span>
		                            </td>
		                            <td>
		                                <strong>조</strong>
		                                <span><input type="text" class="input t1 middle" name="article" value="${law.article}"></span>
		                            </td>
		                            <td>
		                                <strong>항</strong>
		                                <span><input type="text" class="input t1 middle" name="paragraph" value="${law.paragraph}"></span>
		                            </td>
		                            <td>
		                                <span><textarea type="text" class="textarea autosize t1 middle" name="content">${law.content}</textarea></span>
		                            </td>
	                            </tr>
	                            </tbody>
	                        </table>
	                    </div>
	                    <div class="btn_wrap">
	                        <ul>
		                        <li class="fl">
		                        	<a href="<c:url value='/land/relevantLaws.do'/>" class="btn ico t1 nohover list">목록</a>
		                        </li>
	                            <li class="fr">
		                        	<button type="button" class="btn t2" onclick="history.back()">
		                        		<i class="close icon white mr5"></i>
		                        		취소
		                        	</button>
		                        </li>
	                        </ul>
	                    </div>
	                </form>
	            </div>
	        </div>
	    </div>
		</div>

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

	<script src="../lib/jquery.min.js"></script>
	<script src="../lib/jquery.3.1.0.min.js"></script>
	<script src="../lib/owl.carousel.min.js"></script>
	<script src="../lib/jquery-ui.min.js"></script>
	<script src="../lib/lib.js"></script>

	<!--common start-->
	<script src="../js/common.js"></script>

	<script src="../js/admin/law.js"></script>

	<script>
	    $( document ).ready( function(){
	    	//getLawList(1);
	    });
	</script>

</body>
</html>
