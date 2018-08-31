<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/simditor.css" />
<script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
<script type="text/javascript" src="js/module.min.js"></script>
<script type="text/javascript" src="js/hotkeys.min.js"></script>
<script type="text/javascript" src="js/simditor.min.js"></script>
<script type="text/javascript" src="js/uploader.js"></script>
<style type="text/css" >
span{margin-top: 5px;}
</style>
</head>
<body>
<textarea id="editor" placeholder="Balabala" autofocus></textarea>
<script>
	var editor = new Simditor({
  	textarea: $('#editor')
  	//optional options
});
	
</script>

</body>
</html>