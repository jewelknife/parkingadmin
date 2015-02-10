
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
                        <div class="row">
                            <form class="form-horizontal"  role="form" id="qryForm">
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">区域:</label>
                                        <div class="col-sm-10">
                                            <select class="form-control" name="area_id" id="areaSelect">
                                                <option value="0">所有</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-4 right">
                                    <input type="button" class="btn" value="查询" name="submit" id="qrySubmit"/>
                                    <input type="button" class="btn btn-success" value="新增" data-toggle="modal" data-target="#editModal" name="btn_new" id="btn_new"/>
                                </div>
                            </form>
                        </div>
                        <div class="row" id="dataShowArea">
                        <#include "admin_area_list.ftl" />
                        </div>
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
                <h4 class="modal-title" id="editModalLabel">编辑</h4>
            </div>
            <div class="modal-body">
                <form id="edit_area_form">
                    <input type="hidden" id="edit_erea_id" name="id"/>
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

    function goToPage(page) {
        $('#dataShowArea').load(qryAction, $('#qryForm').serialize()+"&page="+page);
    }

    function cleanForm() {
        $('#edit_area_code').val('');
        $('#edit_area_name').val('');
        $('#edit_area_parking_capacity').val('');
        $('#edit_manager_id_select').val('');
        $('#edit_area_description').val('');
    }

    function areaEdit(obj) {
        var tds = $(obj).parent().prevAll('td');
        var prInputs = $(obj).prevAll('input');
        $("#editModal").modal('show');
        $("#edit_area_code").attr("value", $(tds[4]).html());
        $("#edit_area_name").attr("value", $(tds[4]).html());
        $("#edit_area_parking_capacity").attr("value", $(tds[4]).html());
        $("#edit_manager_id_select").val($(prInputs[1]).val());
        $("#edit_area_description").val($(tds[0]).html());
    }

    $(function(){
        initSelect($("#areaSelect"), '/area/all.json', areaSelectOptionAppend);
        initSelect($("#edit_manager_id_select"), '/user/all.json', userSelectOptionAppendById);
        bindQryEvent($('#qrySubmit'), $('#qryForm'), qryAction, $('#dataShowArea'));
        $('#btn_new').click(function() {
            cleanForm();
        });
        $('#edit_area_save_btn').click(function() {
            if (checkInput($('#edit_area_code'), '请输入区域编号!')
                    && checkInput($('#edit_area_name'), '请输入区域名称!')
                    && checkNumberInput($('#edit_area_parking_capacity'), '请输入车位数!')
                    && checkInput($('#edit_manager_id_select'), '请选择管理员!')
                    && checkInput($('#edit_area_description'), '请输入区域描述!')) {
                $.post(saveAction, $('#edit_area_form').serialize(), function(data){
                    if (data.msg != 'sucess') {
                        alert('保存失败!');
                    } else {
                        alert('保存成功!');
                    }
                });
            }
        });
    });
</script>
<#include "/common/footer.ftl" />
