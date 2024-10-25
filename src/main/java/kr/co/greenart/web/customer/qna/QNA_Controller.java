package kr.co.greenart.web.customer.qna;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.properties.bind.DefaultValue;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class QNA_Controller {
	@Autowired
	private QNA_Service service;

	@GetMapping("/qna")
	public String qna(
			@PageableDefault(sort = "created_at", direction = Sort.Direction.DESC, size = 20, page = 1) Pageable page,
			String search, String searchType, Model model) {
		int pageNum = page.getPageNumber() - 1;
		int size = page.getPageSize();
		String column = page.getSort().toList().get(0).getProperty();
		String direction = page.getSort().toList().get(0).getDirection().toString();
		String searchQuery = null;
		if (search == null)
			searchQuery = "1 = 1";
		else
			searchQuery = searchType + " like '%" + search + "%'";
		List<QNA> qnaList = service.findAll(new MyOrder(column, direction), size, pageNum * size, searchQuery);
		int count = service.count(searchQuery);

		int totalPage = (count + page.getPageSize() - 1) / page.getPageSize();

		model.addAttribute("qnaList", qnaList);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("count", count);
		model.addAttribute("sort", column + "," + direction);
		model.addAttribute("page", pageNum + 1);
		model.addAttribute("size", size);
		model.addAttribute("search", search);
		model.addAttribute("searchType", searchType);
		return "qna";
	}

	@GetMapping("/qna/form")
	public String qnaForm() {
		return "qnaForm";
	}

	@PostMapping("/qna/form")
	public ResponseEntity<?> qnaSubmit(@RequestBody QNA qna) {
		int articleId = service.save(qna);
		if (articleId > 0) {
			return ResponseEntity.ok().build();
		} else {
			return ResponseEntity.internalServerError().build();
		}
	}

	@GetMapping("/qna/{id}")
	public String readArticle(@PathVariable Integer id, Model model) {
		QNA qna = service.findById(id);

		model.addAttribute("qna", qna);

		return "qnaView";
	}
}
