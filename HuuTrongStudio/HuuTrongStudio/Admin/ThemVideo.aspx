<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MaterPageII.Master" AutoEventWireup="true" CodeBehind="ThemVideo.aspx.cs" Inherits="HuuTrongStudio.Admin.ThemVideo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="conten" runat="server">
     <div style="background-color:white">
        <div style="width:79%; margin:auto;background-color:gainsboro;padding-left:100px;padding-top:100px">
            
            <h2 style="color:black">Thêm video phóng sự cưới</h2>

            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Nhập mô tả video" ControlToValidate="txtnameDV"></asp:RequiredFieldValidator><br />
            <asp:TextBox ID="txtnameDV" runat="server" Height="50px" Width="50%" Font-Bold="True" Font-Size="15pt" placeholder="Mô tả video"></asp:TextBox>
            <br />         
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Nhập ảnh nền" ControlToValidate="txtGia"></asp:RequiredFieldValidator><br />
            <asp:TextBox ID="txtGia" runat="server" Width="50%" Height="50px" Font-Bold="True" Font-Size="15pt" placeholder="Link ảnh nền"></asp:TextBox>
            <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Nhập link video" ControlToValidate="txtKM"></asp:RequiredFieldValidator>
            <br />
            <asp:TextBox ID="txtKM" runat="server" Height="50px" Width="50%" Font-Bold="True" Font-Size="15pt" placeholder="Link video" ></asp:TextBox>
            <br />
              <br /><br /><br />            
            <br />
            <asp:Button runat="server" ID ="btnSave" BackColor="#0000CC" OnClick="btnSave_Click" Font-Bold="True" Font-Size="20pt" ForeColor="White" Height="53px" Text="Save" Width="150px" />
            <br />
            <br />
        </div>
    </div>
</asp:Content>
