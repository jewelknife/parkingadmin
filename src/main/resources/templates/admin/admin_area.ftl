
<#include "/common/header.ftl" />
<link href="${contextpath}/js/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.css" rel="stylesheet">
<link href="${contextpath}/js/datatables-responsive/css/dataTables.responsive.css" rel="stylesheet">
<div id="page-wrapper">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">区域管理</h1>
        </div>
        <!-- /.col-lg-12 -->
    </div>
    <!-- /.row -->
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    区域管理
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
                                <#include "admin_area_list.ftl" />
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
                <form id="edit_area_form">
                    <input type="hidden" id="edit_area_id" name="id"/>
                    <div class="form-group">
                        <label for="edit_area_code" class="control-label">区域编号</label>
                        <input type="text" class="form-control" id="edit_area_code" name="areaCode"  placeholder="请输入区域编号.."/>
                    </div>
                    <div class="form-group">
                        <label for="edit_area_name" class="control-label">区域名称</label>
                        <input type="text" class="form-control" id="edit_area_name" name="areaName"  placeholder="请输入区域名称.."/>
                    </div>
                    <div class="form-group">
                        <label for="edit_area_parking_capacity" class="control-label">车位数</label>
                        <input type="text" class="form-control" id="edit_area_parking_capacity" name="areaParkingCapacity" placeholder="请输入车位数.." />
                    </div>
                    <div class="form-group">
                        <label for="edit_manager_id_select" class="control-label">管理员</label>
                        <select class="form-control"  id="edit_manager_id_select" name="areaManagerId" >
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="edit_area_description" class="control-label">描述</label>
                        <textarea class="form-control" id="edit_area_description" name="areaDescription"></textarea>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" id="edit_area_save_btn">保存</button>
            </div>
        </div>
    </div>
</div>

<!-- /#page-wrapper -->
<script src="${contextpath}/js/datatables/media/js/jquery.dataTables.min.js"></script>
<script src="${contextpath}/js/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.min.js"></script>
<script type="application/javascript">

    var qryAction = "/admin/area/q.do";
    var saveAction = "/admin/area/save.do";
    var bDelAction = "/admin/area/del.do"

    function fleshPage() {
        goToPage(1);
    }

    function goToPage(page) {
        $('#dataShowArea').load(qryAction, $('#qryForm').serialize()+"&page="+page);
    }

    function cleanForm() {
        $('#edit_area_id').val('');
        $('#edit_area_code').val('');
        $('#edit_area_name').val('');
        $('#edit_area_parking_capacity').val('');
        $('#edit_manager_id_select').val('');
        $('#edit_area_description').val('');
    }

    function del(obj) {
        var id = $(obj).prevAll('input:eq(2)').val();
        if (confirm("确定要删除这条记录么?")) {
            var delAction = "/admin/area/" + id;
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
                    $("#detail_area_id_" + id).parent().parent().remove();
                    alert('删除成功!');
                }
            });
        }
    }

    function initBatchDelBtn() {
        var checkedBoxs = $("input[name='area_checked']:checked");
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
                        if ($('#detail_area_id_' + data.areaId).size() > 0) {
                            var tds = $('#detail_area_id_' + data.areaId).parent().prevAll('td');
                            alert("区域'" + $(tds[3]).html() + "'有关联数据，无法删除!");
                        } else {
                            alert('所选区域有关联数据, 无法删除!');
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
        $('#editModalLabel').html("编辑区域信息");
        $("#editModal").modal('show');
        $('#edit_area_id').val($(prInputs[1]).val());
        $("#edit_area_code").val($(tds[4]).html());
        $("#edit_area_name").val($(tds[3]).html());
        $("#edit_area_parking_capacity").val($(tds[2]).html());
        $("#edit_manager_id_select").val($(prInputs[0]).val());
        $("#edit_area_description").val($(tds[0]).html());
    }

    $(function(){
        initSelect($("#edit_manager_id_select"), '/user/all.json', userSelectOptionAppendById);
//        bindQryEvent($('#qrySubmit'), $('#qryForm'), qryAction, $('#dataShowArea'));
        $('#btn_new').click(function() {
            $('#editModalLabel').html("新增区域信息");
            cleanForm();
        });
        $('#btn_del_batch').click(function() {
            initBatchDelBtn();
        });
        $('#edit_area_save_btn').click(function() {
            if (checkInput($('#edit_area_code'), '请输入区域编号!')
                    && checkInput($('#edit_area_name'), '请输入区域名称!')
                    && checkNumberInput($('#edit_area_parking_capacity'), '请输入车位数!')
                    && checkInput($('#edit_manager_id_select'), '请选择管理员!')
                    && checkInput($('#edit_area_description'), '请输入区域描述!')) {
                $.post(saveAction, $('#edit_area_form').serialize(), function(data){
                    if (data.msg != 'success') {
                        alert('保存失败!');
                    } else {
                        $("#editModal").modal('hide');

                        if ($('#detail_area_id_' + data.area.id).size() > 0) {
                            var tds = $('#detail_area_id_' + data.area.id).parent().prevAll('td');
                            $('#detail_area_user_id_' + data.area.id).val(data.area.areaManagerId);
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
