<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html style="font-size: 16px;">
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="utf-8">
    <meta name="keywords" content="​Interior Design for Your Home, ​Our Design Creativity, 01, About Design, ​Turn your house into a Home, 02, About Design, Nature Collections, Interior Design Ideas for Your Modern Home, Contact Us, ​Sign me up!">
    <meta name="description" content="">
    <meta name="page_type" content="np-template-header-footer-from-plugin">
    <title>main page</title>
    <link rel="stylesheet" href="nicepage.css" media="screen">
<link rel="stylesheet" href="main-page.css" media="screen">
    <script class="u-script" type="text/javascript" src="jquery.js" defer=""></script>
    <script class="u-script" type="text/javascript" src="nicepage.js" defer=""></script>
    <meta name="generator" content="Nicepage 4.6.3, nicepage.com">
    <link id="u-theme-google-font" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i|Open+Sans:300,300i,400,400i,500,500i,600,600i,700,700i,800,800i">
    <link id="u-page-google-font" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Playfair+Display:400,400i,500,500i,600,600i,700,700i,800,800i,900,900i|Montserrat:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i">
    
    
    
    
    
    
    <script type="application/ld+json">{
		"@context": "http://schema.org",
		"@type": "Organization",
		"name": ""
}</script>
    <meta name="theme-color" content="#478ac9">
    <meta property="og:title" content="main page">
    <meta property="og:type" content="website">
  </head>
 <body class="u-body u-xl-mode"><header class="u-black u-clearfix u-header u-sticky u-header" id="sec-e47c"><div class="u-clearfix u-sheet u-valign-middle u-sheet-1">
        <nav class="u-menu u-menu-dropdown u-offcanvas u-menu-1">
          <div class="menu-collapse" style="font-size: 1rem; letter-spacing: 0px;">
            <a class="u-button-style u-custom-left-right-menu-spacing u-custom-padding-bottom u-custom-top-bottom-menu-spacing u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base" href="#">
              <svg class="u-svg-link" viewBox="0 0 24 24"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#menu-hamburger"></use></svg>
              <svg class="u-svg-content" version="1.1" id="menu-hamburger" viewBox="0 0 16 16" x="0px" y="0px" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns="http://www.w3.org/2000/svg"><g><rect y="1" width="16" height="2"></rect><rect y="7" width="16" height="2"></rect><rect y="13" width="16" height="2"></rect>
</g></svg>
            </a>
          </div>
          <div class="u-custom-menu u-nav-container">
            <ul class="u-nav u-unstyled u-nav-1"><li class="u-nav-item"><a class="u-button-style u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base" href="/" style="padding: 10px 6px;">Home</a>
</li><li class="u-nav-item"><a class="u-button-style u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base"  style="padding: 10px 6px;">배달음식</a><div class="u-nav-popup"><ul class="u-h-spacing-20 u-nav u-unstyled u-v-spacing-10 u-nav-2"><li class="u-nav-item"><a class="u-button-style u-nav-link u-white" href="/foodstore">오늘 뭐먹지?</a>
</li><li class="u-nav-item"><a class="u-button-style u-nav-link u-white" href="/fsboard/list">같이먹어요</a>
</li></ul>
</div>
</li><li class="u-nav-item"><a class="u-button-style u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base" href="/room/list" style="padding: 10px 6px;">룸쉐어</a>
</li><li class="u-nav-item"><a class="u-button-style u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base" href="/petcare" style="padding: 10px 6px;">펫케어</a>
</li><li class="u-nav-item"><a class="u-button-style u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base" href="/board/list" style="padding: 10px 6px;">우리동네 이야기</a>
</li><li class="u-nav-item"><a class="u-button-style u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base" href="공동구매 링크 넣어주세요" style="padding: 10px 6px;">공동구매</a>
</li><li class="u-nav-item"><a class="u-button-style u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base" href="/CSBoard/list" style="padding: 10px 6px;">고객센터</a>
																									
</li><c:if test="${user.memberid == null && user.memberpw == null }"><li class="u-nav-item"><a class="u-button-style u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base" href="/loginform"style="padding: 10px 6px;">로그인</a>
</li><li class="u-nav-item"><a class="u-button-style u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base" href="/joinform" style="padding: 10px 6px;">회원가입</a>
</li></c:if>	

<c:if test="${user.memberid != null && user.memberpw != null }"><li class="u-nav-item"><a class="u-button-style u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base" href="/mypage"style="padding: 10px 6px;">마이페이지</a>
</li><li class="u-nav-item"><a class="u-button-style u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base" href="/logout" style="padding: 10px 6px;">로그아웃</a>
</li></c:if></ul>								
          </div>
          <div class="u-custom-menu u-nav-container-collapse">
            <div class="u-black u-container-style u-inner-container-layout u-opacity u-opacity-95 u-sidenav">
              <div class="u-inner-container-layout u-sidenav-overflow">
                <div class="u-menu-close"></div>
                <ul class="u-align-center u-nav u-popupmenu-items u-unstyled u-nav-3"><li class="u-nav-item"><a class="u-button-style u-nav-link" href="Home.html" style="padding: 10px 6px;">Home</a>
</li><li class="u-nav-item"><a class="u-button-style u-nav-link" href="To---Do-List.html" style="padding: 10px 6px;">배달음식</a><div class="u-nav-popup"><ul class="u-h-spacing-20 u-nav u-unstyled u-v-spacing-10 u-nav-4"><li class="u-nav-item"><a class="u-button-style u-nav-link">오늘 뭐먹지?</a>
</li><li class="u-nav-item"><a class="u-button-style u-nav-link">같이먹어요</a>
</li></ul>
</div>
</li><li class="u-nav-item"><a class="u-button-style u-nav-link" href="Game-with-JS.html" style="padding: 10px 6px;">룸쉐어</a>
</li><li class="u-nav-item"><a class="u-button-style u-nav-link" style="padding: 10px 6px;">펫케어</a>
</li><li class="u-nav-item"><a class="u-button-style u-nav-link" style="padding: 10px 6px;">우리동네 이야기</a>
</li><li class="u-nav-item"><a class="u-button-style u-nav-link" style="padding: 10px 6px;">공동구매</a>
</li><li class="u-nav-item"><a class="u-button-style u-nav-link" style="padding: 10px 6px;">고객센터</a>
</li><li class="u-nav-item"><a class="u-button-style u-nav-link" style="padding: 10px 6px;">로그인/회원가입</a>
</li></ul>
              </div>
            </div>
            <div class="u-black u-menu-overlay u-opacity u-opacity-70"></div>
          </div>
        </nav>
        <h4 class="u-text u-text-default u-text-1"><a href="/">혼사모</a></h4>
      </div></header>
    </body>
    </html>