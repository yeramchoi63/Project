package com.kosta.simli.controller;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.security.Principal;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.kosta.simli.dao.FileUploadDAO;
import com.kosta.simli.dao.MemberDao;
import com.kosta.simli.dto.FileUploadDTO;

@Controller
public class FileController {

	@Autowired
	private SqlSession sqlSession;

	// 글등록 화면 처리
	@RequestMapping(value = "fileupload", method = RequestMethod.GET)
	public String fileuploadwrite(Principal principal,FileUploadDTO fdto,HttpServletRequest request) {
		FileUploadDAO fdao = sqlSession.getMapper(FileUploadDAO.class);
		System.out.println("글쓰기 매핑");
		String writer = principal.getName(); //상담아이디조회 (본인memberid)
		String categorypart = fdao.uploadlist(writer); //상담,검사
		String category = categorypart+"자";
		System.out.println("category는"+category);
		String part = fdao.membersearch(writer); //내담자,상담자,치료자 구별
		System.out.println("part는"+part);
		String employeeid = fdao.employeeidsearch(writer); //담당 선생님 찾기
		if(category==null&&part==null ){ //상담인지 검사인지 유무 or 상담/치료사인지 확인해서 둘중에 하나라도 없으면
			System.out.println("둘다아님");
			return "redirect:hellow_page";	
		}
		if(part != null){
				if(part.equals("상담자")){
					System.out.println("파트가 상담");
					writer = "상담자";
				}
				if(part.equals("치료자")){
					System.out.println("파트가 치료");
					writer = "치료자";
				}
		}
		request.setAttribute("categorypart", categorypart);
		request.setAttribute("writer", writer);
		request.setAttribute("category", category);
		request.setAttribute("employeeid", employeeid);
		return "book.upload.fileupload";
	}

	// 글등록 처리(실제 글등록 처리)
	@RequestMapping(value = "fileupload", method = RequestMethod.POST)
	public String FileController(FileUploadDTO fdto, HttpServletRequest request, Principal principal,Model model)
			throws IOException, ClassNotFoundException, SQLException {

		FileUploadDAO fdao = sqlSession.getMapper(FileUploadDAO.class);
		MemberDao mdao = sqlSession.getMapper(MemberDao.class); //

		String writer = request.getParameter("writer");
		System.out.println("id는"+writer);
		String category = request.getParameter("category");
		System.out.println("category는"+category);
		String employeeid = request.getParameter("employeeid");
		System.out.println("employeeid는"+employeeid);
		
		List<CommonsMultipartFile> files = fdto.getFiles();
		List<String> filenames = new ArrayList<String>(); // 파일명만 추출

		if (files != null && files.size() > 0) { // 업로드한 파일이 하나라도 있다면

			for (CommonsMultipartFile multipartfile : files) {

				String fname = multipartfile.getOriginalFilename(); // 파일명 얻기
				String path = request.getSession().getServletContext().getRealPath("/WEB-INF/views/book/upload");
				String fullpath = path + "\\" + fname;

				System.out.println(fname + " / " + path + " / " + fullpath);

				if (!fname.equals("")) {
					// 서버에 파일 쓰기 작업
					FileOutputStream fs = new FileOutputStream(fullpath);
					fs.write(multipartfile.getBytes());
					fs.close();
				}
				filenames.add(fname); // 실 DB Insert 작업시 .. 파일명
			}

		}

		// DB저장작업
		// DB 저장할 파일 명

		fdto.setFileSrc(filenames.get(0));
		fdto.setCategory(category);
		fdto.setWriter(writer);
		fdto.setEmployeeid(employeeid);
		FileUploadDAO filedao = sqlSession.getMapper(FileUploadDAO.class);
		filedao.insert(fdto);

		return "redirect:uploadlist";
	}

	@RequestMapping("download")
	public void download(String p, String f, HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		System.out.println("다운");

		String fname = new String(f.getBytes("ISO8859_1"), "UTF-8");

		System.out.println(fname);

		response.setHeader("Content-Disposition", "attachment;filename=" + fname + ";");

		String fullpath = request.getSession().getServletContext().getRealPath(p + "/WEB-INF/views/book/upload/" + f);

		FileInputStream fin = new FileInputStream(fullpath);
		ServletOutputStream sout = response.getOutputStream();
		byte[] buf = new byte[1024]; // 전체를 다읽지 않고 1204byte씩 읽어서
		int size = 0;
		while ((size = fin.read(buf, 0, buf.length)) != -1) // buffer 에 1024byte
		// 담고
		{ // 마지막 남아있는 byte 담고 그다음 없으면 탈출
			sout.write(buf, 0, size); // 1kbyte씩 출력
		}
		fin.close();
		sout.close();
	}


	@RequestMapping("/uploadlist") // 파일업로드 리스트
	public String fileuploadlist(Model model, Principal principal,HttpServletRequest request,FileUploadDTO fdto) throws Throwable {
		FileUploadDAO fdao = sqlSession.getMapper(FileUploadDAO.class);
		String writer = principal.getName(); //상담아이디조회 (본인memberid)
		String resertype = fdao.uploadlist(writer); //상담,검사 (예약테이블) 치료인지 상담인지 구별
		String category = resertype+"자";
		System.out.println("category는"+category);
		
		String part = fdao.membersearch(writer); //상담자,치료자 구별해주는것
		if(category==null&&part==null ){ //상담인지 검사인지 유무 or 상담/치료사인지 확인해서 둘중에 하나라도 없으면
			System.out.println("둘다아님");
			return "redirect:hellow_page";	
		}
		if(category.equals("상담자")||category.equals("치료자")){
			System.out.println("파트가 상담");
			model.addAttribute("list", fdao.list(writer,category));
		}
		if(part!=null){
			System.out.println("상담자,치료자");
			model.addAttribute("list", fdao.partlist(category,writer));
		}

		System.out.println(category+"category");

		return "book.upload.uploadlist";
	}

	@RequestMapping("/content") // 상세보기
	public String content(HttpServletRequest request, Model model, FileUploadDTO fdto) throws Throwable {
		FileUploadDAO fdao = sqlSession.getMapper(FileUploadDAO.class);
		fdto.setNum(Integer.parseInt(request.getParameter("num")));
		model.addAttribute("contentview", fdao.content(fdto));
		return "book.upload.content";
	}
	

	@RequestMapping("/u_delete") // 파일업로드 삭제
	public String UploadDelete(HttpServletRequest request, Model model, FileUploadDTO fdto, Principal principal) throws Throwable {
		FileUploadDAO fdao = sqlSession.getMapper(FileUploadDAO.class);
		String writer = principal.getName(); 
		System.out.println(writer);
		int num = Integer.parseInt(request.getParameter("num"));
		String id = fdao.writersearch(num);
		System.out.println("id는"+id);
		if(!id.equals(writer)){
			return "redirect:uploadlist";
		}
		else{
			fdao.u_delete(writer,num);
		}
		return "redirect:uploadlist";
	}
	

	@RequestMapping("/u_modify") // 파일업로드 수정
	public String UploadModify(HttpServletRequest request, Model model, FileUploadDTO fdto,Principal principal) throws Throwable {
		FileUploadDAO fdao = sqlSession.getMapper(FileUploadDAO.class);
		fdto.setNum(Integer.parseInt(request.getParameter("num")));
		model.addAttribute("contentview", fdao.content(fdto));
		return "book.upload.content";
	}
	
	

}
