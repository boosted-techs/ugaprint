{extends file="index.tpl"}
{block name="body"}
    <div class="col-lg-6 order-1 order-lg-2">
        <div class="text-center">
             <h6>You are viewing business posts in  "<span class="text-danger text-decoration-underline">{$stories.0.category}"</span></h6>
        </div>
        <hr/>
        {foreach $stories item=list}
            <div class="card">
                <!-- post title start -->
                <div class="post-title d-flex align-items-center">
                    <!-- profile picture end -->
                    <div class="profile-thumb">
                        <a href="#">
                            <figure class="profile-thumb-middle">
                                <img src="//{$smarty.server.SERVER_NAME}/profile_pics/{$list.profile_pic}" alt="profile picture">
                            </figure>
                        </a>
                    </div>
                    <!-- profile picture end -->

                    <div class="posted-author">
                        <h6 class="author"><a href="//{$smarty.server.SERVER_NAME}/user/{$list.username}">{$list.names}</a></h6>
                        <span class="post-time">{$list.date_added} - <small><b>{$list.category}</b></small></span>
                    </div>

                    <div class="post-settings-bar">
                        <span></span>
                        <span></span>
                        <span></span>
                        <div class="post-settings arrow-shape">
                            <ul>
                                <li><button>copy link to adda</button></li>
                                <li><button>edit post</button></li>
                                <li><button>embed adda</button></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- post title start -->
                <div class="post-content">
                    <p class="post-desc">
                        {$list.story}
                    </p>
                    {if $list.image != 1}
                        <div class="post-thumb-gallery">
                            <figure class="post-thumb img-popup">
                                <a href="//{$smarty.server.SERVER_NAME}/media/{$list.image}">
                                    <img src="//{$smarty.server.SERVER_NAME}/media/{$list.image}" alt="post image">
                                </a>
                            </figure>
                        </div>
                    {/if}
                    <div class="post-meta">
                        <button class="post-meta-like">
                            <i class="bi bi-heart-beat"></i>
                            <span>{$list.comments} people like this</span>

                        </button>
                        <ul class="comment-share-meta">
                            <li>
                                <button class="post-comment">
                                    <i class="bi bi-chat-bubble"></i>
                                    <span>{$list.likes}</span>
                                </button>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        {/foreach}
        {if empty($stories)}
            <div class="text-center">Search returned an empty value.</div>
        {/if}
        <!-- post status end -->
    </div>
{/block}