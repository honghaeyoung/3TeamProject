<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>

</head>
<body>	
<div>오늘 뭐 먹지?</div>
<div id="show" class="js-odoo"></div>
<button type="button" id="food" onclick="foodclick()">오늘의 음식은?</button>

</body>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>

let food = new Array ();
food[0] = "피자";
food[1] = "치킨";
food[2] = "햄버거";
food[3] = "족발";
food[4] = "곱창";
food[5] = "돈까스";
food[6] = "제육볶음";
food[7] = "비빔밥";
food[8] = "순대국";
food[9] = "찜닭";
food[10] = "덮밥";
food[11] = "김치찜";
food[12] = "닭갈비";
food[13] = "김치찌개";
food[14] = "된장찌개";
food[15] = "짜장면";
food[16] = "짬뽕";
food[17] = "김밥";
food[18] = "회";
food[19] = "육회";
food[20] = "우동";
food[21] = "라면";
food[22] = "초밥";
food[23] = "마라탕";
food[24] = "쌀국수";
food[25] = "스테이크";
food[26] = "파스타";
food[27] = "샐러드";
food[28] = "카레";
food[29] = "보쌈";
food[30] = "닭발";
food[31] = "갈비찜";
food[32] = "아구찜";
food[33] = "해장국";
food[34] = "도시락";
food[35] = "삼겹살";
food[36] = "크로플";
food[37] = "아이스크림";
food[38] = "타코야끼";
food[39] = "샌드위치";
food[40] = "핫도그";
food[41] = "육계장";
food[42] = "설렁탕";
food[43] = "갈비";
food[44] = "낙곱새";
food[45] = "만두";
let i = Math.floor(Math.random() * food.length)
function foodclick(){	
	let taget = document.getElementById("show");
	for(let j=0; j < i; j++){
		
		taget.innerHTML = food[i];
	}
	
	}


</script>
</html>