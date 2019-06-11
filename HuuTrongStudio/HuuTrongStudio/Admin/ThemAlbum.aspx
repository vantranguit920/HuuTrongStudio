<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ThemAlbum.aspx.cs" Inherits="HuuTrongStudio.ThemAlbum" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="assets/css/default.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
    <h1>Admin Panel</h1>
    <form id="form1" runat="server">
        <table>
            <tr>
                <td class="auto-style5">
                    </td>
                <td class="auto-style6">
        <asp:HiddenField ID="hfIDloai" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="auto-style1">
                </td>
                <td class="auto-style7">
                    <asp:Button ID="btn_them" runat="server" Height="39px" OnClick="btn_them_Click"  Text="Thêm Album" Width="213px" CssClass="themalbum"></asp:Button>
                    <asp:HiddenField ID="hfedit" runat="server" />
                    <i class="auto-style10" aria-hidden="true"></i> 
                </td>
            </tr>

            <tr>
                <td>
                    &nbsp;</td>
                <td">
                    &nbsp;</td>
            </tr>

            <tr>
                <td></td>
                <td class="auto-style9">
                    <asp:Label ID="lbThanhcong" runat="server" ForeColor="#FF3300"></asp:Label>
                    <asp:LinkButton ID="LinkButton2" runat="server"></asp:LinkButton>
                </td>
            </tr>
            <tr>
                <td></td>
                <td class="auto-style9">
                    <asp:Label ID="lbThatbai" runat="server" ForeColor="#FF3300"></asp:Label>
                </td>
            </tr>
            <tr>
                <td></td>
                <td class="auto-style9">
                    <asp:GridView ID="gvTuongtacloai" runat="server" Width="1089px" Style="margin-right: 0px; margin-top: 0px;" AutoGenerateColumns="False" OnSelectedIndexChanged="gvTuongtac_SelectedIndexChanged" HorizontalAlign="Left" CssClass="grid">
                        <Columns>
                            <asp:BoundField DataField="Ten" HeaderText="Tên Album" ApplyFormatInEditMode="True" >
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Path" HeaderText="Đường dẫn" >
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:ImageField DataImageUrlField="Pathimg" HeaderText="Ảnh đại diện">
                                <ControlStyle Height="100px" Width="100px" />
                                <FooterStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:ImageField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:Button ID="btn_edit_edit" runat="server" CommandArgument='<%# Eval("ID") %>' OnClick="Editclick" Text="Edit" CssClass="gridedit" />
                                    <asp:Button ID="Button2" runat="server" CommandArgument='<%# Eval("ID") %>' OnClick="Deleteclick" Text="Delete" CssClass="griddelete" />
                                </ItemTemplate>
                                <ItemStyle Height="100px" Width="120px" />
                            </asp:TemplateField>
                        </Columns>
                        <EditRowStyle CssClass="gridrows" />
                        <HeaderStyle CssClass="gridheader" Height="50px" />
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td class="auto-style10"></td>
                <td class="auto-style9">
                    <asp:LinkButton ID="LinkButton1" runat="server"></asp:LinkButton>
                    <asp:ScriptManager ID="ScriptManager1" runat="server">
                    </asp:ScriptManager>
                </td>
            </tr>
        </table>
        <asp:Panel ID="Panel1" runat="server" BackColor="White" Height="529px" Width="702px">
            <table>

                <tr>
                    <td colspan="2">
                        <asp:Label ID="Label1" runat="server" Text="Tên album"></asp:Label>
                        <asp:TextBox ID="txtTenAlbum" runat="server" CssClass="txttenalbum" OnTextChanged="TextBox1_TextChanged" Width="227px"></asp:TextBox>
                        <asp:Button ID="btn_close" runat="server" CssClass="btnclose" Height="25px" OnClick="btn_close_Click" Text="X" Width="25px" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style19">
                        <asp:Label ID="Label2" runat="server" Text="Đường dẫn"></asp:Label>
                        <asp:TextBox ID="txtPath" runat="server" CssClass="txttenalbum" ReadOnly="True" Width="225px"></asp:TextBox>
                    </td>
                    <td class="auto-style1">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style18">

                        <asp:FileUpload ID="FileUpload1" runat="server" AllowMultiple="True" style="display:none;" />
                        <asp:Label ID="Label3" runat="server" ForeColor="#996600"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">
                        <asp:Button ID="btn_upload" runat="server" CssClass="btnupload" OnClick="Button3_Click1" Text="Upload Image" Height="30px" />
                    </td>
                    <td class="auto-style1">
                        <asp:Button ID="btnSave" runat="server" OnClick="btnSave_Click" Text="Save" CssClass="btnsave" Height="30px" Width="55px" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2"><div style=" overflow: auto; height: 400px;">
                        <asp:DataList ID="DataList1" runat="server" RepeatColumns="4" Width="349px" OnSelectedIndexChanged="DataList1_SelectedIndexChanged" Height="280px">
                            <ItemTemplate>
                                <asp:Image ID="Image1" runat="server" Height="150px" ImageUrl='<%# Eval("Path") %>' Width="163px" />
                                <asp:Button ID="btn_deleteimage" runat="server" CommandArgument='<%# Eval("ID") %>' OnClick="btn_deleteimage" Height="25px" Text="Delete" Width="64px" CssClass="griddelete" />
                            </ItemTemplate>
                        </asp:DataList></div>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style18">&nbsp;</td>
                </tr>
                </table>
        </asp:Panel>
        <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" BackgroundCssClass="modalBackground" TargetControlID="LinkButton1" PopupControlID="Panel1" CancelControlID="LinkButton2" runat="server"></ajaxToolkit:ModalPopupExtender>
    </form>
<style>
.modalBackground {
    height: 200%;
    background-color: #EBEBEB;
    filter: alpha(opacity=70);
    opacity: 0.7;
}

.panel {
    width: auto;
    height: auto;
}

.gridheader {
    background-color: #646464;
    font-family: Arial;
    color: White;
    border: none 0px transparent;
    height: 25px;
    text-align: center;
    font-size: 16px;
}
.griddelete {
    background-color: #f44336;
    font-family: Arial;
    color: White;
    text-align: center;
    border-radius: 4px;
    border: 2px solid #f44336;
}
.gridedit {
    background-color: #008CBA;
    font-family: Arial;
    color: White;
    text-align: center;
    border-radius: 4px;
    border: 2px solid #008CBA;
}
.gridedit:hover {
    box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24), 0 17px 50px 0 rgba(0,0,0,0.19);
}
.themalbum {
    background-color: #008CBA;
    font-family: Arial;
    color: White;
    text-align: center;
    border-radius: 4px;
    border: 2px solid #008CBA;
}
.btnsave {
    background-color: #4CAF50;
    font-family: Arial;
    color: White;
    text-align: center;
    border-radius: 4px;
    border: 2px solid #4CAF50;
}
    .txttenalbum {
        margin-left: 24px;
    }
    .txtpath{
        margin-left: 20px;
    }
    .btnupload{
        background-color: #008CBA;
    font-family: Arial;
    color: White;
    text-align: center;
    border-radius: 4px;
    border: 2px solid #008CBA;
    }
    .btnclose{
        background-color: #f44336;
    font-family: Arial;
    color: White;
    text-align: center;
    border-radius: 4px;
    border: 2px solid #f44336;
    margin-left:340px;
    }

    .auto-style1 {
        height: 26px;
    }

</style>
</body>
</html>
