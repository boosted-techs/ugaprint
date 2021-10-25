<?php

//Less define our simple routes in this file to help us map to the exact methods in our project

$route['']                                  =               "Auth/index";
$route['create-account']                    =               "Accounts/new_account";
$route['dashboard']                         =               "Dashboard/index";
$route['get-adverts']                       =               "Dashboard/get_adverts";
$route['get-latest-accounts']               =               "Dashboard/get_latest_users";
$route['get-photo-updates']                 =               "Media/get_media_updates";
$route['login']                             =               "Auth/login";
$route['logout']                            =               "Auth/sign_out";
$route['new-account']                       =               "Accounts/create_account";
$route['reset-password']                    =               "Auth/forgot_password";
$route['recover-password']                  =               "Auth/forgot_password";
$route['send-recovery-mail']                =               "Auth/send_recovery_mail";
$route['search-location']                   =               "Auth/search_location";
$route['search-matches']                    =               "Matches/search";
$route['validate-email']                    =               "Auth/validate_email";
$route['validate-password']                 =               "Auth/validate_password";

//Login process
$route['dashboard/(:any)']                  =               "Dashboard/index/$1";
$route['recover-password/(:any)']           =               "Auth/reset_password/$1";