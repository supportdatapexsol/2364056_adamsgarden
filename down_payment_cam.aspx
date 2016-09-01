<%@ Page Language="C#" AutoEventWireup="true" CodeFile="down_payment_cam.aspx.cs" Inherits="down_payment_cam" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
         <link href="Content/bootstrap.min.css" rel="stylesheet"/>
    <link href="Content/styles1.css" rel="stylesheet"/>
        <link href="Content/style.css" rel="stylesheet"/>

    <script src="Scripts/jquery-1.10.2.js"></script>
	<script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/lumino.glyphs.js"></script>

    <style>
         .downpayment{
            margin-left:0%;
            background-color:#C19F45;
            color:white;
            width:100%;
            text-align:center;
            padding-top:1%;
            padding-bottom:1%;
        }
         .imggg{
             width:100%;
             display: inline-block;
         }
           .mybtns{
        
        margin-left:30%;
       
     
    }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <div class="container">
            <h2 class="downpayment">Capture Image</h2>
        <div class="imggg">
     <div class="buyerimage">
            <input type="hidden" value="xyz" id="tbid" name="tbid"/>
        <div id="results"><img src="#" id="cimg"/></div>
        <div id="my_camera"></div>
		<input type="button" value="Capture" onclick="SellerSnapShot()" class="btn btn"/>
        </div>
            <input type="submit" class="btn btn"/><br />
	   </div>
            </div>
	<script  type="text/javascript" src="Scripts/webcam.js"></script>
	<script language="JavaScript">
	    Webcam.set({
	        width: 320,
	        height: 240,
	        image_format: 'jpeg',
	        jpeg_quality: 90
	    });
	    Webcam.attach('#my_camera');
	</script>
	<script language="JavaScript">
	    function SellerSnapShot() {

	        Webcam.snap(function (data_uri) {
	            document.getElementById('cimg').src = data_uri;
	            document.getElementById('tbid').value = data_uri;


	        });
	    }
	    function buyerSnapShot() {
	        Webcam.snap(function (data_uri) {
	            document.getElementById('bimg').src = data_uri;
	            document.getElementById('tbbid').value = data_uri;


	        });
	    }

	</script>
    </div>
    </form>
</body>
</html>
