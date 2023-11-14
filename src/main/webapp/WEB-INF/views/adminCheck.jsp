<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>
$.ajax({
	type:'post',
	url:'adminCheck.do',
	dataType:'JSON',
    success : function(data){
    	console.log(data.admin);
    	if(data.admin !== 4){
    		$('.btn_gnb.admin').css('display', 'none');
    	}
    },
    error: function(e){
    	console.log(e);
    }
});
</script>
		