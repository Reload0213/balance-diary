<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <!-- https://fontawesome.com/start -->
    <script src="https://kit.fontawesome.com/f1def33959.js" crossorigin="anonymous"></script>
    <!-- default css -->
    <link rel="stylesheet" href="resources/css/format.css">
    <link rel="stylesheet" href="resources/css/header.css">
    <link rel="stylesheet" href="resources/css/recommend/recommend.css">
    <link rel="stylesheet" href="resources/css/footer.css">
    <!-- js -->
    <script type="text/javascript" src="resources/js/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="resources/js/header.js"></script>

    <style>
        @import url('https://fonts.googleapis.com/css?family=Montserrat:300,400,500&display=swap');
        @import url('http://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css');

        * {
            box-sizing:border-box;
        }
        
        body {
            text-align: center;
            overflow-x: hidden;
            margin: 0;
            color: #333;
            font-size: 18px;
            line-height: 1.6em;
        }

        
        a {
            -webkit-transition: all 0.1s linear;
            transition: all 0.1s linear;
            text-decoration: none;
            color: #333;
        }

        a:hover {
            -webkit-transform: scale(1.05);
            -moz-transform: scale(1.05);
            -ms-transform: scale(1.05);
            -o-transform: scale(1.05);
            transform: scale(1.05);
        }
        
        #container {
            width: 100%;
            height: 100%;
        }
        p.blank {
            height: 200px;
        }
       
    </style>
</head>
<body>
    <div id="container">
       <header>
                <section id="top-area">
                    <section id="top-menu">   
                        <div><a href="#" class="h-open-btn"><i class="fas fa-bars"></i></a></div>
                    <div><a href="home"><h1>BalanceDiary</h1></a></div>
                    <div class="top-side">
                        <div><a href="my-diary">My Diary</a></div>
                        <c:if test="${empty sessionScope.account.userid}">
                        <div><a href="isLogin">?????????</a></div>
                        </c:if>
                        <c:if test="${!empty sessionScope.account.userid}">
                        <div><a href="logout">????????????</a></div>
                        </c:if>
                    </div>
                </section>
                <nav id="top-nav">
                    <ul id="nav-menu">
                        <li><a href="#">???????????? <span>???</span></a>
                            <ul>
                                <li><a href="#">?????? ??????</a></li>
                                <li><a href="#">?????? ??????</a></li>
                            </ul>
                        </li>
                        <li><a href="#">?????? ????????? <span>???</span></a>
                            <ul>
                                <li><a href="lean-mass-up">???????????? + ?????? ??????</a></li>
                                <li><a href="diet">?????? ?????? ??????</a></li>
                                <li><a href="bulk-up">?????? + ?????? ??????</a></li>
                            </ul>
                        </li>
                        <li><a href="#">Information <span>???</span></a>
                            <ul>
                                <li><a href="q&a">?????? ?????? ?????? Q&A</a></li>
                                <li><a href="recommend">BalanceDiary ?????? ?????????</a></li>
                            </ul>
                        </li>
                        <li><a href="diary-main">???????????? Diary</a></li>
                        <li><a href="#">????????????</a></li>
                    </ul>
                </nav>
            </section>
            <div class="hamburger-container">
                <nav>
                    <div class="hamburger_menu">
                        <a href="#" class="h-close-btn"><i class="far fa-times-circle"></i></a>
                        <div class="logo"><a href="#">BalanceDiary</a></div>
                            <ul>
                                <li class="menu">
                                    <a class="main" href="#">?????? ??????</a>
                                    <ul class="sub">
                                        <li><a href="#">?????? ??????</a></li>
                                        <li><a href="#">?????? ??????</a></li>
                                    </ul>
                                </li>
                                <li class="menu">
                                    <a class="main" href="#">???????????????</a>
                                    <ul class="sub">
                                        <li><a href="lean-mass-up">???????????? + ?????? ??????</a></li>
                                        <li><a href="diet">?????? ?????? ??????</a></li>
                                        <li><a href="bulk-up">?????? + ?????? ??????</a></li>
                                    </ul>
                                </li>
                                <li class="menu">
                                    <a class="main" href="#">Information</a>
                                    <ul class="sub">
                                        <li><a href="q&a">?????? ?????? ?????? Q&A</a></li>
                                        <li><a href="recommend">BalanceDiary ?????? ?????????</a></li>
                                    </ul>
                                </li>
                                <li><a href="diary-main">???????????? Diary</a></li>
                                <li><a href="#">????????????</a></li>
                            </ul>
                        </div>
                    </nav>
                    <div class="overlay"></div>
                </div>
        </header>
        <main>
          <section class="rem-container">
            <article class="rem-title">
                <h1>11??? 4??????<br>
                    BalanceDiary ?????? ?????????</h1>
                    <h2>?????? ???????????? ?????????</h2>
                    <hr>
                    <p>????????? ?????? ??????????????????? ????????? ??????????????? ?????? ????????? ?????????<br>
                        ????????? ?????? ??????????????? 15??? ????????? ????????? ???????????? <br>
                        ????????? ????????? ?????? ??? ????????????!</p>
            </article>
            <article><img src="resources/images/rem-img.jpg" alt=""></article>
            <section class="rem-content-container">
                    <article class="video-wrap">
                        <div class="video">
                            <div class="video-container">
                                <iframe width="560" height="315" src="https://www.youtube.com/embed/ywVa9EiX9Sk" title="YouTube video player" 
                                frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                            </div>
                        </div>
                    </article>
                    <article class="rem-content1">
                        <h2>?????????</h2>
                        <p><span>1</span> ????????? ????????? ??????. ????????? ???????????? ????????? ????????? ???????????????. </p>
                        <p><span>2</span> ?????? ????????? ?????? ????????? ?????? ??????. ????????? ????????? 4???????????? ?????? ???????????? ????????????
                            ?????????. ???????????? ????????? ????????? ?????? ?????? ?????? ???????????? ????????????. ?????? ?????? ??????????????? ????????? ?????????
                            ?????? ???????????? 8?????? ?????????.</p>
                            <p><span>3</span> ??? ????????? ?????? ????????? ?????? ????????? ?????? ????????? ???????????????. </p>
                            <p><span>4</span> ????????? ????????? ??????. ????????? ???????????? ????????? ????????? ???????????????. </p>
                        </article>
                        <article class="rem-content2">
                            <h2>??????</h2>
                            <p>?????? 1/2 ????????? ?????? ???</p>
                            <p>1/3 ????????????, 8??????</p>
                            <p>(9??????)?????? ??????, ?????? ??? ???</p>
                            <p>(2/3??????) ??? ??????, ?????? ??? ??? </p>
                            <p>??????, 4??????</p>
                            <p>?????? ????????? ??????(9 ??????)</p>
                            <p>?????? ??????2??????</p>
                            <p>????????? ?????? 1/2???</p>
                            <p>????????? ?????? ???</p>
                        </article>
                </section>
            </section> 
                
            </main>
            <footer>
            <article class="footer-logo"><a href="home">BalanceDiary</a></article>
            <section class="footer-content-box">
                <nav>
                    <ul class="footer-nav">
                        <li><a href="#">???????????? ???</a></li>
                        <li><a href="#">???????????? ???</a></li>
                        <li><a href="#">???????????? ???</a></li>
                        <li><a href="#">???????????? ???</a></li>
                        <li><a href="#">???????????????????????? ???</a></li>
                        <li><a href="#">????????????</a></li>
                    </ul>
                </nav>
                <div class="footer-infor">
                    <address>
                        <h6>(???)?????????????????????</h6>
                        <p>????????????: ?????? ??? 00000 | ???????????????: 2011. 11. 11</p>
                        <p>?????????: ????????? | ?????????: ????????? | ?????????: ?????? ????????? ???????????????2??? 115 ????????????????????? 3??? 1109???</p>
                        <p>???????????????: 2011 11. 11 | ????????????: 02 - 0000 - 0000 </p>
                    </address>
                    <article>
                        <h6>?????????????????? 080-777-7777</h6>
                        <p>E-mail: BalanceDiary@naver.com</p>
                        <p>?????? : 09:00 - 18:00</p>
                    </article>
                </div>
                <div class="footer-aBox">
                    <a href="https://www.youtube.com"><i class="fab fa-youtube"></i></a>
                    <a href="https://www.twitter.com"><i class="fab fa-twitter"></i></a>
                    <a href="https://www.facebook.com"><i class="fab fa-facebook"></i></a>
                    <a href="https://www.instagram.com"><i class="fab fa-instagram"></i></a>
                    <a href="https://www.ePrivacy.or.kr"><img src="images/ePrivacy.png" alt="ePrivacy"></a>
                    <a href="https://www.kns.or.kr"><img src="images/kns.png" alt="kns"></a>
                    <a href="https://www.mfds.go.kr"><img src="images/foodsafe.png" alt="foodsafe"></a>
                    <a href="https://www.mohw.go.kr"><img src="images/bogun.png" alt="bogun"></a>
                </div>
                <div class="copyright"><h5>Copyright ??? balanceDiary co. Ltd All Rights Reserved.</h5></div>
            </section>
        </footer>
    </div>
</body>
</html>