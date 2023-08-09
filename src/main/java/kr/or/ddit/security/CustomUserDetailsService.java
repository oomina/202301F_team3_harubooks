package kr.or.ddit.security;

import javax.inject.Inject;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import kr.or.ddit.mapper.LoginMapper;
import kr.or.ddit.vo.CustomUser;
import kr.or.ddit.vo.UserInfoVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class CustomUserDetailsService implements UserDetailsService{
	
	@Inject
	private BCryptPasswordEncoder pe;
	
	@Inject
	private LoginMapper loginMapper;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		UserInfoVO user;	
		try {
			user = loginMapper.readByUserId(username);
			return user == null? null : new CustomUser(user); 
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
}
