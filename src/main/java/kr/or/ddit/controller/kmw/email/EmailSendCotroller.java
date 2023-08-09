package kr.or.ddit.controller.kmw.email;

import java.util.Map;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.ResultStatus;
import kr.or.ddit.service.LoginService;
import kr.or.ddit.vo.UserInfoVO;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
@RequestMapping("/email")
public class EmailSendCotroller {
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Inject
	private LoginService service;
	
	@ResponseBody
	@PostMapping("/send.do")
	public String sendMail(@RequestBody Map<String, String> resMap,HttpServletRequest request, HttpServletResponse response) throws Exception{
		log.info("이메일 주소는 : "+resMap.get("eMail"));
		log.info("사용자 ID : "+resMap.get("id"));
		String id = resMap.get("id");
		log.info(resMap.get("content"));
		
		String subject = "하루북스 임시비밀번호 발급되었습니다";
		String content = resMap.get("content");
		
		String from = "k98328@naver.com";
		String to = resMap.get("eMail");
		
		final MimeMessagePreparator preparator = new MimeMessagePreparator() {
			
			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
				final MimeMessageHelper mailHelper = new MimeMessageHelper(mimeMessage, true, "UTF-8");	
				mailHelper.setFrom(from);
				mailHelper.setTo(to);
				mailHelper.setSubject(subject);
				mailHelper.setText(content,true);
			}
		};
		
		try {
			mailSender.send(preparator);
			log.info("메일보내기 성공");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
			
		return "OK";
	}
	
}
