<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="HuuTrongStudio.AdminDashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="assets/css/default.css">
</head>
<body>

<h1>Admin Panel</h1>

<div class="tab">
  <button class="tablinks" onclick="location.href='/Admin/DichVu.aspx'" >Dịch Vụ</button>
  <button class="tablinks" onclick="location.href='/Admin/LoaiDichVu.aspx'">Loại Dịch Vụ</button>
</div>

</body>
</html>
