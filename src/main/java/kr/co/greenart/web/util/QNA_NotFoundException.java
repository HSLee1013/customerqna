package kr.co.greenart.web.util;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(code = HttpStatus.NOT_FOUND, reason = "게시글을 찾을 수 없습니다.")
public class QNA_NotFoundException extends RuntimeException {
	private Integer articleId;

	public QNA_NotFoundException(Integer articleId) {
		super();
		this.articleId = articleId;
	}
}
