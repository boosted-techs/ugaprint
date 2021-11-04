let staff_data
let audio = new Audio("//" + window.location.host + "/assets/notifications/ringtone.mp3" );

function search_staff(name) {
    let account_name = $(name).val();
    if (account_name.length < 2) {
        $(".staff-sort-list").html('')
        return false;
    }

    $.post("//" + window.location.host + "/staff/filter_accounts", {account : account_name},
        (data) => {
            //$("#account_results").html(data);
            let response = JSON.parse(data);
            if (response) {
                //staff_data = response;
                let list = "<ul class='list-group shadow'>";
                for (let i = 0; i < response.length; i++) {
                    let disabled = response[i]['status'] === 0 ? " disabled bg-danger text-muted \"" : "pointer \" onclick=\"startConversation('" + response[i]['username'] + "')\"";

                    list += "<li class=\"list-group-item " + disabled + ">" + response[i]['names'] + " (" + response[i]['branch'] + ")</li>"
                }
                list += "</ul>";
                $(".staff-sort-list").html(list)
            }else
                $(".staff-sort-list").html("<p class='alert alert-danger mt-2'>No records found.</p>")
        })
}

function startConversation(staff) {
    window.location = "//" + window.location.host + "/inbox/" + staff
}

function sendMessage(staff) {
    let message = $("#message").val();
    $("#message").val('');
    if (message.length < 1)
        return;
    $.post ("//" + window.location.host + "/messages/save", {staff : staff, message : message}, function s(u) {
        console.log(u)
    })
}

let checksum_code;
let notifications;
function update_chat(staff) {

    $.get("//" + window.location.host + "/messages/update_chat/" + staff, (data) => {
        //$(".direct-chat-messages").html(data);
        let msg = JSON.parse(data);
        if (checksum_code !== msg.checksum_code) {
            checksum_code = msg.checksum_code
            $(".direct-chat-messages").html(msg.messages)
            elScroll(".direct-chat-messages")
        }
        //elScroll(".direct-chat-messages");
    })
}

function elScroll(element) {
    $(element).animate({scrollTop: 9999}, 1000);
}

function notoficattionPlay()
{
    audio.play();
}

function get_notifications() {
    $.get("//" + window.location.host + "/messages/notifications/", (data) => {
        //$(".direct-chat-messages").html(data);
        let msg = JSON.parse(data);
        //console.log(msg)
        if (notifications !== msg.checksum_code) {
            notifications = msg.checksum_code
            $("#notification").html(msg.messages)
            $("#messages").html(msg.messages)
            if (msg.messages > 0)
                notoficattionPlay()
        }
    })
}