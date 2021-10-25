const homeLeftBar = {
    data () {
        return {
            serverName : window.location.host
        }
    },
    template : `
    <div class="col-lg-3 order-2 font-open-sans order-lg-1">      
            <aside class="widget-area">
                <!-- widget single item start -->
                <div class="card card-profile widget-item p-0">
                    <div class="profile-banner">
                        <figure class="profile-banner-small">
                            <a href="profile.html">
                                <img :src="'//' + serverName + '/assets/dashboard/images/banner/800-400.jpg'" alt="">
                            </a>
                            <a href="profile.html" class="profile-thumb-2">
                                <img :src="'//' + serverName + '/assets/dashboard/images/profile/profile-midle-1.jpg'" alt="">
                            </a>
                        </figure>
                        <div class="profile-desc text-center">
                            <h6 class="author"><a href="profile.html">Erik Jhonson</a></h6>
                            <p>Any one can join with but Social network us if you want Any one can join with us if you want</p>
                        </div>
                    </div>
                </div>
                <!-- widget single item start -->

                <!-- widget single item start -->
                <div class="card widget-item">
                    <h4 class="widget-title">page you may like</h4>
                    <div class="widget-body">
                        <ul class="like-page-list-wrapper">
                            <li class="unorder-list">
                                <!-- profile picture end -->
                                <div class="profile-thumb">
                                    <a href="#">
                                        <figure class="profile-thumb-small">
                                            <img :src="'//' + serverName + '/assets/dashboard/images/profile/profile-35x35-1.jpg'" alt="profile picture">
                                        </figure>
                                    </a>
                                </div>
                                <!-- profile picture end -->

                                <div class="unorder-list-info">
                                    <h3 class="list-title"><a href="#">Travel The World</a></h3>
                                    <p class="list-subtitle"><a href="#">adventure</a></p>
                                </div>
                                <button class="like-button active">
                                    <img class="heart" :src="'//' + serverName + '/assets/dashboard/images/icons/heart.png'" alt="">
                                    <img class="heart-color" :src="'//' + serverName + '/assets/dashboard/images/icons/heart-color.png'" alt="">
                                </button>
                            </li>
                            <li class="unorder-list">
                                <!-- profile picture end -->
                                <div class="profile-thumb">
                                    <a href="#">
                                        <figure class="profile-thumb-small">
                                            <img :src="'//' + serverName + '/assets/dashboard/images/profile/profile-35x35-10.jpg'" alt="profile picture">
                                        </figure>
                                    </a>
                                </div>
                                <!-- profile picture end -->

                                <div class="unorder-list-info">
                                    <h3 class="list-title"><a href="#">Foodcort Nirala</a></h3>
                                    <p class="list-subtitle"><a href="#">food</a></p>
                                </div>
                                <button class="like-button">
                                    <img class="heart" :src="'//' + serverName + 'assets/dashboard/images/icons/heart.png'" alt="">
                                    <img class="heart-color" :src="'//' + serverName + '/assets/dashboard/images/icons/heart-color.png'" alt="">
                                </button>
                            </li>
                            <li class="unorder-list">
                                <!-- profile picture end -->
                                <div class="profile-thumb">
                                    <a href="#">
                                        <figure class="profile-thumb-small">
                                            <img :src="'//' + serverName + '/assets/dashboard/images/profile/profile-35x35-5.jpg'" alt="profile picture">
                                        </figure>
                                    </a>
                                </div>
                                <!-- profile picture end -->

                                <div class="unorder-list-info">
                                    <h3 class="list-title"><a href="#">Rolin Theitar</a></h3>
                                    <p class="list-subtitle"><a href="#">drama</a></p>
                                </div>
                                <button class="like-button">
                                    <img class="heart" :src="'//' + serverName + '/assets/dashboard/images/icons/heart.png'" alt="">
                                    <img class="heart-color" :src="'//' + serverName + '/assets/dashboard/images/icons/heart-color.png'" alt="">
                                </button>
                            </li>
                            <li class="unorder-list">
                                <!-- profile picture end -->
                                <div class="profile-thumb">
                                    <a href="#">
                                        <figure class="profile-thumb-small">
                                            <img :src="'//' + serverName + '/assets/dashboard/images/profile/profile-35x35-4.jpg'" alt="profile picture">
                                        </figure>
                                    </a>
                                </div>
                                <!-- profile picture end -->

                                <div class="unorder-list-info">
                                    <h3 class="list-title"><a href="#">Active Mind</a></h3>
                                    <p class="list-subtitle"><a href="#">fitness</a></p>
                                </div>
                                <button class="like-button">
                                    <img class="heart" :src="'//' + serverName + '/assets/dashboard/images/icons/heart.png'" alt="">
                                    <img class="heart-color" :src="'//' + serverName + '/assets/dashboard/images/icons/heart-color.png'" alt="">
                                </button>
                            </li>
                        </ul>
                    </div>
                </div>
                <!-- widget single item end -->

                <!-- widget single item start -->
                <div class="card widget-item">
                    <h4 class="widget-title">latest top news</h4>
                    <div class="widget-body">
                        <ul class="like-page-list-wrapper">
                            <li class="unorder-list">
                                <!-- profile picture end -->
                                <div class="profile-thumb">
                                    <a href="#">
                                        <figure class="profile-thumb-small">
                                            <img :src="'//' + serverName + '/assets/dashboard/images/profile/profile-35x35-20.jpg'" alt="profile picture">
                                        </figure>
                                    </a>
                                </div>
                                <!-- profile picture end -->

                                <div class="unorder-list-info">
                                    <h3 class="list-title"><a href="#">Any one can join with us if you want</a></h3>
                                    <p class="list-subtitle">2 min ago</p>
                                </div>
                            </li>
                            <li class="unorder-list">
                                <!-- profile picture end -->
                                <div class="profile-thumb">
                                    <a href="#">
                                        <figure class="profile-thumb-small">
                                            <img :src="'//' + serverName + '/assets/dashboard/images/profile/profile-35x35-18.jpg'" alt="profile picture">
                                        </figure>
                                    </a>
                                </div>
                                <!-- profile picture end -->

                                <div class="unorder-list-info">
                                    <h3 class="list-title"><a href="#">Any one can join with us if you want</a></h3>
                                    <p class="list-subtitle">20 min ago</p>
                                </div>
                            </li>
                            <li class="unorder-list">
                                <!-- profile picture end -->
                                <div class="profile-thumb">
                                    <a href="#">
                                        <figure class="profile-thumb-small">
                                            <img :src="'//' + serverName + '/assets/dashboard/images/profile/profile-35x35-13.jpg'" alt="profile picture">
                                        </figure>
                                    </a>
                                </div>
                                <!-- profile picture end -->

                                <div class="unorder-list-info">
                                    <h3 class="list-title"><a href="#">Any one can join with us if you want</a></h3>
                                    <p class="list-subtitle">30 min ago</p>
                                </div>
                            </li>
                            <li class="unorder-list">
                                <!-- profile picture end -->
                                <div class="profile-thumb">
                                    <a href="#">
                                        <figure class="profile-thumb-small">
                                            <img :src="'//' + serverName + '/assets/dashboard/images/profile/profile-35x35-17.jpg'" alt="profile picture">
                                        </figure>
                                    </a>
                                </div>
                                <!-- profile picture end -->

                                <div class="unorder-list-info">
                                    <h3 class="list-title"><a href="#">Any one can join with us if you want</a></h3>
                                    <p class="list-subtitle">40 min ago</p>
                                </div>
                            </li>
                            <li class="unorder-list">
                                <!-- profile picture end -->
                                <div class="profile-thumb">
                                    <a href="#">
                                        <figure class="profile-thumb-small">
                                            <img :src="'//' + serverName + '/assets/dashboard/images/profile/profile-35x35-10.jpg'" alt="profile picture">
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
            </aside>
       
        

    </div>
    `
}