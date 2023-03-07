<%@ page contentType="text/html; charset=EUC-KR"%>
<%
	/************************************************************************************************
		NICE������ Copyright(c) KOREA INFOMATION SERVICE INC. ALL RIGHTS RESERVED
		
		���񽺸� : ����Ȯ�� ���� 
		�������� : ����Ȯ�� �Է� ������ - ���� �����ָ� Ȯ��
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
			<option value="012">����������</option>
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
			<option value="050">��������</option>
			<option value="054">HSBC����</option>
			<option value="055">����ġ����</option>
			<option value="057">JP��ü�̽�����</option>
			<option value="060">BOA����</option>
			<option value="061">BNP�ĸ�������</option>
			<option value="062">�߱���������</option>
			<option value="064">�긲����</option>
			<option value="067">�߱��Ǽ�����</option>
			<option value="071">��ü��</option>
			<option value="081">�ϳ�����</option>
			<option value="088">��������</option>
			<option value="089">���̹�ũ</option>
			<option value="090">īī����ũ</option>
			<option value="209">����Ÿ����</option>
			<option value="218">KB����</option>
			<option value="227">KTB��������</option>
			<option value="238">�̷����´��</option>
			<option value="240">�Ｚ����</option>
			<option value="243">�ѱ���������</option>
			<option value="247">NH��������</option>
			<option value="261">��������</option>
			<option value="262">������������</option>
			<option value="263">����������</option>
			<option value="264">Ű������</option>
			<option value="265">�̺���Ʈ��������</option>
			<option value="266">SK����</option>
			<option value="267">�������</option>
			<option value="269">��ȭ��������</option>
			<option value="270">�ϳ���������</option>
			<option value="278">���ѱ�������</option>
			<option value="279">DB��������</option>
			<option value="280">������������</option>
			<option value="287">�޸������ձ�������</option>
			<option value="288">īī����������</option>
			<option value="290">�α�����</option>
			<option value="291">�ſ�����</option>
			<option value="292">��������������</option>
			<option value="294">�ݵ�¶����ڸ���</option>
		</select>
		<!-- ���¹�ȣ -->
		<label for="strAccountNo">���¹�ȣ</label>
		<input type="text" name="strAccountNo" maxlength="40" size="40" value="">
		<br>
		<!-- �����ָ� -->
		<label for="name">�����ָ�</label>
		<input type="text" name="name" maxlength="40" size="16" value="">
		<br>
		<!-- �������� ��ư -->
		<button onclick="javascript:bcSubmit('B');">���� �����ָ� Ȯ��</button> (���¹�ȣ + �����ָ�)
	</form>	
</body>
</html>