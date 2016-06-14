package com.kosta.simli.controller;

import java.io.PrintWriter;
import java.security.Principal;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kosta.simli.dao.ReservationDao;
import com.kosta.simli.dao.SchedultDao;
import com.kosta.simli.dto.ReserDTO;
import com.kosta.simli.dto.ScheduleDTO;

@Controller
public class ReservationController {

	@Autowired
	private SqlSession sqlSession;

	@RequestMapping("/reservationview")
	public String consult_view(Model model, Principal principal, HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		ReservationDao rdao = sqlSession.getMapper(ReservationDao.class);
		if (principal == null) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter writer = response.getWriter();
			writer.write("<script type='text/javascript'>");
			writer.write("alert('로그인을 해주세요');");
			writer.write("history.back();");
			writer.write("</script>");
			writer.flush();
			return null;
		} else {
			String id = principal.getName();
			System.out.println(id);
			String appointday = request.getParameter("appointday");
			String hour = request.getParameter("hour");
			String consulttype = request.getParameter("consulttype");
			System.out.println("appointday : " + appointday);
			if (appointday != null) {
				model.addAttribute("appointday", appointday);
			}

			List<ReserDTO> sid = rdao.consearch(id);
			if (sid.isEmpty()) {
				System.out.println(sid);
				return "book.reservation.reservationview";
			}

			model.addAttribute("reserlist", rdao.search2());
			System.out.println("id는" + id);
			return "book.reservation.threpyreservation";
		}
	}

	@RequestMapping("/testresult") // 선생님조회
	public String reservationview(HttpServletRequest request, Model model, ReserDTO rdto) throws Throwable {
		ReservationDao rdao = sqlSession.getMapper(ReservationDao.class);

		int appointhour = Integer.parseInt(request.getParameter("appointhour")); // 시간
		String appointday = request.getParameter("appointday"); // 희망날짜
		int categoryprice = 100000;
		int appointtime = (appointhour * 100); // 희망상담시간
		String memberconsult = request.getParameter("memberconsult"); // 상담방식
		String consulttype = request.getParameter("consulttype"); // 상담유형
		String patron = request.getParameter("patron"); // 보호자
		String resertype = "상담";
		String result = rdao.patronsearch(patron);
		if (result == null) {
			model.addAttribute("patron", "No patron");
		} else {
			model.addAttribute("patron", result);
		}

		System.out.println("상담날짜는" + appointday);
		System.out.println("상담시간은" + appointtime);
		System.out.println("상담방식은" + memberconsult);
		System.out.println("상담유형은" + consulttype);
		System.out.println(resertype);
		//////////////////////// 날짜 -> 요일변환///////////////////////////////////
		SimpleDateFormat fmt_in = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat fmt_out = new SimpleDateFormat("EEE", Locale.ENGLISH);
		String date_in = request.getParameter("appointday");
		ParsePosition pos = new ParsePosition(0);
		java.util.Date outTime = fmt_in.parse(date_in, pos);
		String date_out = fmt_out.format(outTime);
		System.out.println(date_out);
		//////////////////////////////////////////////////////////////////////

		String daystart = date_out + "_s";
		String dayend = date_out + "_e";

		rdto.setAppointday(appointday);
		rdto.setAppointtime(appointtime);
		System.out.println("consulttype" + consulttype);
		SchedultDao sdao = sqlSession.getMapper(SchedultDao.class);
		if (consulttype.equals("개인상담")) {
			List<ScheduleDTO> list = sdao.list(appointtime, appointday, daystart, dayend);
			model.addAttribute("list", list);
		}
		if (consulttype.equals("집단상담")) {
			List<ScheduleDTO> list = sdao.grouplist(appointtime, appointday, daystart, dayend);
			model.addAttribute("list", list);
		}
		model.addAttribute("appointday", request.getParameter("appointday")); // 날짜
		model.addAttribute("appointhour", request.getParameter("appointhour")); // 시간
		model.addAttribute("appointtime", appointtime); // 시간
		model.addAttribute("memberconsult", request.getParameter("memberconsult"));// 상담방식
		model.addAttribute("consulttype", request.getParameter("consulttype")); // 집단/개인
		model.addAttribute("categoryprice", categoryprice);
		model.addAttribute("resertype", resertype);
		return "reservationresult";

	}

	@RequestMapping("/result") // 선생님선택
	public String searchresult(HttpSession session, Principal principal, HttpServletRequest request, Model model,
			ReserDTO rdto) throws Throwable {

		ReservationDao rdao = sqlSession.getMapper(ReservationDao.class);

		SimpleDateFormat fmt_in = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat fmt_out = new SimpleDateFormat("EEE", Locale.ENGLISH);
		String date_in = request.getParameter("appointday");
		ParsePosition pos = new ParsePosition(0);
		java.util.Date outTime = fmt_in.parse(date_in, pos);
		String date_out = fmt_out.format(outTime);
		System.out.println(date_out);

		int appointtime = Integer.parseInt(request.getParameter("appointtime"));
		int categoryprice = Integer.parseInt(request.getParameter("categoryprice"));
		String employeeid = request.getParameter("employeeid");
		System.out.println("선생님은" + employeeid);
		String consulttype = request.getParameter("consulttype");
		String memberid = principal.getName();
		String patron = request.getParameter("patron");
		System.out.println("보호자는" + patron);
		System.out.println(memberid + "아이디");
		rdto.setMemberid(memberid);

		rdto.setMemberconsult("online");

		rdto.setAppointweek(date_out);

		rdto.setAppointcheck("waiting");
		rdto.setEmployeeid(employeeid);
		rdto.setAppointtime(appointtime);
		rdto.setCategoryprice(categoryprice);
		rdto.setConsulttype(consulttype);
		rdto.setPatron(patron);
		rdao.insert(rdto);

		return "redirect:reserManage";

	}

	@RequestMapping("/pay") // 결제창
	public String offline(Principal principal, HttpServletRequest request, Model model, ReserDTO rdto)
			throws Throwable {
		System.out.println("pay로와요");
		ReservationDao rdao = sqlSession.getMapper(ReservationDao.class);

		SimpleDateFormat fmt_in = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat fmt_out = new SimpleDateFormat("EEE", Locale.ENGLISH);
		String date_in = request.getParameter("appointday");
		ParsePosition pos = new ParsePosition(0);
		java.util.Date outTime = fmt_in.parse(date_in, pos);

		String date_out = fmt_out.format(outTime); // 날짜
		String memberid = principal.getName(); // ID
		String employeeid = request.getParameter("employeeid");
		String consulttype = request.getParameter("consulttype"); // 개인/그룹집단
		String patron = request.getParameter("patron"); // 보호자
		String resertype = request.getParameter("resertype"); // 상담유형
		int appointtime = Integer.parseInt(request.getParameter("appointtime")) * 100; // 시간
		int categoryprice = Integer.parseInt(request.getParameter("categoryprice")); // 가격
		request.setAttribute("memberid", memberid);
		request.setAttribute("memberconsult", "offline"); // 상담방식
		request.setAttribute("appointweek", date_out);
		request.setAttribute("appointday", date_in);
		request.setAttribute("appointcheck", "waiting"); // 상담대기
		request.setAttribute("appointtime", appointtime);
		request.setAttribute("categoryprice", categoryprice);
		request.setAttribute("resertype", resertype);
		request.setAttribute("consulttype", consulttype);
		request.setAttribute("patron", patron);
		request.setAttribute("employeeid", employeeid);
		return "book.reservation.pay";

	}

	////////////////////////////////////// 치료////////////////////////////////////////////
	@RequestMapping("/threpyreservation") // 치료창

	public String threpyreservation(Principal principal, Model model, HttpServletRequest request) throws Throwable {
		ReservationDao rdao = sqlSession.getMapper(ReservationDao.class);
		String id = principal.getName();

		if (rdao.msearch(id) == null) { // 치료방법유무로 권장치료방법이 없을시 상담페이지로 리턴
			return "redirect:reservationview";
		}
		request.setAttribute("id", id);
		model.addAttribute("mlist", rdao.msearch(id));

		return "book.reservation.threpyreservation";
	}

	@RequestMapping("/threpyresult") // 치료결과창

	public String threpyresult(Principal principal, Model model, HttpServletRequest request, ReserDTO rdto)
			throws Throwable {
		ReservationDao rdao = sqlSession.getMapper(ReservationDao.class);
		System.out.println("치료테스트");
		int appointtime = Integer.parseInt(request.getParameter("appointhour")) * 100;
		String memberid = principal.getName(); // 멤버아이디
		String resertype = request.getParameter("resertype");
		request.setAttribute("appointday", request.getParameter("appointday")); // 희망요일
		request.setAttribute("appointtime", appointtime); // 희망시간
		request.setAttribute("resertype", resertype); // 상담방법

		//////////////////////// 날짜 -> 요일변환///////////////////////////////////
		SimpleDateFormat fmt_in = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat fmt_out = new SimpleDateFormat("EEE", Locale.ENGLISH);
		String appointday = request.getParameter("appointday");
		ParsePosition pos = new ParsePosition(0);
		java.util.Date outTime = fmt_in.parse(appointday, pos);
		String appointweek = fmt_out.format(outTime);

		//////////////////////////////////////////////////////////////////////

		String daystart = appointweek + "_s"; // 요일 뒤에 _s
		String dayend = appointweek + "_e"; //

		System.out.println(appointweek); // 요일출력

		SchedultDao sdao = sqlSession.getMapper(SchedultDao.class);
		List<ScheduleDTO> list = sdao.threpysearch(appointtime, appointday, daystart, dayend);

		model.addAttribute("list", list);

		return "threpyresult";
	}

	@RequestMapping("/threpyemployenroll") // 치료등록

	public String threpyemployenroll(Principal principal, Model model, HttpServletRequest request, ReserDTO rdto)
			throws Throwable {
		ReservationDao rdao = sqlSession.getMapper(ReservationDao.class);
		String appointday = request.getParameter("appointday");
		int appointtime = Integer.parseInt(request.getParameter("appointtime"));
		String resertype = request.getParameter("resertype");
		String memberid = principal.getName();

		//////////////////////// 날짜 -> 요일변환///////////////////////////////////
		SimpleDateFormat fmt_in = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat fmt_out = new SimpleDateFormat("EEE", Locale.ENGLISH);
		ParsePosition pos = new ParsePosition(0);
		java.util.Date outTime = fmt_in.parse(appointday, pos);
		String appointweek = fmt_out.format(outTime);

		//////////////////////////////////////////////////////////////////////

		String daystart = appointweek + "_s"; // 요일 뒤에 _s
		String dayend = appointweek + "_e"; //
		String memberconsult = "online";
		System.out.println(resertype);
		////////////////////////////// 가격//////////////////////////////
		int categoryprice = 0;
		if (resertype.equals("미술치료")) { // 미술치료
			categoryprice = 150000; // 가격

		} else if (resertype.equals("가족치료")) { // 가족치료
			categoryprice = 250000; // 가격

		} else if (resertype.equals("게임치료")) { // 게임 치료
			categoryprice = 300000; // 가격

		} else if (resertype.equals("영상치료")) { // 영상 치료
			categoryprice = 250000; // 가격

		} else if (resertype.equals("놀이치료")) { // 놀이치료
			categoryprice = 150000; // 가격

		} else if (resertype.equals("심리치료")) { // 심리 치료
			categoryprice = 200000; // 가격

		} else if (resertype.equals("독서치료")) { // 독서치료
			categoryprice = 150000; // 가격

		} else if (resertype.equals("언어치료")) { // 언어치료
			categoryprice = 150000; // 가격

		} else if (resertype.equals("상담치료")) { // 상담치료
			categoryprice = 70000; // 가격
		}
		//////////////////////////////////////////////////////////////

		rdto.setEmployeeid(request.getParameter("employeeid")); // 선생님아이디
		rdto.setAppointweek(appointweek); // 희망요일
		rdto.setAppointcheck("threpy waiting"); // 치료여부
		rdto.setMemberconsult(memberconsult); // 상담방법
		rdto.setAppointtime(appointtime); // 희망시간
		rdto.setCategoryprice(categoryprice); // 가격
		rdto.setMemberid(memberid); // 멤버아이디
		rdao.therapyreg(rdto); // 치료 등록

		return "redirect:threpyreservation";
	}

	@RequestMapping("/consultresult") // 상담결과창
	public String consultresult(Model model, HttpServletRequest request, Principal principal) throws Throwable {
		ReservationDao rdao = sqlSession.getMapper(ReservationDao.class);
		String id = principal.getName();
		model.addAttribute("list", rdao.conresult(id));
		return "book.reservation.consultresult";

	}

	@RequestMapping("/enrollsubmit") // 상담->치료 등록창
	public String enrollsubmit(Model model, HttpServletRequest request, ReserDTO rdto) throws Throwable {
		ReservationDao rdao = sqlSession.getMapper(ReservationDao.class);
		System.out.println("아이디" + request.getParameter("id")); // 아이디가져온다
		System.out.println("치료방법" + request.getParameter("resertype")); // 치료방법가져온다..

		rdto.setMemberid(request.getParameter("id"));
		rdto.setResertype(request.getParameter("resertype")); // id와 resertype으로
																// 정해놓고 insert시킴
		rdao.therapyupdate(rdto);
		rdao.therapyinsert(rdto);
		return "redirect:consultresult";
	}

	@RequestMapping("/conready") // 접속준비창
	public String conready(Model model, HttpServletRequest request, Principal principal) throws Throwable {
		ReservationDao rdao = sqlSession.getMapper(ReservationDao.class);
		String employeeid = principal.getName();
		model.addAttribute("list", rdao.conready(employeeid));
		return "book.reservation.conready";
	}

	@RequestMapping("/connection") // 접속연결라인
	public String connection(Model model, HttpServletRequest request, Principal principal) throws Throwable {
		int num = Integer.parseInt(request.getParameter("num"));
		System.out.println("접속할 글번호는:" + num);
		return "redirect:conready";
	}

	@RequestMapping("/examinerview")
	public String examineresultview(Model model) throws Throwable {
		ReservationDao rdao = sqlSession.getMapper(ReservationDao.class);
		model.addAttribute("examiner", rdao.search2());
		return "book.reservation.examinerview";
	}

	@RequestMapping("/payresult") // 결제완료시..
	public String payresult(HttpServletRequest request, Model model, ReserDTO rdto) throws Throwable {
		ReservationDao rdao = sqlSession.getMapper(ReservationDao.class);
		String employeeid = request.getParameter("employeeid");
		String memberid = request.getParameter("memberid");
		String memberconsult = request.getParameter("offline"); // 상담방식
		String appointweek = request.getParameter("appointweek");
		String appointcheck = request.getParameter("appointcheck");
		int appointtime = Integer.parseInt(request.getParameter("appointtime"));
		int categoryprice = Integer.parseInt(request.getParameter("categoryprice"));
		String resertype = request.getParameter("resertype");
		String consulttype = request.getParameter("consulttype");
		String patron = request.getParameter("patron");
		String appointday = request.getParameter("appointday");
		/////////////////////////////////////////////////////////////////////
		System.out.println(employeeid); //
		System.out.println(memberid); // allfreenew
		System.out.println(memberconsult);
		System.out.println(appointweek); // tue
		System.out.println(appointcheck); // waiting
		System.out.println(appointtime); // 900
		System.out.println(categoryprice); // 80000
		System.out.println(resertype); // 개인상담
		System.out.println(consulttype);
		System.out.println(patron);
		System.out.println(appointday);
		//////////////////////////////////////////////////////////////////////////
		rdto.setEmployeeid(employeeid);
		rdto.setMemberid(memberid);
		rdto.setMemberconsult(memberconsult);
		rdto.setAppointweek(appointweek);
		rdto.setAppointcheck(appointcheck);
		rdto.setAppointtime(appointtime);
		rdto.setCategoryprice(categoryprice);
		rdto.setResertype(resertype);
		rdto.setConsulttype(consulttype);
		rdto.setPatron(patron);
		rdto.setAppointday(appointday);
		rdao.insert(rdto);
		return "book.reservation.examinerview";
	}

	@RequestMapping("/examinerresult") // 선생님조회
	public String examinerresult(HttpServletRequest request, Model model, ReserDTO rdto) throws Throwable {
		ReservationDao rdao = sqlSession.getMapper(ReservationDao.class);

		int appointhour = Integer.parseInt(request.getParameter("appointhour")); // 시간
		String appointday = request.getParameter("appointday"); // 희망날짜

		int appointtime = (appointhour * 100); // 희망상담시간
		String resertype = request.getParameter("resertype"); // 상담방식

		System.out.println("상담날짜는" + appointday);
		System.out.println("상담시간은" + appointtime);
		System.out.println("상담방식은" + resertype);
		//////////////////////// 날짜 -> 요일변환///////////////////////////////////
		SimpleDateFormat fmt_in = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat fmt_out = new SimpleDateFormat("EEE", Locale.ENGLISH);
		String date_in = request.getParameter("appointday");
		ParsePosition pos = new ParsePosition(0);
		java.util.Date outTime = fmt_in.parse(date_in, pos);
		String date_out = fmt_out.format(outTime);
		System.out.println(date_out);
		//////////////////////////////////////////////////////////////////////

		String daystart = date_out + "_s";
		String dayend = date_out + "_e";

		rdto.setAppointday(appointday);
		rdto.setAppointtime(appointtime);

		SchedultDao sdao = sqlSession.getMapper(SchedultDao.class);
		List<ScheduleDTO> list = sdao.examinerlist(appointtime, appointday, daystart, dayend);
		System.out.println("리스트");
		model.addAttribute("list", list);
		request.setAttribute("appointday", request.getParameter("appointday"));
		request.setAttribute("appointhour", request.getParameter("appointhour"));
		request.setAttribute("resertype", request.getParameter("resertype"));

		return "examinerresult";

	}

	@RequestMapping("/exresult") // 선생님선택
	public String exresult(HttpSession session, Principal principal, HttpServletRequest request, Model model,
			ReserDTO rdto) throws Throwable {

		ReservationDao rdao = sqlSession.getMapper(ReservationDao.class);

		SimpleDateFormat fmt_in = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat fmt_out = new SimpleDateFormat("EEE", Locale.ENGLISH);
		String date_in = request.getParameter("appointday");
		ParsePosition pos = new ParsePosition(0);
		java.util.Date outTime = fmt_in.parse(date_in, pos);
		String date_out = fmt_out.format(outTime);
		System.out.println(date_out);

		int appointtime = Integer.parseInt(request.getParameter("appointtime")) * 100;
		int categoryprice = 50000;

		String memberid = principal.getName();
		System.out.println(memberid + "아이디");
		rdto.setMemberid(memberid);
		String resertype = request.getParameter("resertype");
		rdto.setMemberconsult("offline");

		rdto.setAppointweek(date_out);

		rdto.setAppointcheck("waiting");

		rdto.setAppointtime(appointtime);

		rdto.setCategoryprice(categoryprice);
		rdto.setResertype(resertype);

		rdao.insert(rdto);

		return "redirect:reserManage_Member";

	}

}
