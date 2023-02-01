<%@	page contentType="text/html;charset=utf-8" language="java" pageEncoding="utf-8"
	import="java.io.*"
%>

<div class="popup goodsowner" id="popupGoodsowner">
         <div class="p_box">
             <div class="p_head">
                 <h3 class="p_title">
                     	지장물 소유자 상세보기
                 </h3>
                 <a href="#" class="p_close" onclick="closePopup('goodsowner');return false;"><span class="blind" >닫기</span></a>
             </div>
             <div class="p_body">
                 <div class="wrap">
             <!--         <div class="cs_title">
                       <div class="cs_option">
                           <div
                               class="cso_btnwrap"
                           >
                               <a
                                   href="#"
                                   download=""
                                   class="btn t2 small ico download"
                                   >다운로드</a
                               >
                           </div>
                       </div>
                   </div> -->
				<button type="button" class="btn t4 ico download white fr mb15" onclick="downloadExcelGoodsOwners(); return false;">지장물 소유자 엑셀 다운로드</button>
                   <div class="c_table t1">
                       <table>
                           <caption>
                              	 지장물
                           </caption>
                           <thead>
                               <tr>
                                   <th>연번</th>
                                   <th>소유자</th>
                                   <th>지분</th>
                                   <th>소재지</th>
                                   <th>본번</th>
                                   <th>부번</th>
                                   <th>부번2</th>
                                   <th>
                                  	     물건종류
                                   </th>
                                   <th>
                                   	    물건구조
                                   </th>
                                   <th>
                                      	 면적/수량
                                   </th>
                                   <th>단가</th>
                               </tr>
                           </thead>
                           <tbody id="goodsownerList">
                               
                           </tbody>
                       </table>
                   </div>
               </div>
           </div>
       </div>
   </div>

