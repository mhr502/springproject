package oracle.java.omyBatis3.controller;

import java.io.File;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class UploadController {
	private static final Logger logger = LoggerFactory.getLogger(UploadController.class);

	// uploadForm 시작화면
	@RequestMapping(value = "uploadFormStart")
	public String uploadFormStart(Model model) {
		System.out.println("uploadFormStart Start");
		return "uploadFormStart";
	}

	@RequestMapping(value = "uploadForm", method = RequestMethod.POST)
	public String uploadForm(HttpServletRequest request, MultipartFile file, String path, Model model)
			throws Exception {
		String uploadPath = request.getSession().getServletContext().getRealPath("/upload/");
		System.out.println("uploadForm POST Start");
	logger.info("originalName:" + file.getOriginalFilename());
	logger.info("size:" + file.getSize());
	logger.info("contentType:" + file.getContentType());
	String savedName = uploadFile(file.getOriginalFilename(), file.getBytes(), uploadPath);
	logger.info("savedName :" +savedName);
	model.addAttribute("savedName",savedName);
	return "uploadResult";
	}

	private String uploadFile(String originalName, byte[] fileData, String uploadPath) throws Exception {
		UUID uid = UUID.randomUUID(); // 데이터를 식별하는데 사용 되는 고유 숫자
		// requestPath= requestPath+ "/resources/image";
		System.out.println("uploadPath->" + uploadPath);
		// Directory 생성
		File fileDirectory = new File(uploadPath);
		if (!fileDirectory.exists()) {
			fileDirectory.mkdirs();
			System.out.println("업로드용 폴더 생성 :" + uploadPath);
			//C:\spring\springSrc39\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\omyBatis3		
			}
		String savedName = uid.toString() + "_" + originalName; // 파일 중첩되는걸 방지
		File target = new File(uploadPath, savedName);
		FileCopyUtils.copy(fileData, target);
		return savedName;
	}
	

}
