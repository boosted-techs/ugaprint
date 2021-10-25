{extends file="index.tpl"}
{block name="body"}
    <div class="create-account" id="resetPassword">
        <div class="creator-header shadow">
            <div class="create-account-loader" {literal}:style="{width: progressBar + '%'}"{/literal}>
            </div>
            <div class="create-account-body">
                <div class="col-md-6 mx-auto mt-3 p-5">
                    <div>
                    {if isset($user_details)}
                        <h1>New Password</h1>
                        <h4 class="font-weight-light mb-4">Welcome back, {$user_details.names}!</h4>
                        <p class="mt-2 mb-2" v-if="errorMessage">%% errorMessage %%</p>
                        <input type="password" class="login-form-input" v-model="password" placeholder="Password "/>
                        <input type="password" class="login-form-input" v-model="passwordTwo" placeholder="Repeat Password"/>
                        <button class="btn btn-danger rounded-0 shadow mt-3 float-end" @click="newPassword" :disabled="inputSubmitButton">That's Okay</button>
                        <a href="//{$smarty.server.SERVER_NAME}/login" class="float-end mt-3 text-dark" style="margin-right: 15px !important;">LOGIN</a>
                    {else}
                        <h1>No results found.</h1>
                    {/if}
                    </div>
                </div>
            </div>
        </div>
    </div>
{/block}
{block name="scripts"}
    <script src="//{$smarty.server.SERVER_NAME}/assets/vue/login.vue.js"></script>
{/block}