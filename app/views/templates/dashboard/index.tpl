{extends file="index-2.tpl"}
{block name="styles"}

{/block}
{block name="body"}
    <app>
        <router-view></router-view>
    </app>
    <home>
        <nav-bar email="{$user.email}" username="{$user.username}" names="{$user.names}" role="{$user.role}" status="{$user.status}" image="{$user.image}" verified="{$user.verified}"></nav-bar>
        <main>
            <div class="main-wrapper pt-80">
                <div class="container">
                    <div class="row">
                        <left-bar names="{$user.names}" role="{$user.role}" status="{$user.status}" image="{$user.image}"></left-bar>
                        <main-body email="{$user.email}" username="{$user.username}" names="{$user.names}" role="{$user.role}" status="{$user.status}" image="{$user.image}" verified="{$user.verified}"></main-body>
                        <right-bar names="{$user.names}" role="{$user.role}" status="{$user.status}" image="{$user.image}"></right-bar>
                    </div>
                </div>
            </div>
        </main>
        <!-- Scroll to top start -->
        <div class="scroll-top not-visible">
            <i class="bi bi-finger-index"></i>
        </div>
        <!-- Scroll to Top End -->
        <footer-section></footer-section>

    </home>
{/block}
{block name="scripts"}
    <script>

    </script>
    <script src="./assets/vue/components/main-navigation.js"></script>
    <script src="./assets/vue/components/left-navigation.js"></script>
    <script src="./assets/vue/components/home_template.js"></script>
    <script src="./assets/vue/components/right-navigation.js"></script>
    <script src="./assets/vue/components/footer.js"></script>
    <script src="//{$smarty.server.SERVER_NAME}/assets/vue/dashboard.js"> </script>
    <script src="./assets/vue/routes.js"></script>
{/block}