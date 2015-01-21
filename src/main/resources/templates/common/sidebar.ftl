<!-- BEGIN SIDEBAR -->
<div class="page-sidebar navbar-collapse collapse">
    <!-- BEGIN SIDEBAR MENU -->
    <ul class="page-sidebar-menu">
        <li>
            <!-- BEGIN SIDEBAR TOGGLER BUTTON -->
            <div class="sidebar-toggler hidden-phone"></div>
            <!-- BEGIN SIDEBAR TOGGLER BUTTON -->
        </li>
        <li>
            <!-- BEGIN RESPONSIVE QUICK SEARCH FORM -->
            <form class="sidebar-search" action="extra_search.html" method="POST">
                <div class="form-container">
                    <div class="input-box">
                        <a href="javascript:;" class="remove"></a>
                        <input type="text" placeholder="Search..."/>
                        <input type="button" class="submit" value=" "/>
                    </div>
                </div>
            </form>
            <!-- END RESPONSIVE QUICK SEARCH FORM -->
        </li>
        <li class="start ">
            <a href="${contextpath}/home">
                <i class="fa fa-home"></i>
                <span class="title">首页</span>
                <span class="selected"></span>
            </a>
        </li>
        <li class="">
            <a href="javascript:;">
                <i class="fa fa-user"></i>
                <span class="title">菜单1</span>
                <span class="arrow "></span>
            </a>
            <ul class="sub-menu">
                <li>
                    <a href="${contextpath}/blog/create">
                        2级菜单</a>
                </li>
                <li>
                    <a href="${contextpath}/blog/author/${Session["loginUser"].id}">
                        2级菜单</a>
                </li>
            </ul>
        </li>
        <li class="">
            <a href="javascript:;">
                <i class="fa fa-sitemap"></i>
                <span class="title">其他设置</span>
                <span class="arrow "></span>
            </a>
            <ul class="sub-menu">
                <li>
                    <a href="#">
                        功能建设中..</a>
                </li>
                <li>
                    <a href="#">
                        功能建设中..</a>
                </li>
            </ul>
        </li>


    </ul>
    <!-- END SIDEBAR MENU -->
</div>
<!-- END SIDEBAR -->

