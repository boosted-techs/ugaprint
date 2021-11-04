<?php

//Less define our simple routes in this file to help us map to the exact methods in our project

$route['']                                  =               "Home/index";

$route['auth']                              =               "Auth/index";
$route['create-account']                    =               "Auth/create_account";
$route['home']                              =               "Home/index";
$route['inbox']                             =               "Home/inbox";
$route['login']                             =               "Auth/login";
$route['logout']                            =               "Auth/logout";
$route['products']                          =               "Home/products";
$route['profile']                           =               "Home/profile";
$route['search']                            =               "Home/search";
$route['settings']                          =               "Home/setting";
$route['shops']                             =               "Home/shop";
$route['upload_story']                      =               "Home/upload";

$route['user/(:any)']                       =               "Home/profile/$1";
