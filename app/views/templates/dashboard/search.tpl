{extends file="index.tpl"}
{block name="body"}
    <div class="col-lg-6 order-1 order-lg-2">
        <div class="text-center">
            {if isset($smarty.get.q)} <h4>You are searching "<span class="text-danger text-decoration-underline">{$smarty.get.q}"</span></h4> {/if}
        </div>
    </div>
{/block}