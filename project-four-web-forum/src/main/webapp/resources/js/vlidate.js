/***************************************************************************************************
 *************************************     公共部分    **********************************************
 ***************************************************************************************************/
$(function(){
	//上一页按钮限制
	$("#shangyiye").click(function(){
		var pns = $("#pagePnShang").val();
		if (parseInt(pns) < 0) {
			return false;
		}
		return true;
	});

	//下一页按钮限制
	$("#xiayiye").click(function(){
		var total = $("#totalPage").val();
		var pnx = $("#pagePnXia").val();
		//alert(pnx+">="+total)
		if (parseInt(pnx) >= parseInt(total)) {
			return false;
		}
		return true;
	});
});