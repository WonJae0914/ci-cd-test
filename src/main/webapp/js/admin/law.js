let rowItem = 10;

// ----------------- 관련 법령 js --------------------

function getLawList(cpage) {

	let contextPath = $("#contextPath").val();
	let url = contextPath + "/api/law/lawList.do";

	$("#lawList").attr("data-cpage", cpage);
	$("#lawList").empty();
	$("#pageList").empty();
	$(".cs_title").empty();

	$.ajax({
		url: url,
		type: "GET",
		dataType: "json",
		async: false,
		data: {
			"cpage": cpage,
		},
		success: function(data) {
			let list = data.list;
			let allCount = data.allCount;
			let totalPage = data.totalPage;

			if (totalPage == "0") totalPage = 1;

			let addList = new Array();
			addList.push("<h4 class=\'fl title t1 bold cb s1 bullet'>검색결과 : " + allCount + "항목 (" +cpage+"/"+totalPage + ") 페이지</h4>");
			$(".cs_title").append(addList.join(''));

			if (list.length == 0){

				let addList2 = new Array();

                addList2.push("<div class=\"cbl_wrap\">");
                addList2.push("   등록된 법령이 없습니다.");
                addList2.push("</div>");

				$("#lawList").append(addList.join(''));				
			}
			else {
				$("#lawList").attr("data-tpage", totalPage);
	
				for(let i = 1; i<list.length+1; i++) {
					makeLawBlock(i, list[i - 1]);
				}	
				makeLawPageList();
			}
		},
		error: function(xhr, status, error) {
		
			//에러!
			//alert("code:"+xhr.status);
		
		}
	});
}

function addLaw() {
	let csrfToken = $("meta[name='_csrf']").attr("content");
    let csrfHeader = $("meta[name='_csrf_header']").attr("content");

	let contextPath = $("#contextPath").val();
	let url = contextPath + "/api/law/addLaw.do";

	const data = {
		"title"     : $("input[name=title]")[0].value,
		"department": $("input[name=department]")[0].value,
		"article"   : $("input[name=article]")[0].value,
		"paragraph" : $("input[name=paragraph]")[0].value,
		"content"   : $("textarea[name=content]")[0].value,
	}
	
	if (data.title == null || data.title == "") {
		alert("법령을 입력해주세요");
		$('#title').focus();
		return false;
	}

	if (data.department == null || data.department == "") {
		alert("담당부서를 입력해주세요");
		$('#department').focus();
		return false;
	}
	
	if (data.article == null || data.article == "") {
		alert("조를 입력해주세요");
		$('#article').focus();
		return false;
	}
	
	if (data.paragraph == null || data.paragraph == "") {
		alert("항를 입력해주세요");
		$('#paragraph').focus();
		return false;
	}
	
	if (data.content == null || data.content == "") {
		alert("내용을 입력해주세요");
		$('#content').focus();
		return false;
	}
	
	if (confirm("법령을 등록 하시겠습니까?")){
		$.ajax({
			url: url,
			type: "POST",
		    contentType : "application/json; charset=UTF-8",
			async: false,
			data : JSON.stringify(data),
	        beforeSend : function(xhr){
	        	xhr.setRequestHeader(csrfHeader, csrfToken);
	        },
			success: function(data) {
				alert("등록이 완료되었습니다.");
				var page = contextPath + "/admin/law.do"
				//location.href = history.back();
				location.href = page;
			},
			error: function(xhr, status, error) {
		
			}
		});
	}
}


function makeLawBlock(idx, info) {
	
	let contextPath = $("#contextPath").val();
	let addList = new Array();
	let seq_no = info.seq_no;

	addList.push("<tr>");
	
	addList.push("<th>");
	addList.push("<strong>" + idx+ "</strong>");
	addList.push("</th>");
	
	addList.push("<td>");
	addList.push("<strong>법령</strong><span>"+info.title+"</span>");
	addList.push("</td>");
	
	addList.push("<td>");
	addList.push("<strong>담당부서</strong><span>"+info.department+"</span>");
	addList.push("</td>");
	
	addList.push("<td>");
	addList.push("<strong>조</strong><span>"+info.article+"</span>");
	addList.push("</td>");
	
	addList.push("<td>");
	addList.push("<strong>항</strong><span>"+info.paragraph+"</span>");
	addList.push("</td>");
	
	addList.push("<td>");
	addList.push("<div class=\"cbl_subject\"><a href=\""+contextPath+"/law/view.do?viewSeq="+seq_no+"\">"+
				"<strong>내용</strong><span>"+info.content+"</span>" +"</a></div>");
	//addList.push("<strong>내용</strong><span>"+info.content+"</span>"+"</a></div>");
	addList.push("</td>");
	
	addList.push("</tr>");
	
	$("#lawList").append(addList.join(''));
}


function makeLawPageList() {

	let totalPage = $("#lawList").attr("data-tpage");
	let currentPage = $("#lawList").attr("data-cpage");
	console.log(totalPage);
	console.log(currentPage);

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
		if (i <=5 )classInfo="page-link--show";

		if (currentPage ==i){
			li.insertAdjacentHTML("beforeend", `<a href='#' id='page-${i}' class='on'><strong>${i}</strong></a>`);
		} else {
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

	$("#pageList a").click(function(e) {
		e.preventDefault();
		let $item = $(this);
		let $id = $item.attr("id");
		let selectedPage = $item.text();

		if ($id == "next") selectedPage=next;
		if ($id == "prev") selectedPage=prev;
		if ($id == "allprev") selectedPage = 1;
		if ($id == "allnext") selectedPage = totalPage;

		getLawList(selectedPage);
	});
}


function deleteLaw(seqNo) {
	let csrfToken = $("meta[name='_csrf']").attr("content");
    let csrfHeader = $("meta[name='_csrf_header']").attr("content");

	let contextPath = $("#contextPath").val();
	let url = contextPath + "/api/law/deleteLaw.do";
	
	if (confirm("법령을 삭제 하시겠습니까?")){
		$.ajax({
			url: url,
			type: "POST",
			dataType: "json",
			async: false,
			data: {
				"seq_no": seqNo,
			},
	        beforeSend : function(xhr){
	        	xhr.setRequestHeader(csrfHeader, csrfToken);
	        },
			success: function(data) {
				alert("삭제가 완료되었습니다.");
				var page = contextPath + "/admin/law.do"
				location.href = page;
			},
			error: function(xhr, status, error) {
		
			}
		});
	}
}

function editLaw(seqNo) {
	let csrfToken = $("meta[name='_csrf']").attr("content");
    let csrfHeader = $("meta[name='_csrf_header']").attr("content");

	let contextPath = $("#contextPath").val();
	let url = contextPath + "/api/law/editLaw.do";

	const data = {
		"seqNo"     : seqNo,
		"title"     : $("input[name=title]")[0].value,
		"department": $("input[name=department]")[0].value,
		"article"   : $("input[name=article]")[0].value,
		"paragraph" : $("input[name=paragraph]")[0].value,
		"content"   : $("textarea[name=content]")[0].value,
	}
	
	if (data.title == null || data.title == "") {
		alert("법령을 입력해주세요");
		$('#title').focus();
		return false;
	}
	
	if (data.department == null || data.department == "") {
		alert("관련부서를 입력해주세요");
		$('#department').focus();
		return false;
	}

	if (data.article == null || data.article == "") {
		alert("조를 입력해주세요");
		$('#article').focus();
		return false;
	}
	
	if (data.paragraph == null || data.paragraph == "") {
		alert("항를 입력해주세요");
		$('#paragraph').focus();
		return false;
	}
	
	if (data.content == null || data.content == "") {
		alert("내용을 입력해주세요");
		$('#content').focus();
		return false;
	}
	
	if (confirm("법령을 수정 하시겠습니까?")){
		$.ajax({
			url: url,
			type: "POST",
		    contentType : "application/json; charset=UTF-8",
			async: false,
			data : JSON.stringify(data),
	        beforeSend : function(xhr){
	        	xhr.setRequestHeader(csrfHeader, csrfToken);
	        },
			success: function(data) {
				alert("수정이 완료되었습니다.");
				var page = contextPath + "/admin/law.do"
				//location.href = history.back();
				location.href = page;
			},
			error: function(xhr, status, error) {
		
			}
		});
	}
}


function SearchLaw(cpage) {

	let contextPath = $("#contextPath").val();
	let url = contextPath + "/api/law/search.do";

	let search =  $("input[name=searchContent]")[0].value;
	
	if (search == null || search == "") {
		alert("검색어를 입력해주세요");
		$('#searchContent').focus();
		return false;
	}
	
	$("#lawList").attr("data-cpage", cpage);
	$("#lawList").empty();
	$("#pageList").empty();
	$(".cs_title").empty();
	

	$.ajax({
		url: url,
		type: "GET",
		dataType: "json",
		async: false,
		data: {
			"cpage": cpage,
			"search" : search,
		},
		success: function(data) {
			let list = data.list;
			let allCount = data.allCount;
			let totalPage = data.totalPage;

			if (totalPage == "0") totalPage = 1;

			let addList = new Array();
			addList.push("<h4 class=\'fl title t1 bold cb s1 bullet'>검색결과 : " + allCount + "항목 (" +cpage+"/"+totalPage + ") 페이지</h4>");
			$(".cs_title").append(addList.join(''));

			if (list.length == 0){

				let addList2 = new Array();

                addList2.push("<div class=\"cbl_wrap\">");
                addList2.push("   검색결과가 존재하지 않습니다.");
                addList2.push("</div>");

				$("#lawList").append(addList2.join(''));				
			}
			else {
				$("#lawList").attr("data-tpage", totalPage);
	
				for(let i = 1; i<list.length+1; i++) {
					makeLawBlock(i, list[i - 1]);
				}	
				makeLawPageList();
			}
		},
		error: function(xhr, status, error) {
		
			//에러!
			//alert("code:"+xhr.status);
		
		}
	});
}