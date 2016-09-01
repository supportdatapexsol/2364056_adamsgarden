<%@ Page Title="" Language="C#" MasterPageFile="~/sitedashboardmaster.master" AutoEventWireup="true" CodeFile="admin_transfer_form.aspx.cs" Inherits="admin_transfer_form" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" type="text/css" media="print" href="Content/styles.css">
     <style>
         .button
         {
        margin-left:30%;
        margin-right:10%;
        
             } 
        .nointernaldiv
        {
            width:30%;
            float:left;
            display:block;
        }
        .radioninternalclass
        {
            width:70%;
            float:left;
            display:block;
        }
        .paymentradiolabel{
             width:20%;
             text-align: left;
             margin-right:2%;
             height:10%;
             float:left;
             display:block;
        }
        .shorttb{
            width:100%;
            margin-right:3%;
        }
        .shortgroupdiv{
            width:50%;
            float:left;
        }
        .midgroupdiv{
            width:33.33%;
            float:left;
        }
        .longgrouptb{
            width:100%;
            clear:both;
        }
        .clear{clear:both;}
        .radioitem{
            width:8%;
             text-align: left;
             margin-right:2%;
             height:10%;
             float:left;
             display:block;

        }
        .radioitem1{
            width:12%;
             text-align: left;
             margin-right:2%;
             height:10%;
             float:left;
             display:block;

        }
        .noinradio{
            width:50%;
             text-align: left;
             height:20%;

        }
        #save{
            width:20%;
        }
        .adamscontent{
            margin-left:5%;
            color:white;
            width:80%;
            text-align:center;
            padding-top:5%;
            padding-bottom:5%;
        }
        
        .logo_image{
            margin-left:11%;
             float:left;
             display:block;
             width:200px;
             height:200px;
             border:2px solid black;
        }
        .logo_image img{
            width:100%;
            height:100%;
        }
        .client_image{
            margin-left:50%;
            float:left;
           
             width:200px;
             height:200px;
             
        }
        .client_image img{
            margin-top:1%;
             width:100%;
            height:100%;
        }
        .btn{
          background-color:#C19E45;
          color:white;
          border-color:#C19E45;
        }
       .adamcontent{
          
          width:100%;
         padding: 6px 12px;
    line-height: 1.428571429;
    color: #555;
    vertical-align: auto;
    background-color: #F1F4F7;
    
    -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,0.075);
    box-shadow: inset 0 1px 1px rgba(0,0,0,0.075);
    -webkit-transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
    transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
       }
       .adamcontent h1{
           font-size:2.5em;
       }
       .adamcontent h2{
           font-size:1.0em;
       }
       .adamcontent h3{
           font-size:.5em;
       }

       .validationtxt{float:right;color:red;margin-right:10px;}
        .validationradio{float:left;color:red;margin-right:10px;}
        .image{
           background-image:url('Images/logo.jpg');
             margin-left: 40px;
         }
         .camera_button {
             
             width:50px;
             height:50px;
             float:right;
         }
         .sellerimg{
             width:200px;
             height:200px;
             border:2px solid #C19F45;
         }
    </style>
    
<script language="javascript" type="text/javascript">
    function ShowMessage(message, messagetype) {
        var cssclass;
        switch (messagetype) {
            case 'Success':
                cssclass = 'alert-success'
                break;
            case 'Error':
                cssclass = 'alert-danger'
                break;
            case 'Warning':
                cssclass = 'alert-warning'
                break;
            default:
                cssclass = 'alert-info'
        }
        $('#alert_container').append('<div id="alert_div" style="margin-top:40px;margin-left:100px;width:50%; -webkit-box-shadow: 3px 4px 6px #999;" class="alert fade in ' + cssclass + '"><a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a><strong>' + messagetype + '!</strong> <span>' + message + '</span></div>');
    }
        $(function () {
    $("#btnPrint").click(function () {
        var contents = $("#dvContents1").html();
        var frame1 = $('<iframe />');
        frame1[0].name = "frame1";
        frame1.css({ "position": "absolute", "top": "-1000000px" });
        $("body").append(frame1);
        var frameDoc = frame1[0].contentWindow ? frame1[0].contentWindow : frame1[0].contentDocument.document ? frame1[0].contentDocument.document : frame1[0].contentDocument;
        frameDoc.document.open();
        //Create a new HTML document.
        frameDoc.document.write('<html><head><title>Adams Garden Transfer Form</title>');
        frameDoc.document.write('</head><body style="-webkit-print-color-adjust: exact;background-color:white; height: 950px;left: 0; right: 0;border-style:double;border-width:12px;border-color:black;background-position: center; background-repeat: no-repeat; background-size:700px 500px;align-content:center;>');
        //Append the external CSS file.
        
    
        //Append the DIV contents.
        frameDoc.document.write(contents);
        frameDoc.document.write('</body></html>');
        frameDoc.document.close();
        setTimeout(function () {
            window.frames["frame1"].focus();
            window.frames["frame1"].print();
            frame1.remove();
        }, 500);
    });
        });
   

$(function () {
    $(":file").change(function () {
        if (this.files && this.files[0]) {
            var reader = new FileReader();
            reader.onload = imageIsLoaded;
            reader.readAsDataURL(this.files[0]);
          
        }
    });
});
$(function () {
    $(":FileUpload1").change(function () {
        if (this.files && this.files[0]) {
            var reader = new FileReader();
            reader.onload = imageIsLoaded1;
            reader.readAsDataURL(this.files[0]);
           
        }
    });
});

function imageIsLoaded(e) {
    $('#clientimage').attr('src', e.target.result);
   
};
function imageIsLoaded1(e) {
    $('#image').attr('src', e.target.result);

};
function generateSellerPage() {
    var output = "waqas khan";
    var OpenWindow = window.open("Admin_SellerCamera.aspx", "mywin", "width=1000,height=1000");
    OpenWindow.dataFromParent = output; // dataFromParent is a variable in child.html
    OpenWindow.init();
};
function generateBuyerPage() {
    var output = "waqas khan";
    var OpenWindow = window.open("Admin_BuyerCamera.aspx", "mywin", "width=1000,height=1000");
    OpenWindow.dataFromParent = output; // dataFromParent is a variable in child.html
    OpenWindow.init();
};
function xyz() {
    var win = window.open("Admin_SellerCamera.aspx", 'windowName', "width=1000,height=1000,scrollbars=no");
    var timer = setInterval(function () {
        if (win.closed) {
            clearInterval(timer);
            alert('closed');
        }
    }, 1000);
}
var popup;

function ShowPopup(url) {

    popup = window.open(url, "Popup", "toolbar=no,scrollbars=no,location=no,statusbar=no,menubar=no,resizable=0,width=1000,height=1000,left = 490,top = 262");

    popup.focus();

}

window.setInterval("refreshDiv()", 1000);
function refreshDiv() {
    var buyer = document.getElementById("Imge1");
    buyer.onerror = function () {
      
        buyer.src = 'Captures/alternative.png';
    };
    document.getElementById("Imge").src = 'Captures/Seller.jpg?rand=' + Math.random();
    document.getElementById("Imge1").src = 'Captures/Buyer.jpg?rand=' + Math.random();
    
}
$(document).ready(function () {
    $("#buyercambutton").click(function () {
        $("Imge").hide();
    });
    $("#ambutton").click(function () {
        $("Imge").show();
    });
});

</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="header" >
      <div class ="newcontainer">
        <div class="newrow">
            <div class="downpayment"><b style="font-size:large">Adam's Garden Transfer Form</b>
                <div style="float:right">
                 <asp:TextBox ID="tbregno" runat="server" placeholder="Enter Registeration no." Font-Bold="True" AutoPostBack="True" CssClass="textboxtb"></asp:TextBox>
                <asp:Button ID="Button1" runat="server" Text="Search" OnClick="Button1_Click" />
                    </div>
            </div>
             <div class="messagealert" id="alert_container">  </div>	
       
        
                   
                   

               
                      
             
     
           
            </div>
            <div class="clear"></div>
                               <br />
                       <asp:Panel ID="tranferId" runat="server"  >
                                   <div class="row">
                                        <div  >
                           
                                           
                            <div class="container" id="dvContents1" style="   height: 1000px;left: 0;background-color:white;right: 0;border-style:double;border-width:12px;border-color:black ;color:black">

                  
                   <div  class="col-sm-3">
                            <asp:Image id="Image1" runat="server" AlternateText="Image text"  ImageAlign="right"
                        ImageUrl="Images/logo.jpg" Width="50%" style="float:left;width:200px;height:100px; margin-top: 8px;"/>
                       </div>
                   
                           <div  class="col-sm-8">
                                         <br />
                                            <h2  style="float:left;text-align:left;"><b>ADAM'S GARDEN Pvt. LTD</b></h2>
                                    </div>
                                        <br/>
                                        <br/>
                                        <br />
                            <div style="float:left;width:100%;text-align:center; " >
                                     <hr style=" display: block; margin-top: 0.3em;  margin-bottom: 0.5em; margin-left: auto;  margin-right: auto; border-style: solid;" />
                            </div>
                        
                     <div  style="text-align:justify;float:left;width:60%; margin-left: 40px;">
                   
                                        <br />
                                    <asp:Label ID="labelregid" runat="server" Text="Registeration No. " for="tbregid"></asp:Label>
                                    <asp:Label ID="lbregid" runat="server" Font-Bold="true" Font-Size="Large"></asp:Label>
                            </div>
                            <div style="text-align:left;float:right;width:30%">
                                        <br />
                                    <asp:Label ID="lbdate" runat="server" Text="Date" for="tbdateid"></asp:Label>
                                    <asp:Label ID="lbdate1" runat="server" Font-Bold="true" Font-Size="Large"></asp:Label>                
                            </div>
                                    <br />
                                    <br />
                                    <br /> 
                                    <br />
                                    <br />
                                    <h2 class="h2style" style="margin-left:0%; background-color:#C19F45;color:black;      width:100%;text-align:center;font-family:'Old English Text MT'; ">Certificate of Transfer</h2>
                                           
                   <div id="r1"  style="float:right;width:30%;" >
                                                   

                       <img id="Imge" src="Captures/Seller.jpg" onclick="ShowPopup('Admin_SellerCamera.aspx')" style="width:155px;height:155px"/>
                  <!--     <asp:ImageButton ID="buyercambutton" runat="server"  class="camera_button"  ImageUrl="Images/camera.png" OnClientClick="ShowPopup('Admin_SellerCamera.aspx')"/>
                  -->            
                       
                            </div>
             
                    
                      
                    <div style="background-image:url('Images/logo.png'); margin-left: 40px;" >
                         
                  <!--          <div style="background-image:url('Images/logo3.png'); background-position: center; background-repeat: no-repeat; background-size:700px 500px;align-content:center; margin-left: 40px;" >
-->
                               <asp:Label ID="lbowner" runat="server" Text="The Owner " ></asp:Label >
                        <br /><br />

                              <asp:Label ID="labelownername" runat="server" Text="Mr/Mrs/Miss : " for="lbownername" ></asp:Label >
                        <asp:Label ID="lbownername" runat="server"  Font-Bold="true" Font-Size="Large"></asp:Label>
                        <br /><br />
                         <asp:Label ID="Label3" runat="server" Text="NIC No. : " for="lbownernicno"></asp:Label>
                        <asp:Label ID="lbowner_cnic" runat="server"  Font-Bold="true" Font-Size="Large"></asp:Label>
                        <br /><br />
                           <asp:Label ID="Label5" runat="server" Text="Residence of : " for="lbowneraddress"></asp:Label>
                        <asp:Label ID="lbowner_address" runat="server"  Font-Bold="true" Font-Size="Large"></asp:Label>
                         <br /><br />
                                
                                <asp:Label ID="lbplot" runat="server" Text="Certified that the title of PLOT No. : " for="labelplotno"></asp:Label>
                                <asp:Label ID="lbplotno" runat="server"  Font-Bold="true" Font-Size="Large"></asp:Label>
                                 <br />    <br />
                               
                                <asp:Label ID="lbstreet" runat="server" Text="Street : " for="tbstreetid"></asp:Label>
                                <asp:Label ID="lbstreet_no" runat="server"  Font-Bold="true" Font-Size="Large" ></asp:Label>
                
                   
                    
                                <asp:Label ID="labelcatagory" runat="server" Text="CAT" for="tbcatagory"></asp:Label>
                                <asp:Label ID="lbcatagory" runat="server" Font-Bold="true" Font-Size="Large"></asp:Label>
                           <br /><br />
                            <asp:Label ID="labelsector" runat="server" Text="Plot Address : " for="tbsector"></asp:Label>
                                <asp:Label ID="lbplot_address" runat="server" Font-Bold="true" Font-Size="Large"></asp:Label>

                    
                
                        <br /><br />
                        <p style="font-size:20px;color:black" >Islamabad has been transfered in the name of</p>
                               
                        <br />
                        <div id="result" style="float:right;width:30%">
                           
                            <img id="Imge1" src="Captures/Buyer.jpg"  onclick="generateBuyerPage()" style="width:155px;height:155px"/>
                            </div>
                        <asp:Label ID="lbnameid" runat="server" Text="Mr/Mrs/Miss : " for="lbbuyername"></asp:Label>
                        <asp:Label ID="lbbuyername" runat="server"  Font-Bold="true" Font-Size="Large"></asp:Label>
                        <br /><br />
                         <asp:Label ID="lbnic" runat="server" Text="NIC No. : " for="lbbuyernic"></asp:Label>
                        <asp:Label ID="lbbuyernic" runat="server"  Font-Bold="true" Font-Size="Large" ></asp:Label>
                        <br /><br />
                <asp:Label ID="lbresidenceid" runat="server" Text="Residence of : " for="lbbuyeraddress"></asp:Label>
                        <asp:Label ID="lbbuyeraddress" runat="server"  Font-Bold="true" Font-Size="Large"></asp:Label>
                       
                
                     
                   <br />
                    
                    
                 
                        
                  
             
                   <div style="float:left;color:black">   
                              <br />                 
                       <h4 style="float:left;color:black">on the terms and conditions laid down by the Adam's Garden and accepted by the tranferee and has been entered in the record of the Adam's Garden accordingly.</h4>
<br />
                    <br />
                    <br />
                    <br />
                       <br /><br /><br /><br />
                    
                    <h3 style="font-style:italic;color:black">Assistant Director (Estate)</h3>
                     </div>
                        </div>
                    </div>

                   
                    
                </div> 
                                            <br />
                                       <div class="container">
                                            <input type="button" id="btnPrint" value="Print"  class="btn btn"/>
                                            <asp:Button ID="savetransferform" runat="server" OnClick="savetransferform_Click" Text="Save Transfer Form" class="btn btn"/>
                                        </div>
                                       </div>
                     
        </asp:Panel>
                  
                       </div></div>
   
    
</asp:Content>

