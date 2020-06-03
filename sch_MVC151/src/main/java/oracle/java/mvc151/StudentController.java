package oracle.java.mvc151;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class StudentController {

	@RequestMapping("/studentForm")
	public String studentForm() {
		return "createPage";
	}

	@RequestMapping("/student/create")
	public String studentCreate(HttpServletRequest request, Student stu1, BindingResult result, Model model) {
		//BindingResult 또는 Errors 파라미터는 반드시 커맨드 객체 바로 뒤에 위치 해야됨
		// public String studentCreate(HttpServletRequest request,
		// @ModelAttribute("st3") Student stu1, BindingResult result, Model model){
		String context = request.getContextPath();
		String page = "createDonePage";
		System.out.println("/student/create Start");
		StudentValidator validator = new StudentValidator();
		validator.validate(stu1, result); //검증
		System.out.println("result Message->" + result.toString());
		System.out.println("result Message getFieldError->" + result.getFieldError("name"));

		if (result.hasErrors()) {
			result.getFieldError("name");
			if (result.hasFieldErrors("name")) {
				System.out.println("result.hasErrors1->" + result.getFieldError("name")); //필드에서 꺼낸후 
				FieldError fieldError1 = result.getFieldError("name");
				String name = fieldError1.getCode();
				System.out.println("result.hasErrors1 name->" + name);
				model.addAttribute("name", name); //모델에 결과값을 담아주면 됨

			}
			if (result.hasFieldErrors("id")) {
				FieldError fieldError2 = result.getFieldError("id");
				System.out.println("result.hasErrors2->" + result.getFieldError("id"));
				String id = fieldError2.getCode();
				model.addAttribute("id", id);
				
			}
			
			page = "createPage";

		}
		System.out.println("resultMessage ->End");
		System.out.println("result page->" + page);
		return page;
	}
}