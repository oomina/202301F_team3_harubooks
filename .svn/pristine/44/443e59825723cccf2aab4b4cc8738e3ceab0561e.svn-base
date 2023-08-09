package kr.or.ddit.security;

import java.io.IOException;
import java.util.Collection;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;

import kr.or.ddit.service.kmw.BookService;
import kr.or.ddit.vo.kmw.BookInfoVO;
import lombok.extern.slf4j.Slf4j;

// 로그인 성공시 처리하는 클래스
@Slf4j
public class CustomLoginSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler{

	@Override
		public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
				Authentication authentication) throws ServletException, IOException {
			log.info("로그인 성공 onAuthenticationSuccess실행");
			User user = (User) authentication.getPrincipal();
			
			log.debug("userId : "+user.getUsername());
			log.debug("password : "+user.getPassword());
			
			boolean hasRoleTemp = authentication.getAuthorities().stream()
	                .anyMatch(role -> role.getAuthority().equals("ROLE_TEMP"));
			log.debug("임시사용자 : "+hasRoleTemp);
			if(hasRoleTemp) {
				setDefaultTargetUrl("/login/resetPwForm");
				super.onAuthenticationSuccess(request, response, authentication);
			}else {				
				setDefaultTargetUrl("/harubooks/main");
				super.onAuthenticationSuccess(request, response, authentication);		
			}
			
		}
}
