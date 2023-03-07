<%@ page contentType="text/html; charset=EUC-KR"%>
<%
	/************************************************************************************************
		NICE������ Copyright(c) KOREA INFOMATION SERVICE INC. ALL RIGHTS RESERVED
		
		���񽺸� : ����Ȯ�� ���� 
		�������� : ����Ȯ�� �Է� ������ - ���� ������ Ȯ��
	*************************************************************************************************/
%>
<html>
<head>
	<meta charset="EUC-KR">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>NICE������ ����Ȯ�� ����</title>
	<style type="text/css">
		input, select{
			margin: 2px;
			padding: 4px;
		}

		button {
			margin: 10px 2px;
			padding: 10px;
		}

		#form_bc {
			margin: auto;
			width: 700px;
			border: 1px solid black;
			padding: 10px;
		}
	</style>	
	<script>
		function bcSubmit(bcType){
			if(bcType == "A"){
				// ���� ������ Ȯ��
				document.form_bc.service.value = "1";
				document.form_bc.svcGbn.value = "5";
			}
			else if(bcType == "B"){
				// ���� �����ָ� Ȯ��
				document.form_bc.service.value = "2";
				document.form_bc.svcGbn.value = "2";
			}
			else
			{
				// ���� ��ȿ�� Ȯ��
				document.form_bc.service.value = "3";
				document.form_bc.svcGbn.value = "4";
			}
			document.form_bc.action = "request.jsp";
			document.form_bc.submit();
		} 
	</script>
</head>	
<body>
	<!-- NICE �������� form -->
	<form name="form_bc" method="post">
		<!-- ���񽺱��� (1: ������ Ȯ��, 2: �����ָ� Ȯ��, 3: ���� ��ȿ�� Ȯ��) -->
		<input type="hidden" name="service" value="">
		<!-- �������� (5: ������ Ȯ��, 2: �����ָ� Ȯ��, 4: ���� ��ȿ�� Ȯ��) -->
		<input type="hidden" name="svcGbn" value="">
		<!-- ���±��� (1:���ΰ���, 2:���ΰ���) -->
		<input type="radio" name="strGbn" id="strGbn1" value="1" checked="checked">
		<label for="strGbn1">���ΰ���</label>
		<input type="radio" name="strGbn" id="strGbn2" value="2">
		<label for="strGbn2">���ΰ���</label>
		<br>
		<!-- �����ڵ� -->
		<label for="strBankCode">�����ڵ�</label>
		<select name="strBankCode">
			<option value="002">�������</option>
			<option value="003">�������</option>
			<option value="004">��������</option>
			<option value="007">����</option>
			<option value="011">����</option>
			<option value="020">�츮����</option>
			<option value="023">SC��������</option>
			<option value="027">�ѱ���Ƽ����</option>
			<option value="031">�뱸����</option>
			<option value="032">�λ�����</option>
			<option value="034">��������</option>
			<option value="035">��������</option>
			<option value="037">��������</option>
			<option value="039">�泲����</option>
			<option value="045">�������ݰ�</option>
			<option value="048">����</option>
			<option value="071">��ü��</option>
			<option value="081">�ϳ�����</option>
			<option value="088">��������</option>
		</select>
		<!-- ���¹�ȣ -->
		<label for="strAccountNo">���¹�ȣ</label>
		<input type="text" name="strAccountNo" maxlength="40" size="40" value="">
		<br>
		<!-- �����ָ� -->
		<label for="name">�����ָ�</label>
		<input type="text" name="name" maxlength="40" size="16" value="">
		<br>
		<!-- �������/����ڹ�ȣ -->
		<label for="birth">�������</label>
		<input type="text" name="birth" maxlength="10" size="10" value="">
		<span>(������� 6�ڸ� / ����ڹ�ȣ 10�ڸ�)</span>
		<br>
		<!-- �������� ��ư -->
		<button onclick="javascript:bcSubmit('A');" >���� ������ Ȯ��</button> (���¹�ȣ + �����ָ� + �������)
	</form>	
</body>
</html>