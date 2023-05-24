<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BookMate</title>
</head>
<style>
.main {
    width:100%;
    height:100%;
    /* border: 1px solid black; */
}
.logo {
    width:100%;
    height:100px;
    text-align: center;
}
.logoImg {
    width:20%;
    margin-top:20px;
    /* border: 1px solid black; */
    display: inline-block;
}
/* 로그인, 장바구니, 마이페이지, 고객센터 연결 */
.menu {
    width:100%;
    height:40px;
    background-color: white;
    text-align : right;
}
a {
    text-decoration-line: none;
}
a:link {
    color : gray;
}
/* 색상상자 */
.name{
    width:100%;
    height:20px;
    background-color: #97d4f7;
    color:white;
    text-align : center;
    padding : 20px 0;
}
/* 카테고리 */

.category {
    width:100%;
    height:60px;
    background-color: white;
}
.category_ul {
    list-style:none;
    float:right;
}
.category_li {
    float: left;
    margin-right: 20px;
}
a:hover {
        color: #97d4f7;
}
/* 검색창 */
.search {
    position: relative;
    width: 100%;
}
.searchBox {
    width: 250px;
    border: 1px solid #bbb;
    border-radius: 15px;
    padding: 5px 5px;
    font-size: 14px;
}
.search_img {
    position : absolute;
    width: 17px;
    top: 5px;
    right: 10px;
}
/* 추가 부분*/
.content {
    width:100%;
    height:700px;
    
    
}
.content_A {
    width:95%;
    height:100%;
    text-align: center;
    margin-left: auto;
    margin-right:auto;
    
}
.content2 {
    width:95%;
    height:400px;
    margin: auto;
    
   
}

 /* 게시판 목록 스타일 */
 .board {
        width: 100%;
        border-collapse: collapse;
    }
    
    /* 테이블 헤더 스타일 */
    .board th {
        padding: 12px;
        background-color: #ebedf3;
        border: 1px solid #f5eeec;
        font-weight: bold;
        text-align: center;
    }
    
    /* 테이블 셀 스타일 */
    .board td {
        padding: 12px;
        border: 1px solid #c8cfe2;
        text-align: center;
    }
    
   
    /* 짝수 번째 행 배경색 지정 */
    .board tr:nth-child(even) {
        background-color: #f8f9fa;
    }
    
    /* 마우스 호버 효과 */
    .board tr:hover {
        background-color: #f8edf1;
    }
    
    /* 제목 링크에 언더라인 및 호버 효과 */
    .board a.title-link {
        text-decoration: underline;
    }
    
    .board a.title-link:hover {
        text-decoration: none;
    }

</style>
<body>
    <div class="main">
        <div class="logo">
            <img src="/img/logo.png" class="logoImg">
        </div>
        <div class="menu">
            <a href="/login">로그인</a>&nbsp;|&nbsp;<a href="/cart">장바구니</a>&nbsp;|&nbsp;<a href="/mypage">마이페이지</a>&nbsp;|&nbsp;<a href="/q&a">고객센터</a>
        </div>
        <div class="name">지금 어떤 책을 읽어야 할지 고민하는 사용자의 상태에 맞는 책을 추천해주는 서비스</div>
        <div class="category">
            <ul class="category_ul">
				<li class="category_li"><a href="C:\Users\admin\Desktop\bookstore\category_comedy.html">코미디</a></li>
				<li class="category_li"><a href="/book2">로맨스</a></li>
				<li class="category_li"><a href="/book3">판타지</a></li>
				<li class="category_li"><a href="/book4">공포/스릴러/추리</a></li>
				<li class="category_li"><a href="/book5">드라마/가족</a></li>
                <li class="category_li"><a href="C:\Users\admin\Desktop\bookstore\donation.html">기부앤테이크</a></li>
                <li class="category_li">
                    <div class="search">
                    <input type="text" class="searchBox" placeholder="  검색어를 입력하세요">
                    <img src="/img/search.png" class="search_img">
                    </div>
                </li>
			</ul>
        </div>
        
        <div class="content">
            <br>
            <div class="content_A">
                <h1>고객센터</h1>
                <br>
                <div class="content2">
                    <table class="board">
                        <tr>
                            <th>번호</th>
                            <th>제목</th>
                            <th>작성자</th>
                            <th>조회수</th>
                            <th>작성일</th>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>첫 번째 게시물</a></td>
                            <td>작성자1</td>
                            <td>1</td>
                            <td>2023-05-22</td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>두 번째 게시물</a></td>
                            <td>작성자2</td>
                            <td>1</td>
                            <td>2023-05-23</td>
                        </tr>
                        <tr>
                            <td>3</td>
                            <td>세 번째 게시물</a></td>
                            <td>작성자3</td>
                            <td>1</td>
                            <td>2023-05-24</td>
                        </tr>
                    </table>
                </div>

                <div class="content3">
                    <button id="btnNew">글쓰기</button><a href="/C:/Users/admin/Desktop/bookstore/Qnew.html">글쓰기
                </div>

            </div>
            
        </div>

    </div>
</body>
</html>