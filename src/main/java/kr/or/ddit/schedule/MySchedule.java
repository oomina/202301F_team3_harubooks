package kr.or.ddit.schedule;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import kr.or.ddit.controller.ljy.excel.ExcelUtils;
import kr.or.ddit.mapper.ljy.PoMngMapper;
import kr.or.ddit.mapper.ljy.PubMngMapper;
import kr.or.ddit.mapper.ljy.RemainMngMapper;
import kr.or.ddit.vo.ljy.PoMngVO;
import kr.or.ddit.vo.ljy.PubMngVO;
import kr.or.ddit.vo.ljy.RemainMngVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class MySchedule {
	
	@Resource(name="uploadExcel")
	private String filePath;
	
	@Autowired
	private RemainMngMapper remainMapper;
	@Autowired
	private PoMngMapper poMapper;
	@Autowired
	private PubMngMapper pubMapper;
	
	@Scheduled(fixedRate = 60000)// 1분
	public void autoPoReq() {
		log.info("자동발주 시작");
		List<RemainMngVO> remainDangerList = remainMapper.remainDangerList();
		List<PoMngVO> poWaitingList = poMapper.poWaitingList();
		if(poWaitingList == null || poWaitingList.size() == 0) { // 발주 신청 목록이 없을 때 => 바로 자동발주
			// 자동발주 신청
			for (RemainMngVO remainMngVO : remainDangerList) {
				PoMngVO newPoMngVO = new PoMngVO();
				newPoMngVO.setBook_no(remainMngVO.getBook_no());
				newPoMngVO.setPub_nm(remainMngVO.getPub_nm());
				int book_qty = remainMngVO.getBm_bsc_cnt() - remainMngVO.getBm_cnt();
				newPoMngVO.setBook_qty(book_qty);
				log.info("newPoMngVO 자동발주 insert" + newPoMngVO);
				poMapper.poAuto(newPoMngVO);
				
				// 엑셀로 발주서 저장
				PubMngVO pubMngVO = pubMapper.getPub(remainMngVO.getPub_nm());
				List<PoMngVO> excelList = new ArrayList<PoMngVO>();
				PoMngVO poMngVO = poMapper.getPo(newPoMngVO.getBr_no());
				excelList.add(poMngVO);
				try {
					ExcelUtils.createPoExcel(filePath, pubMngVO, excelList);
				} catch (IOException e) {
					log.error("자동발주 발주서 저장 실패" + newPoMngVO);
				}
			}
		} else {
			// 발주 신청 목록과 비교하기
			for (RemainMngVO remainMngVO : remainDangerList) {
				boolean chk = false;
				for (PoMngVO poMngVO : poWaitingList) {
					log.info("remainMngVO" + "");
					if(poMngVO.getBook_no().equals(remainMngVO.getBook_no())) {
						log.info(remainMngVO + "이미 대기목록 존재");
						chk = true;
						break;
					} 
				}
				if(!chk) {
					PoMngVO newPoMngVO = new PoMngVO();
					newPoMngVO.setBook_no(remainMngVO.getBook_no());
					newPoMngVO.setPub_nm(remainMngVO.getPub_nm());
					int book_qty = remainMngVO.getBm_bsc_cnt() - remainMngVO.getBm_cnt();
					newPoMngVO.setBook_qty(book_qty);
					log.info("newPoMngVO 자동발주 insert" + newPoMngVO);
					poMapper.poAuto(newPoMngVO);
					
					// 엑셀로 발주서 저장
					PubMngVO pubMngVO = pubMapper.getPub(remainMngVO.getPub_nm());
					List<PoMngVO> excelList = new ArrayList<PoMngVO>();
					PoMngVO poMngVO = poMapper.getPo(newPoMngVO.getBr_no());
					excelList.add(poMngVO);
					try {
						ExcelUtils.createPoExcel(filePath, pubMngVO, excelList);
					} catch (IOException e) {
						log.error("자동발주 발주서 저장 실패" + newPoMngVO);
					}
				}
			}
		}
	}	
}
