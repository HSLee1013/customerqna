package kr.co.greenart.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import kr.co.greenart.web.customer.qna.QNA;
import kr.co.greenart.web.customer.qna.QNA_Mapper;

@SpringBootApplication
public class DemoApplication implements CommandLineRunner {
	@Autowired
	private QNA_Mapper mapper;

	// 프로그램의 시작점
	public static void main(String[] args) {
		SpringApplication.run(DemoApplication.class, args);
	}

	@Override
	public void run(String... args) throws Exception {
		for (int i = 1; i < 100; i++) {
			mapper.save(QNA.builder().title("title" + i).content("content" + i).username("username" + i)
					.password("password" + i).build());
		}

	}
}
