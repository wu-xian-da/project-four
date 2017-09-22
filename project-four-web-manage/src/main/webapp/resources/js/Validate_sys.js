/***************************************************************************************************
 *************************************      USER     ***********************************************
 ***************************************************************************************************/
$(function(){
	//list.jsp
	//用户删除提示
	$(".deleteuser").click(function(){
		var name = $(this).next(":hidden").val();
		var flag = confirm("确定删除"+name);
		if (flag) {
			return true;
		}
		return false;
	});
	
	//form.jsp
	//用户必须选择角色
	$('#usersubmit').on("click", function(){
		var checkArr = $('input[name=roleIds]:checked');
		if(checkArr.length == 0){
			alert("-请勾选需要操作的数据");
			return false;
		}
		return true;
	});

	//用户姓名验证
	$("#usersubmit").on("click",function(){
		var username = $("#usernamevalid").val();
		var reg = /^([A-Za-z]|[\u4E00-\u9FA5])+$/;
		if (reg.test(username)) { 
			$("#errusername").html("");
			return true; 
		}
		$("#errusername").html("姓名只能是字母或汉字");
		return false;
	});
	
	//密码长度及密码组成成分的验证
	$("#usersubmit").on("click",function(){
		var pwdstr = /[a-zA-Z0-9]+$/;
		var pwd = $("#passwordvalid").val();
		var flag = pwdstr.test(pwd);//true or false
		if (flag) {
			if (pwd.length<8) {
				$("#errpassword1").html("");
				$("#errpassword2").html("密码长度小于8");
				return false;
				
			} 
			$("#errpassword1").html("");
			$("#errpassword2").html("");
			return true;
		} else {
			$("#errpassword1").html("密码必须由字母数字组合");
			$("#errpassword2").html("");
			return false;
		}
	});
	
	//昵称验证
	$("#usersubmit").on("click",function(){
		var nickname = $("#nicknamevalid").val();
		var reg = /^[0-9a-zA-Z]+$/;
		if (reg.test(nickname)) { 
			$("#errnickname").html("");
			return true; 
		}else{ 
			$("#errnickname").html("账号只能是字母或数字!"); 
			return false; 
		}
	});

	//年龄验证
	$("#usersubmit").on("click",function(){
		var intage = /^[0-9]{1,20}$/;
		var age = $("#useragevalid").val();
		if (intage.test(age)) {
			if (age > 100) {
				$("#errage1").html("年龄必须小于100");
				$("#errage2").html("");
				return false;
			}
			$("#errage1").html("");
			$("#errage2").html("");
			return true;
		} 	
		$("#errage1").html("");
		$("#errage2").html("年龄必须是正整数");
		return false;
	});
});


/***************************************************************************************************
 *************************************      ROLE     ***********************************************
 ***************************************************************************************************/
$(function(){
	//list.jsp
	//role 删除提示
	$(".deleterole").click(function(){
		var name = $(this).next(":hidden").val();
		var role = $(this).next(":hidden").next(":hidden").val();
		if (role != undefined) {
			alert("角色已经关联用户,无法删除");
		}else {
			var flag = confirm("确定删除："+name);
			if (flag) {
				return true;
			}
			return false;
		}
		return false;
	});
	
	//form.jsp
	$("#rolesumbit").on("click",function(){
		var rolename = $("#rolenamevalid").val();
		var reg = /^[\u4e00-\u9fa5_a-zA-Z0-9]+$/;
		var flag = reg.test(rolename);
		if (flag) {
			$("#errrolename").html("")
			return true;
		}
		$("#errrolename").html("角色名称由汉字字母组合")
		return false;
	});
	
	//角色选择
	/*$("#role_form").validate({
		errorPlacement: function(error,element){
			error.appendTo(element.parent());
		}
	});
	function Submit(){
		var checksLen = $('input[type="checkbox"]:checked').length;
		if(checksLen == 0){
			alert("-请选择授权信息");
			return;
	 	}
		$("#role_form").submit();
	}
	$(function(){
		$("#role_form").validate({
			errorPlacement: function(error,element){
				error.appendTo(element.parent());
			}
		});
		
		$('input[type="checkbox"]').on('click',function(){
			var _statusP = $(this).prop("checked");
			
			//父节点
			var parent_v = $(this).data("m");
			if(parent_v != null && parent_v != '' && _statusP){
				$('input[value='+parent_v+']').prop("checked", true);
			}
			
			//子节点
			$('input[data-p='+$(this).val()+']').each(function(){
				var _statusC = $(this).prop("checked");
				if(_statusP){
					if(!_statusC){
						$(this).click();
					}
				}
				else{
					if(_statusC){
						$(this).click();
					}
				}
			});
	 	});
	});*/
});
/***************************************************************************************************
 *************************************      MENU     ***********************************************
 ***************************************************************************************************/

$(function(){
	//list.jsp
	//menu删除提示
	$(".deletemenu").click(function(){
		var name = $(this).next(":hidden").val();
		var menu = $(this).next(":hidden").next(":hidden").val();
		if (menu != undefined) {
			alert("权限已经关联角色,无法删除");
		}else {
			var flag = confirm("确定删除："+name);
			if (flag) {
				return true;
			}
			return false;
		}
		return false;
	});
	
	//form.jsp
	
});

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