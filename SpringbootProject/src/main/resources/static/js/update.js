function sample6_execDaumPostcode() {
	new daum.Postcode({
		oncomplete : function(data) {
			// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

			// 각 주소의 노출 규칙에 따라 주소를 조합한다.
			// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			var addr = ''; // 주소 변수
			var extraAddr = ''; // 참고항목 변수

			//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
			if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
				addr = data.roadAddress;
			} else { // 사용자가 지번 주소를 선택했을 경우(J)
				addr = data.jibunAddress;
			}

			document.getElementById("roomaddress").value = addr;

		}
	}).open();
}

$(function(){
	$("#updateform").submit(function(){
		if( $("#roomtitle").val() == ""){
			$("#title_chk").empty();
			$("#address_chk").empty();
			$("#date_chk").empty();
			$("#phone_chk").empty();
			$("#title_chk").text("제목을 적어주세요");
			$("#roomtitle").focus();
			return false;
		}
		if( $("#roomaddress").val() == ""){
			$("#title_chk").empty();
			$("#address_chk").empty();
			$("#date_chk").empty();
			$("#phone_chk").empty();
			$("#address_chk").text("주소를 검색해 넣어주세요");
			$("#adr_search").focus();
			return false;
		}
		if( $("#roomphone").val() == ""){
			$("#title_chk").empty();
			$("#address_chk").empty();
			$("#date_chk").empty();
			$("#phone_chk").empty();
			$("#phone_chk").text("연락처를 적어주세요");
			$("#roomphone").focus();
			return false;
		}
		if( $("#roomdate").val() == ""){
			$("#title_chk").empty();
			$("#address_chk").empty();
			$("#date_chk").empty();
			$("#phone_chk").empty();
			$("#date_chk").text("입주날짜를 입력해주세요");
			$("#roomdate").focus();
			return false;
		}
	})
	var date = $("#fmtdate").text();
	$("#roomdate").val(date);
	var period = $("#period").text();
	if(period == "3개월 미만"){
		$("#under3m").prop("checked",true);
	} else if(period == "3개월 ~ 6개월"){
		$("#under6m").prop("checked",true);
	} else if(period == "6개월 ~ 1년"){
		$("#under1y").prop("checked",true);
	}else if(period == "1년 ~ 2년"){
		$("#under2y").prop("checked",true);
	}else{
		$("#over2y").prop("checked",true);
	}
})