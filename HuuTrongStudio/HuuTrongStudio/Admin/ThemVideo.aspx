<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ThemVideo.aspx.cs" Inherits="HuuTrongStudio.ThemVideo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="assets/css/default.css">
    <style type="text/css">
        .auto-style1 {
            height: 33px;
        }
    </style>
</head>
<body>

    <h1>Admin Panel</h1>

    <div class="tab">
        <button class="tablinks" onclick="location.href='/Admin/DichVu.aspx'">Dịch Vụ</button>
        <button class="tablinks" onclick="location.href='/Admin/LoaiDichVu.aspx'">Loại Dịch Vụ</button>
        <button class="tablinks" onclick="location.href='/Admin/ThemAlbum.aspx'">Album</button>
    </div>
    <div class="tabcontent">
        <form id="form1" runat="server">
            <asp:HiddenField ID="hfIDloai" runat="server" />
            <table>
                <tr>
                    <td>
                        <asp:Label ID="labelTen" runat="server" Text="Tên video"></asp:Label>
                    </td>
                    <td colspan="2">
                        <asp:TextBox ID="txtTenVideo" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>

                        <asp:Label ID="label2" runat="server" Text="Đường dẫn"></asp:Label>

                    </td>
                    <td>

                        <asp:TextBox ID="txtpath" runat="server"></asp:TextBox>

                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Ảnh" runat="server" Text="Ảnh"></asp:Label>
                    </td>
                    <td colspan="2">
                        <asp:FileUpload ID="FileUpload1" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1"></td>
                    <td colspan="2" class="auto-style1">
                        <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" />
                        <asp:Button ID="btnClear" runat="server" Text="Clear" OnClick="btnClear_Click" />
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td colspan="2">
                        <asp:Label ID="lbThanhcong" runat="server" ForeColor="#FF3300"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td colspan="2">
                        <asp:Label ID="lbThatbai" runat="server" ForeColor="#FF3300"></asp:Label>
                    </td>
                    <tr>
                        <td></td>
                        <td colspan="2">&nbsp;</td>
                    </tr>
                </tr>
            </table>
            <br />
            <asp:GridView ID="gvTuongtacloai" runat="server" Width="1089px" Style="margin-right: 0px; margin-top: 0px;" AutoGenerateColumns="False" OnSelectedIndexChanged="gvTuongtac_SelectedIndexChanged" HorizontalAlign="Left">
                <Columns>
                    <asp:BoundField DataField="Ten" HeaderText="Tên video" ApplyFormatInEditMode="True" />
                    <asp:BoundField DataField="Img" HeaderText="Ảnh" />
                    <asp:BoundField DataField="Path" HeaderText="Đường dẫn" />
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
