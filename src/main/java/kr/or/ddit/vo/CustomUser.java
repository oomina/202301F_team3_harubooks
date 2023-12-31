package kr.or.ddit.vo;

import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

public class CustomUser extends User{
	private UserInfoVO user;
	
	public CustomUser(String username, String password, 
			Collection<? extends GrantedAuthority> authorities) {
		super(username, password, authorities);
	}

	public CustomUser(UserInfoVO user) {
		super(user.getAe_id(), user.getAe_pw(),
				user.getAuthList().stream().map(auth -> new SimpleGrantedAuthority(auth.getAuth())).collect(Collectors.toList()));
		this.user = user;
	}
	
	public UserInfoVO getUser() {
		return user;
	}
	
	public void setUser(UserInfoVO user) {
		this.user = user;
	}
}
