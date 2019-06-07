<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UploadImage.aspx.cs" Inherits="HuuTrongStudio.UploadImage" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <style type="text/css">
        .auto-style1 {
            height: 71px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Panel ID="Panel1" runat="server" Height="247px" Width="1082px">
                            <table class="auto-style1">
                                <tr>
                                    <td class="auto-style13">Tên Album</td>
                                    <td class="auto-style2">
                                        <asp:TextBox ID="TextBox1" runat="server" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
                                        
                                    </td>
                                    <td>
                                        <asp:Button ID="btn_close" runat="server" Text="X" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style12">Đường dẫn</td>
                                    <td class="auto-style9">
                                        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style1">

                                        <asp:Button ID="btn_save" runat="server" OnClick="Button3_Click" Text="Save" />

                                        <asp:HiddenField ID="hf" runat="server" />

                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style7">
                                        <asp:FileUpload ID="FileUpload1" runat="server" AllowMultiple="True" />
                                    </td>
                                    <td class="auto-style4">
                                        <asp:Button ID="btn_saveimage" runat="server" Text="Save" />
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:DataList ID="DataList1" runat="server">
                                            <ItemTemplate>
                                                <asp:Image ID="Image1" runat="server" Height="140px" ImageUrl='<%# Eval("path") %>' Width="156px" />
                                                <asp:Button ID="btn_deleteimage" runat="server" CommandArgument='<%# Eval("path") %>' Height="26px" Text="Delete" Width="64px" />
                                            </ItemTemplate>
                                        </asp:DataList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style11">

                                        &nbsp;</td>
                                </tr>
                            </table>
                        </asp:Panel>
    </form>
</body>
</html>
