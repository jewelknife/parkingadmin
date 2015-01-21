<ul class="nav navbar-nav pull-right">
<!-- BEGIN USER LOGIN DROPDOWN -->
<li class="dropdown user">
    <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
        <img alt="" src="${rc.contextPath}/assets/img/avatar1_small.jpg"/>
        <span class="username"><#if Session["loginUser"]??>${Session["loginUser"].username}</#if></span>
        <i class="fa fa-angle-down"></i>
    </a>
    <ul class="dropdown-menu">
        <#--<li><a href="extra_profile.html"><i class="fa fa-user"></i> My Profile</a></li>-->
        <li><a href="${rc.contextPath}/login/logout"><i class="fa fa-key"></i>登出</a></li>
    </ul>
</li>
<!-- END USER LOGIN DROPDOWN -->
</ul>