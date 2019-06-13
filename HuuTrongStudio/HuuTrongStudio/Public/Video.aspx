<%@ Page Title="" Language="C#" MasterPageFile="../MasterPage/MaterPageII.Master" AutoEventWireup="true" CodeBehind="Video.aspx.cs" Inherits="HuuTrongStudio.Public.Video" %>

<asp:Content ID="Content1" ContentPlaceHolderID="conten" runat="server">
    <div style="background-color: black">
        <div>

            <div class="videoiframediv" style="width: 100%">
                <iframe runat="server" id="ifVideo" style="width: 60%; height: 400px; margin-left: 50%; transform: translate(-50%)" class="videoiframe"  allowfullscreen></iframe>
            </div>

        </div>


    </div>
    <div style="margin-left:10px;margin-top:100px">
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
                                <p style="font-family: VnArialH; font-size: 180%; font-weight: bold; font-style: oblique; color: black; text-align: left; width: 280px; text-overflow: ellipsis; overflow: hidden; white-space: nowrap"><%#Eval("Name") %></p>
                            </a>
                        </td>
                    </tr>
                </table>


            </ItemTemplate>
        </asp:DataList>
    </div>
</asp:Content>
