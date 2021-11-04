{extends file="iframe_index.tpl"}
{block name="styles"}

{/block}
{block name="body"}
    <div class="col-md-12">
        <div class="card card-primary card-outline">
            <div class="card-header">
                <h3 class="card-title">Inbox</h3>
                <div class="card-tools">
                    <div class="input-group input-group-sm">
                        <input type="text" class="form-control" onkeyup="search_staff(this)" placeholder="Search staff">
                        <div class="input-group-append">
                            <div class="btn btn-primary">
                                <i class="fas fa-search"></i>
                            </div>
                        </div>
                        <div class="staff-sort-list p-2">
                        </div>
                    </div>
                </div>
                <!-- /.card-tools -->
            </div>
            <!-- /.card-header -->
            <div class="card-body p-0">
                <div class="mailbox-controls">
                    <!-- Check all button -->
                    <!-- /.btn-group -->
                    <button type="button" class="btn btn-default btn-sm">
                        <i class="fas fa-sync-alt" onclick="location.reload()"></i>
                    </button>
                    <div class="float-right">
                        1-50/200
                        <div class="btn-group">
                            <button type="button" class="btn btn-default btn-sm">
                                <i class="fas fa-chevron-left"></i>
                            </button>
                            <button type="button" class="btn btn-default btn-sm">
                                <i class="fas fa-chevron-right"></i>
                            </button>
                        </div>
                        <!-- /.btn-group -->
                    </div>
                    <!-- /.float-right -->
                </div>
                <div class="table-responsive mailbox-messages">
                    <table class="table table-hover table-striped">
                        <tbody>
                        {foreach $messages item=list}
                            <tr {if $list.seen == 0}class="bg-dark"{/if}>
                                <td>
                                    <div class="icheck-primary">
                                        <input type="checkbox" value="" disabled id="check1">
                                        <label for="check1"></label>
                                    </div>
                                </td>
                                <td class="mailbox-star"><a href=""><i class="fas fa-star text-warning"></i></a></td>
                                <td class="mailbox-name"><a href="//{$smarty.server.SERVER_NAME}/messages/{$list.username}">{$list.names}</a></td>
                                <td class="mailbox-subject"><p class="text-truncate">{$list.message}</p>
                                </td>
                                <td class="mailbox-attachment"></td>
                                <td class="mailbox-date">{$list.date_sent}</td>
                            </tr>
                        {/foreach}
                        </tbody>
                    </table>
                    <!-- /.table -->
                </div>
                <!-- /.mail-box-messages -->
            </div>
        </div>
        <!-- /.card -->
    </div>
{/block}
{block name="scripts"}

{/block}