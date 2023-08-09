package kr.or.ddit.vo.bmk;

import java.util.List;

public class Diary_PageVO<T> {
	   private int allRecord;		// 페이지 전환 필요없이 모든 게시글 수
	   private int totalRecord;      // 조건에 맞는 게시글 수
	   private int totalPage;         // 총 페이지 수
	   private int currentPage;      // 현제 페이지
	   private int screenSize = 10;         // 페이지 당 게시글 수
	   private int blockSize = 5;         // 페이지 블록 수
	   private int startRow;         // 시작 row
	   private int endRow;            // 끝 row
	   private int startPage;         // 시작 페이지
	   private int endPage;         // 끝 페이지
	   private List<T> dataList;      // 결과를 넣을 데이터 리스트
	   private String searchType;      // 검색 타입(제목, 내용, 작성자, 작성일 등등)
	   private String searchWord;      // 검색 단어(키워드)
	   private String ae_id;			// 사용자 아이디
	   
	   public Diary_PageVO() {}
	   
	   public String getAe_id() {
		   return ae_id;
	   }
	   
	   
	   public int getAllRecord() {
		   return allRecord;
	   }

	   public void setAllRecord(int allRecord) {
		   this.allRecord = allRecord;
	   }

	   public void setAe_id(String ae_id) {
		   this.ae_id = ae_id;
	   }
	   
	   // PaginationInfoVO 객체를 만들 때, 한 페이지당 게시글 수와 페이지 블록 수를
	   // 원하는 값으로 초기화 할 수 있도록 Custom 생성자 생성
	   public Diary_PageVO(int screenSize, int blockSize) {
	      super();
	      this.screenSize =  screenSize;
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
	      this.currentPage = currentPage;            // 현재 페이지
	      endRow = currentPage * screenSize;         // 끝 row = 현재 페이지 * 한 페이지당 게시글 수
	      startRow = endRow - (screenSize - 1);      // 시작 row = 끝 row - (한 페이지당 게시글 수 - 1)
	      // 마지막 페이지 = (현재 페이지 + (페이지 블록 사이즈 -1)) / 페이지 블록 사이즈 * 페이지 블록 사이즈
	      endPage = (currentPage + (blockSize -1)) / blockSize * blockSize;
	      startPage = endPage - (blockSize - 1);      // 시작 페이지 = 마지막 페이지 - (페이지 블록 사이즈 - 1)
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
	         int realStartPage = totalPage-(totalPage-1);
	         // 부투스트랩을 이용하던 여러 css요소를 이용해서 페이징 UI를 구현하는 곳입니다!
	         html.append("<div class='board_page'>");
	         // 스타트페이지가 1보다 크면 첫페이지로 이동 생성(5개의 페이지를 하나로 묶은 단위)
	         if (startPage > 1) {
	            html.append("<a href='#' class='bt first' data-page='"+realStartPage+"'><<</a>");
	         }
	         // 최근페이지가 1보다 클 경우 이전 페이지(5개의 묶음 중 하나) 
	         if (currentPage > 1){
	        	 html.append("<a href='#' class='bt prev' data-page='" + (currentPage - 1)+ "'><</a>");
	         }
	         // 시작페이지가 (총페이지가 끝페이지보다 크면 끝페이지가 마지막페이지 아니면 총페이지가 마지막 페이지)
	         for (int i = startPage; i <= (endPage < totalPage ? endPage : totalPage); i++) {
	        	// 최근 페이지가 i면 ??
	            if (i == currentPage) {
	               html.append("<a href='#' class='num on'>" + i + "</a>");
	            } else {
            		html.append("<a href='#' class='num' data-page='" + i + "'>" + i + "</a>");
	            }
	         }
	         // 끝페이지가 토탈페이지보다 작으면 다음 버튼 생성
	         if (currentPage < totalPage) {
	        	 html.append("<a href='#' class='bt prev' data-page='" + (currentPage + 1)+ "'>></a>");
	         }
	         if (endPage < totalPage) {
	        	 html.append("'>></a><a href='' class='bt end' data-page='"+totalPage+"'>>></a>");
	         }

	         html.append("</div>");
	         return html.toString();
	      }
}
