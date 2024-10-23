package kr.co.greenart.web.util;

import java.time.LocalDateTime;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ServerTimeController {
	@GetMapping("/server/time")
	public String serverTime(Model model) {
		model.addAttribute("serverTime", LocalDateTime.now());
		return "server-time";
	}
}
