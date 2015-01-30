<#include "/common/header.ftl" />
<link href="${contextpath}/js/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.css" rel="stylesheet">
<link href="${contextpath}/js/datatables-responsive/css/dataTables.responsive.css" rel="stylesheet">
        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">用户管理</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            用户管理
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="dataTable_wrapper">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                    <tr>
                                        <th></th>
                                        <th>用户工号</th>
                                        <th>用户名</th>
                                        <th>角色</th>
                                        <th>描述</th>
                                        <th>操作（增、删、改）</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <#if pageBean??>
                                        <#list pageBean.content as user>
                                        <tr class="odd gradeX">
                                            <td><input type="checkbox" class="checkbox" name="user_${user.id}"/></td>
                                            <td>${user.userCode}</td>
                                            <td>${user.username}</td>
                                            <td></td>
                                            <td>${user.userDescription?if_exists}</td>
                                            <td></td>
                                        </tr>
                                        </#list>
                                    </#if>
                                    </tbody>
                                </table>
                            </div>
                            <!-- /.table-responsive -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
        <#assign sp=8>
        <#if pageBean?? && pageBean.totalPages gt 1>
            <!-- 分页算法参考新浪博客页面, 保持选中的在中间, 永远有page1 -->
            <ul class="pagination pull-right">
                <#if !pageBean.first>
                    <li><a href="?page=${pageBean.number}"><i class="fa fa-angle-left"></i></a></li>
                </#if>
                <#if pageBean.totalPages lte sp>
                    <#list 1..pageBean.totalPages as num>
                        <li <#if pageBean.number == num -1>class="active"</#if>><a href="?page=${num}">${num}</a></li>
                    </#list>
                <#elseif pageBean.number lt sp/2 >
                    <#list 1..sp as num>
                        <li <#if pageBean.number == num -1 >class="active"</#if>><a href="?page=${num}">${num}</a></li>
                    </#list>
                    <li><a>..</a></li>
                <#elseif pageBean.totalPages - pageBean.number - 1 lt sp/2 >
                    <li><a href="?page=1">1</a></li>
                    <li><a>..</a></li>
                    <#list (pageBean.number + 1 - sp/2 + 1)..sp as num>
                        <li <#if pageBean.number == num -1 >class="active"</#if>><a href="?page=${num}">${num}</a></li>
                    </#list>
                <#else>
                    <li><a href="?page=1">1</a></li>
                    <li><a>..</a></li>
                    <#list (pageBean.number + 1 - sp/2 + 1)..(pageBean.number + 1 + sp/2 -1) as num>
                        <li <#if pageBean.number == num -1 >class="active"</#if>><a href="?page=${num}">${num}</a></li>
                    </#list>
                    <li><a>..</a></li>
                </#if>
                <#if !pageBean.last>
                    <li><a href="?page=${pageBean.number+2}"><i class="fa fa-angle-right"></i></a></li>
                </#if>
                <li><a>共 ${pageBean.totalPages} 页</a></li>
            </ul>
        </#if>
        </div>
        <!-- /#page-wrapper -->
<script src="${contextpath}/js/DataTables/media/js/jquery.dataTables.min.js"></script>
<script src="${contextpath}/js/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.min.js"></script>
<#include "/common/footer.ftl" />
