<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<head>
  <script src="js/jQueryRotate.2.2.js" type="text/javascript"></script>
</head>
<div class="admin-content nav-tabs-custom box">
  <div class="box-header with-border">

    <input type="hidden" name="adminop_tag" value="0">

    <div class="nav-tabs-custom">
      <ul class="nav nav-tabs">
        <li class="active"><a href="#tab_1" data-toggle="tab">信息</a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tab_1">
          <div class="box-header with-border">
            <h3 class="box-title">基础信息</h3>
          </div>
          <div class="box-body">
            <div class="form-group">
              <label class="col-sm-2 control-label">基础信息</label>
              <div class="col-sm-10">
                <div class="row inline-from">
                  <div class="col-sm-3">
                    <div class="input-group">
                      <span class="input-group-addon">姓名</span>
                      <input type="text" class="form-control" onblur="this.value=this.value.toUpperCase();this.value=this.value.trim();"
                       id="">
                    </div>
                  </div>
                  <div class="col-sm-3"> 
                    <div class="input-group">
                      <span class="input-group-addon">身份证</span>
                      <input type="text" class="form-control" onblur="this.value=this.value.toUpperCase();this.value=this.value.trim();"
                       id="">
                    </div>
                  </div>
                  <div class="col-sm-3">
                    <div class="input-group">
                      <span class="input-group-addon">电话</span>
                      <input type="text" class="form-control" onblur="this.value=this.value.toUpperCase();this.value=this.value.trim();"
                       id="">
                    </div>
                  </div>
                  <div class="col-sm-3">
                    <div class="input-group">
                      <span class="input-group-addon">性别</span>
                      <select name="" id="" class="form-control">
                        <option value="">请选择性别</option>
                        <option value="">男</option>
                        <option value="">女</option>
                      </select>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="box-header with-border">
          <h3 class="box-title">大数据查询信息</h3>
        </div>
          <div class="box-body">
            <div class="form-group">
              <label class="col-sm-2 control-label">主贷人大数据信息</label>
              <div class="col-sm-10">
                <div class="row inline-from">
                  <div class="col-sm-3">
                    <div class="input-group">
                      <span class="input-group-addon">查询时间</span>
                      <input type="text" class="form-control" name="remark" id="remark" value="">
                    </div>
                  </div>
                  <div class="col-sm-3">
                    <div class="input-group">
                      <span class="input-group-addon">结果编码</span>
                      <input type="text" class="form-control" name="remark" id="remark" value="">
                    </div>
                  </div>
                  <div class="col-sm-3">
                    <div class="input-group">
                      <span class="input-group-addon">结果返回时间</span>
                      <input type="text" class="form-control" name="remark" id="remark" value="">
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label">配偶大数据信息</label>
              <div class="col-sm-10">
                <div class="row inline-from">
                  <div class="col-sm-3">
                    <div class="input-group">
                      <span class="input-group-addon">查询时间</span>
                      <input type="text" class="form-control" name="remark" id="remark" value="">
                    </div>
                  </div>
                  <div class="col-sm-3">
                    <div class="input-group">
                      <span class="input-group-addon">结果编码</span>
                      <input type="text" class="form-control" name="remark" id="remark" value="">
                    </div>
                  </div>
                  <div class="col-sm-3">
                    <div class="input-group">
                      <span class="input-group-addon">结果返回时间</span>
                      <input type="text" class="form-control" name="remark" id="remark" value="">
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label">共借人1大数据信息</label>
              <div class="col-sm-10">
                <div class="row inline-from">
                  <div class="col-sm-3">
                    <div class="input-group">
                      <span class="input-group-addon">查询时间</span>
                      <input type="text" class="form-control" name="remark" id="remark" value="">
                    </div>
                  </div>
                  <div class="col-sm-3">
                    <div class="input-group">
                      <span class="input-group-addon">结果编码</span>
                      <input type="text" class="form-control" name="remark" id="remark" value="">
                    </div>
                  </div>
                  <div class="col-sm-3">
                    <div class="input-group">
                      <span class="input-group-addon">结果返回时间</span>
                      <input type="text" class="form-control" name="remark" id="remark" value="">
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label">共借人2大数据信息</label>
              <div class="col-sm-10">
                <div class="row inline-from">
                  <div class="col-sm-3">
                    <div class="input-group">
                      <span class="input-group-addon">查询时间</span>
                      <input type="text" class="form-control" name="remark" id="remark" value="">
                    </div>
                  </div>
                  <div class="col-sm-3">
                    <div class="input-group">
                      <span class="input-group-addon">结果编码</span>
                      <input type="text" class="form-control" name="remark" id="remark" value="">
                    </div>
                  </div>
                  <div class="col-sm-3">
                    <div class="input-group">
                      <span class="input-group-addon">结果返回时间</span>
                      <input type="text" class="form-control" name="remark" id="remark" value="">
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="box-header with-border">
            <h3 class="box-title">大数据查询结果</h3>
          </div>
          <div class="box-body">
            <div class="form-group">
              <label class="col-sm-2 control-label">主贷人大数据查询结果</label>
              <div class="col-sm-10">
                <div class="row inline-from">
                  <div class="col-sm-3">
                    <div class="input-group">
                      <div class="col-sm-4">
                        <textarea style="width: 100%; height: 30px" class="form-control" name="textvin" id="textvin"></textarea>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label">配偶大数据查询结果</label>
              <div class="col-sm-10">
                <div class="row inline-from">
                  <div class="col-sm-3">
                    <div class="input-group">
                      <div class="col-sm-4">
                        <textarea style="width: 100%; height: 30px" class="form-control" name="textvin" id="textvin"></textarea>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label">共借人1大数据查询结果</label>
              <div class="col-sm-10">
                <div class="row inline-from">
                  <div class="col-sm-3">
                    <div class="input-group">
                      <div class="col-sm-4">
                        <textarea style="width: 100%; height: 30px" class="form-control" name="textvin" id="textvin"></textarea>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label">共借人2大数据查询结果</label>
              <div class="col-sm-10">
                <div class="row inline-from">
                  <div class="col-sm-3">
                    <div class="input-group">
                      <div class="col-sm-4">
                        <textarea style="width: 100%; height: 30px" class="form-control" name="textvin" id="textvin"></textarea>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>




        <!-- /.tab-pane -->
      </div>
      <!-- /.tab-content -->
    </div>
  </div>
</div>
<script>
</script>