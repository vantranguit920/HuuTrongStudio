<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MaterPageII.Master" AutoEventWireup="true" CodeBehind="Lienhe.aspx.cs" Inherits="HuuTrongStudio.Public.Lienhe" %>

<asp:Content ID="Content1" ContentPlaceHolderID="conten" runat="server">
    <div class="content">
        ﻿<div id="contact">
            <div class="container">
                <h1>Liên hệ với chúng tôi</h1>

                <div class="row">
                    <p style="margin-left: 30px; font-weight: bold; margin-bottom: 20px;">
                        Vui lòng gửi cho chúng tôi thông tin của chú rể và cô dâu để được khuyến mãi thêm 5% trọn gói.
                    </p>

                    <div class="span6">
                        <div class="row-fluid" style="font-size: 20px; font-weight: 600; color: black">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Nhập vào họ tên" ControlToValidate="txtName" ForeColor="Red" Font-Size="10pt"></asp:RequiredFieldValidator><br />

                            <asp:TextBox ID="txtName" runat="server" CssClass="txtName" Height="40px" Width="400px" placeholder="Full Name" BackColor="#DADADA" Font-Bold="True" ForeColor="Black" Font-Size="15"></asp:TextBox><br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ForeColor="Red" ErrorMessage="Nhập vào Email" ControlToValidate="txtEmail" Font-Size="10pt" ></asp:RequiredFieldValidator><br />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ForeColor="Red" runat="server" ErrorMessage="Email không hợp lệ!" Font-Size="10pt" ControlToValidate="txtEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator><br />
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="txtEmail" Height="40px" Width="400px" placeholder="Email" BackColor="#DADADA" Font-Bold="True" ForeColor="Black" Font-Size="15"></asp:TextBox><br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ForeColor="Red" runat="server" ErrorMessage="Nhập vào số điện thoại" Font-Size="10pt"  ControlToValidate="txtPhone"></asp:RequiredFieldValidator><br />

                            <asp:TextBox ID="txtPhone" runat="server" CssClass="txtPhone" Height="40px" Width="400px" placeholder="Number Phone" BackColor="#DADADA" Font-Bold="True" ForeColor="Black" Font-Size="15"></asp:TextBox><br />
                            
                            <h5>Chọn gói dịch vụ</h5>
                            <span>
                                <asp:DropDownList ID="drdGoiDV" runat="server" CssClass="drdGoiDV" Width="415px" OnSelectedIndexChanged="drdGoiDV_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList></span><br />
                            <asp:Label runat="server" ID="lblDV" BackColor="Red" ForeColor="#FFFFCC" Font-Size="20pt" Font-Bold="True"></asp:Label><br />
                            <br />
                            <asp:TextBox ID="txtGhiChu" runat="server" CssClass="txtGhichu" Height="40px" Width="400px" placeholder="Ghi Chú" BackColor="#DADADA" Font-Bold="True" ForeColor="Black" Font-Size="15"></asp:TextBox><br />
                            <asp:Button runat="server" OnClick="Unnamed_Click" CssClass="btnsubmit" Text="Send" Width="100px" Height="50px" BackColor="#1FAEB5" BorderStyle="Solid" ForeColor="#FFFFCC" Font-Size="15pt" /><br />

                        </div>
                    </div>
                    <!--End span6 -->

                    <div class="span6">
                        <ul class="contact-info">
                            <li>Áo cưới HTStudio</li>
                            <li>Add: HCM City</li>
                            <li>Email: AocuoiHTStudio@gmail.com</li>
                        </ul>
                        <div class="phone-contact clearfix">
                            <img src="assets/img/icon_phone02.png" alt="">
                            <div class="phone-number">
                                <p>04.6684.6619 <span>(Tư vấn chụp ảnh)</span></p>
                                <p>097.986.9861 <span>(Mr.Trong)</span></p>
                                <p>0913.998.398 <span>(Mr.Trong)</span></p>
                            </div>
                        </div>
                        <div class="fb-page"
                            data-href="https://www.facebook.com/Wedding-media-395007184279628"
                            data-width="340"
                            data-hide-cover="false"
                            data-show-facepile="true">
                        </div>

                    </div>
                    <!--End span6 -->
                </div>
            </div>
            <!--End container -->
        </div>
        <!--End #contact -->

    </div>



    <%--<div style="width:100%;height:100px;margin-top:-10px">
        <div style="background-color:white;text-align:center;height:100%;padding-top:10px">
            <h2>HÃY LIÊN HỆ VỚI CHÚNG TÔI</h2>
        </div>
    </div>
    <div style="width: 100%; margin: auto;height:700px">

        <div class="leftBGDV" id="leftBGDV" style="height:700px;width: 60%; background-color: #ccc9c9; float: left; text-align: center">
            
        </div>

        <div class="rightBGDV" id="rightBGDV" style="width: 40%; height:700px; background-color: white; float: left">
           
             
        </div>
    </div>--%>
</asp:Content>
