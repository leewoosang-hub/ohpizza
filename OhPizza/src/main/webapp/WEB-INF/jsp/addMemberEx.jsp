<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kakao API</title>
</head>
<body>
    <table>
        <tr>
            <th>�̸�</th>
            <td><input type="text" name="user_name"></td>
        </tr>
        <tr>
            <th>�ּ�</th>
            <td><input type="text" id="address_kakao" name="address" readonly /></td>
        </tr>
        <tr>
            <th>�� �ּ�</th>
            <td><input type="text" name="address_detail" /></td>
        </tr>
    </table>
</body>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
window.onload = function(){
    document.getElementById("address_kakao").addEventListener("click", function(){ //�ּ��Է�ĭ�� Ŭ���ϸ�
        //īī�� ���� �߻�
        new daum.Postcode({
            oncomplete: function(data) { //���ý� �Է°� ����
                document.getElementById("address_kakao").value = data.address; // �ּ� �ֱ�
                document.querySelector("input[name=address_detail]").focus(); //���Է� ��Ŀ��
            }
        }).open();
    });
}





</script>
</html>