<%@ Page Title="" Language="C#" MasterPageFile="../MasterPage/MaterPageII.Master" AutoEventWireup="true" CodeBehind="NDBlog.aspx.cs" Inherits="HuuTrongStudio.Public.NDBlog" %>

<asp:Content ID="Content1" ContentPlaceHolderID="conten" runat="server">
    <div style="background-color: white">
        <div style="width: 80%; margin: auto; padding: 10px">
            <div>
                <asp:Repeater runat="server" ID="rpcontent">
                    <ItemTemplate>
                        <h3 style="color:red"><%#Eval("sub") %></h3>
                        <p><%#Eval("content") %></p>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
            <div>
                <h3 style="color: blue">Các bài viết khác</h3>
                <ul style="list-style:circle;margin-left:50px;font-size:20px">
                    <asp:DataList ID="Dtlblog" runat="server" >
                        <ItemTemplate>
                            
                                <li><a href="../Public/NDBlog.aspx?ID=<%#Eval("ID") %>"><%#Eval("sub") %></a></li>
                            
                            
                        </ItemTemplate>
                    </asp:DataList>
                </ul>

            </div>
        </div>
    </div>
</asp:Content>
