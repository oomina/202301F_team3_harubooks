<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script>
var msg = "<c:out value='${msg}'/>";
var url = "<c:out value='${url}'/>";
	Swal.fire({
		title : msg,
		icon : 'success'
	}).then(()=>{
		location.href = url;
	})
</script>