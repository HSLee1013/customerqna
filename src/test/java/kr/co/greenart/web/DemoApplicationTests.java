package kr.co.greenart.web;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import java.util.List;

import org.junit.jupiter.api.MethodOrderer;
import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestMethodOrder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import kr.co.greenart.web.customer.qna.MyOrder;
import kr.co.greenart.web.customer.qna.QNA;
import kr.co.greenart.web.customer.qna.QNA_Mapper;

@SpringBootTest
@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
class DemoApplicationTests {
	@Autowired
	private QNA_Mapper mapper;

	@Test
	@Order(1)
	void testInsert() {
		QNA qna = QNA.builder().title("제목").content("내용").username("유저네임").password("비밀먼호").build();
		int rows = mapper.save(qna);

		assertEquals(1, rows);
		assertNotNull(qna.getArticleId());
	}

	@Test
	@Order(2)
	void testSelect() {
		List<QNA> all = mapper.findAll(new MyOrder("article_id","DESC"), 10, 0,"1=1");
		System.out.println(all);
		assertNotEquals(0, all.size());
	}
	
	@Test
	@Order(2)
	void testView() {
		QNA qna = mapper.findById(1);
		
		assertEquals("제목", qna.getTitle());
	}
	
	@Test
	@Order(2)
	void testSecure() {
		int secure=mapper.findSecureByPk(1);
		
		assertEquals(0, secure);
	}
}
