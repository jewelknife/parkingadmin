<table class="table table-striped table-bordered table-hover" id="dataTables-area">
    <thead>
    <tr>
        <th></th>
        <th>区域编号</th>
        <th>区域名</th>
        <th>车位数</th>
        <th>管理员</th>
        <th>描述</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <#if pageBean??>
        <#list pageBean.content as area>
        <tr class="odd gradeX">
            <td><input type="checkbox" name="area_checked" value="${area.id}"></td>
            <td>${area.areaCode}</td>
            <td>${area.areaName}</td>
            <td>${area.areaParkingCapacity}</td>
            <td>${area.manager.userCode}</td>
            <td>${area.areaDescription?if_exists}</td>
            <td>
                <input type="hidden" id="detail_area_id_${area.id}" value="${area.id}"/>
                <input type="hidden" id="detail_area_user_id_${area.id}" value="${area.areaManagerId}"/>
                <input type="button" class="btn btn-sm btn-info" style="margin-right: 10px" name="btn_edit" value="编辑" />
                <input type="button" class="btn btn-sm btn-danger" name="btn_delete" value="删除"/>
            </td>
        </tr>
        </#list>
    </#if>
    </tbody>
</table>
<script type="application/javascript">
    $(function () {
        $("#dataTables-area input[name='btn_edit']").each(function () {
            $(this).click(function () {
                edit(this);
            });
        });
        $("#dataTables-area input[name='btn_delete']").each(function () {
            $(this).click(function () {
                del(this)
            });
        });
    });
</script>
<#assign sp=8>
<#if pageBean?? && pageBean.totalPages gt 1>
<!-- 分页算法参考新浪博客页面, 保持选中的在中间, 永远有page1 -->
<ul class="pagination pull-right">
    <#if !pageBean.first>
        <li><a href="javascript:goToPage(${pageBean.number})"><i class="fa fa-angle-left"></i></a></li>
    </#if>
    <#if pageBean.totalPages lte sp>
        <#list 1..pageBean.totalPages as num>
            <li <#if pageBean.number == num -1>class="active"</#if>><a href="javascript:goToPage(${num})">${num}</a>
            </li>
        </#list>
    <#elseif pageBean.number lt sp/2 >
        <#list 1..sp as num>
            <li <#if pageBean.number == num -1 >class="active"</#if>><a href="javascript:goToPage(${num})">${num}</a>
            </li>
        </#list>
        <li><a>..</a></li>
    <#elseif pageBean.totalPages - pageBean.number - 1 lt sp/2 >
        <li><a href="javascript:goToPage(1)">1</a></li>
        <li><a>..</a></li>
        <#list (pageBean.number + 1 - sp/2 + 1)..sp as num>
            <li <#if pageBean.number == num -1 >class="active"</#if>><a href="javascript:goToPage(${num})">${num}</a>
            </li>
        </#list>
    <#else>
        <li><a href="javascript:goToPage(1)">1</a></li>
        <li><a>..</a></li>
        <#list (pageBean.number + 1 - sp/2 + 1)..(pageBean.number + 1 + sp/2 -1) as num>
            <li <#if pageBean.number == num -1 >class="active"</#if>><a href="javascript:goToPage(${num})">${num}</a>
            </li>
        </#list>
        <li><a>..</a></li>
    </#if>
    <#if !pageBean.last>
        <li><a href="javascript:goToPage(${pageBean.number+2})"><i class="fa fa-angle-right"></i></a></li>
    </#if>
    <li><a>共 ${pageBean.totalPages} 页</a></li>
</ul>
</#if>