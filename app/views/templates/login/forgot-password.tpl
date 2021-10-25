{extends file="index.tpl"}
{block name="body"}
    <div class="create-account" id="resetPassword">
        <div class="creator-header shadow">
            <div class="create-account-loader" {literal}:style="{width: progressBar + '%'}"{/literal}>
            </div>
            <div class="create-account-body">
                <div class="col-md-6 mx-auto mt-3 p-5">
                    <div>
                        <h1>Forgetting is Human.</h1>
                        <h4 class="font-weight-light mb-4">What is your email?</h4>
                        <p class="mt-2 mb-2" v-if="errorMessage">%% errorMessage %%</p>
                        <input type="email" class="login-form-input" v-model.trim="email" :placeholder="emailPlaceholder"/>
                        <button class="btn btn-danger rounded-0 shadow mt-3 float-end" @click="resetPassword" :disabled="inputSubmitButton">That's Okay</button>
                        <a href="//{$smarty.server.SERVER_NAME}/login" class="float-end mt-3 text-dark" style="margin-right: 15px !important;">LOGIN</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
{/block}
{block name="scripts"}
    <script src="//{$smarty.server.SERVER_NAME}/assets/vue/login.vue.js"></script>
{/block}