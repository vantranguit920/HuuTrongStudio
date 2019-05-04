<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="HuuTrongStudio.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Style.css" rel="stylesheet" />
</head>
<body>
    <div class ="Loginbox">
        <form runat="server">
            <asp:Label Text="Email" CssClass="lblEmail" runat="server"/>
            <asp:TextBox ID="txtEmail" runat="server" CssClass="txtEmail" placeholder="EnterEmail" />
            <asp:Label Text="Password" CssClass="lblPass" runat="server"/>
            <asp:TextBox ID="txtPass" runat="server" CssClass="txtPass"  placeholder="**********" TextMode="Password" />
            <asp:Button ID="btnSubmit" Text="Login In" runat="server" OnClick="btnSubmit_Click" CssClass="btnSubmit" />
        </form>

    </div>
</body>
</html>
