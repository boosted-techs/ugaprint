{extends file="index.tpl"}
{block name="body"}
    <div class="login-box wow fadeIn" id="login-search-box">
        <div class="login-search-box-a"  style="overflow-y: auto; padding-left: 20px; padding-right: 20px;">
            <div class="col-md-4 mx-auto shadow login-box-search-box-form rounded p-3">
                {if isset($login_btn)}
                    <a href="//{$smarty.server.SERVER_NAME}/login">
                        <button class="btn btn-danger shadow rounded-0 float-end">LOGIN</button>
                    </a>
                    {else}
                    <a href="//{$smarty.server.SERVER_NAME}/dashboard">
                        <button class="btn btn-danger shadow rounded-0 float-end">DASHBOARD</button>
                    </a>
                {/if}
                <h1 class="text-center">P<i class="fa fa-heart text-danger"></i>ullah</h1>
                <div>
                    <select class="login-form-input mt-4 p-2" v-model="interest" v-on:change="checkForm" v-bind:disabled="inputDisabled">
                        <option value="null">Who are you interested in?</option>
                        <option value="female_male">Am a woman interest in men</option>
                        <option value="male_female">Am a man interested in Women</option>
                        <option value="male_male">Am a man interested in a man</option>
                        <option value="female_female">Am a woman interested in woman</option>
                        <option value="woman_all">Am a woman interested in Both</option>
                        <option value="man_all">Am a man interested in Both</option>
                    </select>
                    <div>
                        <h5 class="text-center mt-4">Between ages</h5>
                        <div class="row mt-4">
                            <div class="col-5">
                                <select class="login-form-input p-2" v-model="lowerAge"  :disabled="inputDisabled">
                                    {for $i=18 to 100}
                                        <option value="{$i}">{$i} years</option>
                                    {/for}
                                </select>
                            </div>
                            <div class="col-2">
                                <h5 class="text-center">to</h5>
                            </div>
                            <div class="col-5">
                                <select class="login-form-input p-2" v-model="upperAge"  :disabled="inputDisabled">
                                    {for $i=18 to 100}
                                        <option value="{$i}">{$i} years</option>
                                    {/for}
                                </select>
                            </div>
                            <div class="col-md-12 mt-4 mb-4">
                                <input type="text" class="login-form-input p-2" v-model.trim="location" :disabled="inputDisabled" :placeholder="locationPlaceHolder" v-on:keyup="matchByLocation"/>
{*                                <component v-bind:is="view" ></component>*}
                                <div class="col-md-10 location-list p-2 shadow" v-if="dropDown" id="locationResults">
                                    <ul class='list-group'>
                                        <li class="list-group-item clickable" v-for="location in locationReturnedList" v-on:click="selectLocation(location.id, location.city, location.country)">
                                            %% location.city %% <small class="text-muted" style="text-size:10px"> - %% location. country %%</small>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <button class="btn btn-danger form-control rounded-0 shadow" @click="loginSearch"  :disabled="inputSubmitDisabled">Search <i class="fa fa-search"></i></button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
{/block}