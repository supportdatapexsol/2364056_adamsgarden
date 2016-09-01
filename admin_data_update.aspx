<%@ Page Title="" Language="C#" MasterPageFile="~/sitedashboardmaster.master" AutoEventWireup="true" CodeFile="admin_data_update.aspx.cs" Inherits="admin_data_update" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
      <style>
         .button{
        margin-left:30%;
        margin-right:10%;
        
    } 
        .nointernaldiv{
            width:30%;
            float:left;
            display:block;
        }
        .radioninternalclass{
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
		  border:2px solid #c19f45;
            width:100%;
			  margin-right:3%;
			  border-radius: 50px;
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
			  border: 2px solid #c19f45;
              border-radius: 50px;

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
        .dawnpayment{
            margin-left:0%;
            background-color:#C19F45;
            color:white;
            width:100%;
            text-align:center;
            padding-top:1%;
            padding-bottom:1%;
        }
        .logo_image{
            margin-left:11%;
             float:left;
             display:block;
             width:200px;
             height:200px;
             border:none;
        }
        .logo_image img{

            width:100%;
            height:100%;
        }
        .client_image{

            margin-right:20px;
            float:right;
           
             width:180px;
             height:220px;
             margin-bottom:5px;
             margin-top:0px;
             
        }
        .client_image img{
         
             width:100%;
            height:100%;
        }
        .btn{
          background-color:#C19E45;
          color:white;
          border-color:#C19E45;
         margin-left:30% 
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
        .validationimage{float:right;color:red;margin-top:-85px;}
        .validationradio{float:left;color:red;margin-right:10px;}
         .messagealert {
            width: 100%;
            position: fixed;
             top:0px;
            z-index: 100000;
            padding: 0;
            font-size: 15px;
        }
    </style>
<script language="javascript" type="text/javascript">


    function generateDownpayPage() {
        var output = "waqas khan";
        var OpenWindow = window.open("down_payment_cam.aspx", "mywin", "width=1000,height=1000");
        OpenWindow.dataFromParent = output; // dataFromParent is a variable in child.html
        OpenWindow.init();

    };




    window.setInterval("refreshDiv()", 1000);
    function refreshDiv() {
        var buyer = document.getElementById("Imge1");
        buyer.onerror = function () {

            buyer.src = 'Captures/alternative1.png';
        };
      
        document.getElementById("Imge1").src = 'Captures/DownPayment.jpg?rand=' + Math.random();

    }

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
    $(":file").change(function () {
        if (this.files && this.files[0]) {
            var reader = new FileReader();
            reader.onload = imageIsLoaded;
            reader.readAsDataURL(this.files[0]);
            alert(this.files[0]);
        }
    });
});

function imageIsLoaded(e) {
    $('#clientimage').attr('src', e.target.result);
   
};



    
 

</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
    <div class="header">
        <div class="newcontainer">
            <div class="newrow">
       
     
        
        <asp:Panel runat="server" ID="downpayment">
		
         
          
            
            <div class="clear"></div>
           
                
                    <div class="messagealert" id="alert_container">  </div>	
                <h2 class="dawnpayment">Down Payment Form</h2>
           

                  <div class="client_image">
                 <div class="logo_image">

                    <img id="Imge1" src="Captures/DownPayment.jpg"  onclick="generateDownpayPage()" />
                         <asp:Button ID="Button1"  OnClientClick="generateDownpayPage()"  runat="server" Text="Take Image" class="btn btn"/>
                     
</div>
                      </div>
<div class="clearfix"></div>
                <div class="form-group longgrouptb">

                <asp:Label ID="lbname" runat="server" Text="Name" for="tbname" Font-Bold="true"></asp:Label>
                <asp:TextBox ID="tbname" runat="server" ReadOnly="false" class="form-control input-sm shorttb" Font-Bold="true"></asp:TextBox>
                                      <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="tbname" runat="server" ErrorMessage="*Please enter you name"  SetFocusOnError="True" class="validationtxt"></asp:RequiredFieldValidator>

                    </div>
               
                <div class="form-group shortgroupdiv">
                    
                     <asp:Label ID="lbsof" runat="server" Text="S/O,D/O,W/O" for="tbsof" Font-Bold="true"></asp:Label>
                   
                <asp:TextBox ID="tbsof" runat="server" ReadOnly ="false" class="form-control input-sm shorttb" Font-Bold="true"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="tbsof" runat="server" ErrorMessage="*Please enter S/O,D/O,W/O"  SetFocusOnError="True" class="validationtxt"></asp:RequiredFieldValidator>

                 </div>
             
                <div class="form-group shortgroupdiv">

                <asp:Label ID="lbcnic" runat="server" Text="C.N.I.C" for="tbcnic" Font-Bold="true"></asp:Label>
                               <asp:TextBox ID="tbcnic" runat="server" ReadOnly ="false" class="form-control input-sm shorttb" Font-Bold="true"></asp:TextBox>
               <asp:RegularExpressionValidator runat="server"  ControlToValidate="tbcnic" ValidationExpression="^[0-9+]{5}-[0-9+]{7}-[0-9]{1}$"
EnableClientScript="true"
ErrorMessage="Enter correct format of CNIC xxxxx-xxxxxx-x" SetFocusOnError="True" class="validationtxt" ></asp:RegularExpressionValidator>
                          </div>


                <div class="form-group longgrouptb">
                <asp:Label ID="lboccupation" runat="server" Text="Occupation" for="tboccupatiom" Font-Bold="true"></asp:Label>                
                <asp:TextBox ID="tboccupatiom" runat="server" ReadOnly ="false" class="form-control input-sm shorttb" Font-Bold="true"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="tboccupatiom" runat="server" ErrorMessage="*Please enter your Occupation"  SetFocusOnError="True" class="validationtxt"></asp:RequiredFieldValidator>

                    </div>
                <div class="form-group longgrouptb">
                <asp:Label ID="lbpresentaddress" runat="server" Text="Present Address" for="tbpresentaddress" Font-Bold="true"></asp:Label>
                <asp:TextBox ID="tbpresentaddress" runat="server" ReadOnly ="false" class="form-control input-sm shorttb" Font-Bold="true"> </asp:TextBox>
                                  <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="tbpresentaddress" runat="server" ErrorMessage="*Please enter your Present Address"  SetFocusOnError="True" class="validationtxt"></asp:RequiredFieldValidator>

                     </div>

                 <div class="form-group midgroupdiv">
                <asp:Label ID="lbtel" runat="server" Text="Tel :" for="tbtel" Font-Bold="true"></asp:Label>
                <asp:TextBox ID="tbtel" runat="server" ReadOnly ="false" class="form-control input-sm shorttb" Font-Bold="true"> </asp:TextBox>
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="tbtel" runat="server" ErrorMessage="*Please enter your Telephone number"  SetFocusOnError="True" class="validationtxt"></asp:RequiredFieldValidator>

                    </div>

                 <div class="form-group midgroupdiv">
                <asp:Label ID="lbmobile" runat="server" Text="Mobile :" for="tbmobile" Font-Bold="true"></asp:Label>
                <asp:TextBox ID="tbmobile" runat="server" class="form-control input-sm shorttb" Font-Bold="true"> </asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ControlToValidate="tbmobile" runat="server" ErrorMessage="*Please enter your Mobile Number"  SetFocusOnError="True" class="validationtxt"></asp:RequiredFieldValidator>

                    </div>

                 <div class="form-group midgroupdiv">
                <asp:Label ID="lbemai" runat="server" Text="E-mail :" for="tbemail" Font-Bold="true"></asp:Label>
                <asp:TextBox ID="tbemail" runat="server" class="form-control input-sm shorttb" Font-Bold="true"> </asp:TextBox>
                           <asp:RegularExpressionValidator ControlToValidate="tbemail" SetFocusOnError="True" class="validationtxt" ValidationExpression="^[-a-zA-Z0-9][-.a-zA-Z0-9]*@[-.a-zA-Z0-9]+(\.[-.a-zA-Z0-9]+)*\.(com|edu|info|gov|int|mil|net|org|biz|name|museum|coop|aero|pro|tv|[a-zA-Z]{2})$" EnableClientScript="true" ErrorMessage="Enter correct format of email !" runat="server" />

                              </div>

                 <div class="form-group longgrouptb">
                <asp:Label ID="lbparmaentadd" runat="server" Text="Permanent Address :" for="tbparmaentadd" Font-Bold="true"></asp:Label>
                <asp:TextBox ID="tbparmaentadd" runat="server" class="form-control input-sm shorttb" Font-Bold="true"> </asp:TextBox>
               <asp:RequiredFieldValidator ID="RequiredFieldValidator9" ControlToValidate="tbparmaentadd" runat="server" ErrorMessage="*Please enter your Parmanent Address"  SetFocusOnError="True" class="validationtxt"></asp:RequiredFieldValidator>

                    </div>
 
                    <div class="clear"></div>
                <div class="form-group longgrouptb clear">
                <asp:Label ID="lbnominename" runat="server" Text="Nominee Name" for="tbnominename" Font-Bold="true"></asp:Label>
                <asp:TextBox ID="tbnominename" runat="server" class="form-control input-sm shorttb" Font-Bold="true"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" ControlToValidate="tbnominename" runat="server" ErrorMessage="*Please enter Nominee Name"  SetFocusOnError="True" class="validationtxt"></asp:RequiredFieldValidator>

                    </div>
                <div class="form-group shortgroupdiv">
                <asp:Label ID="lbnomineaddress" runat="server" Text="Nominee Address" for="tbnomineaddress" Font-Bold="true"></asp:Label>
                <asp:TextBox ID="tbnomineaddress" runat="server" class="form-control input-sm shorttb" Font-Bold="true"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" ControlToValidate="tbnomineaddress" runat="server" ErrorMessage="*Please enter Nominee Address"  SetFocusOnError="True" class="validationtxt"></asp:RequiredFieldValidator>

                </div>
                <div class="form-group shortgroupdiv">
                <asp:Label ID="lbcnicnomine" runat="server" Text="Nominee CNIC:" for="tbcnicnominee" Font-Bold="true"></asp:Label>
                 <asp:TextBox ID="tbcnicnominee" runat="server" class="form-control input-sm shorttb" Font-Bold="true"></asp:TextBox>
                    <asp:RegularExpressionValidator runat="server"  ControlToValidate="tbcnicnominee"
ValidationExpression="^[0-9+]{5}-[0-9+]{7}-[0-9]{1}$"
EnableClientScript="true"
ErrorMessage="Enter correct format of CNIC xxxxx-xxxxxx-x" SetFocusOnError="True"  ></asp:RegularExpressionValidator>
                </div>
              
                
  
                
              
                    
                   

                
             
                    <div class="form-group shortgroupdiv clear">
                    <asp:Button ID="btnsave" runat="server" Text="Save" CssClass="btn btn" OnClick="btnsave_Click" />
               </div>
                   
                
        
          </asp:Panel>
                </div>
        </div>
          
 </div>
       
</asp:Content>