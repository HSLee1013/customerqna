package kr.co.greenart.web.customer.qna;

import org.springframework.http.HttpStatus;
import org.springframework.http.HttpStatusCode;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

import kr.co.greenart.web.util.QNA_NotFoundException;
import kr.co.greenart.web.util.QNA_isSecure;

@ControllerAdvice(assignableTypes = QNA_Controller.class)
public class QNA_ControllerAdvice {

	@ExceptionHandler(QNA_NotFoundException.class)
	public ModelAndView notFound(QNA_NotFoundException e) {
		ModelAndView mv = new ModelAndView("notFound");
		mv.setStatus(HttpStatusCode.valueOf(HttpStatus.NOT_FOUND.value()));

		return mv;
	}
	
	@ExceptionHandler(QNA_isSecure.class)
	public ModelAndView notFound(QNA_isSecure e) {
		ModelAndView mv = new ModelAndView("secure");
		mv.setStatus(HttpStatusCode.valueOf(HttpStatus.UNAUTHORIZED.value()));

		return mv;
	}	

}
