<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="se"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="./resources/css/images.css">
</style>
<script type="text/javascript">
	function DisplayPrice() {
		var sum = 0;
		for (i = 1; i <= 21; i++) {
			sum += parseInt($("input[type=radio][name=price" + i + "]:checked")
					.val());
		}
		if (0 <= sum && sum <= 9)
			alert("정상입니다");
		if (10 <= sum && sum <= 15)
			alert("약간의 우울증 증세가 보입니다. 우울한 감정에 너무 신경을 집중하지 마세요 매사에"
					+ "조금 더 가볍게, 당연하게 받아들이시기 바랍니다. 기회가 된다면 자연속에서 재충전의 시간을 가져보세요");
		if (16 <= sum && sum <= 63)
			alert("중증 이상의 우울증 증세가 보입니다. 현재 자신의 우울 증세에 대해 세심한 주의가"
					+ "필요합니다. 일반적으로 우울한 감정은 누구나 느낄 수있고, 또 한동안 지속되었다가 사라지기도 하지만 이런 증상이 자주"
					+ "반복된다면 반드시 전문가의 상담을 통해 도움을 받으셔야 합니다.");
		else
			alert("정확히 선택해 주세요");
	}
</script>
<title>Kosta th109</title>
</head>
<body>

	<div id="imagewidth">
		<h1>
			<font color="blue">자가진단테스트 페이지</font>
		</h1>
		<h1>
			테이블 테두리 선은 css 적용후 투명으로 전환<br /> 추후협의
		</h1>
		<table border=1 align="center">

			<td align="left" width="900"><b>이 질문지는 여러분이 일상 생활에서 경험할 수 있는
					내용들로 구성되어 있습니다. 각 내용은 모두 네 개의 문장으로 되어 있는데, 이 네 개의 문장들을 자세히 읽어보시고 그
					중 요즈음 (오늘을 포함하여 지난 일주일 동안)의 자신을 가장 잘 나타낸다고 생각되는 하나의 문장을 선택하여 그 번호를
					( )안에 기입하여 주십시오. 하나도 빼지 말고 반드시 한 문장만을 선택하시되, 너무 오래 생각하지 마시고 솔직하게
					응답해 주시면 감사하겠습니다.</b></td>

		</table>
		<table border=1 align="center">
			<tr>
				<td><b>번호</b></td>
				<td><b>문항</b></td>
				<td><b>선택</b></td>
			</tr>

			<tr>
				<td><b>1</b></td>
				<td align="left">나는 슬프지 않다.<br>
					<hr> 나는 슬프다.<br>
					<hr> 나는 항상 슬프고 기운을 낼 수 없다.<br>
					<hr> 나는 너무나 슬프고 불행해서 도저히 견딜 수 없다.
				</td>
				<td align="center"><input type="radio" value="0" name="price1"><br>
					<hr> <input type="radio" value="1" name="price1"><br>
					<hr> <input type="radio" value="2" name="price1"><br>
					<hr> <input type="radio" value="3" name="price1"><br>
				</td>

			</tr>

			<tr>
				<td><b>2</b></td>
				<td align="left">나는 앞날에 대해서 별로 낙심하지 않는다.<br>
					<hr> 나는 앞날에 대해서 용기가 나지 않는다.<br>
					<hr> 나는 앞날에 대해 기대할 것이 아무 것도 없다고 느낀다.<br>
					<hr> 나는 앞날은 아주 절망적이고 나아질 가망이 없다고 느낀다.
				</td>
				<td align="center"><input type="radio" value="0" name="price2"><br>
					<hr> <input type="radio" value="1" name="price2"><br>
					<hr> <input type="radio" value="2" name="price2"><br>
					<hr> <input type="radio" value="3" name="price2"><br>
				</td>
			</tr>

			<tr>
				<td><b>3</b></td>
				<td align="left">나는 실패자라고 느끼지 않는다.<br>
					<hr> 나는 보통사람들보다 더 많이 실패 한 것 같다.<br>
					<hr> 내가 살아온 과거를 뒤돌아보면, 실패투성이인 것 같다. <br>
					<hr> 나는 인간으로 완전한 실패자라고 느낀다.
				</td>
				<td align="center"><input type="radio" value="0" name="price3"><br>
					<hr> <input type="radio" value="1" name="price3"><br>
					<hr> <input type="radio" value="2" name="price3"><br>
					<hr> <input type="radio" value="3" name="price3"><br>
				</td>
			</tr>

			<tr>
				<td><b>4</b></td>
				<td align="left">나는 전과같이 일상생활에 만족하고 있다.<br>
					<hr> 나는 일상생활은 예전처럼 즐겁지 않다.<br>
					<hr> 나는 요즘에는 어떤 것에서도 별로 만족을 얻지 못한다. <br>
					<hr> 나는 모든 것이 다 불만스럽고 싫증난다.
				</td>
				<td align="center"><input type="radio" value="0" name="price4"><br>
					<hr> <input type="radio" value="1" name="price4"><br>
					<hr> <input type="radio" value="2" name="price4"><br>
					<hr> <input type="radio" value="3" name="price4"><br>
				</td>
			</tr>

			<tr>
				<td><b>5</b></td>
				<td align="left">나는 특별히 죄책감을 느끼지 않는다.<br>
					<hr> 나는 죄책감을 느낄 때가 많다.<br>
					<hr> 나는 죄책감을 느낄 때가 아주 많다. <br>
					<hr> 나는 항상 죄책감에 시달리고 있다.
				</td>
				<td align="center"><input type="radio" value="0" name="price5"><br>
					<hr> <input type="radio" value="1" name="price5"><br>
					<hr> <input type="radio" value="2" name="price5"><br>
					<hr> <input type="radio" value="3" name="price5"><br>
				</td>
			</tr>

			<tr>
				<td><b>6</b></td>
				<td align="left">나는 벌을 받고 있다고 느끼지 않는다.<br>
					<hr> 나는 어쩌면 벌을 받을지도 모른다는 느낌이 든다.<br>
					<hr> 나는벌을 받을 것 같다. <br>
					<hr> 나는 지금 벌을 받고 있다고 느낀다.
				</td>
				<td align="center"><input type="radio" value="0" name="price6"><br>
					<hr> <input type="radio" value="1" name="price6"><br>
					<hr> <input type="radio" value="2" name="price6"><br>
					<hr> <input type="radio" value="3" name="price6"><br>
				</td>
			</tr>

			<tr>
				<td><b>7</b></td>
				<td align="left">나는 나 자신에게 실망하지 않는다.<br>
					<hr> 나는 나 자신에게 실망하고 있다.<br>
					<hr> 나는 나 자신에게 화가 난다. <br>
					<hr> 나는 나 자신을 증오한다.
				</td>
				<td align="center"><input type="radio" value="0" name="price7"><br>
					<hr> <input type="radio" value="1" name="price7"><br>
					<hr> <input type="radio" value="2" name="price7"><br>
					<hr> <input type="radio" value="3" name="price7"><br>
				</td>
			</tr>

			<tr>
				<td><b>8</b></td>
				<td align="left">나는 다른 사람보다 못한 것 같지 않다.<br>
					<hr> 나는 나의 약점이나 실수에 대해서 나 자신을 탓하는 편이다. <br>
					<hr> 내가 한 일이 잘못되었을 때는 언제나 나를 탓한다. <br>
					<hr> 일어나는 모든 나쁜 일들은 다 내 탓이다.
				</td>
				<td align="center"><input type="radio" value="0" name="price8"><br>
					<hr> <input type="radio" value="1" name="price8"><br>
					<hr> <input type="radio" value="2" name="price8"><br>
					<hr> <input type="radio" value="3" name="price8"><br>
				</td>
			</tr>

			<tr>
				<td><b>9</b></td>
				<td align="left">나는 자살 같은 것은 생각하지 않는다.<br>
					<hr> 나는 자살할 생각을 가끔 하지만, 실제로 하지는 않을 것이다.<br>
					<hr> 자살하고 싶은 생각이 자주 든다.<br>
					<hr> 나는 기회만 있으면 자살하겠다.
				</td>
				<td align="center"><input type="radio" value="0" name="price9"><br>
					<hr> <input type="radio" value="1" name="price9"><br>
					<hr> <input type="radio" value="2" name="price9"><br>
					<hr> <input type="radio" value="3" name="price9"><br>
				</td>
			</tr>

			<tr>
				<td><b>10</b></td>
				<td align="left">나는 평소보다 더 울지는 않는다.<br>
					<hr> 나는 전보다 더 많이 운다.<br>
					<hr> 나는 요즈음 항상 운다.<br>
					<hr> 나는 전에는 울고 싶을 때 울 수 있었지만, 요즈음은 울래야 울 기력조차 없다.
				</td>
				<td align="center"><input type="radio" value="0" name="price10"><br>
					<hr> <input type="radio" value="1" name="price10"><br>
					<hr> <input type="radio" value="2" name="price10"><br>
					<hr> <input type="radio" value="3" name="price10"><br>
				</td>
			</tr>

			<tr>
				<td><b>11</b></td>
				<td align="left">나는 요즈음 평소보다 더 짜증을 내는 편은 아니다.<br>
					<hr> 나는 전보다 더 쉽게 짜증이 나고 귀찮아진다.<br>
					<hr> 나는 요즈음 항상 짜증을 내고 있다.<br>
					<hr> 전에는 짜증스럽던 일에 요즘은 너무 지쳐서 짜증조차 나지 않는다.
				</td>
				<td align="center"><input type="radio" value="0" name="price11"><br>
					<hr> <input type="radio" value="1" name="price11"><br>
					<hr> <input type="radio" value="2" name="price11"><br>
					<hr> <input type="radio" value="3" name="price11"><br>
				</td>
			</tr>

			<tr>
				<td><b>12</b></td>
				<td align="left">나는 다른 사람들에 대한 관심을 잃지 않고 있다.<br>
					<hr> 나는 전보다 다른 사람들에 대한 관심이 줄었다.<br>
					<hr> 나는 다른 사람들에 대한 관심이 거의 없어졌다.<br>
					<hr> 나는 다른 사람들에 대한 관심이 완전히 없어졌다.
				</td>
				<td align="center"><input type="radio" value="0" name="price12"><br>
					<hr> <input type="radio" value="1" name="price12"><br>
					<hr> <input type="radio" value="2" name="price12"><br>
					<hr> <input type="radio" value="3" name="price12"><br>
				</td>
			</tr>

			<tr>
				<td><b>13</b></td>
				<td align="left">나는 평소처럼 결정을 잘 내린다.<br>
					<hr> 나는 결정을 미루는 때가 전보다 더 많다.<br>
					<hr> 나는 전에 비해 결정 내리는 데에 더 큰 어려움을 느낀다.<br>
					<hr> 나는 더 이상 아무 결정도 내릴 수가 없다.
				</td>
				<td align="center"><input type="radio" value="0" name="price13"><br>
					<hr> <input type="radio" value="1" name="price13"><br>
					<hr> <input type="radio" value="2" name="price13"><br>
					<hr> <input type="radio" value="3" name="price13"><br>
				</td>
			</tr>

			<tr>
				<td><b>14</b></td>
				<td align="left">나는 전보다 내 모습이 더 나빠졌다고 느끼지 않는다.<br>
					<hr> 나는 나이들어 보이거나 매력없어 보일까봐 걱정한다.<br>
					<hr> 나는 내 모습이 매력없게 변해버린 것 같은 느낌이 든다.<br>
					<hr> 나는 내가 추하게 보인다고 믿는다.
				</td>
				<td align="center"><input type="radio" value="0" name="price14"><br>
					<hr> <input type="radio" value="1" name="price14"><br>
					<hr> <input type="radio" value="2" name="price14"><br>
					<hr> <input type="radio" value="3" name="price14"><br>
				</td>
			</tr>

			<tr>
				<td><b>15</b></td>
				<td align="left">나는 전처럼 일을 할 수 있다.<br>
					<hr> 어떤 일을 시작하는 데에 전보다 더 많은 노력이 든다.<br>
					<hr> 무슨 일이든 하려면 나 자신을 매우 심하게 채찍질해야만 한다.<br>
					<hr> 나는 전혀 아무 일도 할 수가 없다.
				</td>
				<td align="center"><input type="radio" value="0" name="price15"><br>
					<hr> <input type="radio" value="1" name="price15"><br>
					<hr> <input type="radio" value="2" name="price15"><br>
					<hr> <input type="radio" value="3" name="price15"><br>
				</td>
			</tr>

			<tr>
				<td><b>16</b></td>
				<td align="left">나는 평소처럼 잠을 잘 수가 없다.<br>
					<hr> 나는 전에 만큼 잠을 자지는 못한다.<br>
					<hr> 나는 전보다 한 두시간 일찍 깨고 다시 잠들기 어렵다.<br>
					<hr> 나는 평소보다 몇 시간이나 일찍 깨고, 한번 깨면 다시 잠들 수 없다.
				</td>
				<td align="center"><input type="radio" value="0" name="price16"><br>
					<hr> <input type="radio" value="1" name="price16"><br>
					<hr> <input type="radio" value="2" name="price16"><br>
					<hr> <input type="radio" value="3" name="price16"><br>
				</td>
			</tr>

			<tr>
				<td><b>17</b></td>
				<td align="left">나는 평소보다 더 피곤하지는 않다.<br>
					<hr> 나는 전보다 더 쉽게 피곤해진다.<br>
					<hr> 나는 무엇을 해도 피곤해진다.<br>
					<hr> 나는 너무나 피곤해서 아무 일도 할 수 없다.
				</td>
				<td align="center"><input type="radio" value="0" name="price17"><br>
					<hr> <input type="radio" value="1" name="price17"><br>
					<hr> <input type="radio" value="2" name="price17"><br>
					<hr> <input type="radio" value="3" name="price17"><br>
				</td>
			</tr>

			<tr>
				<td><b>18</b></td>
				<td align="left">내 식욕은 평소와 다름없다.<br>
					<hr> 나는 요즈음 전보다 식욕이 좋지 않다.<br>
					<hr> 나는 요즈음 식욕이 많이 떨어졌다.<br>
					<hr> 요즈음에는 전혀 식욕이 없다.
				</td>
				<td align="center"><input type="radio" value="0" name="price18"><br>
					<hr> <input type="radio" value="1" name="price18"><br>
					<hr> <input type="radio" value="2" name="price18"><br>
					<hr> <input type="radio" value="3" name="price18"><br>
				</td>
			</tr>

			<tr>
				<td><b>19</b></td>
				<td align="left">요즈음 체중이 별로 줄지 않았다.<br>
					<hr> 전보다 몸무게가 2Kg 가량 줄었다.<br>
					<hr> 전보다 몸무게가 5Kg 가량 줄었다.<br>
					<hr> 전보다 몸무게가 7Kg 가량 줄었다.
				</td>
				<td align="center"><input type="radio" value="0" name="price19"><br>
					<hr> <input type="radio" value="1" name="price19"><br>
					<hr> <input type="radio" value="2" name="price19"><br>
					<hr> <input type="radio" value="3" name="price19"><br>
				</td>
			</tr>

			<tr>
				<td><b>20</b></td>
				<td align="left">나는 건강에 대해 전보다 더 염려하고 있지는 않다.<br>
					<hr> 나는 여러 가지 통증, 소화불량, 변비 등과 같은 신체적 문제로 걱정하고 있다.<br>
					<hr> 나는 건강이 염려되어 다른 일은 생각하기 힘들다.<br>
					<hr> 나는 건강이 너무 염려되어 다른 일은 아무 것도 생각할 수 없다.
				</td>
				<td align="center"><input type="radio" value="0" name="price20"><br>
					<hr> <input type="radio" value="1" name="price20"><br>
					<hr> <input type="radio" value="2" name="price20"><br>
					<hr> <input type="radio" value="3" name="price20"><br>
				</td>
			</tr>

			<tr>
				<td><b>21</b></td>
				<td align="left">나는 요즈음 성(sex)에 대한 관심에 별다른 변화가 있는 것 같지는 않다.<br>
					<hr> 나는 전보다 성(sex)에 대한 관심이 줄었다.<br>
					<hr> 나는 전보다 성(sex)에 대한 관심이 상당히 줄었다.<br>
					<hr> 나는 성(sex)에 대한 관심을 완전히 잃었다.
				</td>
				<td align="center"><input type="radio" value="0" name="price21"><br>
					<hr> <input type="radio" value="1" name="price21"><br>
					<hr> <input type="radio" value="2" name="price21"><br>
					<hr> <input type="radio" value="3" name="price21"><br>
				</td>
			</tr>
		</table>

		<h3>
			<button style="border: outset; background-color: white;"
				onclick="DisplayPrice()">결과</button>
		</h3>
	</div>
</body>
</html>