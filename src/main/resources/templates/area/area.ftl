<#include "/common/header.ftl" />
<link href="${contextpath}/js/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.css" rel="stylesheet">
<link href="${contextpath}/js/datatables-responsive/css/dataTables.responsive.css" rel="stylesheet">
        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">区域信息</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            区域信息
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
                                        </div>
                                    </form>
                                </div>
                                <div class="row" id="dataShowArea">
                                    <#include "_list.ftl" />
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
        <!-- /#page-wrapper -->
<script src="${contextpath}/js/DataTables/media/js/jquery.dataTables.min.js"></script>
<script src="${contextpath}/js/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.min.js"></script>
<script type="application/javascript">

    var qryAction = "/area/q.do";

    function goToPage(page) {
        $('#dataShowArea').load(qryAction, $('#qryForm').serialize()+"&page="+page);
    }

    $(function(){
        initSelect($("#areaSelect"), '/area/all.json', areaSelectOptionAppend);
        bindQryEvent($('#qrySubmit'), $('#qryForm'), qryAction, $('#dataShowArea'));
    });
</script>
<#include "/common/footer.ftl" />
