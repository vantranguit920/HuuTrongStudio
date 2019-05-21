<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DichVu.aspx.cs" Inherits="HuuTrongStudio.Admin.DichVu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style2 {
            height: 29px;
        }
        <meta name="viewport" content="width=device-width, initial-scale=1">
<style>
* {box-sizing: border-box}
body {font-family: "Lato", sans-serif;}

/* Style the tab */
.tab {
  float: left;
  border: 1px solid #ccc;
  background-color: #f1f1f1;
  width: auto;
  height: auto;
}

/* Style the buttons inside the tab */
.tab button {
  display: block;
  background-color: inherit;
  color: black;
  padding: 22px 16px;
  width: 100%;
  border: none;
  outline: none;
  text-align: left;
  cursor: pointer;
  transition: 0.3s;
  font-size: 17px;
}

/* Change background color of buttons on hover */
.tab button:hover {
  background-color: #ddd;
}

/* Create an active/current "tab button" class */
.tab button.active {
  background-color: #ccc;
}

/* Style the tab content */
.tabcontent {
  float: left;
  padding: 0px 12px;
  border: 1px solid #ccc;
  width: 70%;
  border-left: none;
  height: auto;
}
</style>
</head>
<body>
    
<h1>Admin Panel</h1>

<div class="tab">
  <button class="tablinks" onclick="location.href='/Admin/DichVu.aspx'" >Dịch Vụ</button>
  <button class="tablinks" onclick="location.href='/Admin/LoaiDichVu.aspx'">Loại Dịch Vụ</button>
</div>
    <div id="DichVu" class="tabcontent" style="display: block;">
    <form id="form1" runat="server">
        
            <asp:HiddenField ID="hfID" runat="server" />
            <table>
                <tr>
                    <td>
                        <asp:Label ID="labelTen" runat="server" Text="Tên dịch vụ"></asp:Label>
                    </td>
                    <td colspan="2">
                        <asp:TextBox ID="txtTen" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="label1" runat="server" Text="Giá tiền"></asp:Label>
                    </td>
                    <td colspan="2">
                        <asp:TextBox ID="txtgia" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="rvlGia" runat="server" ControlToValidate="txtgia" ValidationExpression="^[0-9]+$"
                            ErrorMessage="Nhập lại giá!" ForeColor="#FF3300"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="label2" runat="server" Display="Dynamic" Text="Nội dung" TextMode="Multiline"></asp:Label>
                    </td>
                    <td colspan="2" class="auto-style2">
                        <asp:TextBox ID="txtNoidung" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td colspan="2">
                        <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" />
                        <asp:Button ID="btnDelete" runat="server" Text="Delete" OnClick="btnDelete_Click" />
                        <asp:Button ID="btnClear" runat="server" Text="Clear" OnClick="btnClear_Click" />
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td colspan="2">
                        <asp:Label ID="lbThanhcong" runat="server" ForeColor="#FF3300"></asp:Label>
                    </td>
                    <tr>
                        <td></td>
                        <td colspan="2">
                            <asp:Label ID="lbThatbai" runat="server" ForeColor="#FF3300"></asp:Label>
                        </td>
                    </tr>
                </tr>
            </table>
            <br />
            <asp:GridView ID="gvTuongtac" runat="server" Width="963px" Style="margin-right: 0px" AutoGenerateColumns="false" OnSelectedIndexChanged="gvTuongtac_SelectedIndexChanged">
                <Columns>
                    <asp:BoundField DataField="Ten" HeaderText="Tên dịch vụ" />
                    <asp:BoundField DataField="Gia" HeaderText="Giá tiền" />
                    <asp:BoundField DataField="Noidung" HeaderText="Nội dung" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button ID="Button1" runat="server" CommandArgument='<%# Eval("ID") %>' OnClick="Editclick" Text="Edit" />
                            <asp:Button ID="Button2" runat="server" CommandArgument='<%# Eval("ID") %>' OnClick="Deleteclick" Text="Delete" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </form>
        </div>
    
</body>
</html>

