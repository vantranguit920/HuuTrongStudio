<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MaterPageII.Master" AutoEventWireup="true" CodeBehind="Album.aspx.cs" Inherits="HuuTrongStudio.Public.Album" %>

<asp:Content ID="Content1" ContentPlaceHolderID="conten" runat="server">
    <div id="Album" style="background-color:white">
        <h2 style="margin-left: 10px">
            <asp:Label runat="server" ID="lblName"></asp:Label></h2>
        <div id="content" style="padding: 10px">

            <asp:DataList ID="DTListpic" runat="server" RepeatColumns="3" RepeatDirection="Horizontal">
                <ItemTemplate>

                    <%--<asp:Image ID="imgalbum" CssClass="img-rounded" Width="400" Height="200" runat="server" ImageUrl='<%#Eval("PathImg") %>' />--%>
                    <%--<img id="imgalbums" runat="server" class="img-rounded" src="<%#Eval("PathImg") %>"/>--%>
                    <img  id="imgalbums" class="img-rounded" Width="400" Height="100" src=<%#Eval("PathImg") %> runat="server" ClientIdMode="Static"/>
                </ItemTemplate>
            </asp:DataList>
            
        </div>
        


    </div>
    <div id="myModal" class="modal">
            <span class="close">&times;</span>
            <img class="modal-content" id="img01">
            <div id="caption"></div>
    </div>
    <script>
        // Get the modal
        var modal = document.getElementById("myModal");

        // Get the image and insert it inside the modal - use its "alt" text as a caption
        var img = document.getElementById("imgalbums");
        var modalImg = document.getElementById("img01");
        var captionText = document.getElementById("caption");
        img.onclick = function () {
            modal.style.display = "block";
            modalImg.src = this.src;
            //captionText.innerHTML = this.alt;
        }

        // Get the <span> element that closes the modal
        var span = document.getElementsByClassName("close")[0];

        // When the user clicks on <span> (x), close the modal
        span.onclick = function () {
            modal.style.display = "none";
        }
    </script>
</asp:Content>
