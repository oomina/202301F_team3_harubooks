package kr.or.ddit.controller.bmk.haruter;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.service.bmk.IFindLibraryService;
import kr.or.ddit.vo.bmk.FindLibraryVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/haruter")
public class findLibraryController {

	@Autowired
	private IFindLibraryService findLibraryService;
	
	@PreAuthorize("hasRole('ROLE_MEMBER')")
	@GetMapping("/findlibrary")
	public String getFindLibrary(Model model) {
		String ae_id = SecurityContextHolder.getContext().getAuthentication().getName();
		FindLibraryVO fvo = findLibraryService.getAddress(ae_id);
		model.addAttribute("fvo", fvo);
		return "haruter/findLibrary";
	}
	
	@GetMapping("/findlibrarys")
	@ResponseBody
	public List<FindLibraryVO> getAllLibraryInfo(){
		List<FindLibraryVO> flvo = findLibraryService.getAllLibraryInfo();
		return flvo;
	}
	
	@ResponseBody
	@GetMapping("/findlibraryinfo")
	public FindLibraryVO getLibraryInfo(Model model, String lib_nm) {
		FindLibraryVO fvo = findLibraryService.getLibraryInfo(lib_nm);
		return fvo;
	}
}
