<?php

//Less define our simple routes in this file to help us map to the exact methods in our project

$route['']                                  =               "Home/index";

$route['auth']                              =               "Auth/index";
$route['create-account']                    =               "Auth/create_account";
$route['home']                              =               "Home/index";
$route['inbox']                             =               "Messages/index";
$route['login']                             =               "Auth/login";
$route['logout']                            =               "Auth/logout";
$route['messages/save']                     =               "Messages/save";
$route['products']                          =               "Home/products";
$route['profile']                           =               "Home/profile";
$route['search']                            =               "Home/search";
$route['settings']                          =               "Home/setting";
$route['shops']                             =               "Home/shop";
$route['upload_story']                      =               "Home/upload";
$route['pay']                               =               "Home/pay";

$route['messages/update_chat/(:any)']       =               "Messages/update_chat/$1";
$route['inbox/(:any)']                      =               "Messages/inbox/$1";
$route['user/(:any)']                       =               "Home/profile/$1";
$route['service/(:any)']                    =               "Home/services/$1";
