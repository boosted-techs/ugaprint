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
    <style>
        .login-area .single-field {
            color: #dc4734;
        }

        .login-area .login-btn {
            background-color: #dc4734;
            color: #ffffff;
        }
    </style>

</head>

<body class="bg-transparent">

<main>
    <div class="main-wrapper pb-0 mb-0">
        <div class="timeline-wrapper">
            <div class="timeline-header shadow">
                <div class="container-fluid p-0">
                    <div class="row g-0 align-items-center">
                        <div class="col-lg-6">
                            <div class="timeline-logo-area d-flex align-items-center">
                                <div class="timeline-logo">
                                    <a href="//{$smarty.server.SERVER_NAME}">
                                       <b class="text-danger" style="font-size: 20px">UGA PRiNT</b>
                                    </a>
                                </div>
                                <div class="timeline-tagline">
                                    <h6 class="tagline">Buy and Sell any printery, Graphics etc with UGA PRINT</h6>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="login-area bg-white">
                                <form action="login" method="post">
                                    <div class="row align-items-center">
                                        <div class="col-md-5">
                                            <input type="text" name="email" required  placeholder="Email or Userame" class="single-field">
                                        </div>
                                        <div class="col-md-5">
                                            <input type="password" name="password" required placeholder="Password" class="single-field">
                                        </div>
                                        <div class="col-md-2">
                                            <button class="login-btn" >Login</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="timeline-page-wrapper">
                <div class="container-fluid p-0">
                    <div class="row g-0">
                        <div class="col-lg-6 order-2 order-lg-1">
                            <div class="timeline-bg-content bg-img" data-bg="//{$smarty.server.SERVER_NAME}/assets/images/banner/login-banner.jpg">
                                <h3 class="timeline-bg-title">Sign up today, Start selling right away</h3>
                            </div>
                        </div>
                        <div class="col-lg-6 order-1 order-lg-2 d-flex align-items-center justify-content-center">
                            <div class="signup-form-wrapper">
                                {if isset($smarty.get.error)}
                                    <div class="alert alert-danger rounded-0 text-center">
                                        {$smarty.get.error}
                                    </div>
                                {/if}
                                <h1 class="create-acc text-center">Create An Account</h1>
                                <div class="signup-inner text-center">
                                    <h3 class="title">Welcome to Uga Print</h3>
                                    <form class="signup-inner--form" action="//{$smarty.server.SERVER_NAME}/create-account" method="post">
                                        <div class="row">
                                            <div class="col-12">
                                                <input type="text" required class="single-field" name="names" placeholder="Names">
                                            </div>
                                            <div class="col-md-6">
                                                <input type="text" name="email" required class="single-field" placeholder="Email">
                                            </div>
                                            <div class="col-md-6">
                                                <input type="text" name="contact" required class="single-field" placeholder="Telephone">
                                            </div>
                                            <div class="col-12">
                                                <input type="password" name="password" required class="single-field" placeholder="Password">
                                            </div>
                                            <div class="col-12">
                                                <input type="text" name="address" required class="single-field" placeholder="Address">
                                            </div>
                                            <div class="col-md-6">
                                                <select class="nice-select" name="gender">
                                                    <option value="M">Male</option>
                                                    <option value="F">Female</option>
                                                </select>
                                            </div>
                                            <div class="col-md-6">
                                                <input type="date" name="date" required class="single-field"/>
                                            </div>
                                            <div class="col-12">
                                                <select class="nice-select" name="sortby">
                                                    <option value="Uganda">Uganda</option>
                                                    <option value="Kenya">Kenya</option>
                                                    <option value="Tanzania">Tanzania</option>
                                                    <option value="Rwanda">Rwanda</option>
                                                    <option value="others">E.T.C</option>
                                                </select>
                                            </div>
                                            <div class="col-12">
                                                <button class="submit-btn">Create Account</button>
                                            </div>
                                        </div>
                                        <h6 class="terms-condition">I have read & accepted the <a href="#">terms of use</a></h6>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>

<!-- JS
============================================ -->

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

</body>

</html>