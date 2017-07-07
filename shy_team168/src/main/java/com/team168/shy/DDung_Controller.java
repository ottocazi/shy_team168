package com.team168.shy;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.team168.shy.model.ShyMemberVO;
import com.team168.shy.service.DDung_Service;
import com.team168.shy.service.Juno_Service;


@Controller
@Component
public class DDung_Controller {

	@Autowired
	private DDung_Service service;
	
	@Autowired
	private Juno_Service jservice;
	
	@RequestMapping(value="/logo.shy", method={RequestMethod.GET})
	public String userpage(HttpServletRequest req, HttpSession session) {
		 
		return "shy_logo.notiles";
	}
	
	
	@RequestMapping(value="/mainline.shy", method={RequestMethod.GET})
	public String mainline(HttpServletRequest req, HttpSession session) {

		Object loginuser = session.getAttribute("loginuser");
		ShyMemberVO smvo = (ShyMemberVO)loginuser;
		session.setAttribute("loginuser", smvo);
		
		if(smvo==null){
			
			System.out.println("null이오");
			req.setAttribute("type", "question");
			req.setAttribute("msg", "활동이 감지되지 않아 로그아웃되었습니다.  :)");
			req.setAttribute("loc", req.getContextPath()+"/");
			return "ddung_alert.notiles";
			
		}
		
		// 로그인 유저의 팔로우 명단 가져오기 
		List <String> followlist = service.followlist(smvo.getIdx());
		

		// 팔로워 명단에 내 계정도 추가해서 내 계정의 글들도 같이 볼수 있도록 하기
		String myIdx = Integer.toString(smvo.getIdx());
		System.out.println("myIdx = "+ myIdx);
		followlist.add(myIdx);
		
		System.out.println("followlist의 사이즈 = "+followlist.size());
		
		// 팔로워들 + 나의 샤이 가져오기 , 유저정보 가져오기(join?), 
		List <HashMap<String, String>> shies = service.getmainshy(followlist);
		
		if(shies!=null){
			for(int i =0 ; i<shies.size(); i++){
				
				
				// 가져온 샤이의 메인 정보를 가져 오는 동안 image, 친구태그, 지역태그 유무의 status를 확인하여 그 값을 추가하거나 null값을 부여한다.
				// 페이징 처리 미완성
				if("1".equals(shies.get(i).get("simage"))){
					
					String snsno = shies.get(i).get("snsno");
					System.out.println("snsno = "+snsno);
					String imagefile = service.imgaddr(snsno);
					
					System.out.println("해시맵에 담기 직전의 파일명(중요) : ");
					shies.get(i).put("imageaddr", imagefile);
					
				}
				
				else if("0".equals(shies.get(i).get("simage"))){
					shies.get(i).put("imageaddr", null);
				}
				
				System.out.println("shies.simage : "+shies.get(i).get("simage"));
				System.out.println("shies에 들어간 imageaddr = " + shies.get(i).get("imageaddr"));
			}
		
		}
		
		
		req.setAttribute("shies", shies);
		return "ddung/mainLine.tiles";
    	
    }
	
	@RequestMapping(value="/shynow.shy", method={RequestMethod.POST})
    public String shynow(MultipartHttpServletRequest req, HttpSession session) throws IOException {

		Object loginuser = session.getAttribute("loginuser");
		ShyMemberVO smvo = (ShyMemberVO)loginuser;
		int iidx = smvo.getIdx();
		System.out.println("iidx"+iidx);
		
		String idx = req.getParameter("userseq");
		String content = req.getParameter("content");
		String ftag = req.getParameter("ftag");
		String publicyn = req.getParameter("status");
		String shyplace = req.getParameter("shyplace");
		
		
		/*String image = req.getMultipartContentType("image");
		System.out.println("image = " + image);*/
		
		MultipartFile imagefile = req.getFile("image");
		byte[] imagebytes = imagefile.getBytes();
		int bytesize = imagebytes.length;
		System.out.println("bytesize는 ***"+bytesize);
		
		String newFilename ="";
		
		if(bytesize==0){
			imagefile = null;
		}
		
		
		else {
		String fileExt = imagefile.getOriginalFilename();
		
		String rootpath = session.getServletContext().getRealPath("/");
		String path = rootpath + "resources" + File.separator + "images/shydb";
		
		//path = "C:/github_shy_team168/shy_team168/shy_team168/src/main/webapp/resources/images/shydb";
		path = req.getSession().getServletContext().getRealPath("/resources/images/shydb");
		path = req.getSession().getServletContext().getRealPath("/resources/images/shydb");
		
		System.out.println("rootpath : "+ rootpath);
		System.out.println("path : " +  path);
		System.out.println("req.getContextPath() : " + req.getContextPath());
		
		/*	/shy_team168/src/main/webapp/resources/images/shydb
		    C:\github_shy_team168\shy_team168\shy_team168\src\main\webapp\resources\images\shydb
			rootpath : C:\springworkspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\shy_team168\
			path : C:\springworkspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\shy_team168\resources\images/shydb*/
		
		newFilename = String.format("%1$tY%1$tm%1$td%1$tH%1$tM%1$tS", Calendar.getInstance());
		newFilename += System.nanoTime();
		newFilename += fileExt;
		System.out.println("newFilename = "+ newFilename);
		// 업로드할 경로가 존재하지 않는 경우 폴더를 생성 한다.
		File dir = new File(path);
		if(!dir.exists())
			dir.mkdirs();

		String pathname = path + File.separator + newFilename;

		FileOutputStream fos = new FileOutputStream(pathname);
		fos.write(imagebytes);
		fos.close();
		}
		
		String ftagstatus = "0";
		if(ftag!=null){
			ftagstatus = "1";
			
			//tag 테이블에 친구 값 insert
		}
		
		
		
		String staggeo = "0";
		if (shyplace!=null){
			staggeo = "1";
			
			// geo 테이블에 위치값 insert
		} 
		
		System.out.println("ftag = "+ftag);
		System.out.println("content = "+content);
		System.out.println("idx= "+idx);
		System.out.println("ftagstatus = "+ftagstatus);
		System.out.println("publicyn = "+publicyn);
		
		HashMap<String, String> shyform = new HashMap<String, String>();
		
		try {
			int iiidx = Integer.parseInt(idx);
			
			if (!(iiidx==iidx)){
			 	
			}
			
		} catch (NumberFormatException e) {
			
		}
		
		String simage = "0";
		if(imagefile!=null){
			simage = "1";
			
		}
		
		shyform.put("fk_idx", idx);
		shyform.put("scontent", content);
		shyform.put("stagfollow", ftagstatus);
		shyform.put("simage" , simage);
		shyform.put("staggeo", staggeo);
		shyform.put("publicyn", publicyn);
		
		service.shyup(shyform);
		
		
		HashMap<String, String> shynow = service.getshynow(idx); // 업로드한 shy 값 추출
		System.out.println("저장된 scontent = "+shynow.get("scontent"));
		System.out.println("simage ==="+simage);
		if(simage.equals("1")){
			
			HashMap<String, String> parameters = new HashMap<String, String>();
			parameters.put("snsno", shynow.get("snsno"));
			System.out.println("이미지 테이블에 등록할 fk_snsno는  "+shynow.get("snsno"));
			parameters.put("filename", newFilename);
			System.out.println("등록할 이미지 파일명은 "+newFilename);
			service.insert_tbl_image(parameters);
			
		}
		
		if(ftagstatus.equals("1")){

			// 입력한 이름이 email 또는 이름과 같다면 fk_idx 로 없다면 그냥 일반 입력값으로 insert into
		}
		
		if(staggeo.equals("1")){
			String latitude = req.getParameter("latitude");
			String longditude= req.getParameter("longditude");
			String route =req.getParameter("route");
			String locality =req.getParameter("locality");
			String area1 =req.getParameter("area1");
			String postal_code =req.getParameter("postal_code");
			String country=	req.getParameter("country");
			String street_number = req.getParameter("street_number");
			
			HashMap<String,String> parameters = new HashMap<String, String>();
			
			if(latitude==null||country==null){
				parameters.put("fk_snsno", shynow.get("snsno"));
				parameters.put("shyplace", shyplace);
				parameters.put("latitude", "X");
				parameters.put("longditude", "X");
				parameters.put("route", "X");
				parameters.put("locality", "X");
				parameters.put("area1", "X");
				parameters.put("postal_code","X");
				parameters.put("country","X");
				parameters.put("street_number", "X");
				
			}
			
			else{
				parameters.put("fk_snsno", shynow.get("snsno"));
				parameters.put("shyplace", shyplace);
				parameters.put("latitude", latitude);
				parameters.put("longditude", longditude);
				parameters.put("route", route);
				parameters.put("locality", locality);
				parameters.put("area1", area1);
				parameters.put("postal_code",postal_code);
				parameters.put("country",country);
				parameters.put("street_number", street_number);
			}
			
			service.insertGeo(parameters);
			
			
		}
		
		
		
		req.setAttribute("loc", "mainline.shy");
		return "msg.notiles";
		
    	
    } 
	
	@RequestMapping(value="/myimgedit.shy", method={RequestMethod.POST})
    public String myimgedit(MultipartHttpServletRequest req, HttpSession session) throws IOException {
		
		ShyMemberVO loginuser = (ShyMemberVO)session.getAttribute("loginuser");
		System.out.println("loginuser의 이름 : " + loginuser.getName());
		
		int idx = loginuser.getIdx();
		
		String str_idx = req.getParameter("idx");
		String column_name = req.getParameter("column_name");
		
		String myimg = req.getMultipartContentType("myimg");
		System.out.println("myimg = " + myimg);
		
		MultipartFile imagefile = req.getFile("myimg");
		byte[] imagebytes = imagefile.getBytes();
		String fileExt = imagefile.getOriginalFilename();
		
		String rootpath = session.getServletContext().getRealPath("/");
		String path = req.getSession().getServletContext().getRealPath("/resources/images/shydb");
		/*path = req.getSession().getServletContext().getRealPath("/resources/images/shydb");*/
		
		System.out.println("rootpath : "+ rootpath);
		System.out.println("path : " +  path);
		System.out.println("req.getContextPath() : " + req.getContextPath());
    	
		String newFilename = String.format("%1$tY%1$tm%1$td%1$tH%1$tM%1$tS", Calendar.getInstance());
		newFilename += System.nanoTime();
		newFilename += fileExt;
		System.out.println("newFilename = "+ newFilename);
		// 업로드할 경로가 존재하지 않는 경우 폴더를 생성 한다.
		File dir = new File(path);
		if(!dir.exists())
			dir.mkdirs();

		String pathname = path + File.separator + newFilename;

		FileOutputStream fos = new FileOutputStream(pathname);
		fos.write(imagebytes);
		fos.close();
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("idx", str_idx);
    	map.put("column_name", column_name);
    	map.put("edited_content", newFilename);
    	
    	jservice.myInfoEditEnd(map);
		ShyMemberVO getMemberVO = jservice.getMemberVO(idx);
	       
        req.setAttribute("getMemberVO", getMemberVO);
	       
        req.setAttribute("loc", "myInfoEdit.shy");
		return "msg.notiles";
		
	}
	
	@RequestMapping(value="/auth.shy", method={RequestMethod.GET})
	public String accountenter(HttpServletRequest req, HttpSession session) throws IOException {
		
		return "ddung/shy_auth.tiles";
		
	}
	
	@RequestMapping(value="/m.shy", method={RequestMethod.GET})
	public String m(HttpServletRequest req, HttpSession session) throws IOException {
		
		return "ddung/mainLine2.tiles";
		
	}
	
	@RequestMapping(value="/insertreply.shy", method={RequestMethod.GET})
	@ResponseBody
	public String insertReply(HttpServletRequest req, HttpSession session) throws IOException {
		
		String myidx = req.getParameter("myidx");
		String shyidx = req.getParameter("shyidx");
		String replycontent = req.getParameter("replycontent");
		
		System.out.println(myidx+" 번 유저가");
		System.out.println(shyidx+" 번 글에");
		System.out.println(replycontent + " 내용의 댓글을 남깁니다.");
		
		HashMap<String, String> parameters = new HashMap<String, String>();
		parameters.put("fk_idx", myidx);
		parameters.put("snsno", shyidx);
		parameters.put("cmtcontent", replycontent);
		
		service.insertReply(parameters);
		
		String result = "댓글 입력 끝";
		
		return result;
		
		
	}
	
	@RequestMapping(value="/getComments.shy", method={RequestMethod.POST})
	@ResponseBody
	public List <HashMap <String, String>> getComments(HttpServletRequest req, HttpSession session) throws IOException {
		
		String snsno = req.getParameter("snsno");
		
		System.out.println("댓글을 출력할 샤이 번호는 : "+snsno);
		
		List <HashMap <String, String>> comments = service.getComments(snsno);
		System.out.println(snsno+"번의 댓글 list : comments에 "+comments.size()+" 크기의 리스트가 생성됨");
		
		return comments;
		
		
	}
	
	@RequestMapping(value="/banking.shy", method={RequestMethod.POST})
	public String banking(HttpServletRequest req, HttpSession session) throws IOException {
		
		String snsno = req.getParameter("snsno");
		
		System.out.println("댓글을 출력할 샤이 번호는 : "+snsno);
		
		List <HashMap <String, String>> comments = service.getComments(snsno);
		System.out.println(snsno+"번의 댓글 list : comments에 "+comments.size()+" 크기의 리스트가 생성됨");
		
		return "banking.tiles";
		
		
	}
	
}


/*
#Generated by Maven Integration for Eclipse
#Wed Jun 21 18:42:51 KST 2017
version=1.0.0-BUILD-SNAPSHOT
groupId=com.team168
m2e.projectName=shy_team168
m2e.projectLocation=C\:\\github_shy_team168\\shy_team168\\shy_team168
artifactId=shy
*/
