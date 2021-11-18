{extends file="index.tpl"}
{block name="body"}
    <div class="col-lg-6 order-1 order-lg-2">
        <div class="card card-primary card-outline">
            <div class="card-header">
                <h3 class="card-title">{$staff.names}</h3>
                <div class="col-3">
                    <a href="//{$smarty.server.SERVER_NAME}/pay?i={$staff.username}">
                        <button class="submit-btn">PAY OUT</button>
                    </a>
                </div>

            </div>
            <!-- /.card-header -->
            <div class="card-body p-0">
                {if $staff.username == $user_bio.username}
                    <div class="alert alert-danger text-center">You cannot chat with your self</div>
                {else}
                        <div class="card-header">
                            <div class="card-tools">
                                <div class="card direct-chat direct-chat-warning">
                                <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                    <i class="fas fa-minus"></i>
                                </button>
                                <button type="button" class="btn btn-tool" onclick="window.location = '../messages/inbox'" title="Contacts" data-widget="chat-pane-toggle">
                                    <i class="fas fa-comments"></i>
                                </button>
                            </div>
                        </div>
                        <!-- /.card-header -->
                        <div class="card-body">
                            <!-- Conversations are loaded here -->
                            <div class="direct-chat-messages">
                                <!-- Message. Default to the left -->
                                {$inbox}
                            </div>
                            <!--/.direct-chat-messages-->
                        </div>
                        <!-- /.direct-chat-pane -->
                    </div>
                    <!-- /.card-body -->
                    <div class="card-footer">
                        <form action="#" method="post">
                            <div class="input-group">
                                <input type="text" name="message" id="message" placeholder="Type Message ..." class="form-control">
                                <span class="input-group-append">
                              <button type="button" class="btn btn-warning" onclick="sendMessage({$staff.id})">Send</button>
                            </span>
                            </div>
                        </form>
                    </div>
                    <!-- /.card-footer-->
                {/if}
            </div>
        </div>
        <!-- /.card -->
    </div>
{/block}
{block name="scripts"}
    <script src="//{$smarty.server.SERVER_NAME}/assets/messages.js"></script>
    <script>
        elScroll(".direct-chat-messages");
        setInterval(function () {
            update_chat({$staff.username|json_encode})
        }, 6000);
    </script>
{/block}