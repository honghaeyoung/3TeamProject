$(function() {
	$(".rsupdate").click(function() {
		let rsno = $(this).attr("id");
		$.post("/room/commentone", {"rsno":rsno},function(data){
			var sel = "#" + rsno; 
			var roomno = data["roomno"];
			$(sel).empty();
			$(sel).append('<hr style="border-top:1px dotted #bbb;">')
			$(sel).append('<div class="mb-3"><input type="text" class="form-control rsno" id="'+rsno+'" name="memberid" style="width: 200px;" value="'+data["memberid"]+'" readonly></div>');
			$(sel).append('<div class="mb-3"><textarea class="form-control" id="rscontent-update" name="rscontent" rows="3">'+data["rscontent"]+'</textarea></div>');
			$(sel).append('<div class="d-grid gap-2 d-md-flex justify-content-md-end"><button id="rsupd" class="btn btn-primary rsupdbnt" type="submit">등록</button></div>');
		})
	})
	$("body").on("click",".rsupdbnt",function(){
		var rscontent = $("#rscontent-update").val();
		var rsno = $(".rsno").attr("id");
		if(rscontent == ""){
			alert("댓글을 작성해주세요");
			return false;
		}else{
			$.get("/room/rsupdate",{"rsno":rsno,"rscontent":rscontent},function(data){
				location.reload();
			})
		}
		
	})
	
	$(".recomment").click(function() {
		let rersno = $(this).attr("id");
		let sel = "#re_"+rersno;
		$(sel).empty();
		$(sel).append('<hr style="border-top:1px dotted #bbb;">')
		$(sel).append('<div class="mb-3"><input type="text" class="form-control rersno" id="'+rersno+'" name="memberid" style="width: 200px;"></div>');
		$(sel).append('<div class="mb-3"><textarea class="form-control" id="rscontent-recomm" name="rscontent" rows="3"></textarea></div>');
		$(sel).append('<div class="d-grid gap-2 d-md-flex justify-content-md-end"><button id="recomm_'+rersno+'" class="btn btn-primary subrecomm" type="submit">등록</button></div>');
		
	})
	
	$("body").on("click",".subrecomm",function(){
		var rscontent = $("#rscontent-recomm").val();
		var rersno = $(".rersno").attr("id");
		var memberid = $(".rersno").val();
		var sel = "#rn_"+rersno;
		var roomno = $(sel).text();
		if(rscontent == ""){
			alert("댓글을 작성해주세요");
			return false;
		}else{
			$.get("/room/recommwrite",{"rersno":rersno,"rscontent":rscontent,"memberid":memberid,"roomno":roomno},function(data){
				location.reload();
			})
		}
		
	})
	
	
	$(".rsdelete").click(function(){
		var rsno = $(this).attr("id");
		$.get("/room/rsdelete",{"rsno":rsno},function(data){
			location.reload();
		})
	})

})