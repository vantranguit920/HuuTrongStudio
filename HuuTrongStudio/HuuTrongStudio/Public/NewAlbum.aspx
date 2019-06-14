<%@ Page Title="" Language="C#" MasterPageFile="../MasterPage/MaterPageII.Master" AutoEventWireup="true" CodeBehind="NewAlbum.aspx.cs" Inherits="HuuTrongStudio.Public.NewAlbum" %>
<asp:Content ID="Content1" ContentPlaceHolderID="conten" runat="server">
     <div class="Album" id="Album">

        <h2>ALBUM NỔI BẬT</h2>
        <div style="padding=50px; margin-left: 20px">
            <asp:DataList ID="DataList1" runat="server" RepeatColumns="4" RepeatDirection="Horizontal">
                <ItemTemplate>

                    <table>

                        <tr>

                            <td>
                                <a href="Album.aspx?ID=<%#Eval("ID")%>&Name=<%#Eval("NAME") %>#content">

                                    <div class="col-md-4" style="margin: 5px; text-align: center">
                                        <div class="thumbnail" style="background-color:#c08f4d">
                                            <asp:Image ID="imgAlbum" CssClass="imgalbum" runat="server" ImageUrl='<%#Eval("PathImg")%>' Height="200px" Width="300px" />
                                        </div>
                                    </div>
                                </a>

                            </td>

                        </tr>
                        <tr>
                            <td style="text-align:center">
                                <a href="Album.aspx" style="font-family: VnArialH; font-size: 200%; font-style: oblique; font-weight: bold; color:black;text-align:center">
                                    <%#Eval("NAME") %>
                                </a>
                            </td>
                        </tr>
                    </table>

                </ItemTemplate>
            </asp:DataList>
        </div>
        <%--<asp:Button CssClass="btnXemthem" ID="btnXemthem" runat="server" Text="Xem Them" OnClick="btnXemthem_Click" />--%>
    </div>

</asp:Content>
