<%@ Page Title="" Language="C#" MasterPageFile="~/sitedashboardmaster.master" AutoEventWireup="true" CodeFile="admin_down_payment.aspx.cs" Inherits="property_payment" %>

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

function plotsize(source,args)
{
  
    if(document.getElementById("<%= r1.ClientID%>").checked || document.getElementById("<%= r2.ClientID %>").checked|| document.getElementById("<%= r3.ClientID %>").checked|| document.getElementById("<%= r4.ClientID %>").checked|| document.getElementById("<%= r5.ClientID %>").checked)
    {
        args.IsValid = true;
    }
    else
    {
        args.IsValid = false;
    }
    
}
function paymentmadethrough(source,args)
{   
    if(document.getElementById("<%= pcash.ClientID%>").checked || document.getElementById("<%= pcheque.ClientID %>").checked|| document.getElementById("<%= pdraft.ClientID %>").checked|| document.getElementById("<%= porder.ClientID %>").checked|| document.getElementById("<%= r5.ClientID %>").checked)
    {
        args.IsValid = true;
    }
    else
    {
        args.IsValid = false;
    }
    
}
    function plottype(source,args)
{   
    if(document.getElementById("<%= residential.ClientID%>").checked || document.getElementById("<%= commercial.ClientID %>").checked)
    {
        args.IsValid = true;
    }
    else
    {
        args.IsValid = false;
    }
    
}
    
 

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
                <asp:TextBox ID="tbname" runat="server" ReadOnly="true" class="form-control input-sm shorttb" Font-Bold="true"></asp:TextBox>
                                      <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="tbname" runat="server" ErrorMessage="*Please enter you name"  SetFocusOnError="True" class="validationtxt"></asp:RequiredFieldValidator>

                    </div>
               
                <div class="form-group shortgroupdiv">
                    
                     <asp:Label ID="lbsof" runat="server" Text="S/O,D/O,W/O" for="tbsof" Font-Bold="true"></asp:Label>
                   
                <asp:TextBox ID="tbsof" runat="server" ReadOnly ="true" class="form-control input-sm shorttb" Font-Bold="true"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="tbsof" runat="server" ErrorMessage="*Please enter S/O,D/O,W/O"  SetFocusOnError="True" class="validationtxt"></asp:RequiredFieldValidator>

                 </div>
             
                <div class="form-group shortgroupdiv">

                <asp:Label ID="lbcnic" runat="server" Text="C.N.I.C" for="tbcnic" Font-Bold="true"></asp:Label>
                               <asp:TextBox ID="tbcnic" runat="server" ReadOnly ="true" class="form-control input-sm shorttb" Font-Bold="true"></asp:TextBox>
               <asp:RegularExpressionValidator runat="server"  ControlToValidate="tbcnic" ValidationExpression="^[0-9+]{5}-[0-9+]{7}-[0-9]{1}$"
EnableClientScript="true"
ErrorMessage="Enter correct format of CNIC xxxxx-xxxxxx-x" SetFocusOnError="True" class="validationtxt" ></asp:RegularExpressionValidator>
                          </div>


                <div class="form-group longgrouptb">
                <asp:Label ID="lboccupation" runat="server" Text="Occupation" for="tboccupatiom" Font-Bold="true"></asp:Label>                
                <asp:TextBox ID="tboccupatiom" runat="server" ReadOnly ="true" class="form-control input-sm shorttb" Font-Bold="true"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="tboccupatiom" runat="server" ErrorMessage="*Please enter your Occupation"  SetFocusOnError="True" class="validationtxt"></asp:RequiredFieldValidator>

                    </div>
                <div class="form-group longgrouptb">
                <asp:Label ID="lbpresentaddress" runat="server" Text="Present Address" for="tbpresentaddress" Font-Bold="true"></asp:Label>
                <asp:TextBox ID="tbpresentaddress" runat="server" ReadOnly ="true" class="form-control input-sm shorttb" Font-Bold="true"> </asp:TextBox>
                                  <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="tbpresentaddress" runat="server" ErrorMessage="*Please enter your Present Address"  SetFocusOnError="True" class="validationtxt"></asp:RequiredFieldValidator>

                     </div>

                 <div class="form-group midgroupdiv">
                <asp:Label ID="lbtel" runat="server" Text="Tel :" for="tbtel" Font-Bold="true"></asp:Label>
                <asp:TextBox ID="tbtel" runat="server" ReadOnly ="true" class="form-control input-sm shorttb" Font-Bold="true"> </asp:TextBox>
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
                <div  class="row">
                <div class="col-sm-8" >
                <asp:Label ID="lbplotsize" runat="server" Text="Plot size :" for="MyGroup" class="radioitem1" Font-Bold="true"/>
                <asp:RadioButton id="r1" runat="server" GroupName="MyGroup" Text="4 Marla" class="radioitem1" />
                <asp:RadioButton id="r2" runat="server" GroupName="MyGroup" Text="5 Marla" class="radioitem1"/>
                <asp:RadioButton id="r3" runat="server" GroupName="MyGroup" Text="7 Marla" class="radioitem1"/>
                <asp:RadioButton id="r4" runat="server" GroupName="MyGroup" Text="10 Marla" class="radioitem1"/>
                <asp:RadioButton id="r5" runat="server" GroupName="MyGroup" Text="1 Kanal" class="radioitem1"/>
                    <asp:CustomValidator id="CustomValidator1" runat="server"  ErrorMessage="please Select PlotSize" ClientValidationFunction="plotsize" OnServerValidate="plotsize_ServerValidate" class="validationtxt"></asp:CustomValidator>
                    </div>
                   

                <div class="col-sm-4">
                <asp:Label ID="Label4" runat="server" Text="Property Type:" for="MyGroup1" Font-Bold="true" />
               <asp:RadioButton id="residential" runat="server" GroupName="MyGroup1" Text="Residential"  />
                <asp:RadioButton id="commercial" runat="server" GroupName="MyGroup1" Text="Commercial" />
                <asp:CustomValidator id="CustomValidator3" runat="server"  ErrorMessage="*please Select Plot Type" ClientValidationFunction="plottype" OnServerValidate="plottype_server" class="validationtxt"></asp:CustomValidator>
                    </div>
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
ErrorMessage="Enter correct format of CNIC xxxxx-xxxxxx-x" SetFocusOnError="True" class="validationtxt" ></asp:RegularExpressionValidator>
                </div>
                     <div class="form-group midgroupdiv">
                 <asp:Label ID="Label2" runat="server" Text="Registeration No:" for="tbregistrationo" Font-Bold="true"></asp:Label>
                 <asp:TextBox ID="tbregistrationo" runat="server" ReadOnly ="true" class="form-control input-sm shorttb" Font-Bold="true"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator16" ControlToValidate="tbregistrationo" runat="server" ErrorMessage="*Please enter Registeration no."  SetFocusOnError="True" class="validationtxt"></asp:RequiredFieldValidator>

                     </div>
               
                    <div class="form-group midgroupdiv">
                <asp:Label ID="Label3" runat="server" Text="Plot No :" for="tbplotnumber" Font-Bold="true"></asp:Label>

                <asp:TextBox ID="tbplotnumber" runat="server" class="form-control input-sm shorttb" Font-Bold="true" OnTextChanged="tbplotnumber_TextChanged" AutoPostBack="True"> </asp:TextBox>
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator17" ControlToValidate="tbplotnumber" runat="server" ErrorMessage="*Please enter plot no."  SetFocusOnError="True" class="validationtxt"></asp:RequiredFieldValidator>

                           </div>
                     <div class="form-group midgroupdiv">
                <asp:Label ID="Label5" runat="server" Text="Plot Street No :" for="tbemail" Font-Bold="true"></asp:Label>

                <asp:TextBox ID="tbstreet" runat="server" class="form-control input-sm shorttb" Font-Bold="true"> </asp:TextBox>
                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator19" ControlToValidate="tbstreet" runat="server" ErrorMessage="*Please enter street no."  SetFocusOnError="True" class="validationtxt"></asp:RequiredFieldValidator>

                          </div>
                

























            <div  class="row">
                <div class="col-sm-9" >
                            <asp:Label ID="Label1" runat="server" Text="Payment Made Through:" for="payment_made" class="paymentradiolabel"  Font-Bold="true"/>
                <asp:RadioButton id="pcash" runat="server" GroupName="payment_made" Text="Cash" class="radioitem1" />
                <asp:RadioButton id="pcheque" runat="server" GroupName="payment_made" Text="Cheque" class="radioitem1"/>
                <asp:RadioButton id="pdraft" runat="server" GroupName="payment_made" Text="Draft" class="radioitem1"/>

                <asp:RadioButton id="porder" runat="server" GroupName="payment_made" Text="Pay Order" class="radioitem1"/>
                     <asp:CustomValidator id="CustomValidator2" runat="server"  ErrorMessage="please select payment method" ClientValidationFunction="paymentmadethrough" OnServerValidate="paymentmadethrough_server" class="validationtxt"></asp:CustomValidator>
                    </div>
                   

                <div class="col-sm-3">
                 <asp:Label ID="lbno" runat="server" Text="No" Font-Bold="true"></asp:Label>
                          <asp:TextBox ID="tbno" runat="server" class="noinradio" Font-Bold="true"></asp:TextBox><br />    </div>
                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator13" ControlToValidate="tbno" runat="server" ErrorMessage="*Please enter NO"  SetFocusOnError="True" class="validationtxt"></asp:RequiredFieldValidator>
       
                  </div>





          
                
              
                    
                   

                     <div class="form-group shortgroupdiv clear">
                 <asp:Label ID="lbamount" runat="server" Text="Amount Rs:" for="tbamoutn"></asp:Label>
                 <asp:TextBox ID="tbamoutn" runat="server" class="form-control input-sm shorttb"></asp:TextBox>
                                             <asp:RequiredFieldValidator ID="RequiredFieldValidator14" ControlToValidate="tbamoutn" runat="server" ErrorMessage="*Please enter Amount"  SetFocusOnError="True" class="validationtxt"></asp:RequiredFieldValidator>

                    </div>
                <div class="form-group shortgroupdiv">
                 <asp:Label ID="lbamountinwords" runat="server" Text="Amount in WOrds" for="tbamountinwords"></asp:Label>
                 <asp:TextBox ID="tbamountinwords" runat="server" class="form-control input-sm shorttb"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator15" ControlToValidate="tbamountinwords" runat="server" ErrorMessage="*Please enter Amount in Words"  SetFocusOnError="True" class="validationtxt"></asp:RequiredFieldValidator>
<br />

                    </div>
             <div class="form-group shortgroupdiv">
                <asp:Label ID="Label12" runat="server" Text="Date" for="tbdate" Font-Bold="true"></asp:Label>
            <asp:TextBox ID="tbdate" CssClass="textboxtb" runat="server" Font-Bold="true" Width="70%"></asp:TextBox><asp:ImageButton ID="ImageButton" runat="server" Height="31px" ImageUrl="~/Images/abc.gif" Width="62px" OnClick="ImageButton_Click" CausesValidation="false" />
                 <br />
                 <asp:Calendar ID="Cal1" runat="server" OnSelectionChanged="Cal1_SelectionChanged"></asp:Calendar>
                 </div>
                    <div class="form-group shortgroupdiv clear">
                    <asp:Button ID="btnsave" runat="server" Text="Save" class="btn btn-primary btn" OnClick="btnsave_Click" />

               </div>
                   
                
        
          </asp:Panel>
                </div>
        </div>
          
 </div>
       
</asp:Content>

