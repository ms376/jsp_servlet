<%@ page import="utils.BoardPage"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Map"%>
<%@ page import="model1.board.BoardDAO"%>
<%@ page import="model1.board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
// DB연결 및 CRUD작업을 위한 DAO객체를 생성한다.
BoardDAO dao = new BoardDAO(application);

// 검색어가 있는 경우 클라가 선택한 필드명과 검색어를 저장할 Map컬렉션을 생성한다.
Map<String, Object> param = new HashMap<String, Object>();
/*
	검색폼에서 입력한 검색어와 필드명을 파라미터로 받아온다.
	해당 <form>의 전송방식은 get, action속성은 없는 상태이므로
	현재 페이지로 폼값이 전송된다.
*/
String searchField = request.getParameter("searchField");
String searchWord = request.getParameter("searchWord");
// 사용자가 입력한 검색어가 있다면...
if (searchWord != null)
{
	// Map컬렉션에 컬럼명과 검색어를 추가한다.
	param.put("searchField", searchField);
	param.put("searchWord", searchWord);
}
// Map컬렉션을 인수로 게시물의 갯수를 count한다.
int totalCount = dao.selectCount(param);

/*** 페이징 코드 추가 부분 ***/
// web.xml에 설정한 컨텍스트 초기화 파라미터를 읽어와서 산술연산을 위해
// 정수(int)로 변환한다. 
int pageSize = Integer.parseInt(application.getInitParameter("POSTS_PER_PAGE"));
int blockPage = Integer.parseInt(application.getInitParameter("PAGES_PER_BLOCK"));
/*
	전체 페이지수를 계산한다.
	(전체 게시물 갯수 / 페이지당 출력할 게시물 갯수) => 결과값의 올림처리
	가령 게시물의 갯수가 51개라면 나눳을때 결과가 5.1이 된다. 이때 무조건
	올림처리 하여 6페이지가 나오게 된다.
	만약 totalcount를 double로 형변환하지 않으면 정수의 결과가 나오게되므로,
	6페이지가 아니라 5페이지가 된다. 따라서 주의해야 한다.
*/
int totalPage = (int)Math.ceil((double)totalCount / pageSize); // 전체페이지 수
/*
	목록에 처음 진입했을 때는 페이지관련 파라미터가 없는 상태이므로 무조건
	1page로 지정한다. 만약 파라미터 pageNum이 있다면 request내장객체를 통해
	받아온 후 페이지 번호로 지정한다.
	List.jsp = > 이와 같이 파라미터가 없는 상태일때는 null
	List.hsp?pageNum=> 이와 같이 파라미터는 있는데 값이 없을 때는 빈값으로
	체크된다.
*/

int pageNum= 1;
String pageTemp = request.getParameter("pageNum");
if(pageTemp != null && !pageTemp.equals(""))
	pageNum=Integer.parseInt(pageTemp);
/*
	게시물의 구간을 계산한다.
	각 페이지의 시작번호와 종료번호를 현재페이지번호와 페이지사이즈를 통해
	계산한 후 DAO로 전달하기 위해 Map컬렉션에 추가한다.
*/
int start=(pageNum-1)*pageSize +1;
int end=pageNum*pageSize;
param.put("start",start);
param.put("end",end);
// 페이지 처리 end


// 목록에 출력할 게시물을 추출하여 반환받는다.
List<BoardDTO> boardLists = dao.selectListPage(param);
// 자원해제
dao.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<title>회원제 게시판</title>
</head>
<body>

	<!-- 공통 링크 -->
    <jsp:include page="../Common/Link.jsp" />  
    <h2>목록 보기(List) - 현재 페이지 : <%=pageNum %> (전체 : <%=totalPage %>)</h2>
    <form method="get">  
    <table border="1" width="90%" cellpadding="10" >
    <tr>
        <td align="center">
            <select name="searchField"> 
                <option value="title">제목</option> 
                <option value="content">내용</option>
            </select>
            <input type="text" name="searchWord" />
            <input type="submit" value="검색하기" />
        </td>
    </tr>   
    </table>
    </form>
    <table border="1" width="90%" >
        <tr>
            <th width="10%">번호</th>
            <th width="50%">제목</th>
            <th width="15%">작성자</th>
            <th width="10%">조회수</th>
            <th width="15%">작성일</th>
        </tr>
<%
if (boardLists.isEmpty()) {
%>
        <tr>
            <td colspan="5" align="center">
                등록된 게시물이 없습니다^^*
            </td>
        </tr>
<%
}
else {
	// 출력할 게시물이 있는 경우에는 확장 for문으로 List컬렉션에
	// 저장된 데이터의 갯수만큼 반복하여 출력한다.
    int virtualNum = 0; 
	int countNum=0;
	
	// 페이지가 적용된 가상번호를 계산하기 위해 성성한 변수
    for (BoardDTO dto : boardLists)
    {
    	// 현재 출력할 게시물의 갯수에 따라 출력번호는 달라지므로
    	// totalCount를 사용하여 가상번호를 부여한다.
    	
//         virtualNum = totalCount--;
    		// 현재 페이지 번호를 적용한 가상번호 계산하기
    		// 전체 게시물 수 - (((현재페이지-1)*한페이지 출력갯수)+ countNum증가치)
    		virtualNum=totalCount-(((pageNum-1)*pageSize)+countNum++);
%>
        <tr align="center">
        	<!-- 게시물의 가상번호 -->
            <td><%= virtualNum %></td>
            <!-- 제목 -->  
            <td align="left"> 
                <a href="View.jsp?num=<%= dto.getNum() %>"><%= dto.getTitle() %></a> 
            </td>
            <!-- 작성자 아이디 -->
            <td align="center"><%= dto.getId() %></td>
            <!-- 조회수 -->           
            <td align="center"><%= dto.getVisitcount() %></td>
            <!-- 작성일 -->   
            <td align="center"><%= dto.getPostdate() %></td>    
        </tr>
<%
    }
}
%>
    </table>
   
    <table border="1" width="90%">
        <tr align="right">
        	<!-- 
        		totalCount : 전체 개시물의 갯수
        		pageSize : 한페이지에 출력할 게시물의 갯수
        		blockPage : 한블럭당 출력할 페이지번호의 갯수
        		pageNum : 현재 페이지 번호
        		request.getRequestURI() : request 내장객체를 통해 현재페이지의
        			HOST를 제외한 나머지 경로명을 얻어올 수 있다.여기서 얻은
        			경로명을 통해 "경로명.JSP?pageNum=페이지번호" 와 같은 바로
        			가기 링크를 생성한다.
        	 -->
        	<!-- 페이징 처리 -->
        	<td>
        		<%= BoardPage.pagingStr(totalCount, pageSize, blockPage, pageNum, request.getRequestURI()) %>
        	</td>
            <td><button type="button" onclick="location.href='Write.jsp';">글쓰기
                </button></td>
        </tr>
    </table>
</body>

</html>