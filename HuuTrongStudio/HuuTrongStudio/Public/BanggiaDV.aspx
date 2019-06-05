<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MaterPageII.Master" AutoEventWireup="true" CodeBehind="BanggiaDV.aspx.cs" Inherits="HuuTrongStudio.Public.BanggiaDV" %>

<asp:Content ID="Content1" ContentPlaceHolderID="conten" runat="server">



    <div style="width: 100%; margin: auto">
        <div class="leftBGDV" id="leftBGDV" style="width: 30%; height: 100%; background-color: #ccc9c9; float: left; text-align: center">
            <div style="margin:10px">
                <div>
                    <h3>Bảng Giá Các Gói Dịch Vụ</h3>
                </div>
                <div class="contentDV">
                    <ul class="clearfix">
                        <asp:Label runat="server" ID="lbllistdv">

                        </asp:Label>
                    </ul>
                </div>
                <a href="Lienhe.aspx">
                    <div style="background-color: blue; color: white">
                        <h3>ĐẶT ONLINE</h3>
                    </div>
                </a>

            </div>
        </div>

        <div class="rightBGDV" id="rightBGDV" style="width: 70%; height: 100%; background-color: white; float: left">
           
                <div style="margin:10px">
                    <h3 runat="server" id="title" style="margin: 10px;color:red"></h3>
                    <h4 style="margin: 20px;color:crimson;padding-bottom:5px">
                        <asp:BulletedList ID="BListDV" runat="server" BulletStyle="Disc"></asp:BulletedList>
                    </h4>
                    <p style="margin:10px;font-family:VnArabia;font-size:20px;text-align:justify" runat="server" id="h5ND">

                    </p>
                    <br />
                    <br />
                    <br />
                    <br />
                    
                    
                </div>
        </div>
    </div>
    
    <script>
        $(document).ready(function () {
            var left = document.getElementById("leftBGDV").clientHeight;
            var right = document.getElementById("rightBGDV").clientHeight;
            if (left > right) {

                document.getElementById("rightBGDV").style.height = left + "px";

            } else {
                document.getElementById("leftBGDV").style.height = right + "px";
            }
        })
    </script>

    
</asp:Content>
