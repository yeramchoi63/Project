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

import com.kosta.simli.dao.AdminDAO;
import com.kosta.simli.dto.MemberDto;
import com.kosta.simli.dto.ReserDTO;

@Controller
public class AdminController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/adminjoin_view")
	public String adminjoin_view() throws Exception {

		return "admin.admin_member.adminjoin_view";
	}
	
		@RequestMapping(value = "admin_join", method = RequestMethod.POST)
		public String admin_join(Model model, HttpServletRequest request, MemberDto dto) throws Exception {


			String phone = request.getParameter("phone1") + "-" + request.getParameter("phone2") + "-"
					+ request.getParameter("phone3");

			dto.setId(request.getParameter("id"));
			dto.setPwd(request.getParameter("pwd"));
			dto.setName(request.getParameter("name"));
			dto.setEmail(request.getParameter("email"));
			dto.setPhone(phone);
			dto.setBirth(request.getParameter("birth"));
			dto.setGender(request.getParameter("gender"));
			dto.setAddr(request.getParameter("addr"));
			dto.setTherapy1(request.getParameter("therapy1"));
			dto.setTherapy2(request.getParameter("therapy2"));
			dto.setTherapy3(request.getParameter("therapy3"));
			dto.setPart(request.getParameter("part"));
			

			AdminDAO dao = sqlSession.getMapper(AdminDAO.class);

			dao.admin_join(dto);
			dao.schedule_join(dto);
			// 권한부여

			dao.adminRole_join(dto.getId(), "ROLE_PKEMPLOYEE");
			dao.adminRole_join(dto.getId(), "ROLE_EMPLOYEE");
			dao.adminRole_join(dto.getId(), "ROLE_USER");

			model.addAttribute("list", dao.adminmember_list());
			
			return "admin.admin_member.adminmember_list";
		}
	
	@RequestMapping("/adminpage_view")
	public String adminpage_view(Model model, Principal principal) throws Exception {

		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);
		model.addAttribute("list", dao.adminpage_view(principal.getName()));

		return "admin.admin_member.adminpage_view";
	}
	
	@RequestMapping("adminmember_content")
	public String member_content(Model model, Principal principal, HttpServletRequest request, MemberDto dto)
			throws Exception {

		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);
		model.addAttribute("list", dao.adminmember_content(request.getParameter("id")));

		return "admin.admin_member.adminmember_content";
	}
	
	@RequestMapping("/adminmodify_view")
	public String adminmodify_view(Model model, HttpServletRequest request, Principal principal, String id) throws Exception {

		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);
		model.addAttribute("list", dao.adminmodify_view(principal.getName()));

		String phone = dao.adminmember_phone(principal.getName());
		String[] str = phone.split("-");

		model.addAttribute("phone1", str[0]);
		model.addAttribute("phone2", str[1]);
		model.addAttribute("phone3", str[2]);

		return "admin.admin_member.adminmodify_view";
	}
	
	@RequestMapping("/adminmlistmodify_view")
	public String adminmlistmodify_view(Model model, HttpServletRequest request, Principal principal, String id) throws Exception {

		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);
		model.addAttribute("list", dao.adminmodify_view(request.getParameter("id")));

		String phone = dao.adminmember_phone(request.getParameter("id"));
		String[] str = phone.split("-");

		model.addAttribute("phone1", str[0]);
		model.addAttribute("phone2", str[1]);
		model.addAttribute("phone3", str[2]);

		return "admin.admin_member.adminmodify_view";
	}
	
	@RequestMapping(value = "adminmember_modify", method = RequestMethod.POST)
	public String adminmember_modify(Model model, Principal principal, HttpServletRequest request, MemberDto dto)
			throws Exception {

		String phone = request.getParameter("phone1") + "-" + request.getParameter("phone2") + "-"
				+ request.getParameter("phone3");

		dto.setId(request.getParameter("id"));
		dto.setName(request.getParameter("name"));
		dto.setPwd(request.getParameter("pwd"));
		dto.setEmail(request.getParameter("email"));
		dto.setPhone(phone);
		dto.setBirth(request.getParameter("birth"));
		dto.setAddr(request.getParameter("addr"));
		dto.setTherapy1(request.getParameter("therapy1"));
		dto.setTherapy2(request.getParameter("therapy2"));
		dto.setTherapy3(request.getParameter("therapy3"));
		dto.setPart(request.getParameter("part"));

		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);

		dao.adminmember_modify(dto);

		model.addAttribute("list", dao.adminmember_content(request.getParameter("id")));

		return "admin.admin_member.adminmember_content";
	}
	
	@RequestMapping("/adminmember_list")
	public String adminmember_list(Model model) throws Exception {

		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);
		model.addAttribute("list", dao.adminmember_list());

		return "admin.admin_member.adminmember_list";
	}
	
	@RequestMapping("/employeemember_list")
	public String employeemember_list(Model model) throws Exception {

		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);
		model.addAttribute("list", dao.employeemember_list());

		return "admin.admin_member.employeemember_list";
	}
	
	@RequestMapping("/usermember_list")
	public String usermember_list(Model model) throws Exception {

		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);
		model.addAttribute("list", dao.usermember_list());

		return "admin.admin_member.usermember_list";
	}
	
	@RequestMapping("/adminmlist_delete")
	public String adminmlist_delete(Model model, HttpServletRequest request, MemberDto dto) {

		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);
		
		dto.setId(request.getParameter("id"));
		dao.adminmlist_delete(dto);
		dao.adminmrole_delete(dto);
		dao.schedule_delete(dto.getId());

		model.addAttribute("list", dao.adminmember_list());

		return "admin.admin_member.adminmember_list";
	}
	
	@RequestMapping("/sales_pay")
	public String sales_pay() {

		return "admin.admin_sales.sales_pay";
	}

	@RequestMapping("/user_Money")
	public String user_Money() {
		return "admin.admin_sales.user_Money";
	}
	
	@RequestMapping("/user_Money_Detail")
	public String user_Money_Detail(Model model,HttpServletRequest request) {
		
		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);
		
		String year =  request.getParameter("year"); //ajax로 값을 받아온 변수
		String month = request.getParameter("month"); //ajax로 값을 받아온 변수
		
		int categoryPriceSum = 0;
		
		if(month.equals("null")) { //연도별 내담자 지불 리스트
			
			model.addAttribute("list", dao.userMoneyYearList(year));
			
			List<ReserDTO> categoryPriceList = dao.userMoneyYearList(year);			
			for (int i = 0; i < categoryPriceList.size(); i++) {
				categoryPriceSum += categoryPriceList.get(i).getCategoryprice();
			}			
		}else { //연도,월별 내담자 지불 리스트				
			int Tmonth= Integer.parseInt(month);			
			if(Tmonth/10==0 && Tmonth!=10) { 
				month = "0"+month;
			}else{
				month = ""+month;
			}
			
			model.addAttribute("list", dao.userMoneyMonthList(year,month));
			
			List<ReserDTO> categoryPriceList = dao.userMoneyMonthList(year,month);
			for (int i = 0; i < categoryPriceList.size(); i++) {
				categoryPriceSum += categoryPriceList.get(i).getCategoryprice();
			}
		}	
		
		request.setAttribute("categoryPriceSum", categoryPriceSum);
		
		return "user_Money_Detail";
	}
	
	@RequestMapping("/admin_Sales")
	public String admin_Sales() {
		
		return "admin.admin_sales.admin_Sales";
	}

	@RequestMapping("/admin_Sales_Detail") //관리자모드_매출
	public String admin_Sales_Detail(HttpServletRequest request) {
		
		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);
		
		String year =  request.getParameter("year"); //ajax로 값을 받아온 변수
		String highlightMonth = request.getParameter("month"); //ajax로 값을 받아온 변수
		String month;
		int strI;
		
		List<MemberDto> counselorList  = dao.employeeNameList("상담사"); //part가 상담사인 직원 이름 리스트.
		List<MemberDto> therapistList  = dao.employeeNameList("치료사"); //part가 치료사인 직원 이름 리스트.
		//int[] categoryPrice; //한 명의 상담자 categoryPrice들 담아놓을 그릇.
		int[][] cMonthSum = new int[counselorList.size()][12]; //categoryPrice 1월,2월.. 달별로 담아놓을 그릇.
		int[][] tMonthSum = new int[therapistList.size()][12];
		
		int[] cMonthSumAll = new int[counselorList.size()]; //상담사별 연매출
		int[] tMonthSumAll = new int[therapistList.size()];
		
		int[] allCMonthSum = new int[12];
		int[] allTMonthSum = new int[12];
		
		int allCMonthSumAll = 0; //모든 상담사들의 연매출.
		int allTMonthSumAll = 0; //모든 치료사들의 연매출.
		
		int[] allEMonthSum = new int[12]; //모든 직원들의 월매출
		int allEMonthSumAll = 0; // 모든 직원들의 연간 총매출

		////////////////상담자 매출
		for (int i = 0; i < counselorList.size(); i++) { //상담자 수 만큼 반복..	
			for (int j = 0; j < 12; j++) {				
				strI = j+1;
				Integer.toString(strI);
				if((j+1)/10==0 && (j+1)!=10) { //(i+1)이 한자리 숫자이면 0을 붙여준다.
					month = "0"+strI;
				}
				else {
					month = ""+strI;
				}	
				List<Integer> categoryPriceMonthList;
				categoryPriceMonthList = dao.categoryPriceMonthList(counselorList.get(i).getId(),year,month); //해당하는 달 categoryprice 셀렉트.
				for (int k = 0; k < categoryPriceMonthList.size(); k++) {
					cMonthSum[i][j] += categoryPriceMonthList.get(k);
				}//for k end
			}//for j end
		}//for i end
		for (int i = 0; i < cMonthSumAll.length; i++) {
			for (int j = 0; j < 12; j++) {
				cMonthSumAll[i] += cMonthSum[i][j];
			}
		}
		for (int i = 0; i < 12; i++) {
			for (int j = 0; j < counselorList.size(); j++) {
				allCMonthSum[i] += cMonthSum[j][i];
			}
			allCMonthSumAll += allCMonthSum[i];
		}
		////////////////치료사 매출
		for (int i = 0; i < therapistList.size(); i++) { //치료자 수 만큼 반복..		
			for (int j = 0; j < 12; j++) {				
				strI = j+1;
				Integer.toString(strI);
				if((j+1)/10==0 && (j+1)!=10) { //(i+1)이 한자리 숫자이면 0을 붙여준다.
					month = "0"+strI;
				}
				else {
					month = ""+strI;
				}	
				List<Integer> categoryPriceMonthList;
				categoryPriceMonthList = dao.categoryPriceMonthList(therapistList.get(i).getId(),year,month); //해당하는 달 categoryprice 셀렉트.
				for (int k = 0; k < categoryPriceMonthList.size(); k++) {
					tMonthSum[i][j] += categoryPriceMonthList.get(k);
				}//for k end
			}//for j end
		}//for i end
		for (int i = 0; i < tMonthSumAll.length; i++) {
			for (int j = 0; j < 12; j++) {
				tMonthSumAll[i] += tMonthSum[i][j];
			}
		}	
		for (int i = 0; i < 12; i++) {
			for (int j = 0; j < therapistList.size(); j++) {
				allTMonthSum[i] += tMonthSum[j][i];
			}
			allTMonthSumAll += allTMonthSum[i];
		}
		
		
		for (int i = 0; i < 12; i++) {
			allEMonthSum[i] = allCMonthSum[i] + allTMonthSum[i];
			allEMonthSumAll += allEMonthSum[i];
		}
		
		request.setAttribute("counselorList", counselorList);
		request.setAttribute("therapistList", therapistList);
		request.setAttribute("cMonthSum", cMonthSum);
		request.setAttribute("tMonthSum", tMonthSum);
		request.setAttribute("cMonthSumAll", cMonthSumAll);
		request.setAttribute("tMonthSumAll", tMonthSumAll);
		request.setAttribute("allCMonthSum", allCMonthSum);
		request.setAttribute("allTMonthSum", allTMonthSum);
		request.setAttribute("allCMonthSumAll", allCMonthSumAll);
		request.setAttribute("allTMonthSumAll", allTMonthSumAll);
		request.setAttribute("allEMonthSum", allEMonthSum);
		request.setAttribute("allEMonthSumAll", allEMonthSumAll);
		request.setAttribute("highlightMonth", highlightMonth);

		return "admin_Sales_Detail";
	}
	
	@RequestMapping("/Employee_Pay")
	public String Employee_Pay() {
		
		return "admin.admin_sales.Employee_Pay";
	}
	
	@RequestMapping("/Employee_Pay_Detail")
	public String Employee_Pay_Detail(HttpServletRequest request) {
		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);
		
		String year =  request.getParameter("year"); //ajax로 값을 받아온 변수
		String highlightMonth = request.getParameter("month"); //ajax로 값을 받아온 변수
		String month;
		int strI;
		
		List<MemberDto> counselorList  = dao.employeeNameList("상담사"); //part가 상담사인 직원 이름 리스트.
		List<MemberDto> therapistList  = dao.employeeNameList("치료사"); //part가 치료사인 직원 이름 리스트.
		//int[] categoryPrice; //한 명의 상담자 categoryPrice들 담아놓을 그릇.
		int[][] cMonthSum = new int[counselorList.size()][12]; //categoryPrice 1월,2월.. 달별로 담아놓을 그릇.
		int[][] tMonthSum = new int[therapistList.size()][12];
		
		int[] cMonthSumAll = new int[counselorList.size()]; //상담사별 연매출
		int[] tMonthSumAll = new int[therapistList.size()];
		
		int[] allCMonthSum = new int[12];
		int[] allTMonthSum = new int[12];
		
		int allCMonthSumAll = 0; //모든 상담사들의 연매출.
		int allTMonthSumAll = 0; //모든 치료사들의 연매출.
		
		int[] allEMonthSum = new int[12]; //모든 직원들의 월매출
		int allEMonthSumAll = 0; // 모든 직원들의 연간 총매출

		////////////////상담자 매출
		for (int i = 0; i < counselorList.size(); i++) { //상담자 수 만큼 반복..	
			for (int j = 0; j < 12; j++) {				
				strI = j+1;
				Integer.toString(strI);
				if((j+1)/10==0 && (j+1)!=10) { //(i+1)이 한자리 숫자이면 0을 붙여준다.
					month = "0"+strI;
				}
				else {
					month = ""+strI;
				}	
				List<Integer> categoryPriceMonthList;
				categoryPriceMonthList = dao.categoryPriceMonthList(counselorList.get(i).getId(),year,month); //해당하는 달 categoryprice 셀렉트.
				for (int k = 0; k < categoryPriceMonthList.size(); k++) {
					cMonthSum[i][j] += categoryPriceMonthList.get(k);
				}//for k end
			}//for j end
		}//for i end
		for (int i = 0; i < cMonthSumAll.length; i++) {
			for (int j = 0; j < 12; j++) {
				cMonthSumAll[i] += cMonthSum[i][j];
			}
		}
		for (int i = 0; i < 12; i++) {
			for (int j = 0; j < counselorList.size(); j++) {
				allCMonthSum[i] += cMonthSum[j][i];
			}
			allCMonthSumAll += allCMonthSum[i];
		}
		////////////////치료사 매출
		for (int i = 0; i < therapistList.size(); i++) { //치료자 수 만큼 반복..		
			for (int j = 0; j < 12; j++) {				
				strI = j+1;
				Integer.toString(strI);
				if((j+1)/10==0 && (j+1)!=10) { //(i+1)이 한자리 숫자이면 0을 붙여준다.
					month = "0"+strI;
				}
				else {
					month = ""+strI;
				}	
				List<Integer> categoryPriceMonthList;
				categoryPriceMonthList = dao.categoryPriceMonthList(therapistList.get(i).getId(),year,month); //해당하는 달 categoryprice 셀렉트.
				for (int k = 0; k < categoryPriceMonthList.size(); k++) {
					tMonthSum[i][j] += categoryPriceMonthList.get(k);
				}//for k end
			}//for j end
		}//for i end
		for (int i = 0; i < tMonthSumAll.length; i++) {
			for (int j = 0; j < 12; j++) {
				tMonthSumAll[i] += tMonthSum[i][j];
			}
		}	
		for (int i = 0; i < 12; i++) {
			for (int j = 0; j < therapistList.size(); j++) {
				allTMonthSum[i] += tMonthSum[j][i];
			}
			allTMonthSumAll += allTMonthSum[i];
		}
		
		
		for (int i = 0; i < 12; i++) {
			allEMonthSum[i] = allCMonthSum[i] + allTMonthSum[i];
			allEMonthSumAll += allEMonthSum[i];
		}
		
		request.setAttribute("counselorList", counselorList);
		request.setAttribute("therapistList", therapistList);
		request.setAttribute("cMonthSum", cMonthSum);
		request.setAttribute("tMonthSum", tMonthSum);
		request.setAttribute("cMonthSumAll", cMonthSumAll);
		request.setAttribute("tMonthSumAll", tMonthSumAll);
		request.setAttribute("allCMonthSum", allCMonthSum);
		request.setAttribute("allTMonthSum", allTMonthSum);
		request.setAttribute("allCMonthSumAll", allCMonthSumAll);
		request.setAttribute("allTMonthSumAll", allTMonthSumAll);
		request.setAttribute("allEMonthSum", allEMonthSum);
		request.setAttribute("allEMonthSumAll", allEMonthSumAll);
		request.setAttribute("highlightMonth", highlightMonth);
		
		return "Employee_Pay_Detail";
	}
	
	@RequestMapping("/scheduleCheck")
	public String scheduleCheck(Model model) throws Throwable {
		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);
		model.addAttribute("scheduleList",dao.scheduleList());
		return "admin.admin_schedule.scheduleCheck";
	}
	
	@RequestMapping("/employee_schedule")
	public String employee_schedule() {

		return "admin.admin_schedule.employee_schedule";
	}
	
	@RequestMapping("/bookingCheck")
	public String bookingCheck() {

		return "admin.admin_schedule.bookingCheck";
	}
	
}
