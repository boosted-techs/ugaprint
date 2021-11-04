{foreach $inbox item=list}
    {if $list.sender == $user_bio.id}
        <!-- Message to the right -->
        <div class="direct-chat-msg right">
            <div class="direct-chat-infos clearfix">
                <span class="direct-chat-name float-right">{$user_bio['names']}</span>
                <span class="direct-chat-timestamp float-left">{$list.date_sent}</span>
            </div>
            <!-- /.direct-chat-infos -->
            <img class="direct-chat-img" style="width: 50px; height: 50px; object-fit: cover" src="//{$smarty.server.SERVER_NAME}/profile_pics/{$user_bio['profile_pic']}" alt="message user image">
            <!-- /.direct-chat-img -->
            <div class="direct-chat-text">
                {$list.message}
            </div>
            <!-- /.direct-chat-text -->
        </div>
        <!-- /.direct-chat-msg -->
    {else}
        <div class="direct-chat-msg">
            <div class="direct-chat-infos clearfix">
                <span class="direct-chat-name float-left">{$staff['names']}</span>
                <span class="direct-chat-timestamp float-right">{$list.date_sent}</span>
            </div>
            <!-- /.direct-chat-infos -->
            <img class="direct-chat-img" style="width: 50px; height: 50px; object-fit: cover" src="//{$smarty.server.SERVER_NAME}/profile_pics/{$staff['profile_pic']}" alt="message user image">
            <!-- /.direct-chat-img -->
            <div class="direct-chat-text">
                {$list.message}
            </div>
            <!-- /.direct-chat-text -->
        </div>
        <!-- /.direct-chat-msg -->
    {/if}
{/foreach}