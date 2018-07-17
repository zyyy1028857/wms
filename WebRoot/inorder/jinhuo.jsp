<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/common/common.jspf"%>
<html>
<head>


<title></title>
<style type="text/css">
.searchbox {
	margin: -3
}
</style>

<script type="text/javascript">
	$(function() {
		//变量用来支持单元格编辑时使用
		var editIndex = undefined;

		$('#dg')
				.datagrid(
						{
							//url:'${proPath}/supplier/selectPage.action', //通过关键字查询
							//支持多条件查询
							url : '${proPath}/inorder/selectPageUseDyc.action',

							fitColumns : true,
							nowrapL : true,
							idField : 'goodsId',
							rownumbers : true,
							pagination : true,
							pageSize : 5,
							pageList : [ 2, 5, 10, 20 ],

							/*     queryParams: {
								supName: '%%',
								supAddress:'%%'			
							},  */

							toolbar : [
									{
										iconCls : 'icon-edit',
										text : '修改',
										handler : function() {
											alert('修改按钮');
											//判断是否选中一行，并且只能选中一行进行修改
											var array = $('#dg').datagrid(
													"getSelections");
											if (array.length != 1) {
												alert("请选择需要修改的记录，并且只能选中一条！");
												return false;
											}

											//打开修改窗口
											parent
													.$('#win')
													.window(
															{
																title : '修改进货单',
																width : 600,
																height : 400,
																modal : true,
																content : "<iframe src='${proPath}/base/goURL/inorder/update.action' height='100%' width='100%' frameborder='0px' ></iframe>"
															});

										}
									},
									'-',
									{
					iconCls: 'icon-remove',
					text:'删除',
					handler: function(){
						var array = $('#dg').datagrid("getSelections");
						if(array.length>0){
							
							
							//定义数组，通过下边的用来存储选中记录的Id
						var ids = new Array();
						for (i = 0; i < array.length; i++) {
							ids[i] = array[i].orderId;
							alert(ids[i]);
						}
						//如果需要锁整个页面，前面加parent.
						parent.$.messager.confirm('删除对话框', '您确认要删除吗？', function(r) {
							if (r) {
								$.ajax({
								  url: "${proPath}/inorder/deleteList.action",
								  type:"POST",
								  //设置为传统方式传送参数
								  traditional:true,
								  data:{pks:ids},
								  success: function(html){
									  if(html>0){
									  	alert("恭喜您 ，删除成功，共删除了"+html+"条记录");
									  }else{
									  	alert("对不超 ，删除失败");
									  }
								  //重新刷新页面
								    $("#dg").datagrid("reload");
								    //请除所有勾选的行
								    $("#dg").datagrid("clearSelections");
								  },
								  error: function (XMLHttpRequest, textStatus, errorThrown) {
									    $.messager.alert('删除错误','请联系技术人员！','error');
									},
								  dataType:'json'
								});


							}
						});

							
							
							
							
							
							
							
							
							
						}else{
							alert("请选择需要删除的记录！");
						}
						
						
					}
				},
									'-',
									{
					iconCls: 'icon-remove',
					text:'完成',
					handler: function(){
						alert('完成按钮');
						var array = $('#dg').datagrid("getSelections");
						if(array.length>0){
							alert("选中");
							
							
							//定义数组，通过下边的用来存储选中记录的Id
						var ids = new Array();
						for (i = 0; i < array.length; i++) {
							ids[i] = array[i].orderId;
							alert(ids[i]);
						}
						//alert("ids" + ids);
						//如果需要锁整个页面，前面加parent.
						parent.$.messager.confirm('完成对话框', '您确认要完成吗？', function(r) {
							if (r) {
								alert(r);
								$.ajax({
								  url: "${proPath}/inorder/complete.action",
								  type:"POST",
								  //设置为传统方式传送参数
								  traditional:true,
								  data:{pks:ids},
								  success: function(html){
									  if(html>0){
									  	alert("恭喜您 ，成功");
									  }else{
									  	alert("对不超 ，失败");
									  }
								  //重新刷新页面
								    $("#dg").datagrid("reload");
								    //请除所有勾选的行
								    $("#dg").datagrid("clearSelections");
								  },
								  error: function (XMLHttpRequest, textStatus, errorThrown) {
									    $.messager.alert('错误','请联系管理员！','error');
									},
								  dataType:'json'
								});


							}
						
						});

							
							
							
							
							
							
							
							
							
						}else{
							alert("请选择需要完成的订单！");
						}
						
						
					}
				
									} ],

							columns : [ [ {
								checkbox : true,
							}, {
								field : 'goodsName',
								title : '商品名称',
								width : 100
							}, {
								field : 'goodsAmount',
								title : '商品数量',
								width : 100
							}, {
								field : 'supName',
								title : '供货商',
								width : 100
							}, {
								field : 'orderId',
								title : '进货单编号',
								width : 100
							}, {
								field : 'orderTime',
								title : '进货时间',
								width : 100
							}, {
								field : 'orderOk',
								title : '备注',
								width : 100,
							} ] ]
						});

		$('#goodsName')
				.searchbox(
						{
							searcher : function(value, name) {
								parent
										.$('#win')
										.window(
												{
													title : '选择商品',
													width : 800,
													height : 600,
													modal : true,
													content : "<iframe src='${proPath}/base/goURL/goods/select.action' height='100%' width='100%' frameborder='0px' ></iframe>"
												});

							},
							prompt : '请选择商品'
						});

		var box = $('#goodsName').searchbox('textbox');//获取控件文本框对象
		//box.attr('disabled', true);// 设置无效，禁用输入
		$('#ff').form("disableValidation");

		$('#supName')
				.searchbox(
						{
							searcher : function(value, name) {
								alert(value + "," + name);
								parent
										.$('#win')
										.window(
												{
													title : '选择供应商',
													width : 800,
													height : 600,
													modal : true,
													content : "<iframe src='${proPath}/base/goURL/supplier/select.action' height='100%' width='100%' frameborder='0px' ></iframe>"
												});

							},
							prompt : '请选择供应商'
						});

		//禁用供应商信息的输入
		var box = $('#supName').searchbox('textbox');//获取控件文本框对象
		//box.attr('disabled', true);// 设置无效，禁用输入

		$('#ff').form("disableValidation");

	});
</script>
</head>
<body class="mybody">
	<form class="myfm" style="padding:15px;margin:0px;background:#eee;"
		id="ff" action="${proPath}/inorder/insert.action" method="post">
		<div class="myftitle">请填写进货信息</div>
		<div class="myfitem2">
			<label>商品名：</label><input type="hidden" id="goodsId" name="goodsId" />
			<input type="text" id="goodsName" name="goodsName" /> <label>数量：</label><input
				type="text" id="goodsAmount" name="goodsAmount" /> <label>供货商：</label><input
				type="hidden" id="supId" name="supId" /> <input type="text"
				id="supName" name="supName" />
		</div>
		<div class="myfitem2">
			<label>进货编号：</label><input type="text" id="orderId" name="orderId" />
			<label>进货时间：</label><input type="text" id="orderTime"
				name="orderTime" /> <label>备注：</label><input type="text"
				id="orderOk" name="orderOk" />
		</div>
		<div class="myfitem2">
			<input value="提交进货单" align="center" style="width:10%;" type="submit"
				name="sub">
		</div>
	</form>

	<table id="dg"></table>
</body>
</html>