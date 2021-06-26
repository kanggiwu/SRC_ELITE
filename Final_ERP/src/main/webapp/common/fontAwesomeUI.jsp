<%
	StringBuilder path = new StringBuilder(request.getContextPath());
	path.append("/");
%>  
<link rel="stylesheet" href="<%=path.toString() %>common/css/all.min.css">
<link rel="stylesheet" href="<%=path.toString() %>common/css/fontawesome.min.css">
<link rel="stylesheet" href="<%=path.toString() %>common/css/brands.min.css">
<link rel="stylesheet" href="<%=path.toString() %>common/css/solid.min.css">
<link rel="stylesheet" href="<%=path.toString() %>common/css/svg-with-js.min.css">
<script src="<%=path.toString() %>common/js/all.min.js"></script>
<script src="<%=path.toString() %>common/js/fontawesome.js"></script>
<script src="<%=path.toString() %>common/js/brands.min.js"></script>
<script src="<%=path.toString() %>common/js/solid.min.js"></script>