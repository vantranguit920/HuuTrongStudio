<%@ Page Title="" Language="C#" MasterPageFile="../MasterPage/MaterPage.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="HuuTrongStudio.Public.Home" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="conten">
    <div class="Album" id="Album">

        <h2>ALBUM NỔI BẬT</h2>
        <div style="padding: 5px; margin-left: 20px">
            <asp:DataList ID="DataList1" runat="server" RepeatColumns="4" RepeatDirection="Horizontal">
                <ItemTemplate>

                    <table>

                        <tr>

                            <td>
                                <a href="Album.aspx?ID=<%#Eval("ID")%>&Name=<%#Eval("NAME") %>#content">

                                    <div class="col-md-4" style="margin: 2px; text-align: center">
                                        <div class="thumbnail" style="background-color:darkgrey">
                                            <asp:Image ID="imgAlbum" CssClass="imgalbum" runat="server" ImageUrl='<%#Eval("PathImg")%>' Height="200px" Width="300px" />
                                        </div>
                                    </div>
                                </a>

                            </td>

                        </tr>
                        <tr>
                            <td style="text-align: center">
                                <a href="Album.aspx?ID=<%#Eval("ID")%>&Name=<%#Eval("NAME") %>" style="font-family: VnArialH; font-size: 200%; font-style: oblique; font-weight: bold; color: black; text-align: center">
                                    <%#Eval("NAME") %>
                                </a>
                            </td>
                        </tr>
                    </table>

                </ItemTemplate>
            </asp:DataList>
        </div>
        <asp:Button CssClass="btnXemthem" ID="btnXemthem" runat="server" Text="Xem Thêm" OnClick="btnXemthem_Click" />
    </div>
    <div class="Banggia" id="Banggia">
        <h2>Bảng giá dịch vụ</h2>
        <div class="DTlist" style ="margin-left:60px">
            <asp:DataList runat="server" ID="DTlistBG" Height="50px"  RepeatColumns="5" OnSelectedIndexChanged="DTlistBG_SelectedIndexChanged">
                <ItemTemplate>
                    <div id="divBG" style="margin: 20px; border: thin; background-color: beige; text-align: center; width: 200px">
                        <div style="background-color: #e40f6b; height: 40px; padding: 5px; color: white">
                            <h4><%#Eval("Name") %></h4>
                        </div>
                        <div style="height: 30px; background-color: #e788b1; padding: 5px; color: white">
                            <h4>Giá: <%#Eval("Gia") %>  VND </h4>
                        </div>
                        <div style="text-align: left; padding: 10px">
                            <h5>

                                <asp:BulletedList ID="BulletedList1" runat="server" DataSource='<%#Eval("ListKM") %>' BulletStyle="NotSet" BorderStyle="NotSet"></asp:BulletedList>

                            </h5>




                        </div>
                        <a href="BanggiaDV.aspx?Name=<%#Eval("Id")%>">
                            <div style="height: 40px; background-color: #e40f6b; padding-top: 10px">

                                <h4 style="color: black; margin-top: 5px">Xem Chi Tiết</h4>

                            </div>
                        </a>

                    </div>
                </ItemTemplate>

            </asp:DataList>
        </div>

    </div>
    <div class="video" id="video">
        <h2>Thư viện Video </h2>
        <div style="margin-left:50px">
            <asp:DataList ID="DTLVideo" RepeatColumns="4" runat="server">
                <ItemTemplate>
                    <table>

                        <tr>

                            <td>
                                <a href="Video.aspx?ID=<%#Eval("Link")%>">

                                    <div class="col-md-4" style="margin: 2px; text-align: center">

                                        <div class="thumbnail" style="position: relative">
                                            <asp:Image ID="imgAlbum" CssClass="imgalbum" runat="server" ImageUrl='<%#Eval("Img")%>' ImageAlign="Middle" Height="200" Width="300"></asp:Image>

                                            <div style="width: 50px; height: 50px; position: absolute; top: 50%; left: 50%; transform: translate(-50%,-50%)">
                                                <img src="../assets/img/play-button.png" />
                                            </div>
                                        </div>


                                    </div>
                                </a>

                            </td>

                        </tr>
                        <tr>
                            <td style="text-align: center">
                                <a href="Video.aspx?ID=<%#Eval("Link")%>">
                                    <p style="font-family: VnArialH; font-size: 180%;font-weight:bold; font-style: oblique;  color: black; text-align: left;width:280px;text-overflow:ellipsis;overflow: hidden;white-space: nowrap"><%#Eval("Name") %></p>                                    
                                </a>
                            </td>
                        </tr>
                    </table>


                </ItemTemplate>
            </asp:DataList>
        </div>
    </div>
</asp:Content>

