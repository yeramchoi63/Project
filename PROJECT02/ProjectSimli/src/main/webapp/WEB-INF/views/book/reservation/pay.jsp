<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.1.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
	IMP.init('imp92596934'); //자신의 "가맹점 식별코드"를 사용
	IMP.request_pay({
		merchant_uid : '${memberid}'+new Date().getTime(),
		name : '쇼미더심리',
		amount : '1000',
		buyer_email : 'iamport@siot.do',
		buyer_name : '구매자',
		buyer_tel : '${categoryprice}',
		buyer_addr : '서울특별시 강남구 삼성동',
		buyer_postcode : '123-456'
	},

	function(rsp) {
	if ( rsp.success ) {
		var category = '${resertype}';
		var msg = '결제가 완료되었습니다.';
		msg += '고유ID : ' + rsp.imp_uid;
		msg += '상점 거래ID : ' + rsp.merchant_uid;
		msg += '결제 금액 : ' + rsp.paid_amount;
		msg += '카드 승인번호 : ' + rsp.apply_num;
		if(category=='상담'){
			var url = "result?memberid=${memberid}&memberconsult=${memberconsult}&appointweek=${appointweek}&appointcheck=${appointcheck}&appointtime=${appointtime}&resertype=${resertype}}&consulttype=${consulttype}&patron=${patron}&categoryprice=${categoryprice}&appointday=${appointday}&employeeid=${employeeid}";    
			$(location).attr('href',url);
		}else if(category == '치료'){
			var url = "threpyemployenroll?memberid=${memberid}&memberconsult=${memberconsult}&appointweek=${appointweek}&appointcheck=${appointcheck}&appointtime=${appointtime}&resertype=${resertype}}&consulttype=${consulttype}&patron=${patron}&categoryprice=${categoryprice}&appointday=${appointday}";    
			$(location).attr('href',url);
		}
	
	} else {
		var msg = '결제에 실패하였습니다.';
		msg += '에러내용 : ' + rsp.error_msg;
		history.back();
	}
	});  
	
</script>
</head>
<body>
	
		${memberid}
		${memberconsult}
		${appointweek}
		${appointcheck}
		${appointtime}
		${categoryprice}
		${resertype}
		${consulttype}
		${patron}
		${apppointday}
		${employeeid}

</body>
</html>