{extends file="index.tpl"}
{block name="body"}
    <div class="create-account" id="login">
        <div class="creator-header shadow">
            <div class="create-account-loader" {literal}:style="{width: progressBar + '%'}"{/literal}>
            </div>
            <div class="create-account-body">
                <div class="col-md-6 mx-auto mt-3 p-5">
                    <div v-if="level == 0">
                        <h1>Hi, Welcome back.!</h1>
                        <h4 class="font-weight-light mb-4">Provide Your email</h4>
                        <input type="email" class="login-form-input" :placeholder="emailPlaceHolder" v-model.trim="email"/>
                        <span>%% errorMessage %%</span>
                        <button class="btn btn-danger rounded-0 shadow mt-3 float-end" @click="progress" :disabled="inputSubmitButton">That's Okay</button>
                    </div>
                    <div v-if="level == 1">
                        <h1>We are still on it</h1>
                        <h4 class="font-weight-light mb-4">Password</h4>
                        <input type="password" :placeholder="passwordPlaceHolder" class="login-form-input" v-model.trim="password"/>
                        <span>%% errorMessage %%</span>
                        <button class="btn btn-danger rounded-0 shadow mt-3 float-end" @click="validatePassword" :disabled="inputSubmitButton">That's Okay</button>
                    </div>
                    <a href="//{$smarty.server.SERVER_NAME}/create-account" class="btn float-md-end mt-3 d-sm-block text-white" style="margin-right: 15px !important;">SIGN UP</a>
                    <a href="//{$smarty.server.SERVER_NAME}/" class="btn float-md-end mt-3 d-sm-block text-white" style="margin-right: 15px !important;">HOME</a>
                    <a href="//{$smarty.server.SERVER_NAME}/reset-password" class="btn float-md-end d-sm-block text-white" style="margin-right: 15px !important;">RESET PASSWORD</a>
                </div>
            </div>
        </div>
    </div>
{/block}
{block name="scripts"}
    <script src="//{$smarty.server.SERVER_NAME}/assets/vue/login.vue.js"></script>
{/block}