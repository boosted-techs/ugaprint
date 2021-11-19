<script src="//{$smarty.server.SERVER_NAME}/assets/js/vendor/jquery-3.6.0.min.js"></script>
<script src="https://checkout.flutterwave.com/v3.js"></script>
<script>
    $(document).ready(function(){
        get_amount()
        }
    )
    function get_amount() {
        let amount = prompt("How much do you want to pay to {$user_profile['names']} in UGX?");
        if (isNaN(amount))
            alert("Provide a valid input")
        else
            makePayment(amount)

    }
    </script>
<script>
    function makePayment(fee) {
        FlutterwaveCheckout({
            public_key: "FLWPUBK_TEST-ea8276349f78a208c5e3231a1ba5487f-X ",
            tx_ref: "{$ref}",
            amount: fee,
            currency: "UGX",
            country: "UG",
            payment_options: false,
            redirect_url: // specified redirect URL
                "http://" + window.location.host + "/payment_progress/{$user_profile['username']}/" + fee,
            meta: {
                consumer_id: {if isset($user_profile['username'])}"{$user_profile['username']}"{else}"{$smarty.cookies.temporary_id}_temp"{/if},
                consumer_mac: "92a3-912ba-1192a",
            },
            customer: {
                email: "{$user_profile['email']}",
                phone_number: "{$user_profile['contacts']}",
                name: "{if isset($user_profile['names'])}{$user_profile['names']}{else}{$addresses.company}{/if}",
            },
            callback: function (data) {
                //console.log(data);
            },
            onclose: function() {
                window.location = "//" + window.location.host + "/error?error=cancelled"
            },
            customizations: {
                title: "UGA PRINT",
                description: "PAYING DEPOSIT TO {$user_profile['names']}.",
                logo: "",
            },
        });
    }
</script>