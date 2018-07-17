<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html>
<head>
<%@ include file="/common/common.jspf"%>
<title>My JSP</title>
</head>
<body>

	<form id="ff" method="post">
	   <div>
			<label for="goodsName">商品名：:</label> <input type="text" name="goodsName" readonly="readonly" />
		</div>
				<div>
			<label for="goodsAmount">数量：:</label> <input type="text"
				name="goodsAmount" />
		</div>
		<div>
			<label for="supName">供应商:</label> <input type="text" name="supName" />
		</div>
		<div>
			<label for="orderId">进货编号：:</label> <input type="text"
				name="orderId" />
		</div>
		<div>
			<label for="orderTime">进货时间:</label> <input type="text"
				name="orderTime" />
		</div>
		<div>
			<label for="orderOk">备注:</label> <input type="text"
				name="orderOk" />
		</div>
		<div>
			<input id="btn" type="button" value="提交" />
		</div>
	</form>

	<script type="text/javascript">
		$(function() {
			var win = parent.$("iframe[title='仓库进货']").get(0).contentWindow;//返回ifram页面窗体对象（window)
			
			var row = win.$('#dg').datagrid("getSelected");
			//alert(row.supId);
			//
			$('#ff').form('load',{
				goodsName:row.goodsName,
				goodsAmount:row.goodsAmount,
				supId:row.supId,
				orderId:row.orderId,
				orderTime:row.orderTime,
				orderOk:row.orderOk
			});

			
		

			$("#btn").click(function() {
				//alert("ddddddddddd");
				$("#ff").form("enableValidation");
				if ($("#ff").form("validate")) {
					$('#ff').form('submit', {
						url : '${proPath}/inorder/update.action',
						onSubmit : function() {
							return true;
						},
						success : function(count) {							
								//可以定义为对应消息框
								if(count>0){
								    alert(count);
									alert("修改成功！");									
								}else{
								    alert(count);
									alert("修改失败！");
								}
								parent.$("#win").window("close");
								win.$("#dg").datagrid("reload");							
						}
					});

				}

			});

		});
	</script>
</body>
</html>
