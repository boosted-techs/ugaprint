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

</head>
<body>
<div class="card light shadow border-0 col-md-6 mx-auto mt-5">
    {if isset($smarty.get.transaction_id)}
        <div class="card-header">
            <h4><span class="text-danger">UGA PRINT</span> PAYMENTS</h4>
        </div>
        <div class="card-body">
            <p>Hello <b class="text-primary">{$user.names}</b>, your payment of <b class="text-danger">UGX {$fee|number_format:2}</b> to <b class="text-info">{$profile.names}</b> has been successful</b>.</p>
        </div>
    {/if}
</div>
</body>

