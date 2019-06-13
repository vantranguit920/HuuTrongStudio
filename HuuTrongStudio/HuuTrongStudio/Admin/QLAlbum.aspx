<%@ Page Title="" Language="C#" MasterPageFile="../MasterPage/MasterPageAdmin.Master" AutoEventWireup="true" CodeBehind="QLAlbum.aspx.cs" Inherits="HuuTrongStudio.Admin.QLAlbum" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="conten" runat="server">

    <div style="background-color: white; padding-left:110px">
        <table>
            <tr>
                <td class="auto-style5"></td>
                <td class="auto-style6">
                    <asp:HiddenField ID="hfIDloai" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="auto-style1"></td>
                <td class="auto-style7">
                    <asp:Button ID="btn_them" runat="server" OnClick="btn_them_Click" Height="39px" Text="Thêm Album" Width="213px" CssClass="themalbum"></asp:Button>
                    <asp:HiddenField ID="hfedit" runat="server" />
                    <i class="auto-style10" aria-hidden="true"></i>
                </td>
            </tr>

            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
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
                    <asp:GridView ID="gvTuongtacloai" runat="server" Width="1089px" Style="margin-right: 0px; margin-top: 0px;" AutoGenerateColumns="False" HorizontalAlign="Left" CssClass="grid">
                        <Columns>
                            <asp:BoundField DataField="NAME" HeaderText="Tên Album" ApplyFormatInEditMode="True">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="PathAl" HeaderText="Đường dẫn">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:ImageField DataImageUrlField="PathImg" HeaderText="Ảnh đại diện">
                                <ControlStyle Height="100px" Width="100px" />
                                <FooterStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:ImageField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:Button ID="btn_edit_edit" runat="server" CommandArgument='<%# Eval("ID") %>' OnClick="btn_edit_edit_Click" Text="Edit" CssClass="gridedit" />
                                    <asp:Button ID="Button2" runat="server" CommandArgument='<%# Eval("ID") %>' OnClick="Button2_Click" Text="Delete" CssClass="griddelete" />
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
                        <asp:TextBox ID="txtTenAlbum" runat="server" CssClass="txttenalbum" Width="227px"></asp:TextBox>
                        <asp:Button ID="btn_close" runat="server" CssClass="btnclose" Height="25px" Text="X" Width="25px" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style19">
                        <asp:Label ID="Label2" runat="server" Text="Đường dẫn"></asp:Label>
                        <asp:TextBox ID="txtPath" runat="server" CssClass="txttenalbum" ReadOnly="True" Width="225px"></asp:TextBox>
                    </td>
                    <td class="auto-style1">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style18">

                        <asp:FileUpload ID="FileUpload1" runat="server" AllowMultiple="True" Style="display: none;" />
                        <asp:Label ID="Label3" runat="server" ForeColor="#996600"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">
                        <asp:Button ID="btn_upload" runat="server"  CssClass="btnupload" Text="Upload Image" Height="30px" />
                    </td>
                    <td class="auto-style1">
                        <asp:Button ID="btnSave" runat="server" OnClick="btnSave_Click" Text="Save" CssClass="btnsave" Height="30px" Width="55px" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <div style="overflow: auto; height: 400px;">
                            <asp:DataList ID="DataList1" runat="server" RepeatColumns="4" Width="349px" Height="280px">
                                <ItemTemplate>
                                    <asp:Image ID="Image1" runat="server" Height="150px" ImageUrl='<%# Eval("PathImg") %>' Width="163px" />
                                    <asp:Button ID="btn_deleteimage" OnClick="btn_deleteimage_Click" runat="server" CommandArgument='<%# Eval("ID") %>' Height="25px" Text="Delete" Width="64px" CssClass="griddelete" />
                                </ItemTemplate>
                            </asp:DataList>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style18">&nbsp;</td>
                </tr>
            </table>
        </asp:Panel>
    </div>


    <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" BackgroundCssClass="modalBackground" TargetControlID="LinkButton1" PopupControlID="Panel1" CancelControlID="LinkButton2" runat="server"></ajaxToolkit:ModalPopupExtender>



</asp:Content>
