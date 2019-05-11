﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UploadImage.aspx.cs" Inherits="HuuTrongStudio.UploadImage" %>

<!DOCTYPE html>

<html>
<head>
    <style>
        input[type="file"] {
            display: block;
        }

        .imageThumb {
            max-height: 75px;
            border: 2px solid;
            padding: 1px;
            cursor: pointer;
        }

        .pip {
            display: inline-block;
            margin: 10px 10px 0 0;
        }

        .remove {
            display: block;
            background: #444;
            border: 1px solid black;
            color: white;
            text-align: center;
            cursor: pointer;
        }

            .remove:hover {
                background: white;
                color: black;
            }
    </style>
</head>
<body>
    <form method="post" enctype="multipart/form-data" runat="server">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <div class="field" align="left">
        <h3>Upload your images</h3>
        <input type="file" id="files" name="files[]" multiple="">
        <asp:Button ID="Button1" runat="server" Text="Upload and Save" OnClick="Button1_Click" />
    </div>
    <script type="text/javascript">
        $(document).ready(function () {
            if (window.File && window.FileList && window.FileReader) {
                $("#files").on("change", function (e) {
                    var files = e.target.files,
                        filesLength = files.length;
                    for (var i = 0; i < filesLength; i++) {
                        var f = files[i]
                        var fileReader = new FileReader();
                        fileReader.onload = (function (e) {
                            var file = e.target;
                            $("<span class=\"pip\">" +
                                "<img class=\"imageThumb\" src=\"" + e.target.result + "\" title=\"" + file.name + "\"/>" +
                                "<br/><span class=\"remove\">X</span>" +
                                "</span>").insertAfter("#files");
                            $(".remove").click(function () {
                                $(this).parent(".pip").remove();
                            });
                        });
                        fileReader.readAsDataURL(f);
                    }
                });
            } else {
                alert("Your browser doesn't support to File API")
            }
        });
    </script>
        </form>
     <asp:Label ID="Label1" runat="server" Text=""></asp:Label>

</body>
</html>
