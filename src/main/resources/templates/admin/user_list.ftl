
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
                    <#--<div id="dataTables-example_wrapper" class="dataTables_wrapper form-inline dt-bootstrap no-footer">-->
                        <div class="row">
                            <div class="col-sm-2 ">
                                <div class="right ">
                                    <input type="button" class="btn btn-danger" value="删除" name="btn_del_batch" id="btn_del_batch"/>
                                    <input type="button" class="btn btn-success" value="新增" data-toggle="modal" data-target="#editModal" name="btn_new" id="btn_new"/>
                                </div>
                            </div>
                        </div>
                        <div class="row" id="dataShowArea">
                            <div class="col-sm-12">
                            <#include "admin_user_list.ftl" />
                            </div>
                        </div>
                    <#--</div>-->
                    </div>
                    <!-- /.table-responsive -->
                </div>
                <!-- /.panel-body -->
            </div>
            <!-- /.panel -->
        </div>
        <!-- /.col-lg-12 -->
    </div>
</div>
<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="editModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="editModalLabel"></h4>
            </div>
            <div class="modal-body">
                <form id="edit_user_form">
                    <input type="hidden" id="edit_user_id" name="id"/>
                    <div class="form-group">
                        <label for="edit_user_code" class="control-label">用户工号</label>
                        <input type="text" class="form-control" id="edit_user_code" name="usercode"  placeholder="请输入用户工号.."/>
                    </div>
                    <div class="form-group">
                        <label for="edit_username" class="control-label">用户名</label>
                        <input type="text" class="form-control" id="edit_username" name="username"  placeholder="请输入用户名.."/>
                    </div>
                    <div class="form-group">
                        <label for="edit_user_password" class="control-label">密码</label>
                        <input type="text" class="form-control" id="edit_user_password" name="userPassword" placeholder="请输入密码.." />
                    </div>
                    <div class="form-group">
                        <label for="edit_user_sex_male" class="control-label">性别</label>
                        <input type="radio" class="form-control" id="edit_user_sex_male" name="userSex" checked value="男" />
                        <input type="radio" class="form-control" id="edit_user_sex_female" name="userSex"  value="女" />
                    </div>
                    <div class="form-group">
                        <label for="edit_user_description" class="control-label">描述</label>
                        <textarea class="form-control" id="edit_user_description" name="userDescription"></textarea>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" id="edit_user_save_btn">保存</button>
            </div>
        </div>
    </div>
</div>

<!-- /#page-wrapper -->
<script src="${contextpath}/js/datatables/media/js/jquery.dataTables.min.js"></script>
<script src="${contextpath}/js/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.min.js"></script>
<script type="application/javascript">

    var saveAction = "/admin/user/save.do";
    var bDelAction = "/admin/user/del.do"

    function fleshPage() {
        goToPage(1);
    }

    function goToPage(page) {
        $('#dataShowArea').load(qryAction, $('#qryForm').serialize()+"&page="+page);
    }

    function cleanForm() {
        $('#edit_user_id').val('');
        $('#edit_user_code').val('');
        $('#edit_username').val('');
        $('#edit_password').val('');
        $('#edit_user_sex_male').checked;
        $('#edit_user_description').val('');
    }

    function del(obj) {
        var id = $(obj).prevAll('input:eq(2)').val();
        if (confirm("确定要删除这条记录么?")) {
            var delAction = "/admin/user/" + id;
            $.ajax({
                url: delAction,
                type: 'DELETE',
            }).done(function(data) {
                if (data.msg != 'success') {
                    if (data.errCode = 'WC0022') {
                        alert('该区域有关联数据, 无法删除!');
                    } else {
                        alert('删除失败!');
                    }
                } else {
                    $("#detail_user_id_" + id).parent().parent().remove();
                    alert('删除成功!');
                }
            });
        }
    }

    function initBatchDelBtn() {
        var checkedBoxs = $("input[name='user_checked']:checked");
        if (checkedBoxs.length == 0) {
            alert("请先勾选要删除的记录!");
            return;
        }
        if (confirm("确定要删除这些记录么？")) {
            $.ajax({
                url: bDelAction,
                data: checkedBoxs.serialize(),
                type: 'POST',
            }).done(function(data) {
                if (data.msg != 'success') {
                    if (data.errCode = 'WC0022') {
                        if ($('#detail_user_id_' + data.userId).size() > 0) {
                            var tds = $('#detail_user_id_' + data.userId).parent().prevAll('td');
                            alert("用户'" + $(tds[3]).html() + "'有关联数据，无法删除!");
                        } else {
                            alert('所选用户有关联数据, 无法删除!');
                        }
                    } else {
                        alert('删除失败!');
                    }
                } else {
                    alert('删除成功!');
                    fleshPage();
                }
            });
        }
    }

    function edit(obj) {
        var tds = $(obj).parent().prevAll('td');
        var prInputs = $(obj).prevAll('input');
        $('#editModalLabel').html("编辑用户信息");
        $("#editModal").modal('show');
        $('#edit_user_id').val($(prInputs[1]).val());
        $("#edit_user_code").val($(tds[4]).html());
        $("#edit_username").val($(tds[3]).html());
        $("#edit_password").val($(tds[2]).html());
        $("#edit_user_sex_male").val($(prInputs[0]).val());
        $("#edit_user_description").val($(tds[0]).html());
    }

    $(function(){
        $('#btn_new').click(function() {
            $('#editModalLabel').html("新增用户信息");
            cleanForm();
        });
        $('#btn_del_batch').click(function() {
            initBatchDelBtn();
        });
        $('#edit_user_save_btn').click(function() {
            if (checkInput($('#edit_user_code'), '请输入用户工号!')
                    && checkInput($('#edit_username'), '请输入用户名!')
                    && checkNumberInput($('#edit_password'), '请输入用户密码!')
                    && checkInput($('#edit_user_description'), '请输入区域描述!')) {
                $.post(saveAction, $('#edit_user_form').serialize(), function(data){
                    if (data.msg != 'success') {
                        alert('保存失败!');
                    } else {
                        $("#editModal").modal('hide');

                        if ($('#detail_user_id_' + data.user.id).size() > 0) {
                            var tds = $('#detail_user_id_' + data.user.id).parent().prevAll('td');
                            $(tds[0]).html(data.area.areaDescription);
                            $(tds[1]).html(data.area.manager.userCode);
                            $(tds[2]).html(data.area.areaParkingCapacity);
                            $(tds[3]).html(data.area.areaName);
                            $(tds[4]).html(data.area.areaCode);
                        } else {
                            var editTD = $("<td></td>")
                                    .append('<input type="hidden" id="detail_area_id_' + data.area.id + '" value="' + data.area.id + '"/>')
                                    .append('<input type="hidden" id="detail_area_user_id_' + data.area.id + '" value="' + data.area.areaManagerId + '"/>');
                            $('<input type="button" class="btn btn-sm btn-info" name="btn_edit" value="编辑"/>').click(function() {
                                edit(this);
                            }).css("margin-right", "10px").appendTo(editTD);
                            $('<input type="button" class="btn btn-sm btn-danger" name="btn_delete" value="删除"/>').click(function() {
                                del(this);
                            }).appendTo(editTD);
                            $("<tr class='odd gradeX'></tr>")
                                    .append('<td><input type="checkbox" name="area_checked" value="' + data.area.id + '"></td>')
                                    .append("<td>" + data.area.areaCode + "</td>")
                                    .append("<td>" + data.area.areaName + "</td>")
                                    .append("<td>" + data.area.areaParkingCapacity + "</td>")
                                    .append("<td>" + data.area.manager.userCode + "</td>")
                                    .append("<td>" + data.area.areaDescription + "</td>")
                                    .append(editTD)
                                    .insertAfter($('#dataTables-area tr:last'));
                        }
                        alert('保存成功!');
                    }
                });
            }
        });
    });
</script>
<#include "/common/footer.ftl" />
