package kr.co.greenart.web;

import java.util.Random;

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
		for (int i = 1; i < 1234; i++) {

			mapper.save(QNA.builder().title(randomString(20, 50)).content(randomString(100, 10000))
					.username(randomString(5, 10) + i).password("qwer" + i).secure(false).build());
		}
	}

	private String randomString(int min, int max) {
		Random random = new Random();
		int length = random.nextInt(max - min + 1) + min;
		StringBuilder stringBuilder = new StringBuilder();
		for (int i = 0; i < length; i++) {
			int randNum = random.nextInt(62);
			if (randNum < 26) {
				stringBuilder.append((char) ('a' + randNum));
			} else if (randNum < 52) {
				stringBuilder.append((char) ('A' + randNum - 26));
			} else {
				stringBuilder.append((char) ('0' + randNum - 52));
			}
		}
		return stringBuilder.toString();
	}
}
