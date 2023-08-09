package kr.or.ddit.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration // 설정파일
@EnableWebMvc  // mvc 활성화
@EnableScheduling	// 설정파일이어야 가능
public class MyConfig  implements WebMvcConfigurer{

   @Override
   public void addResourceHandlers(ResourceHandlerRegistry registry) {
      // 이미지 올릴 때
      registry.addResourceHandler("/upload/images/**")                  // 웹 접근 경로 
      .addResourceLocations("file:///c:/harubooks/team3/data/images/");  // 서버내 실제 경로
      // 파일 올릴 때
      registry.addResourceHandler("/upload/files/**")                  // 웹 접근 경로 
      .addResourceLocations("file:///c:/harubooks/team3/data/files/");  // 서버내 실제 경로
      // 엑셀 올릴 때 
      registry.addResourceHandler("/upload/excel/**")                  // 웹 접근 경로 
      .addResourceLocations("file:///c:/harubooks/team3/data/excel/");  // 서버내 실제 경로
   }
}


