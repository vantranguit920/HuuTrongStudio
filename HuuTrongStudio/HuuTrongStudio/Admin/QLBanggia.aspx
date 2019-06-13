<%@ Page Title="" Language="C#" MasterPageFile="../MasterPage/MasterPageAdmin.Master" AutoEventWireup="true" CodeBehind="QLBanggia.aspx.cs" Inherits="HuuTrongStudio.Admin.QLBanggia" %>
<asp:Content ID="Content1" ContentPlaceHolderID="conten" runat="server">
    <div class="Banggia" id="Banggia">
        <h2 style="color:white;margin-left:50px">Bảng giá dịch vụ</h2>
        <div class="DTlist">
            <asp:DataList runat="server" ID="DTlistBG" Height="50px" RepeatColumns="5" >
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
                        <a href="ThemBG.aspx?ID=<%#Eval("Id")%>&action=update">
                            <div style="height: 40px; background-color: #e40f6b; padding-top: 10px">

                                <h4 style="color: black; margin-top: 5px">Chỉnh sửa</h4>

                            </div>
                        </a>

                    </div>
                </ItemTemplate>

            </asp:DataList>
        </div>

    </div>
    <div style="padding-left:50px">
        <asp:Button CssClass="btnXemthem" ID="btnXemthem" runat="server" Text="Thêm Dịch Vụ" OnClick="btnXemthem_Click" BackColor="White" Font-Bold="True" Font-Size="20pt" ForeColor="Black" Height="50px" Width="231px" />
    </div>
</asp:Content>
