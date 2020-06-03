package oracle.java.mvc151;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

public class StudentValidator implements Validator {
// 컨트롤러에서 커맨드 객체의 값을 검증할떼 validator가 유용
	@Override
	public boolean supports(Class<?> arg0) {
		return Student.class.isAssignableFrom(arg0); //검증할 객체의 클래스 타입 정보
		
	}
	@Override
	public void validate(Object obj, Errors errors) {
		//obj-> student(검증할 객체), error는 return값, 올바르지 않을경우 에러정보를 저장
		System.out.println("validate()");
		Student student = (Student)obj;
		
		String studentName = student.getName();
		if(studentName == null || studentName.trim().isEmpty()) {
			System.out.println("studentName is null or empty");
			
			//errors.rejectValue("name", "name trouble");
			System.out.println("validate -> 회원 이름을 입력하세요...");
			errors.rejectValue("name", "회원 이름 공백 또는 NULL 오류");
			
		}
		
		int studentId = student.getId();
		if(studentId == 0) {
			System.out.println("studentId is 0");
			errors.rejectValue("id", "studentId 0으로 입력"); //모델 역할을 해줌 
		}

	}

}
