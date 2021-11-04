<!doctype html>
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>UGA PRINT</title>
    <meta name="robots" content="noindex, follow" />
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="//{$smarty.server.SERVER_NAME}/assets/images/favicon.ico">

    <!-- CSS
	============================================ -->
    <!-- google fonts -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,300i,400,400i,500,500i,700,700i,900" rel="stylesheet">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="//{$smarty.server.SERVER_NAME}/assets/css/vendor/bootstrap.min.css">
    <!-- Icon Font CSS -->
    <link rel="stylesheet" href="//{$smarty.server.SERVER_NAME}/assets/css/vendor/bicon.min.css">
    <!-- Flat Icon CSS -->
    <link rel="stylesheet" href="//{$smarty.server.SERVER_NAME}/assets/css/vendor/flaticon.css">
    <!-- audio & video player CSS -->
    <link rel="stylesheet" href="//{$smarty.server.SERVER_NAME}/assets/css/plugins/plyr.css">
    <!-- Slick CSS -->
    <link rel="stylesheet" href="//{$smarty.server.SERVER_NAME}/assets/css/plugins/slick.min.css">
    <!-- nice-select CSS -->
    <link rel="stylesheet" href="//{$smarty.server.SERVER_NAME}/assets/css/plugins/nice-select.css">
    <!-- perfect scrollbar css -->
    <link rel="stylesheet" href="//{$smarty.server.SERVER_NAME}/assets/css/plugins/perfect-scrollbar.css">
    <!-- light gallery css -->
    <link rel="stylesheet" href="//{$smarty.server.SERVER_NAME}/assets/css/plugins/lightgallery.min.css">
    <!-- Main Style CSS -->
    <link rel="stylesheet" href="//{$smarty.server.SERVER_NAME}/assets/css/style.css">

</head>

<body>

<!-- header area start -->
<header>
    <div class="header-top sticky bg-white d-none d-lg-block">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-md-5">
                    <!-- header top navigation start -->
                    <div class="header-top-navigation">
                        <nav>
                            <ul>
                                <li class="active"><a href="//{$smarty.server.SERVER_NAME}">home</a></li>
                                <li ><a  href="//{$smarty.server.SERVER_NAME}/products">Products</a>

                                </li>
                                <li ><a  href="//{$smarty.server.SERVER_NAME}/shops">Top sellers</a>
                                </li>
                            </ul>
                        </nav>
                    </div>
                    <!-- header top navigation start -->
                </div>

                <div class="col-md-2">
                    <!-- brand logo start -->
                    <div class="brand-logo text-center">
                        <b style="font-size: 20px" class="text-danger">UGA PRiNT</b>
                    </div>
                    <!-- brand logo end -->
                </div>

                <div class="col-md-5">
                    <div class="header-top-right d-flex align-items-center justify-content-end">
                        {if ! isset($index_page)}
                        <!-- header top search start -->
                            <div class="header-top-search">
                                <form class="top-search-box">
                                    <input type="text" {if isset($smarty.get.q)} value="{$smarty.get.q}" {/if} name="q" placeholder="Search" class="top-search-field">
                                    <button class="top-search-btn"><i class="flaticon-search"></i></button>
                                </form>
                            </div>
                        {/if}
                        <!-- header top search end -->
                        {if ! empty($user)}
                            <!-- profile picture start -->
                            <div class="profile-setting-box">
                                <div class="profile-thumb-small">
                                    <a href="javascript:void(0)" class="profile-triger">
                                        <figure>
                                            <img src="//{$smarty.server.SERVER_NAME}/profile_pics/{$user.profile_pic}" alt="profile picture">
                                        </figure>
                                    </a>
                                    <div class="profile-dropdown">
                                        <div class="profile-head">
                                            <h5 class="name"><a href="//{$smarty.server.SERVER_NAME}/profile">{$user.names}</a></h5>
                                            <a class="mail" href="//{$smarty.server.SERVER_NAME}/">{$user.email}</a>
                                        </div>
                                        <div class="profile-body">
                                            <ul>
                                                <li><a href="//{$smarty.server.SERVER_NAME}/profile"><i class="flaticon-user"></i>Profile</a></li>
                                                <li><a href="//{$smarty.server.SERVER_NAME}/inbox"><i class="flaticon-message"></i>Inbox</a></li>
                                                <li><a href="//{$smarty.server.SERVER_NAME}/profile"><i class="flaticon-document"></i>Activity</a></li>
                                            </ul>
                                            <ul>
                                                <li><a href="//{$smarty.server.SERVER_NAME}/settings"><i class="flaticon-settings"></i>Setting</a></li>
                                                <li><a href="//{$smarty.server.SERVER_NAME}/logout"><i class="flaticon-unlock"></i>Sign out</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        {else}
                            <!-- profile picture start -->
                            <div class="profile-setting-box">
                                <div class="profile-thumb-small">
                                    <a href="javascript:void(0)" class="profile-triger">
                                        <figure>
                                            <img src="//{$smarty.server.SERVER_NAME}/profile_pics/blank.png" alt="profile picture">
                                        </figure>
                                    </a>
                                    <div class="profile-dropdown">
                                        <div class="profile-head">
                                            <h5 class="name"><a href="//{$smarty.server.SERVER_NAME}/auth">LOGIN</a></h5>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        {/if}
                        <!-- profile picture end -->
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>
<!-- header area end -->
<!-- header area start -->
<header>
    <div class="mobile-header-wrapper sticky d-block d-lg-none">
        <div class="mobile-header position-relative ">

                <div class="mobile-logo text-center">
                    <b style="font-size: 20px" class="text-danger">UGA PRINT</b>
                </div>

            <div class="mobile-menu w-100">
                <ul>

                    <li>
                        <button class="notification request-trigger"><i class="flaticon-notification"></i>
                            <span>0</span>
                        </button>
                        <ul class="frnd-request-list">
                            <li>
                                <div class="frnd-request-member">
                                    No Notifications
                                </div>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <button class="chat-trigger notification"><i class="flaticon-chats"></i>
                            <span>0</span>
                        </button>
                        <div class="mobile-chat-box">
                            <div class="live-chat-title">
                                <!-- profile picture end -->
                                No chats
                            </div>
                        </div>
                    </li>
                    <li>
                        <button class="search-trigger">
                            <i class="search-icon flaticon-search"></i>
                            <i class="close-icon flaticon-cross-out"></i>
                        </button>
                        <div class="mob-search-box">
                            <form class="mob-search-inner">
                                <input type="text" {if isset($smarty.get.q)} value="{$smarty.get.q}" {/if} name="q" placeholder="Search Here" class="mob-search-field">
                                <button class="mob-search-btn"><i class="flaticon-search"></i></button>
                            </form>
                        </div>
                    </li>
                </ul>
            </div>
            {if ! empty($user)}
                <div class="mobile-header-profile">
                    <!-- profile picture end -->
                    <div class="profile-thumb profile-setting-box">
                        <a href="javascript:void(0)" class="profile-triger">
                            <figure class="profile-thumb-middle">
                                <img src="//{$smarty.server.SERVER_NAME}/profile_pics/{$user.profile_pic}" alt="profile picture">
                            </figure>
                        </a>
                        <div class="profile-dropdown text-left">
                            <div class="profile-head">
                                <h5 class="name"><a href="//{$smarty.server.SERVER_NAME}/profile">{$user.names}</a></h5>
                                <a class="mail" href="//{$smarty.server.SERVER_NAME}/profile">{$user.email}</a>
                            </div>
                            <div class="profile-body">
                                <ul>
                                    <li><a href="//{$smarty.server.SERVER_NAME}/profile"><i class="flaticon-user"></i>Profile</a></li>
                                    <li><a href="//{$smarty.server.SERVER_NAME}/inbox"><i class="flaticon-message"></i>Inbox</a></li>
                                    <li><a href="//{$smarty.server.SERVER_NAME}/profile"><i class="flaticon-document"></i>Activity</a></li>
                                </ul>
                                <ul>
                                    <li><a href="//{$smarty.server.SERVER_NAME}/settings"><i class="flaticon-settings"></i>Setting</a></li>
                                    <li><a href="//{$smarty.server.SERVER_NAME}/logout"><i class="flaticon-unlock"></i>Sign out</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- profile picture end -->
                </div>
            {/if}
        </div>
    </div>
</header>
<!-- header area end -->
<main>
    <div class="main-wrapper pt-80">
        {if isset($index_page)}
            <div class="bg p-5">
                <div class="col-md-6 mx-auto p-5">
                    <form action="//{$smarty.server.SERVER_NAME}/search" class="top-search-box" method="get">
                        <input type="text" {if isset($smarty.get.q)} value="{$smarty.get.q}" {/if} name="q" placeholder="Search" class="top-search-field">
                        <button class="top-search-btn"><i class="flaticon-search"></i></button>
                    </form>
                </div>
            </div>
        {/if}
        <div class="container">
            <div class="row">
                {if ! isset($no_side_bars)}
                    <div class="col-lg-3 order-2 order-lg-1">
                        <aside class="widget-area">
                            <!-- widget single item start -->
                            <div class="card card-profile widget-item p-0">
                                <div class="profile-banner">
                                    <figure class="profile-banner-small">
                                        <a href="profile.html">
                                            <img src="//{$smarty.server.SERVER_NAME}/assets/images/banner/login-banner.jpg" alt="">
                                        </a>
                                        {if ! empty($user)}
                                            <a href="profile.html" class="profile-thumb-2">
                                                <img src="//{$smarty.server.SERVER_NAME}/profile_pics/{$user.profile_pic}" alt="">
                                            </a>
                                        {/if}
                                    </figure>
                                    {if ! empty($user)}
                                        <div class="profile-desc text-center">
                                            <h6 class="author"><a href="profile.html">{$user.names}</a></h6>
                                            <p>{$user.username} - {$user.email}</p>
                                        </div>
                                    {/if}
                                </div>
                            </div>
                            <!-- widget single item start -->

                            <!-- widget single item start -->
                            <div class="card widget-item">
                                <h4 class="widget-title">Services</h4>
                                <div class="widget-body">
                                    <ul class="like-page-list-wrapper">
                                        {foreach $categories item=list}
                                            <li class="unorder-list">
                                                <!-- profile picture end -->
                                                <div class="profile-thumb">
                                                    <a href="//{$smarty.server.SERVER_NAME}/service/{$list.url}">
                                                        <figure class="profile-thumb-small">
                                                            <img src="//{$smarty.server.SERVER_NAME}/icons/{$list.thumbnail}" alt="profile picture">
                                                        </figure>
                                                    </a>
                                                </div>
                                                <!-- profile picture end -->
                                                <div class="unorder-list-info">
                                                    <h3 class="list-title"><a href="//{$smarty.server.SERVER_NAME}/service/{$list.url}">{$list.category}</a></h3>
                                                    <p class="list-subtitle"><a href="//{$smarty.server.SERVER_NAME}/service/{$list.url}">(0)</a></p>
                                                </div>
                                            </li>
                                        {/foreach}
                                    </ul>
                                </div>
                            </div>
                            <!-- widget single item end -->

                            <!-- widget single item start -->
                            <div class="card widget-item">
                                <h4 class="widget-title">Quick actions</h4>
                                <div class="widget-body">
                                    <ul class="like-page-list-wrapper">
                                        <li class="unorder-list">
                                            <!-- profile picture end -->
                                            <div class="profile-thumb">
                                                <a href="#">
                                                    <figure class="profile-thumb-small">
                                                        <img src="//{$smarty.server.SERVER_NAME}/icons/post-now.png" alt="profile picture">
                                                    </figure>
                                                </a>
                                            </div>
                                            <!-- profile picture end -->

                                            <div class="unorder-list-info">
                                                <h3 class="list-title"><a href="#">Post a service</a></h3>
                                                <p class="list-subtitle">Are you selling any thing, post it on.</p>
                                            </div>
                                        </li>
                                        <li class="unorder-list">
                                            <!-- profile picture end -->
                                            <div class="profile-thumb">
                                                <a href="#">
                                                    <figure class="profile-thumb-small">
                                                        <img src="//{$smarty.server.SERVER_NAME}/icons/request-now.png" alt="request picture">
                                                    </figure>
                                                </a>
                                            </div>
                                            <!-- profile picture end -->

                                            <div class="unorder-list-info">
                                                <h3 class="list-title"><a href="#">Request for a service</a></h3>
                                                <p class="list-subtitle">Looking for who to do it you.</p>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <!-- widget single item end -->
                        </aside>
                    </div>
                {/if}
                    {block name="body"}{/block}
                {if ! isset($no_side_bars)}
                    <div class="col-lg-3 order-3">
                        <aside class="widget-area">
                            <!-- widget single item start -->
                            <div class="card widget-item">
                                <h4 class="widget-title">Recent Notifications</h4>
                                <div class="widget-body">
                                    <ul class="like-page-list-wrapper">
                                        <li class="unorder-list">
                                            <!-- profile picture end -->
                                            <div class="profile-thumb">
                                                <a href="#">
                                                    <figure class="profile-thumb-small">
                                                        <img src="assets/images/profile/profile-35x35-4.jpg" alt="profile picture">
                                                    </figure>
                                                </a>
                                            </div>
                                            <!-- profile picture end -->

                                            <div class="unorder-list-info">
                                                <h3 class="list-title"><a href="#">Any one can join with us if you want</a></h3>
                                                <p class="list-subtitle">39 min ago</p>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <!-- widget single item end -->

                            <!-- widget single item start -->
                            <div class="card widget-item">
                                <h4 class="widget-title">Advertizement</h4>
                                <div class="widget-body">
                                    <div class="add-thumb">
                                        <a href="#">
                                            <img src="//{$smarty.server.SERVER_NAME}/assets/images/banner/login-banner.jpg" alt="advertisement">
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <!-- widget single item end -->

                            <!-- widget single item start -->
                            <div class="card widget-item">
                                <h4 class="widget-title">TOP SELLING BRANDS</h4>
                                <div class="widget-body">
                                    <ul class="like-page-list-wrapper">
                                        <li class="unorder-list">
                                            <!-- profile picture end -->
                                            <div class="profile-thumb">
                                                <a href="#">
                                                    <figure class="profile-thumb-small">
                                                        <img src="assets/images/profile/profile-35x35-20.jpg" alt="profile picture">
                                                    </figure>
                                                </a>
                                            </div>
                                            <!-- profile picture end -->

                                            <div class="unorder-list-info">
                                                <h3 class="list-title"><a href="#">Active Mind</a></h3>
                                                <p class="list-subtitle"><a href="#">fitness</a></p>
                                            </div>
                                            <button class="like-button">
                                                <img class="heart" src="assets/images/icons/heart.png" alt="">
                                                <img class="heart-color" src="assets/images/icons/heart-color.png" alt="">
                                            </button>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <!-- widget single item end -->
                        </aside>
                    </div>
                {/if}
            </div>
        </div>
    </div>
</main>


<!-- Scroll to top start -->
<div class="scroll-top not-visible">
    <i class="bi bi-finger-index"></i>
</div>
<!-- Scroll to Top End -->


<!-- Modernizer JS -->
<script src="//{$smarty.server.SERVER_NAME}/assets/js/vendor/modernizr-3.6.0.min.js"></script>
<!-- jQuery JS -->
<script src="//{$smarty.server.SERVER_NAME}/assets/js/vendor/jquery-3.6.0.min.js"></script>
<!-- Bootstrap JS -->
<script src="//{$smarty.server.SERVER_NAME}/assets/js/vendor/bootstrap.bundle.min.js"></script>
<!-- Slick Slider JS -->
<script src="//{$smarty.server.SERVER_NAME}/assets/js/plugins/slick.min.js"></script>
<!-- nice select JS -->
<script src="//{$smarty.server.SERVER_NAME}/assets/js/plugins/nice-select.min.js"></script>
<!-- audio video player JS -->
<script src="//{$smarty.server.SERVER_NAME}/assets/js/plugins/plyr.min.js"></script>
<!-- perfect scrollbar js -->
<script src="//{$smarty.server.SERVER_NAME}/assets/js/plugins/perfect-scrollbar.min.js"></script>
<!-- light gallery js -->
<script src="//{$smarty.server.SERVER_NAME}/assets/js/plugins/lightgallery-all.min.js"></script>
<!-- image loaded js -->
<script src="//{$smarty.server.SERVER_NAME}/assets/js/plugins/imagesloaded.pkgd.min.js"></script>
<!-- isotope filter js -->
<script src="//{$smarty.server.SERVER_NAME}/assets/js/plugins/isotope.pkgd.min.js"></script>
<!-- Main JS -->
<script src="//{$smarty.server.SERVER_NAME}/assets/js/main.js"></script>