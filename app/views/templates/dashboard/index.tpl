{extends file="index.tpl"}
{block name="body"}
    <div class="col-lg-6 order-1 order-lg-2">
        {if ! empty($user)}
        <!-- share box start -->
            <div class="card card-small">
                <div class="share-box-inner">
                    <!-- profile picture end -->
                    <div class="profile-thumb">
                        <a href="#">
                            <figure class="profile-thumb-middle">
                                <img src="//{$smarty.server.SERVER_NAME}/profile_pics/{$user.profile_pic}" alt="{$user.username}">
                            </figure>
                        </a>
                    </div>
                    <!-- profile picture end -->

                    <!-- share content box start -->
                    <div class="share-content-box w-100">
                        <form class="share-text-box">
                            <textarea name="share" class="share-text-field" aria-disabled="true" placeholder="Hello {$user.names}, What are you selling today?" data-bs-toggle="modal" data-bs-target="#textbox" id="email"></textarea>
                            <button class="btn-share" type="submit">share</button>
                        </form>
                    </div>
                    <!-- share content box end -->

                    <!-- Modal start -->
                    <div class="modal fade" id="textbox" aria-labelledby="textbox">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title">What can we do right now? Sell or Buy?</h5>
                                    <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body custom-scroll">
                                    <form action="//{$smarty.server.SERVER_NAME}/upload_story" method="post" enctype="multipart/form-data">
                                        <select class="form-control" name="category">
                                            {foreach $categories item=list}
                                                <option value="{$list.id}">{$list.category}</option>
                                            {/foreach}
                                        </select>
                                        <br/>
                                        <textarea name="share" required class="share-field-big custom-scroll mt-2" placeholder="Hello {$user.names}, What are you selling today?""></textarea>
                                        <input type="file" name="file">
                                        <button type="submit"  class="btn post-share-btn">PUBLISH</button>
                                    </form>

                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="post-share-btn" data-bs-dismiss="modal">cancel</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Modal end -->
                </div>
            </div>
            <!-- share box end -->
        {/if}
        <!-- post status start -->
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
                    {if isset($user)}
                        {if $user.username != $list.username}
                            <div class="post-settings-bar">
                                <span></span>
                                <span></span>
                                <span></span>
                                <div class="post-settings arrow-shape">
                                    <ul>
                                        <li><A href="//{$smarty.server.SERVER_NAME}/inbox/{$list.username}"><button>Message</button></A></li>
                                    </ul>
                                </div>
                            </div>
                        {/if}
                    {/if}
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
            <!-- post status end -->
        {/foreach}

    </div>

{/block}