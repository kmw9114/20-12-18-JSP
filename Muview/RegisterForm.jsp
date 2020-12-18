<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
	
</head>
<style>
	table, tr,td{ border-collapse:collapse;}
</style>
<script language="JavaScript">
	function check(){
		if(!document.joinForm.id.value){
			alert("ID를 입력하세요");
			return false;
		}
		if(!document.joinForm.pwd.value){
			alert("Password를 입력하세요");
			return false;
		}
		if(!document.joinForm.name.value){
			alert("이름을 입력하세요");
			return false;
		}
		if(!document.joinForm.eMail.value){
			alert("E-Mail를 입력하세요");
			return false;
		}
		if(!document.joinForm.tel.value){
			alert("Tel을 입력하세요");
			return false;
		}
		if(!document.joinForm.birth.value){
			alert("생년월일을 입력하세요");
			return false;
		}
		
	}
	
	function confirmId(){
		if(document.joinForm.id.value == ""){
			alter("ID를 입력하세요");
			return;
		}

		url = "confirmId.mb?id=" + document.joinForm.id.value;
		open(url, "confirm",
				"toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=300,height=200");
	}


</script>

<body>
<center>
	<h1>Sign Up!</h1>
	<form action="register.mb" method="post" name="joinForm" onSubmit="return check()">
	<table  >
	<tr>
		<td>ID : </td><td width="50%"><input type="text" name="id">&nbsp;&nbsp;
						<input type="button" name="confirm_id" value="중복체크" onClick="confirmId(this.form)" class="btn btn-primary"></td>
	</tr>
	<tr>
		<td>PASSWORD : </td><td><input type="pwd" name="pwd"></td>
	</tr>
	<tr>
		<td>NAME : </td><td><input type="text" name="name"></td>
	</tr>
	<tr> 
		<td>E-MAIL : </td><td><input type="text" name="eMail"></td>
	</tr>

		<tr >
		 <td colspan="2" align="center" ><input type="submit" name="입력완료" class="btn btn-primary" value="가입하기">&nbsp;&nbsp;
		<input type="reset" name="다시작성" value="다시작성" class="btn btn-primary"></td>
		 </tr>
	</table>
	</form>
	
	</center>
</body>
</html>