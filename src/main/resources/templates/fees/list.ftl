<#include "/common/header.ftl" />
<link href="${contextpath}/js/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.css" rel="stylesheet">
<link href="${contextpath}/js/datatables-responsive/css/dataTables.responsive.css" rel="stylesheet">
        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">统计信息</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            DataTables Advanced Tables
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="dataTable_wrapper">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                    <tr>
                                        <th>区域编号</th>
                                        <th>区域名</th>
                                        <th>Platform(s)</th>
                                        <th>Engine version</th>
                                        <th>CSS grade</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr class="odd gradeX">
                                        <td>Trident</td>
                                        <td>Internet Explorer 4.0</td>
                                        <td>Win 95+</td>
                                        <td class="center">4</td>
                                        <td class="center">X</td>
                                    </tr>
                                    <tr class="even gradeC">
                                        <td>Trident</td>
                                        <td>Internet Explorer 5.0</td>
                                        <td>Win 95+</td>
                                        <td class="center">5</td>
                                        <td class="center">C</td>
                                    </tr>
                                    <tr class="odd gradeA">
                                        <td>Trident</td>
                                        <td>Internet Explorer 5.5</td>
                                        <td>Win 95+</td>
                                        <td class="center">5.5</td>
                                        <td class="center">A</td>
                                    </tr>
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
