{extends file="index.tpl"}
{block name="body"}
    <div class="col-lg-6 order-1 order-lg-2">
        <div class="table-responsive mailbox-messages">
            <table class="table table-hover table-striped">
                <tbody>
                {if empty($messages)}
                    <div class="alert alert-danger text-center">YOU have not received any messages</div>
                {/if}
                {foreach $messages item=list}
                    <tr {if $list.seen == 0}class="bg-dark"{/if}>
                        <td>
                            <div class="icheck-primary">
                                <input type="checkbox" value="" disabled id="check1">
                                <label for="check1"></label>
                            </div>
                        </td>
                        <td class="mailbox-star"><a href=""><i class="fas fa-star text-warning"></i></a></td>
                        <td class="mailbox-name"><a href="//{$smarty.server.SERVER_NAME}/inbox/{$list.username}">{$list.names}</a></td>
                        <td class="mailbox-subject"><p class="text-truncate">{$list.message}</p>
                        </td>
                        <td class="mailbox-attachment"></td>
                        <td class="mailbox-date">{$list.date_sent}</td>
                    </tr>
                {/foreach}
                </tbody>
            </table>
        </div>
    </div>
{/block}