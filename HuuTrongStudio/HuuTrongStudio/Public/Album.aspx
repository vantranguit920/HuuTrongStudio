<%@ Page Title="" Language="C#" MasterPageFile="../MasterPage/MaterPageII.Master" AutoEventWireup="true" CodeBehind="Album.aspx.cs" Inherits="HuuTrongStudio.Public.Album" %>

<asp:Content ID="Content1" ContentPlaceHolderID="conten" runat="server">
    <div id="Album" style="background-color: white; padding-left: 50px">
        <h2 style="margin-left: 10px">
            <asp:Label runat="server" ID="lblName"></asp:Label></h2>
        <div id="content" style="padding: 10px">

            <asp:DataList ID="DTListpic" runat="server" RepeatColumns="3" RepeatDirection="Horizontal">
                <ItemTemplate>

                    <%--<asp:Image ID="imgalbum" CssClass="img-rounded" Width="400" Height="200" runat="server" ImageUrl='<%#Eval("PathImg") %>' />--%>
                    <%--<img id="imgalbums" runat="server" class="img-rounded" src="<%#Eval("PathImg") %>"/>--%>
                    <img onclick="showimg(this.src)" style="width: 400px; height: 200px" id="imgalbums" class="img-rounded" src='<%#Eval("PathImg") %>' runat="server" clientidmode="Static" />
                </ItemTemplate>
            </asp:DataList>

        </div>



    </div>
    <div id="myModal" class="modal">
        <span class="close">&times;</span>
        <span id="pre"  class="pre">&laquo;</span>
        <span id="next"  class="next">&raquo;</span>
        <img class="modal-content" id="img01">
        <div id="caption"></div>
    </div>
    <script>



        // Get the modal
        var modal = document.getElementById("myModal");
        var pre = document.getElementById("pre");
        var next = document.getElementById("next");
       

        // Get the image and insert it inside the modal - use its "alt" text as a caption
        // var img = document.getElementById("imgalbums");

        var modalImg = document.getElementById("img01");
        var a = document.getElementsByClassName("img-rounded");
        
       
        var i ;

        function showimg(src) {
            modal.style.display = "block";
            modalImg.src = src;
            i = 1;
            
            
        }
        
        

        
        var span = document.getElementsByClassName("close")[0];

        
        span.onclick = function () {
            
            modal.style.display = "none";
            
        }

        next.onclick = function(){
            i++;
            if (i == (a.length)) {
                 i = 0;
             }
            modalImg.src = a[i].src;
             
             
            
        }
        pre.onclick= function() {
            
            
            

            modalImg.src = a[i].src;
            i--;
            if (i < 0) {
                i = a.length-1;
            }
            
        }
    </script>
</asp:Content>
