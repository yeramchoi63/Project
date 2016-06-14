package com.kosta.simli.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kosta.simli.dao.MypageDAO;
import com.kosta.simli.dao.OnlineboardDAO;
import com.kosta.simli.dto.OnlineboardDTO;
import com.kosta.simli.dto.ReserDTO;

@Controller
public class MypageController {

	@Autowired
	private SqlSession sqlSession;

	@RequestMapping("/employeepage_view")
	public String employeepage_view(Model model, Principal principal) throws Exception {

		MypageDAO dao = sqlSession.getMapper(MypageDAO.class);
		model.addAttribute("list", dao.employeepage_view(principal.getName()));
		return "mem.mypage.employeepage_view";
	}

	@RequestMapping("/reserManage")
	public String postsearchAppointdaySchedule(Model model, HttpServletRequest request, Principal principal)
			throws Throwable {
		MypageDAO mypageDao = sqlSession.getMapper(MypageDAO.class);

		String appointday = request.getParameter("year") + "-" + request.getParameter("month") + "-"
				+ request.getParameter("day");
		System.out.println(appointday);
		List<ReserDTO> list;

		String yearcheck = request.getParameter("year");
		String monthcheck = request.getParameter("month");
		String daycheck = request.getParameter("day");

		if (yearcheck == null || yearcheck == "" || monthcheck == null || monthcheck == "" || daycheck == null
				|| daycheck == "") {
			String id = principal.getName();
			System.out.println("id : " + id);
			list = mypageDao.reserEmployeeList(id).isEmpty() ? mypageDao.reserMemberList(id)
					: mypageDao.reserEmployeeList(id);

		} else {
			list = mypageDao.searchAppointdaySchedule(appointday);
		}

		model.addAttribute("reserEmployeeList", list);
		System.out.println(appointday);
		return "mem.mypage.reserManage";
	}

	@RequestMapping("/ajax_employee_scheduleCheck")
	public String employee_scheduleCheck(Model model, Principal principal) throws Throwable {
		MypageDAO mypageDao = sqlSession.getMapper(MypageDAO.class);
		System.out.println(principal.getName());
		model.addAttribute("list", mypageDao.employee_scheduleCheck(principal.getName()));
		System.out.println(model);
		return "ajax.mem.mypage.employee_scheduleCheck";
	}

	@RequestMapping("/reserManage_Employee_UpdateForm")
	public String reserManage_Teacher_UpdateForm(HttpServletRequest request) throws Throwable {
		int reNum = Integer.parseInt(request.getParameter("reNum"));
		String reRef = request.getParameter("reRef");
		request.setAttribute("reNum", reNum);
		request.setAttribute("reRef", reRef);
		return "popup.mypage.reserManage_Employee_UpdateForm";
	}

	@RequestMapping("/reserManage_Employee_Update")
	public String reserManage_Teacher_Update(HttpServletRequest request) throws Throwable {
		MypageDAO mypageDao = sqlSession.getMapper(MypageDAO.class);
		int reNum = Integer.parseInt(request.getParameter("reNum"));
		String reRef = request.getParameter("reRef");
		mypageDao.reserManage_Employee_Update(reRef, reNum);
		return "mem.mypage.reserManage_Employee_UpdateComplete";
	}

	@RequestMapping("/reserDelete")
	public String reserDelete(Model model, HttpServletRequest request) throws Throwable {
		MypageDAO mypageDao = sqlSession.getMapper(MypageDAO.class);
		int reNum = Integer.parseInt(request.getParameter("reNum"));
		mypageDao.reserDelete(reNum);
		return "redirect:reserManage";
	}

	@RequestMapping("/payConfirm_Employee")
	public String payConfirm_Employee() throws Throwable {
		return "mem.mypage.payConfirm_Employee";
	}

	@RequestMapping("/payConfirm_Employee_Detail")
	public String payConfirm_Employee_Detail(Principal principal, HttpServletRequest request) throws Throwable {

		MypageDAO mypageDao = sqlSession.getMapper(MypageDAO.class);
		String id = principal.getName();
		String part = mypageDao.payConfirmPartCheck(id);
		String year = request.getParameter("year");
		String month = request.getParameter("month");

		int payAllAmount = 0; // 세금 빼지않은 총수당.
		int payTax = 0; // 세금
		int payRealAmount = 0; // 세금 뺀 총수당.
		int payAllPrice = 0; // 합계 금액

		// 개인/집단/심리 금액
		int indiviPrice = 100000;
		int groupPrice = 150000;
		int examinePrice = 400000;
		int therapyPrice = 100000;

		// 개인/집단/심리 수당
		int indiviAllowance = 50000;
		int groupAllowance = 75000;
		int examineAllowance = 200000;
		int therapyAllowance = 50000;

		int monthTemp = Integer.parseInt(month);
		// 입력받을때 5월은 05로 받지않고 5로받기때문에 sql에서 안먹힘..그걸위한것.
		if (monthTemp / 10 == 0) {
			month = "0" + month;
		}
		if (part.equals("상담사")) {

			int indiviConsultCount = mypageDao.IndiviConsultCount(id, year, month);
			int indiviTherapyCount = mypageDao.IndiviTherapyCount(id, year, month);
			int groupConsultCount = mypageDao.groupConsultCount(id, year, month);
			int groupTherapyCount = mypageDao.groupTherapyCount(id, year, month);
			int examinationCount = mypageDao.examinationCount(id, year, month);

			payAllAmount = (indiviConsultCount + indiviTherapyCount) * indiviAllowance
					+ (groupConsultCount + groupTherapyCount) * groupAllowance + (examinationCount * examineAllowance);

			payTax = (int) (payAllAmount * 0.033);

			payAllPrice = (indiviConsultCount + indiviTherapyCount) * indiviPrice
					+ (groupConsultCount + groupTherapyCount) * groupPrice + (examinationCount * examinePrice);

			payRealAmount = payAllAmount - payTax;

			request.setAttribute("indiviConsultCount", indiviConsultCount);
			request.setAttribute("indiviTherapyCount", indiviTherapyCount);
			request.setAttribute("groupConsultCount", groupConsultCount);
			request.setAttribute("groupTherapyCount", groupTherapyCount);
			request.setAttribute("examinationCount", examinationCount);

		} else if (part.equals("치료사")) {

			int therapistTherapyCount = mypageDao.therapistTherapyCount(id, year, month);

			payAllAmount = therapistTherapyCount * therapyAllowance;
			payAllPrice = therapistTherapyCount * therapyPrice;
			payTax = (int) (payAllAmount * 0.033);
			payRealAmount = payAllAmount - payTax;

			request.setAttribute("therapistTherapyCount", therapistTherapyCount);

		}

		request.setAttribute("indiviPrice", indiviPrice);
		request.setAttribute("groupPrice", groupPrice);
		request.setAttribute("examinePrice", examinePrice);
		request.setAttribute("therapyPrice", therapyPrice);

		request.setAttribute("indiviAllowance", indiviAllowance);
		request.setAttribute("groupAllowance", groupAllowance);
		request.setAttribute("examineAllowance", examineAllowance);
		request.setAttribute("therapyAllowance", therapyAllowance);

		request.setAttribute("payAllPrice", payAllPrice);
		request.setAttribute("payAllAmount", payAllAmount);
		request.setAttribute("payTax", payTax);
		request.setAttribute("payRealAmount", payRealAmount);

		request.setAttribute("part", part);
		return "payConfirm_Employee_Detail";
	}

	@RequestMapping("/payResultConfirm_Employee")
	public String payResultConfirm_Employee() throws Throwable {
		return "mem.mypage.payResultConfirm_Employee";
	}

	@RequestMapping("/payResultConfirm_Employee_Detail")
	public String payResultConfirm_Employee_Detail(Principal principal, HttpServletRequest request) throws Throwable {

		MypageDAO mypageDao = sqlSession.getMapper(MypageDAO.class);
		String id = principal.getName();
		String part = mypageDao.payConfirmPartCheck(id);
		String year = request.getParameter("year");
		String month;
		int strI; // for문의 i값을 String형으로 바꿔서 넣어놀 변수.

		int[] payAllAmount = new int[12];
		int[] payTax = new int[12];
		int[] payRealAmount = new int[12];
		int payRealAmountSum = 0;

		// 개인/집단/심리 수당
		int indiviAllowance = 50000;
		int groupAllowance = 75000;
		int examineAllowance = 200000;
		int therapyAllowance = 50000;

		if (part.equals("상담사")) {

			int[] indiviConsultCount = new int[12];
			int[] indiviTherapyCount = new int[12];
			int[] groupConsultCount = new int[12];
			int[] groupTherapyCount = new int[12];
			int[] examinationCount = new int[12];

			int indiviConsultCountSum = 0;
			int indiviTherapyCountSum = 0;
			int groupConsultCountSum = 0;
			int groupTherapyCountSum = 0;
			int examinationCountSum = 0;

			for (int i = 0; i < 12; i++) {
				strI = i + 1;
				Integer.toString(strI);
				if ((i + 1) / 10 == 0) { // (i+1)이 한자리 숫자이면 0을 붙여준다.
					month = "0" + strI;
				} else {
					month = "" + strI;
				}

				indiviConsultCount[i] = mypageDao.IndiviConsultCount(id, year, month);
				indiviTherapyCount[i] = mypageDao.IndiviTherapyCount(id, year, month);
				groupConsultCount[i] = mypageDao.groupConsultCount(id, year, month);
				groupTherapyCount[i] = mypageDao.groupTherapyCount(id, year, month);
				examinationCount[i] = mypageDao.examinationCount(id, year, month);

				indiviConsultCountSum += indiviConsultCount[i];
				indiviTherapyCountSum += indiviTherapyCount[i];
				groupConsultCountSum += groupConsultCount[i];
				groupTherapyCountSum += groupTherapyCount[i];
				examinationCountSum += examinationCount[i];

				payAllAmount[i] = (indiviConsultCount[i] + indiviTherapyCount[i]) * indiviAllowance
						+ (groupConsultCount[i] + groupTherapyCount[i]) * groupAllowance
						+ (examinationCount[i] * examineAllowance);
				payTax[i] = (int) (payAllAmount[i] * 0.033);
				payRealAmount[i] = payAllAmount[i] - payTax[i];
				payRealAmountSum += payRealAmount[i];
			}

			request.setAttribute("indiviConsultCount", indiviConsultCount);
			request.setAttribute("indiviTherapyCount", indiviTherapyCount);
			request.setAttribute("groupConsultCount", groupConsultCount);
			request.setAttribute("groupTherapyCount", groupTherapyCount);
			request.setAttribute("examinationCount", examinationCount);

			request.setAttribute("indiviConsultCountSum", indiviConsultCountSum);
			request.setAttribute("indiviTherapyCountSum", indiviTherapyCountSum);
			request.setAttribute("groupConsultCountSum", groupConsultCountSum);
			request.setAttribute("groupTherapyCountSum", groupTherapyCountSum);
			request.setAttribute("examinationCountSum", examinationCountSum);

		} else if (part.equals("치료사")) {

			int[] therapistTherapyCount = new int[12];
			int therapistTherapyCountSum = 0;

			for (int i = 0; i < 12; i++) {
				strI = i + 1;
				Integer.toString(strI);
				if ((i + 1) / 10 == 0) { // (i+1)이 한자리 숫자이면 0을 붙여준다.
					month = "0" + strI;
				} else {
					month = "" + strI;
				}

				therapistTherapyCount[i] = mypageDao.therapistTherapyCount(id, year, month);
				therapistTherapyCountSum += therapistTherapyCount[i];

				payAllAmount[i] = therapistTherapyCount[i] * therapyAllowance;
				payTax[i] = (int) (payAllAmount[i] * 0.033);
				payRealAmount[i] = payAllAmount[i] - payTax[i];
				payRealAmountSum += payRealAmount[i];
			}
			request.setAttribute("therapistTherapyCount", therapistTherapyCount);
			request.setAttribute("therapistTherapyCountSum", therapistTherapyCountSum);

		}

		request.setAttribute("payAllAmount", payAllAmount);
		request.setAttribute("payTax", payTax);
		request.setAttribute("payRealAmount", payRealAmount);
		request.setAttribute("payRealAmountSum", payRealAmountSum);

		request.setAttribute("part", part);
		return "payResultConfirm_Employee_Detail";
	}

	@RequestMapping("/ajax_reserManage")
	public String searchAppointdaySchedule(Model model, HttpServletRequest request, Principal principal)
			throws Throwable {
		MypageDAO mypageDao = sqlSession.getMapper(MypageDAO.class);

		String id = principal.getName();
		System.out.println("sdfsdf" + id);
		List<ReserDTO> list = mypageDao.reserEmployeeList(id).isEmpty() ? mypageDao.reserMemberList(id)
				: mypageDao.reserEmployeeList(id);

		model.addAttribute("reserEmployeeList", list);

		return "ajax.mem.mypage.reserManage";
	}
}
