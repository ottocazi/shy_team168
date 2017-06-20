package com.team168.shy;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.team168.shy.model.ShyMemberVO;
import com.team168.shy.service.DDung_Service;


@Controller
@Component
public class DDung_Controller {

	@Autowired
	private DDung_Service service;
	
	@RequestMapping(value="/mainline.shy", method={RequestMethod.GET})
    public String mainline(HttpServletRequest req, HttpSession session) {

		Object loginuser = session.getAttribute("loginuser");
		ShyMemberVO smvo = (ShyMemberVO)loginuser;
		session.setAttribute("loginuser", smvo);
		
		
		// 로그인 유저의 팔로우 명단 가져오기
		List <String> followlist = service.followlist(smvo.getIdx());
		
		System.out.println("followlist의 사이즈 = "+followlist.size());
		// 팔로워들의 샤이 가져오기
		List <HashMap<String, String>> shies = service.getmainshy(followlist);
		
		for(int i =0 ; i<shies.size(); i++){
			
			if("1"==shies.get(i).get("simage")){
				
				String snsno = shies.get(i).get("snsno");	
				shies.get(i).put("imageaddr", service.imgaddr(snsno));
				
			};
			
			if("0"==shies.get(i).get("simage")){
				shies.get(i).put("imageaddr", null);
			}
		}
		
		
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
		
		
		String image = req.getMultipartContentType("image");
		System.out.println("image = " + image);
		
		MultipartFile imagefile = req.getFile("image");
		byte[] imagebytes = imagefile.getBytes();
		String fileExt = imagefile.getOriginalFilename();
		
		String rootpath = session.getServletContext().getRealPath("/");
		String path = rootpath + "resources" + File.separator + "images/shydb";
		
		System.out.println("rootpath : "+ rootpath);
		System.out.println("path : " +  path);
		
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
		if(newFilename!=null){
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
		
		if(newFilename!=null){
			
			HashMap<String, String> parameters = new HashMap<String, String>();
			parameters.put("snsno", shynow.get("snsno"));
			parameters.put("filename", newFilename);
			service.insert_tbl_image(parameters);
			
		}
		
		if(ftagstatus=="1"){

			// 입력한 이름이 email 또는 이름과 같다면 fk_idx 로 없다면 그냥 일반 입력값으로 insert into
		}
		
		if(staggeo=="1"){
			// 위도값 경도값, 지정 이름(당산역)을 넣으세요
		}
		
		
		
		/*req.setAttribute("loc ", "javascript:history.go(-1)");*/
		return mainline(req, session);
		
    	
    }
}
