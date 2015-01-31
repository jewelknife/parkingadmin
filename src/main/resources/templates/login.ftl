<!DOCTYPE html>
<html lang="en">
<#assign contextpath="${rc.contextPath}" />
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>停车系统 - 登陆</title>

    <link href="${contextpath}/js/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="${contextpath}/js/metisMenu/dist/metisMenu.min.css" rel="stylesheet">
    <link href="${contextpath}/css/gg-common.css" rel="stylesheet">
    <link href="${contextpath}/js/fontawesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
</head>

<body>
    <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">请登陆</h3>
                    </div>
                    <div class="panel-body">
                        <form action="/login" method="post">
                            <fieldset>
                                <div class="form-group">
                                    <input class="form-control" placeholder="用户ID" name="username" id="j_username" type="username" autofocus>
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="密码" name="password" id="j_password" type="password" value="">
                                </div>
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" id="remember-me" name="remember-me"/>记住我
                                    </label>
                                </div>
                                <#--<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>-->
                                <input name="login" value="登陆" type="submit"/>
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="${contextpath}/js/jquery/dist/jquery.min.js"></script>
    <script src="${contextpath}/js/bootstrap/dist/js/bootstrap.min.js"></script>
    <script src="${contextpath}/js/metisMenu/dist/metisMenu.min.js"></script>

    <script src="${contextpath}/js/gg-common.js"></script>
</body>

</html>
