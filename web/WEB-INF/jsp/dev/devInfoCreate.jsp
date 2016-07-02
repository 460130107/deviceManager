<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/12/20
  Time: 22:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>实验室设备管理系统--设备详情编辑</title>
  <link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet">
  <link href="<%=basePath%>css/datepicker3.css" rel="stylesheet">
  <link href="<%=basePath%>css/styles.css" rel="stylesheet">
  <link rel="shortcut icon" href="<%=basePath%>images/device.ico" />

  <!--[if lt IE 9]>
  <script src="<%=basePath%>js/html5shiv.js"></script>
  <script src="<%=basePath%>js/respond.min.js"></script>
  <![endif]-->
</head>
<body>
<jsp:include page="/common/topNonUserSymbal01.jsp"/>
<button type="submit" class="btn btn-primary" style="margin-left: 530px;" onclick="createDevInfo()">&nbsp;&nbsp;保存&nbsp;&nbsp;</button>
<button type="submit" class="btn btn-primary" onclick="window.close();">&nbsp;&nbsp;关闭&nbsp;&nbsp;</button>
<form id="devInfoForm">
  <div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
    <div class="row">
      <div class="breadcrumb">设备基本信息</div>
      <div style="margin-left: 50px;">
        <label>设备编号</label>
        <input id="devNo" style="width: 200px;" readonly="true">
        <label style="margin-left: 100px;">设备名称</label>
        <input id="devName" name="devName" style="width: 200px;"><br>
      </div>
      <div style="margin-left: 50px;">
        <label>条形码</label>
        <input id="barCode" name="barCode" style="width: 200px;margin-left: 14px;" >
        <label style="margin-left: 100px;">设备权限</label>
        <input id="devPower" style="width: 200px;" readonly="true"><br>
      </div>
      <div style="margin-left: 50px;">
        <label>设备型号</label>
        <input id="modelNo" name="modelNo" style="width: 200px;">
        <label style="margin-left: 100px;">设备规格</label>
        <input id="standard" name="standard" style="width: 200px;"><br>
      </div>
      <div style="margin-left: 50px;">
        <label style="float: left;margin-top: 5px;">设备类别&nbsp;</label>
        <select name="cateId" id="cateId" class="form-control"style="width: 200px;float: left;">
          <c:forEach items="${applicationScope.categoryList}" var="cate">
            <option value="${cate.id}">${cate.cateName}</option>
          </c:forEach>
        </select>
        <label style="margin-left: 102px;float: left;margin-top: 5px;">设备国别&nbsp;</label>
        <select  name="countryId" id="countryId" class="form-control" style="width:200px;float: left;">
          <c:forEach items="${applicationScope.countryList}" var="country">
            <option value="${country.id}">${country.countryName}</option>
          </c:forEach>
        </select>
      </div>
      <div style="margin-left: 50px;">
        <label style="float: left;margin-top: 5px;">设备来源&nbsp;</label>
        <select id="originId" name="originId" class="form-control" style="width: 200px;float: left;">
          <c:forEach items="${applicationScope.originList}" var="origin">
            <option value="${origin.id}">${origin.originName}</option>
          </c:forEach>
        </select>
        <label style="margin-left: 102px;float: left;margin-top: 5px;">使用方向&nbsp;</label>
        <select  id="direcId" name="direcId" class="form-control" style="width:200px;float: left;">
          <c:forEach items="${applicationScope.directionList}" var="dirc">
            <option value="${dirc.id}">${dirc.direcName}</option>
          </c:forEach>
        </select>
      </div>
      <div style="margin-left: 50px;">
        <label style="float: left;margin-top: 5px;">存放地点&nbsp;</label>
        <select id="depositId" name="depositId" class="form-control"style="width: 200px;float: left;">
          <c:forEach items="${applicationScope.depositList}" var="depo">
            <option value="${depo.id}">${depo.depositName}</option>
          </c:forEach>
        </select>
        <label style="margin-left: 102px;float: left;margin-top: 5px;">经费科目&nbsp;</label>
        <select  id="subId" name="foundId" class="form-control" style="width:200px;float: left;">
          <c:forEach items="${applicationScope.foundSubList}" var="found">
            <option value="${found.id}">${found.foundName}</option>
          </c:forEach>
        </select>
      </div>
      <div style="margin-left: 50px;">
        <label>生产厂商</label>
        <input id="firm" name="firm" style="width: 200px;">
        <label style="margin-left: 100px;">出厂编号</label>
        <input id="outFirmNo" name="outFirmNo" style="width: 200px;">
      </div>
      <div style="margin-left: 50px;">
        <label>购买时间</label>
        <input id="purchaseTime" name="purchaseTime" style="width: 200px;">
        <label style="margin-left: 100px;">设备年份</label>
        <input id="devYear" name="devYear" style="width: 200px;">
      </div>
    </div>
    <div class="row">
      <div class="breadcrumb">设备使用情况</div>
      <div style="margin-left: 50px;">
        <label>设备总量</label>
        <input id="devNum" name="devSum"style="width: 200px;">
        <label style="margin-left: 100px;">借出数量</label>
        <input id="devApplyNum" style="width: 200px;" readonly="true"><br>
      </div>
      <div style="margin-left: 50px;">
        <label>维修数量</label>
        <input id="maintainNum" style="width: 200px;" readonly="true">
        <label style="margin-left: 100px;">报废数量</label>
        <input id="dumpNum" style="width: 200px;"  readonly="true"><br>
      </div>
    </div>
    <div class="row">
      <div class="breadcrumb">其它信息</div>
      <div style="margin-left: 50px;">
        <label>入库人</label>
        <input id="createEmpName" style="width: 200px;margin-left: 14px;" readonly="true">
        <label style="margin-left: 100px;"> 修改人</label>
        <input id="modifyEmpName" style="width: 200px;margin-left: 14px;" readonly="true"><br>
      </div>
      <div style="margin-left: 50px;">
        <label>备注</label><br>
        <textarea id="remark" name="remark" style="width: 600px; height: 100px;resize: none;"></textarea>
      </div>
    </div>
  </div>
</form>
<input type="hidden" id="basePath" value="<%=basePath%>">
<script src="<%=basePath%>js/jquery-1.11.1.min.js"></script>
<script src="<%=basePath%>js/bootstrap.min.js"></script>
<script src="<%=basePath%>js/chart.min.js"></script>
<script src="<%=basePath%>js/chart-data.js"></script>
<script src="<%=basePath%>js/easypiechart.js"></script>
<script src="<%=basePath%>js/easypiechart-data.js"></script>
<script src="<%=basePath%>js/bootstrap-datepicker.js"></script>
<script src="<%=basePath%>js/bootstrap-table.js"></script>
<script src="<%=basePath%>js/devInfo.js"></script>
<script>
</script>
</body>
</html>