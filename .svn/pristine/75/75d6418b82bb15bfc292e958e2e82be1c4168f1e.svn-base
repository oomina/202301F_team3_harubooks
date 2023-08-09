package kr.or.ddit.vo.odh;

import java.util.List;

// @Data
public class PagingVO<T> {
	 private int allRecord;		// 페이지 전환 필요없이 모든 게시글 수
	private int totalRecord;			// 총 게시글 수
	private int totalPage;				// 총 페이지 수
	private int currentPage;			// 현재 페이지
	private int screenSize = 10;		// 페이지 당 게시글 수
	private int blockSize = 5;			// 페이지 블록 수
	private int startRow;				// 시작 row
	private int endRow;					// 끝 row
	private int startPage;				// 시작 페이지
	private int endPage;				// 끝 페이지
	private List<T> dataList;			// 결과를 넣을 데이터 리스트
	// select의 option value 같은거고
	private String searchType;			// 검색 타입(제목,내용,작성자,작성일 등등)
	//	키워드 같은거다
	private String searchWord;			// 검색 단어(키워드)
	private String ae_id;

	public PagingVO() {}
	
	// PaginationInfoVO 객체를 만들 때, 한 페이지당 게시글 수 와 페이지 블록 수를
	// 원하는 값으로 초기화 할 수 있도록 Custom 생성자 생성
	public PagingVO(int screenSize, int blockSize){
		super();
		this.screenSize = screenSize;
		this.blockSize = blockSize;
	}
	public int getTotalRecord() {
		return totalRecord;
	}
	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
		// 총 페이지 수 구하기
		// ceil 올림
		totalPage = (int)Math.ceil(totalRecord / (double)screenSize); 
	}
	
	
	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;			//현재 페이지
		endRow = currentPage * screenSize;		// 끝 row = 현재 페이지 * 한 페이지당 게시글 수
		startRow = endRow - (screenSize - 1);	// 시작 row = 끝 row - (한 페이지당 게시글 수 - 1)
		// 마지막 페이지 = (현재 페이지 + (페이지 블록 사이즈 - 1)) / 페이지 블록 사이즈 * 페이지 블록 사이즈
		endPage = (currentPage + (blockSize - 1)) / blockSize * blockSize;
		startPage = endPage - (blockSize - 1);		// 시작 페이지 = 마지막 페이지 - (페이지 블록 사이즈 - 1)
	}

	public int getScreenSize() {
		return screenSize;
	}

	public void setScreenSize(int screenSize) {
		this.screenSize = screenSize;
	}

	public int getBlockSize() {
		return blockSize;
	}

	public void setBlockSize(int blockSize) {
		this.blockSize = blockSize;
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

	public List<T> getDataList() {
		return dataList;
	}

	public void setDataList(List<T> dataList) {
		this.dataList = dataList;
	}

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getSearchWord() {
		return searchWord;
	}

	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}
	
	public String getPagingHTML() {
		StringBuffer html = new StringBuffer();
		
		html.append("<ul style='list-style:none; display:flex;align-items:center;margin:0 auto;'>");
		if(startPage>1) {
			html.append("<li style='float:left;'><a data-page='"+(startPage - totalPage)+"' style='float:left;padding:4px;margin-right:10px;width:45px;color:#5055b1;font:bold 16px tahoma;border:1px solid #5055b1;text-align:center;text-decoration:none; border-radius:10px;' href=''>이전</a></li> ");			
		}
		for(int i = startPage; i<=(endPage < totalPage ? endPage : totalPage); i++) {
			if(i == currentPage) {
				html.append("<li style='float:left; position:relative; left:50%;'><a class='active2' style='float:left;padding:4px;margin-right:10px;width:45px;color:white;font:bold 16px tahoma;border:1px solid #5055b1;text-align:center;text-decoration:none; border-radius:10px; background-color : #5055b1;' href='' data-page='"+i+"'>"+i+"</a></li>");
			}else {
				html.append("<li><a style='float:left;padding:4px;margin-right:10px;width:45px;color:#5055b1;font:bold 16px tahoma;border:1px solid #5055b1;text-align:center;text-decoration:none; border-radius:10px;' href='' data-page='"+i+"'>"+i+"</a></li>");				
			}
		}
		if(endPage < totalPage) {
			html.append("<li style='float:left;'><a data-page='"+(endPage+1)+"' style='float:left;padding:4px;margin-right:10px;width:45px;color:#5055b1;font:bold 16px tahoma;border:1px solid #5055b1;text-align:center;text-decoration:none; border-radius:10px;' href=''>다음</a></li> ");
		}
		html.append("</ul>");
		return html.toString();
	}

	public String getAe_id() {
		return ae_id;
	}

	public void setAe_id(String ae_id) {
		this.ae_id = ae_id;
	}

	public int getAllRecord() {
		return allRecord;
	}

	public void setAllRecord(int allRecord) {
		this.allRecord = allRecord;
	}

}