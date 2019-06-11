<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MaterPageII.Master" AutoEventWireup="true" CodeBehind="ThemBG.aspx.cs" Inherits="HuuTrongStudio.Admin.ThemBG" %>
<asp:Content ID="Content1" ContentPlaceHolderID="conten" runat="server">
    <div style="background-color:white">
        <div style="width:79%; margin:auto;background-color:gainsboro;padding-left:100px;padding-top:100px">
            
            <h2 style="color:black">Bảng giá dịch vụ</h2>

            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Nhập tên dịch vụ" ControlToValidate="txtnameDV"></asp:RequiredFieldValidator><br />
            <asp:TextBox ID="txtnameDV" runat="server" Height="50px" Width="50%" Font-Bold="True" Font-Size="15pt" placeholder="Tên dịch vụ"></asp:TextBox>
            <br />
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Giá không chính xác" ControlToValidate="txtGia" ValidationExpression="^\d+"></asp:RegularExpressionValidator>
            <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Nhập giá dịch vụ" ControlToValidate="txtGia"></asp:RequiredFieldValidator><br />
            <asp:TextBox ID="txtGia" runat="server" Width="50%" Height="50px" Font-Bold="True" Font-Size="15pt" placeholder="Giá dịch vụ"></asp:TextBox>
            <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Nhập nội dung chính" ControlToValidate="txtKM"></asp:RequiredFieldValidator>
            <br />
            <asp:TextBox ID="txtKM" runat="server" Height="50px" Width="50%" Font-Bold="True" Font-Size="15pt" placeholder="Nội dung chính" ></asp:TextBox>
            <br />
              <br /><br /><br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Nhập nội dung chi tiết" ControlToValidate="txtND"></asp:RequiredFieldValidator>
            <br />
            <textarea class="ckeditor" runat="server" id="txtND"></textarea>
            <br />
            <br />
            <asp:Button runat="server" ID ="btnSave" OnClick="btnSave_Click" BackColor="#0000CC" Font-Bold="True" Font-Size="20pt" ForeColor="White" Height="53px" Text="Save" Width="150px" />
            <br />
            <br />
        </div>
    </div>
</asp:Content>
