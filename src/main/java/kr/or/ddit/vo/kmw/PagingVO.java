package kr.or.ddit.vo.kmw;

import java.util.List;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public abstract class PagingVO<T> {
	private List<T> dataList;
	
	private int totalPostCnt; // 총 개시물 수
	private int totalPageCnt; // 총 페이지 개수
	private int postPerPage; // 페이지 당 보여줄 게시물 수
	private int pageSize; // 한 화면에 보여줄 페이지 수
	private int startRow; // 페이지 당 게시물 첫 번째 행
	private int endRow; //페이지 당 게시물 마지막 행
	private int currentPage; // 현재 페이지
	private int startPage; // 한 화면에 보여지는 첫번째 페이지 
	private int endPage; // 한 화면에 보여지는 마지막 페이지수 
	
	private String ae_id;
	
	
	public String getAe_id() {
		return ae_id;
	}

	public void setAe_id(String ae_id) {
		this.ae_id = ae_id;
	}

	public PagingVO() {};
	
	public PagingVO(int postPerPage, int pageSize) {
		super();
		this.postPerPage = postPerPage;
		this.pageSize = pageSize;
	}
	
	public List<T> getDataList() {
		return dataList;
	}
	public void setDataList(List<T> dataList) {
		this.dataList = dataList;
	}
	public int getTotalPostCnt() {
		return totalPostCnt;
	}
	public void setTotalPostCnt(int totalPostCnt) {
		this.totalPostCnt = totalPostCnt;
		totalPageCnt = (totalPostCnt-1)/postPerPage +1;
	}
	public int getTotalPageCnt() {
		return totalPageCnt;
	}
	public void setTotalPageCnt(int totalPageCnt) {
		this.totalPageCnt = totalPageCnt;	
	}
	public int getPostPerPage() {
		return postPerPage;
	}
	public void setPostPerPage(int postPerPage) {
		this.postPerPage = postPerPage;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getStartRow() {
		return startRow;
	}
	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}
	public int getEndRow() {
		return endRow;
	}
	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
		
		startRow = (currentPage-1)*postPerPage+1;
		endRow = currentPage*postPerPage;
		log.info("currentPage : "+currentPage);
		log.info("pageSize : "+pageSize);
		endPage = (((currentPage-1)/pageSize)+1)*pageSize;
		log.info("endPage : "+endPage);
		
		startPage = endPage - (pageSize-1);
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	
	// 페이지 폼 생성하는 메서드
	public String getPagingHtml() {
		StringBuffer html = new StringBuffer();
		
		html.append("<ul style='list-style:none; float:left; display:flex;align-items:center;margin:0 auto;'>");
		if(startPage>1) {
			html.append("<li style='float:left;'><a data-page='"+(startPage - pageSize)+"' style='float:left;padding:4px;margin-right:10px;width:45px;color:#5055b1;font:bold 16px tahoma;border:1px solid #5055b1;text-align:center;text-decoration:none; border-radius:10px;' href=''>이전</a></li> ");			
		}
		for(int i = startPage; i<=(endPage < totalPageCnt ? endPage : totalPageCnt); i++) {
			if(i == currentPage) {
				html.append("<li><a class='active2' style='float:left;padding:4px;margin-right:10px;width:45px;color:white;font:bold 16px tahoma;border:1px solid #5055b1;text-align:center;text-decoration:none; border-radius:10px;' href='' data-page='"+i+"'>"+i+"</a></li>");
			}else {
				html.append("<li><a style='float:left;padding:4px;margin-right:10px;width:45px;color:#5055b1;font:bold 16px tahoma;border:1px solid #5055b1;text-align:center;text-decoration:none; border-radius:10px;' href='' data-page='"+i+"'>"+i+"</a></li>");				
			}
		}
		if(endPage < totalPageCnt) {
			html.append("<li style='float:left;'><a data-page='"+(endPage+1)+"' style='float:left;padding:4px;margin-right:10px;width:45px;color:#5055b1;font:bold 16px tahoma;border:1px solid #5055b1;text-align:center;text-decoration:none; border-radius:10px;' href=''>다음</a></li> ");
		}
		html.append("</ul>");
		return html.toString();
	}
	
}
