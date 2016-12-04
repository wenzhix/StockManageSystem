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
	
	function searchStock1(){
		$('#dg1').datagrid('load',{
			s_bimpoPrice:$('#s_bimpoPrice').val(),
			s_eimpoPrice:$('#s_eimpoPrice').val(),
			s_bexpoPrice:$('#s_bexpoPrice').val(),
			s_eexpoPrice:$('#s_eexpoPrice').val(),
		});
	}
	
	function openChoiceGoodsDialog(){
		$("#dlg2").dialog("open").dialog("setTitle","选择商品");
	}
	
	function searchStock2(){
		$('#dg2').datagrid('load',{
			s_goodsName:$('#s_goodsName').val(),
		});
	} 
	
	/* function searchImport2(){
		$('#dg2').datagrid('load',{
			s_goodsName:$('#s_goodsName').val(),
		});
	} */

	function deleteStock(){
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
				$.post("${pageContext.request.contextPath}/stockManageSystem/stock!delete",{delIds:ids},function(result){
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
	
	function openStockAddDialog(){
		$("#dlg1").dialog("open").dialog("setTitle","添加库存信息");
		url="${pageContext.request.contextPath}/stockManageSystem/stock!save";
	}
	
	function closeStockDialog(){
		$("#dlg1").dialog("close");
		resetValue();
	}
	
	function resetValue(){
		$("#goodsId").combobox("setValue","");
		$("#stockNum").val("");
		$("#impoPrice").val("");
		$("#expoPrice").val("");
		$("#stockDesc").val("");
	}
	
	function saveStock(){
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
	
	
	
	function openStockModifyDialog(){
		var selectedRows = $("#dg1").datagrid("getSelections");
		if(selectedRows.length!=1){
			$.messager.alert("系统提示","请选择一条要修改的数据");
			return ;
		}
		var row = selectedRows[0];
		$("#dlg1").dialog("open").dialog("setTitle","编辑库存信息");
		$("#goodsId").combobox("setValue",row.goodsId);
		$("#stockNum").val(row.stockNum);
		$("#impoPrice").val(row.impoPrice);
		$("#expoPrice").val(row.expoPrice);
		$("#stockDesc").val(row.stockDesc);
		url="${pageContext.request.contextPath}/stockManageSystem/stock!save?id="+row.id;
	}
	
	function cleraValue(){
		$("#s_bimpoPrice").val("");
		$("#s_eimpoPrice").val("");
		$("#s_bexpoPrice").val("");
		$("#s_eexpoPrice").val("");
	}
</script>
</head>
<body style="margin: 5px;">
	<table style="height:423px; width:1160px" id="dg1" title="库存管理" class="easyui-datagrid" fitColumns="true"
	 pagination="true" rownumbers="true" url="${pageContext.request.contextPath}/stockManageSystem/stock" toolbar="#tb">
		<thead>
			<tr>
				<th field="cb" checkbox="true"></th>
				<th field="id" width="15">编号</th>
				<th field="goodsId" width="15" hidden="true">商品编号</th>
				<th field="goodsName" width="15">商品名称</th>
				<th field="stockNum" width="25">商品库存数量</th>
				<th field="impoPrice" width="25">成本价</th>
				<th field="expoPrice" width="25">销售价</th>
				<th field="stockDesc" width="100">库存备注</th>
			</tr>
		</thead>
	</table>
	
	<div id="tb">
		<div>
			<a href="javascript:openStockAddDialog()" class="easyui-linkbutton" iconCls="icon-add" plain="true">添加</a>
			<a href="javascript:openStockModifyDialog()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
			<a href="javascript:deleteStock()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
		</div>
		<div>
		&nbsp;&nbsp;成本价格：&nbsp;<input type="text" name="s_bimpoPrice" id="s_bimpoPrice"  size="10"/>--<input type="text" name="s_eimpoPrice" id="s_eimpoPrice"  size="10"/>
		&nbsp;&nbsp;销售价格：&nbsp;<input type="text" name="s_bexpoPrice" id="s_bexpoPrice"  size="10"/>--<input type="text" name="s_eexpoPrice" id="s_eexpoPrice"  size="10"/>
		
		&nbsp;&nbsp;&nbsp;<a href="javascript:searchStock1()" class="easyui-linkbutton" iconCls="icon-search" >搜索</a>
		
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
					<td><input class="easyui-combobox" id="goodsId" name="stock.goodsId" size="10" data-options="panelHeight:'auto',editable:false,valueField:'id',textField:'goodsName',url:'${pageContext.request.contextPath}/stockManageSystem/goods!goodsComboList'"/></td>
					
					<td>库存数量：</td>
					<td><input type="text" name="stock.stockNum" id="stockNum" class="easyui-validatebox" required="true"/></td>
				</tr>
				<tr>
					<td>成本价：</td>
					<td><input  name="stock.impoPrice" id="impoPrice" class="easyui-validatebox" required="true" /></td>
					
					<td>销售价：</td>
					<td><input  name="stock.expoPrice" id="expoPrice" class="easyui-validatebox" required="true" /></td>
				</tr>
				<tr>
					<td valign="top">库存备注：</td>
					<td colspan="3"><textarea rows="7" cols="43" name="stock.stockDesc" id="stockDesc"></textarea></td>
				</tr>
			</table>
		</form>
	</div>
	
	<div id="dlg-buttons">
		<a href="javascript:saveStock()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
		<a href="javascript:closeStockDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
	</div>
	
	<!-- 选择商品 -->
	<div id="dlg2" class="easyui-dialog" style="width: 600px;height: 350px;padding: 10px 20px"
		closed="true">
		
			<table cellspacing="5px;">
				<tr>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;商品名称：</td>
					<td><input type="text" size="15" name="s_goodsName" id="s_goodsName" class="easyui-validatebox" /></td>
					<td><a href="javascript:searchStock2()" class="easyui-linkbutton" iconCls="icon-search">搜索</a></td>
				</tr>
				<tr>
					<td colspan="3">
						<table style="height:250px; width:540px" id="dg2" title="商品选择" class="easyui-datagrid" fitColumns="true"
	 							pagination="true" rownumbers="true" url="${pageContext.request.contextPath}/stockManageSystem/stock">
	 							<thead>
									<tr>
										<th field="id" width="12" hidden="true">编号</th>
										<th field="goodsId" width="50">商品编号</th>
										<th field="goodsName" width="70">商品名称</th>
										<th field="stockNum" width="70">商品库存数量</th>
										<th field="impoPrice" width="70">成本价</th>
										<th field="expoPrice" width="70">销售价</th>
										<th field="stockDesc" width="100">库存备注</th>
									</tr>
								</thead>	
	 					</table>
					</td>
				</tr>
			</table>
		
	</div>
</body>
</html>