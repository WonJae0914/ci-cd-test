let rowItem = 10;

//************************************************
//Decision Agenda list
// ************************************************

function getDeliberateList(cpage) {

	let contextPath = $("#contextPath").val();
	let url = contextPath+"/api/deliberate/list";

	$("#contentList").attr("data-cpage", cpage);
	$("#contentList").empty();
	$("#pageList").empty();

	$.ajax({
		url : url,
		type : "GET",
		dataType : "json",
		async: false,
		data : {
			"cpage" : cpage,
		},
		success : function(data) {

			let list = data.list;
			console.log(list);
			let totalPage = data.totalPage;
			let allCount = data.allCount;

			//전체 게시물 카운트
			let allCnt = "<mark class=\"cm\">"+allCount+"</mark>";
			$("#allCount").empty();
			$("#allCount").append(allCnt);
			
			let currentPage ="<mark class=\"cm\">"+cpage+"</mark>/"+totalPage;
			$("#currentPage").empty();
			$("#currentPage").append(currentPage);
			
			if (list.length == 0) {

				let addList = new Array();
				
				addList.push("<tr>");
                addList.push("  <td colspan=\"100%\">");
                addList.push("      신청조회가 없습니다.");
                addList.push(" </td>");
                addList.push("</tr>");

				$("#contentList").append(addList.join(''));

			}else{

				$("#contentList").attr("data-tpage", totalPage);

				let t = Number(totalPage);
				let c = Number(cpage);

				let startNumber = 0;

				if(t!=c){
					startNumber = allCount-((c-1)*rowItem);
				}else{
					startNumber = list.length;
				}

				for( let i = 0; i < list.length; i++) {
					makeDeliberateBlock(startNumber,list[i]);
					startNumber--;
				}

				makePageList();

			}

		},
		error : function(xhr, status, error) {

			//에러!
			//alert("code:"+xhr.status);
		}
	});


}


function makePageList(){

	let totalPage = $("#contentList").attr("data-tpage");
	let currentPage = $("#contentList").attr("data-cpage");

	let pageGroup = 0;
	let last = 0
	let first = 0
	let next = 0;
	let prev = 0;

	pageGroup = Math.ceil(currentPage / 10);

	last = pageGroup * 10;
	if (last > totalPage) last = totalPage;

	first = last - (10 - 1) <= 0 ? 1 : last - (10 - 1);
	next = last + 1;
	prev = first - 1;
	
	const fragmentPage = document.createDocumentFragment();

	if (prev > 0) {
		let allpreli = document.createElement('div');
		allpreli.classList.add('p_arrow');
		allpreli.classList.add('start');
		allpreli.insertAdjacentHTML("beforeend", `<a href='#' id='allprev'><i></i><span class='blind'>처음</span></a>`);
		fragmentPage.appendChild(allpreli);
		
		let preli = document.createElement('div');
		preli.classList.add('p_arrow');
		preli.classList.add('prev');
		preli.insertAdjacentHTML("beforeend", `<a href='#' id='prev'><i></i><span class='blind'>이전</span></a>`);
		fragmentPage.appendChild(preli);
	}

	for (let i = first; i <= last; i++) {
		const li = document.createElement("div");
		li.classList.add('p_btn');

		let classInfo = "";
		if(i<=5)classInfo="page-link--show";

		if(currentPage==i){
			li.insertAdjacentHTML("beforeend", `<a href='#' id='page-${i}' class='on'><strong>${i}</strong></a>`);
		}else{
			li.insertAdjacentHTML("beforeend", `<a href='#' id='page-${i}' >${i}</a>`);
		}

		fragmentPage.appendChild(li);
	}

	if (last < totalPage) {

		let endli = document.createElement('div');
		endli.classList.add('p_arrow');
		endli.classList.add('next');
		endli.insertAdjacentHTML("beforeend", `<a href='#' id='next'><span class='blind'>다음</span><i></i></a>`);
		fragmentPage.appendChild(endli);

		let allendli = document.createElement('div');
		allendli.classList.add('p_arrow');
		allendli.classList.add('end');
		allendli.insertAdjacentHTML("beforeend", `<a href='#' id='allnext' ><span class='blind'>끝</span><i></i></a>`);
		fragmentPage.appendChild(allendli);
		
	}

	document.getElementById('pageList').appendChild(fragmentPage);
	// 페이지 목록 생성

	$("#pageList a").click(function (e) {
		e.preventDefault();
		let $item = $(this);
		let $id = $item.attr("id");
		let selectedPage = $item.text();

		if ($id == "next")selectedPage=next;
		if ($id == "prev")selectedPage=prev;
		if ($id == "allprev")selectedPage=1;
		if ($id == "allnext")selectedPage=totalPage;

		getDeliberateList(selectedPage);
	});



}

function getAgendaDetail(viewSeq){
	
	let contextPath = $("#contextPath").val();
	let url = contextPath+"/api/deliberate/agenda/list";

	$("#agendaDetailList").empty();
	let getDetail = $("#agendaDetaiShow").attr("data-check");
	
	$.ajax({
		url : url,
		type : "GET",
		dataType : "json",
		async: false,
		data : {
			"viewSeq" : viewSeq,
		},
		success : function(data) {

			let list = data.list;
			
			let startNumber = 1;

			for( let i = 0; i < list.length; i++) {
				makeAgendaDetail(startNumber,list[i]);
				startNumber++;
			}	
			
			if(getDetail==1){
				$("#agendaDetaiShow").attr("data-check","0");
			    $("#agendaDetaiShow").hide();
			}else{
				$("#agendaDetaiShow").attr("data-check","1");
				$("#agendaDetaiShow").show();
			}

		},
		error : function(xhr, status, error) {

			//에러!
			//alert("code:"+xhr.status);
		}
	});
	
}
