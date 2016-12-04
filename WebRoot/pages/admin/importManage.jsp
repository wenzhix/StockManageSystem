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

	function searchImport1(){
		$('#dg1').datagrid('load',{
			s_goodsId:$('#s_goodsId').val(),
			//s_goodsName:$('#s_goodsName').val(),
			s_bimpoPrice:$('#s_bimpoPrice').val(),
			s_eimpoPrice:$('#s_eimpoPrice').val(),
			s_bimpoDate:$('#s_bimpoDate').datebox("getValue"),
			s_eimpoDate:$('#s_eimpoDate').datebox("getValue"),
		});
	}
	
	function openChoiceGoodsDialog(){
		$("#dlg2").dialog("open").dialog("setTitle","选择商品");
	}
	
	function searchImport2(){
		$('#dg2').datagrid('load',{
			s_goodsName:$('#s_goodsName').val(),
		});
	}

	function deleteImport(){
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
				$.post("${pageContext.request.contextPath}/stockManageSystem/import!delete",{delIds:ids},function(result){
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

	function openImportAddDialog(){
		$("#dlg1").dialog("open").dialog("setTitle","添加入库信息");
		url="${pageContext.request.contextPath}/stockManageSystem/import!save";
	}
	
	function closeImportDialog(){
		$("#dlg1").dialog("close");
		resetValue();
	}
	
	function resetValue(){
		$("#goodsId").combobox("setValue","");
		$("#impoPrice").val("");
		$("#impoDate").datebox("setValue","");
		$("#impoNum").val("");
		$("#impoDesc").val("");
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
	
	function openImportModifyDialog(){
		var selectedRows = $("#dg1").datagrid("getSelections");
		if(selectedRows.length!=1){
			$.messager.alert("系统提示","请选择一条要修改的数据");
			return ;
		}
		var row = selectedRows[0];
		$("#dlg1").dialog("open").dialog("setTitle","编辑入库信息");
		$("#goodsId").combobox("setValue",row.goodsId);
		$("#impoPrice").val(row.impoPrice);
		$("#impoDate").datebox("setValue",row.impoDate);
		$("#impoNum").val(row.impoNum);
		$("#impoDesc").val(row.impoDesc);
		url="${pageContext.request.contextPath}/stockManageSystem/import!save?id="+row.id;
	}
	
	function cleraValue(){
		$("#s_bimpoPrice").val("");
		$("#s_eimpoPrice").val("");
		$("#s_bimpoDate").datebox("setValue","");
		$("#s_eimpoDate").datebox("setValue","");
	}
	
	function exportData(){
		window.open('${pageContext.request.contextPath}/stockManageSystem/import!export')
	}
	
	function openUploadFileDialog(){
		$("#dlg3").dialog('open').dialog('setTitle','批量导入数据');
	}
	
	function downloadTemplate(){
		window.open('${pageContext.request.contextPath}/template/importTemp.xls');
	}
	
	function uploadFile(){
		$("#uploadForm").form("submit",{
			success:function(result){
				var result=eval('('+result+')');
				if(result.errorMsg){
					$.messager.alert("系统提示",result.errorMsg);
				}else{
					$.messager.alert("系统提示","上传成功");
					$("#dlg3").dialog("close");
					$("#dg").datagrid("reload");
				}
			}
		});
	}
</script>
</head>
<body style="margin: 5px;">
	<table style="height:423px; width:1160px" id="dg1" title="商品入库管理" class="easyui-datagrid" fitColumns="true"
	 pagination="true" rownumbers="true" url="${pageContext.request.contextPath}/stockManageSystem/import" toolbar="#tb">
		<thead>
			<tr>
				<th field="cb" checkbox="true"></th>
				<th field="id" width="20">编号</th>
				<th field="goodsId" width="20" hidden="true">商品ID</th>
				<th field="goodsName" width="30">商品名称</th>
				<th field="impoPrice" width="30">入库价格</th>
				<th field="impoDate" width="60">入库时间</th>
				<th field="impoNum" width="60">入库数量</th>
				<th field="impoDesc" width="100">入库备注</th>
			</tr>
		</thead>
	</table>
	
	<div id="tb">
		<div>
			<a href="javascript:openImportAddDialog()" class="easyui-linkbutton" iconCls="icon-add" plain="true">添加</a>
			<a href="javascript:openImportModifyDialog()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
			<a href="javascript:deleteImport()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-redo" plain="true" onclick="exportData()">导出数据</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-undo" plain="true" onclick="openUploadFileDialog()">导入数据</a>
		</div>
		<div>
		&nbsp;&nbsp;入库价格：&nbsp;<input type="text" name="s_bimpoPrice" id="s_bimpoPrice"  size="10"/>--<input type="text" name="s_eimpoPrice" id="s_eimpoPrice"  size="10"/>
		&nbsp;入库时间：&nbsp;<input class="easyui-datebox" name="s_bimpoDate" id="s_bimpoDate" editable="false" size="10"/>-><input class="easyui-datebox" name="s_eimpoDate" id="s_eimpoDate" editable="false" size="10"/> 
		
		&nbsp;&nbsp;&nbsp;<a href="javascript:searchImport1()" class="easyui-linkbutton" iconCls="icon-search" >搜索</a>
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
					<td><input class="easyui-combobox" id="goodsId" name="importGoods.goodsId" size="10" data-options="panelHeight:'auto',editable:false,valueField:'id',textField:'goodsName',url:'${pageContext.request.contextPath}/stockManageSystem/goods!goodsComboList'"/></td>
					
					<td>入库价格：</td>
					<td><input type="text" name="importGoods.impoPrice" id="impoPrice" class="easyui-validatebox" required="true"/></td>
				</tr>
				<tr>
					<td>入库日期：</td>
					<td><input class="easyui-datebox" name="importGoods.impoDate" id="impoDate" editable="false" size="15" required="true"/>
					
					<td>入库数量：</td>
					<td><input  name="importGoods.impoNum" id="impoNum" class="easyui-validatebox" required="true" /></td>
				</tr>
				<tr>
					<td valign="top">入库备注：</td>
					<td colspan="3"><textarea rows="7" cols="43" name="importGoods.impoDesc" id="impoDesc"></textarea></td>
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
					<td><a href="javascript:searchImport2()" class="easyui-linkbutton" iconCls="icon-search">搜索</a></td>
				</tr>
				<tr>
					<td colspan="3">
						<table style="height:250px; width:540px" id="dg2" title="商品选择" class="easyui-datagrid" fitColumns="true"
	 							pagination="true" rownumbers="true" url="${pageContext.request.contextPath}/stockManageSystem/import">
	 							<thead>
									<tr>
										<th field="id" width="12" hidden="true">编号</th>
										<th field="goodsId" width="10" hidden="true">商品编号</th>
										<th field="goodsName" width="70">商品名称</th>
										<th field="impoPrice" width="70">入库价格</th>
										<th field="impoDate" width="70">入库时间</th>
										<th field="impoNum" width="70">入库数量</th>
										<th field="impoDesc" width="100">入库备注</th>
									</tr>
								</thead>
	 							
	 					</table>
					</td>
				</tr>
			</table>
	</div>
	
	<div id="dlg3" class="easyui-dialog" style="width:400px;height:180px;padding:10px 20px"
            closed="true" buttons="#dlg-buttons3">
        <form id="uploadForm" action="${pageContext.request.contextPath}/stockManageSystem/import!upload" method="post" enctype="multipart/form-data">
        	<table>
        		<tr>
        			<td>下载模版：</td>
        			<td><a href="javascript:void(0)" class="easyui-linkbutton"  onclick="downloadTemplate()">导入模版</a></td>
        		</tr>
        		<tr>
        			<td>上传文件：</td>
        			<td><input type="file" name="userUploadFile"></td>
        		</tr>
        	</table>
        </form>
	</div>
    
	<div id="dlg-buttons3">
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" onclick="uploadFile()">上传</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg3').dialog('close')">关闭</a>
	</div>
</body>
</html>