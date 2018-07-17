<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/common/common.jspf"%>
<html>
<head>


<title></title>
<style type="text/css">
.searchbox{
	margin:-3
}
</style>

<script type="text/javascript">
	$(function(){
			var win = parent.$("iframe[title='仓库出货']").get(0).contentWindow;//返回ifram页面窗体对象（window)
	
			$('#dg').datagrid({    
			    //url:'${proPath}/supplier/selectPage.action', //通过关键字查询
			    //支持多条件查询
			    url:'${proPath}/goods/selectPageUseDyc.action', 
			    
			    fitColumns:true,
			    nowrapL:true,
			    idField:'goodsId',
			    rownumbers:true,
			    singleSelect:true,
			    
			    pagination:true,
			    pageSize:5,
			    pageList:[2,5,10,20],
			    
			     queryParams: {
					goodsName: '%%'		
				}, 
						    
			   toolbar: [{
					iconCls: 'icon-ok',
					text:'选择商品',
					handler: function(){
					var row =  $("#dg").datagrid("getSelected");
					win.$("#ff").form('load',{
						goodsId:row.goodsId,
						goodsName:row.goodsName
						
					});
						
						parent.$("#win").window("close");

				
					}
		
				},'-',{
					text:"名称：<input type='text' id='goodsName' name='goodsName'/>",					
				}],			       
			    

				columns : [ [{
					checkbox:true,
				}, {
				field : 'goodsId',
				title : '商品编号'
			}, {
				field : 'goodsName',
				title : '商品名称',
				width : 100
			}, {
				field : 'goodsUnit',
				title : '单位',
				width : 100
			}, {
				field : 'goodsType',
				title : '型号',
				width : 100
			}, {
				field : 'goodsColor',
				title : '颜色',
				width : 100
			}] ]
		});
		
			$('#goodsName').searchbox({ 
			searcher:function(value,name){ 
				
				$('#dg').datagrid('load',{				
					goodsName:'%'+value+'%'		
				});					
			}, 
			prompt:'' 
		});
		

	});
</script>
</head>

<body style="margin:0px">
<table id="dg"></table>
</body>
</html>