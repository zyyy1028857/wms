<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html>
<head>
<%@ include file="/common/common.jspf"%>
<title>My JSP</title>
</head>
<body>

	<form id="ff" class="myfm" method="post">
		<div>
			<label for="goodsId">商品编号:</label> <input type="text" name="goodsId" readonly="readonly" />
		</div>
		<div>
			<label for="goodsName">商品名称:</label> <input type="text"
				name="goodsName" />
		</div>
		<div>
			<label for="goodsUnit">单位:</label> <input type="text"
				name="goodsUnit" />
		</div>
		<div>
			<label for="goodsType">型号:</label> <input type="text"
				name="goodsType" />
		</div>
		<div>
			<label for="goodsColor">颜色:</label> <input type="text"
				name="goodsColor" />
		</div>
		<div>
			<label for="goodsStore">库存:</label> <input type="text"
				name="goodsStore" />
		</div>
		</div>
		<div>
			<label for="goodsLimit">库存上限:</label> <input type="text"
				name="goodsLimit" />
		</div>
		</div>
		<div>
			<label for="goodsCommission">提成:</label> <input type="text"
				name="goodsCommission" />
		</div>
		</div>
		<div>
			<label for="goodsProducer">生产商:</label> <input type="text"
				name="goodsProducer" />
		</div>
		</div>
		<div>
			<label for="goodsRemark">备注:</label> <input type="text"
				name="goodsRemark" />
		</div>
		</div>
		<div>
			<label for="goodsSelPrice">售价:</label> <input type="text"
				name="goodsSelPrice" />
		</div>
		</div>
		<div>
			<label for="goodsBuyPrice">进价:</label> <input type="text"
				name="goodsBuyPrice" />
		</div>
		<div>
			<input id="btn" type="button" value="提交" />
		</div>
	</form>

	<script type="text/javascript">
		$(function() {
			var win = parent.$("iframe[title='商品管理']").get(0).contentWindow;//返回ifram页面窗体对象（window)

			var row = win.$('#dg').datagrid("getSelected");
			//alert(row.supId);

			$('#ff').form('load', {
				goodsId : row.goodsId,
				goodsName : row.goodsName,
				goodsUnit : row.goodsUnit,
				goodsType : row.goodsType,
				goodsColor : row.goodsColor,
				goodsStore : row.goodsStore,
				goodsLimit : row.goodsLimit,
				goodsCommission : row.goodsCommission,
				goodsProducer : row.goodsProducer,
				goodsRemark : row.goodsRemark,
				goodsSelPrice : row.goodsSelPrice,
				goodsBuyPrice : row.goodsBuyPrice
			});

			$("[name='goodsName']").validatebox({
				required : true,
				missingMessage : '请填写商品名称！'
			});
			$("[name='goodsUnit']").validatebox({
				required : true,
				missingMessage : '请填写出商品单位！'
			});
			$("[name='goodsType']").validatebox({
				required : true,
				missingMessage : '请填写类型！'
			});
			//禁用验证
			$("#ff").form("disableValidation");

			$("#btn").click(function() {
				$("#ff").form("enableValidation");
				if ($("#ff").form("validate")) {
					$('#ff').form('submit', {
						url : '${proPath}/goods/update.action',
						onSubmit : function() {
							return true;
						},
						success : function(count) {
							//可以定义为对应消息框
							if (count > 0) {
								alert("修改成功！");
							} else {
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
