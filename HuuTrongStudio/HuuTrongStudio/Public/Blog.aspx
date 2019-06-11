<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MaterPageII.Master" AutoEventWireup="true" CodeBehind="Blog.aspx.cs" Inherits="HuuTrongStudio.Public.Blog" %>
<asp:Content ID="Content1" ContentPlaceHolderID="conten" runat="server">
    <div style ="background-color:white">
        <div style="width:80%;padding-top:10px;margin:auto">
            <asp:DataList ID="Dtlblog" runat="server" RepeatColumns="2">
                <ItemTemplate>
                    <div style ="margin-left:30px">
                        <a href="../Public/NDBlog.aspx?ID=<%#Eval("ID") %>">
                        <div>
                            <img style="width: 500px; height: 300px" runat="server" id="imgblog" src='<%#Eval("img") %>' />
                            <h4><%#Eval("sub") %></h4>
                        </div>
                    </a>
                    </div>
                    
                    
                </ItemTemplate>
            </asp:DataList>
        </div>
    </div>
</asp:Content>
