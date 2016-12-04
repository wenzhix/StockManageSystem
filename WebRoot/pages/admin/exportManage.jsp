<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>库存管理系统</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jquery-easyui-1.3.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jquery-easyui-1.3.3/themes/icon.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/jquery-easyui-1.3.3/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
	var url;
	
	function searchExport1(){
		$('#dg1').datagrid('load',{
			s_goodsId:$('#s_goodsId').val(),
			//s_goodsName:$('#s_goodsName').val(),
			s_bexpoPrice:$('#s_bexpoPrice').val(),
			s_eexpoPrice:$('#s_eexpoPrice').val(),
			s_bexpoDate:$('#s_bexpoDate').datebox("getValue"),
			s_eexpoDate:$('#s_eexpoDate').datebox("getValue"),
		});
	}

	function openChoiceGoodsDialog(){
		$("#dlg2").dialog("open").dialog("setTitle","选择商品");
	}
	
	function searchExport2(){
		$('#dg2').datagrid('load',{
			s_goodsName:$('#s_goodsName').val(),
		});
	}
	
	function deleteExport(){
		var selectedRows = $("#dg1").datagrid("getSelections");
		if(selectedRows.length==0){
			$.messager.alert("系统提示","请选择要删除的数据");
			return;
		}
		var strIds=[];
		for(var i=0;i<selectedRows.length;i++){
			strIds.push(selectedRows[i].id);
		}
		var ids = strIds.join(",");
		$.messager.confirm("系统提示","您确认要删除这<font color=red>"+selectedRows.length+"</font>条数据吗?",function(r){
			if(r){
				$.post("${pageContext.request.contextPath}/stockManageSystem/export!delete",{delIds:ids},function(result){
					if(result.success){
						$.messager.alert("系统提示","您已成功删除<font color=red>"+result.delNums+"</font>条数据！");
						$("#dg1").datagrid("reload");
					}else{
						$.messager.alert('系统提示',result.errorMsg);
					}
				},"json");
			}
		});
	}
	
	function openExportAddDialog(){
		$("#dlg1").dialog("open").dialog("setTitle","添加出库信息");
		url="${pageContext.request.contextPath}/stockManageSystem/export!save";
	}
	
	function closeExportDialog(){
		$("#dlg1").dialog("close");
		resetValue();
	}
	
	function resetValue(){
		$("#goodsId").combobox("setValue","");
		$("#expoPrice").val("");
		$("#expoDate").datebox("setValue","");
		$("#expoNum").val("");
		$("#expoDesc").val("");
	}
	
	function saveImport(){
		$("#fm").form("submit",{
			url:url,
			onSubmit:function(){
				return $(this).form("validate");
			},
			success:function(result){
				if(result.errorMsg){
					$.messager.alert("系统提示",reuslt.errorMsg);
					return error;
				}else{
					$.messager.alert("系统提示","保存成功");
					resetValue();
					$("#dlg1").dialog("close");
					$("#dg1").datagrid("reload");
				}
			}
		});
	}
	
	function openExportModifyDialog(){
		var selectedRows = $("#dg1").datagrid("getSelections");
		if(selectedRows.length!=1){
			$.messager.alert("系统提示","请选择一条要修改的数据");
			return ;
		}
		var row = selectedRows[0];
		$("#dlg1").dialog("open").dialog("setTitle","编辑出库信息");
		$("#goodsId").combobox("setValue",row.goodsId);
		$("#expoPrice").val(row.expoPrice);
		$("#expoDate").datebox("setValue",row.expoDate);
		$("#expoNum").val(row.expoNum);
		$("#expoDesc").val(row.expoDesc);
		url="${pageContext.request.contextPath}/stockManageSystem/export!save?id="+row.id;
	}
	
	function cleraValue(){
		$("#s_bexpoPrice").val("");
		$("#s_eexpoPrice").val("");
		$("#s_bexpoDate").datebox("setValue","");
		$("#s_eexpoDate").datebox("setValue","");
	}
	
	function exportData(){
		window.open('${pageContext.request.contextPath}/stockManageSystem/export!export')
	}
</script>
</head>
<body style="margin: 5px;">
	<table style="height:423px; width:1160px" id="dg1" title="商品出库管理" class="easyui-datagrid" fitColumns="true"
	 pagination="true" rownumbers="true" url="${pageContext.request.contextPath}/stockManageSystem/export" toolbar="#tb">
		<thead>
			<tr>
				<th field="cb" checkbox="true"></th>
				<th field="id" width="20">编号</th>
				<th field="goodsId" width="20" hidden="true">商品ID</th>
				<th field="goodsName" width="30">商品名称</th>
				<th field="expoPrice" width="30">销售价格</th>
				<th field="expoDate" width="60">出库时间</th>
				<th field="expoNum" width="60">出库数量</th>
				<th field="expoDesc" width="100">出库备注</th>
			</tr>
		</thead>
	</table>
	
	<div id="tb">
		<div>
			<a href="javascript:openExportAddDialog()" class="easyui-linkbutton" iconCls="icon-add" plain="true">添加</a>
			<a href="javascript:openExportModifyDialog()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
			<a href="javascript:deleteExport()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-redo" plain="true" onclick="exportData()">导出数据</a>
		</div>
		<div>
		&nbsp;&nbsp;出库价格：&nbsp;<input type="text" name="s_bexpoPrice" id="s_bexpoPrice"  size="10"/>--<input type="text" name="s_eexpoPrice" id="s_eexpoPrice"  size="10"/>
		&nbsp;出库时间：&nbsp;<input class="easyui-datebox" name="s_bexpoDate" id="s_bexpoDate" editable="false" size="10"/>-><input class="easyui-datebox" name="s_eexpoDate" id="s_eexpoDate" editable="false" size="10"/> 
		
		&nbsp;&nbsp;&nbsp;<a href="javascript:searchExport1()" class="easyui-linkbutton" iconCls="icon-search" >搜索</a>
		&nbsp;&nbsp;&nbsp;<a href="javascript:openChoiceGoodsDialog()" class="easyui-linkbutton" iconCls="icon-tip">选择商品</a>
		<a href="javascript:cleraValue()" class="easyui-linkbutton" iconCls="icon-no" plain="true">清空</a>
		</div>
		
	</div>
	
	<div id="dlg1" class="easyui-dialog" style="width:540px;height:350px;padding: 10px 20px"
	closed="true" buttons="#dlg-buttons">
		<form id="fm" method="post">
			<table cellspacing="5px;">
				<tr>
					<td>商品名称：</td>
					<td><input class="easyui-combobox" id="goodsId" name="exportGoods.goodsId" size="10" data-options="panelHeight:'auto',editable:false,valueField:'id',textField:'goodsName',url:'${pageContext.request.contextPath}/stockManageSystem/goods!goodsComboList'"/></td>
					
					<td>出库价格：</td>
					<td><input type="text" name="exportGoods.expoPrice" id="expoPrice" class="easyui-validatebox" required="true"/></td>
				</tr>
				<tr>
					<td>出库日期：</td>
					<td><input class="easyui-datebox" name="exportGoods.expoDate" id="expoDate" editable="false" size="15" required="true"/>
					
					<td>出库数量：</td>
					<td><input  name="exportGoods.expoNum" id="expoNum" class="easyui-validatebox" required="true" /></td>
				</tr>
				<tr>
					<td valign="top">入库备注：</td>
					<td colspan="3"><textarea rows="7" cols="43" name="exportGoods.expoDesc" id="expoDesc"></textarea></td>
				</tr>
			</table>
		</form>
	</div>
	
	<div id="dlg-buttons">
		<a href="javascript:saveImport()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
		<a href="javascript:closeImportDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
	</div>
	
	<!-- 选择商品 -->
	<div id="dlg2" class="easyui-dialog" style="width: 600px;height: 350px;padding: 10px 20px"
		closed="true">
		
			<table cellspacing="5px;">
				<tr>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;商品名称：</td>
					<td><input type="text" size="15" name="s_goodsName" id="s_goodsName" class="easyui-validatebox" /></td>
					<td><a href="javascript:searchExport2()" class="easyui-linkbutton" iconCls="icon-search">搜索</a></td>
				</tr>
				<tr>
					<td colspan="3">
						<table style="height:250px; width:540px" id="dg2" title="商品选择" class="easyui-datagrid" fitColumns="true"
	 							pagination="true" rownumbers="true" url="${pageContext.request.contextPath}/stockManageSystem/export">
	 							<thead>
									<tr>
										
										<th field="goodsId" width="20" hidden="true">商品ID</th>
										<th field="goodsName" width="70">商品名称</th>
										<th field="expoPrice" width="70">销售价格</th>
										<th field="expoDate" width="70">出库时间</th>
										<th field="expoNum" width="70">出库数量</th>
										<th field="expoDesc" width="100">出库备注</th>
									</tr>
								</thead>
	 							
	 					</table>
					</td>
				</tr>
			</table>
		
	</div>
</body>
</html>