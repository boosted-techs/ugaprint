{extends file="index.tpl"}
{block name="body"}
    <main>

        <div class="main-wrapper">
            <div class="profile-banner-large bg-img" data-bg="//{$smarty.server.SERVER_NAME}/assets/images/banner/login-banner.jpg">
            </div>
            <div class="profile-menu-area bg-white">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-lg-3 col-md-3">
                            <div class="profile-picture-box">
                                <figure class="profile-picture">
                                    <a href="profile.html">
                                        <img style="width:270px; height: 270px; object-fit: cover" src="//{$smarty.server.SERVER_NAME}/profile_pics/{$user.profile_pic}" alt="profile picture">
                                    </a>
                                </figure>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6 offset-lg-1">
                            <div class="profile-menu-wrapper">
                                <div class="main-menu-inner header-top-navigation">
                                    <nav>
                                        <ul class="main-menu">
                                            {*<li class="active"><a href="#">timeline</a></li>*}
                                            {*<li><a href="about.html">about</a></li>*}
                                            {*<li><a href="photos.html">photos</a></li>*}
                                            {*<li><a href="friends.html">friends</a></li>*}
                                            {*<li><a href="about.html">more</a></li>*}
                                            <!-- <li class="d-inline-block d-md-none"><a href="profile.html">edit profile</a></li> -->
                                        </ul>
                                    </nav>
                                </div>
                            </div>
                        </div>
                        {*<div class="col-lg-2 col-md-3 d-none d-md-block">*}
                            {*<div class="profile-edit-panel">*}
                                {*<button class="edit-btn">edit profile</button>*}
                            {*</div>*}
                        {*</div>*}
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-lg-3 order-2 order-lg-1">
                        <aside class="widget-area profile-sidebar">
                            <!-- widget single item start -->
                            <div class="card widget-item">
                                <h4 class="widget-title">{$user.names}</h4>
                                <div class="widget-body">
                                    <div class="about-author">
                                        <p></p>
                                        <ul class="author-into-list">
                                            <li><a href="#"><i class="bi bi-office-bag"></i>On UGAPRINT</a></li>
                                            <li><a href="#"><i class="bi bi-home"></i>{$user.address}</a></li>
                                            <li><a href="#"><i class="bi bi-phone"></i>{$user.contacts}</a></li>
                                            <li><a href="#"><i class="bi bi-envelop"></i>{$user.email}</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <!-- widget single item end -->

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

                            <!-- widget single item end -->
                        </aside>
                    </div>

                    <div class="col-lg-6 order-1 order-lg-2">
                        {foreach $stories item=list}
                            <div class="card">
                                <!-- post title start -->
                                <div class="post-title d-flex align-items-center">
                                    <!-- profile picture end -->
                                    <div class="profile-thumb">
                                        <a href="#">
                                            <figure class="profile-thumb-middle">
                                                <img src="//{$smarty.server.SERVER_NAME}/profile_pics/{$list.profile_pic}" alt="profile picture">
                                            </figure>
                                        </a>
                                    </div>
                                    <!-- profile picture end -->

                                    <div class="posted-author">
                                        <h6 class="author"><a href="profile.html">{$list.names}</a></h6>
                                        <span class="post-time">{$list.date_added}</span>
                                    </div>

                                    <div class="post-settings-bar">
                                        <span></span>
                                        <span></span>
                                        <span></span>
                                        <div class="post-settings arrow-shape">
                                            <ul>
                                                <li><button>copy link to adda</button></li>
                                                <li><button>edit post</button></li>
                                                <li><button>embed adda</button></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <!-- post title start -->
                                <div class="post-content">
                                    <p class="post-desc">
                                        {$list.story}
                                    </p>
                                    {if $list.image != 1}
                                        <div class="post-thumb-gallery">
                                            <figure class="post-thumb img-popup">
                                                <a href="assets/images/post/post-1.jpg">
                                                    <img src="//{$smarty.server.SERVER_NAME}/media/{$list.image}" alt="post image">
                                                </a>
                                            </figure>
                                        </div>
                                    {/if}
                                    <div class="post-meta">
                                        <button class="post-meta-like">
                                            <i class="bi bi-heart-beat"></i>
                                            <span>{$list.comments} people like this</span>

                                        </button>
                                        <ul class="comment-share-meta">
                                            <li>
                                                <button class="post-comment">
                                                    <i class="bi bi-chat-bubble"></i>
                                                    <span>{$list.likes}</span>
                                                </button>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <!-- post status end -->
                        {/foreach}
                    </div>

                    <div class="col-lg-3 order-3">
                        <aside class="widget-area">
                            <!-- widget single item start -->

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
                </div>
            </div>
        </div>

    </main>

    <!-- Scroll to top start -->
    <div class="scroll-top not-visible">
        <i class="bi bi-finger-index"></i>
    </div>
    <!-- Scroll to Top End -->
{/block}