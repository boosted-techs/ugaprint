{extends file="index.tpl"}
{block name="body"}
    <div class="col-lg-6 order-1 order-lg-2">
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
                                <h5 class="modal-title">What are you selling?</h5>
                                <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body custom-scroll">
                                <textarea name="share" class="share-field-big custom-scroll" placeholder="Hello {$user.names}, What are you selling today?""></textarea>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="post-share-btn" data-bs-dismiss="modal">cancel</button>
                                <button type="button" class="post-share-btn">PUBLISH</button>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Modal end -->
            </div>
        </div>
        <!-- share box end -->
        <!-- post status start -->
        <div class="card">
            <!-- post title start -->
            <div class="post-title d-flex align-items-center">
                <!-- profile picture end -->
                <div class="profile-thumb">
                    <a href="#">
                        <figure class="profile-thumb-middle">
                            <img src="assets/images/profile/profile-small-1.jpg" alt="profile picture">
                        </figure>
                    </a>
                </div>
                <!-- profile picture end -->

                <div class="posted-author">
                    <h6 class="author"><a href="profile.html">merry watson</a></h6>
                    <span class="post-time">20 min ago</span>
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
                    Many desktop publishing packages and web page editors now use Lorem Ipsum as their
                    default model text, and a search for 'lorem ipsum' will uncover many web sites still
                    in their infancy.
                </p>
                <div class="post-thumb-gallery">
                    <figure class="post-thumb img-popup">
                        <a href="assets/images/post/post-1.jpg">
                            <img src="assets/images/post/post-1.jpg" alt="post image">
                        </a>
                    </figure>
                </div>
                <div class="post-meta">
                    <button class="post-meta-like">
                        <i class="bi bi-heart-beat"></i>
                        <span>You and 201 people like this</span>
                        <strong>201</strong>
                    </button>
                    <ul class="comment-share-meta">
                        <li>
                            <button class="post-comment">
                                <i class="bi bi-chat-bubble"></i>
                                <span>41</span>
                            </button>
                        </li>
                        <li>
                            <button class="post-share">
                                <i class="bi bi-share"></i>
                                <span>07</span>
                            </button>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- post status end -->
    </div>

{/block}