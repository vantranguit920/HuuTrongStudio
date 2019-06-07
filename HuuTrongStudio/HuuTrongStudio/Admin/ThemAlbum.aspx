<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ThemAlbum.aspx.cs" Inherits="HuuTrongStudio.ThemAlbum" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="assets/css/default.css">
</head>
<body>
    <h1>Admin Panel</h1>
    <form id="form1" runat="server">
        <asp:HiddenField ID="hfIDloai" runat="server" />
        <table>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">
                </td>
                <td class="auto-style1">
                    <asp:Button ID="btn_them" runat="server" Height="37px" OnClick="btn_them_Click" Text="Thêm Album" Width="212px" />
                </td>
            </tr>

            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style2">
                    &nbsp;</td>
            </tr>

            <tr>
                <td></td>
                <td>
                    <asp:Label ID="lbThanhcong" runat="server" ForeColor="#FF3300"></asp:Label>
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:Label ID="lbThatbai" runat="server" ForeColor="#FF3300"></asp:Label>
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:GridView ID="gvTuongtacloai" runat="server" Width="1089px" Style="margin-right: 0px; margin-top: 0px;" AutoGenerateColumns="False" OnSelectedIndexChanged="gvTuongtac_SelectedIndexChanged" HorizontalAlign="Left">
                        <Columns>
                            <asp:BoundField DataField="TenAlbum" HeaderText="Tên Album" ApplyFormatInEditMode="True" />
                            <asp:BoundField DataField="Path" HeaderText="Đường dẫn" />
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:Button ID="btn_edit_edit" runat="server" CommandArgument='<%# Eval("ID") %>' OnClick="Editclick" Text="Edit" />
                                    <asp:Button ID="Button2" runat="server" CommandArgument='<%# Eval("ID") %>' OnClick="Deleteclick" Text="Delete" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td class="auto-style10"></td>
                <td class="auto-style10">
                    <asp:LinkButton ID="LinkButton1" runat="server"></asp:LinkButton>
                    <asp:ScriptManager ID="ScriptManager1" runat="server">
                    </asp:ScriptManager>
                </td>
            </tr>
        </table>
        <asp:Panel ID="Panel1" runat="server" BackColor="White" Height="545px" Width="558px">
            <table class="auto-style1">
                <tr>
                    <td class="auto-style13">Tên Album<asp:HiddenField ID="hfIDloai0" runat="server" />
                    </td>
                    <td class="auto-style4">
                        <asp:TextBox ID="txtTenloai" runat="server" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
                        <asp:Button ID="btn_close" runat="server" OnClick="btn_close_Click" Text="X" />

                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">Đường dẫn</td>
                    <td class="auto-style4">
                        <asp:TextBox ID="txtPath" runat="server" ReadOnly="True"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">

                        <asp:Button ID="btnSave" runat="server" OnClick="btnSave_Click" Text="Save" />
                        <asp:Button ID="btnClear" runat="server" OnClick="btnClear_Click" Text="Clear" />

                    </td>
                </tr>
                <tr>
                    <td class="auto-style7">
                        <asp:FileUpload ID="FileUpload1" runat="server" AllowMultiple="True" />
                    </td>
                    <td class="auto-style4">
                        <asp:Button ID="btn_saveimage" runat="server" Text="Save" OnClick="btn_saveimage_Click" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2"><div class="auto-style3">
                        <asp:DataList ID="DataList1" runat="server" RepeatColumns="3" Width="120px">
                            <ItemTemplate>
                                <asp:Image ID="Image1" runat="server" Height="140px" ImageUrl='<%# Eval("path") %>' Width="156px" />
                                <asp:Button ID="btn_deleteimage" runat="server" CommandArgument='<%# Eval("path") %>' Height="26px" Text="Delete" Width="64px" />
                            </ItemTemplate>
                        </asp:DataList></div>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style11">&nbsp;</td>
                </tr>
            </table>
        </asp:Panel>
        <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" BackgroundCssClass="modalBackground" TargetControlID="LinkButton1" PopupControlID="Panel1" CancelControlID="btn_close" runat="server"></ajaxToolkit:ModalPopupExtender>
    </form>
<style>
    .modalBackground {
    height: 100%;
    background-color: #EBEBEB;
    filter: alpha(opacity=70);
    opacity: 0.7;
}

    .auto-style1 {
        height: 28px;
    }
    .auto-style2 {
        height: 29px;
    }


    .auto-style3 {
        height: 376px;
        width: 553px;
        overflow: Auto;
    }

    .auto-style4 {
        height: 29px;
        width: 206px;
    }

</style>
</body>
</html>
