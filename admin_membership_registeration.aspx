<%@ Page Title="" Language="C#" MasterPageFile="~/sitedashboardmaster.master" AutoEventWireup="true" CodeFile="admin_membership_registeration.aspx.cs" Inherits="admin_membership_registeration" %>

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
		     border: 2px solid #c19f45;
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
        .button{
        margin-left:30%;
        margin-right:10%;
        
    }
    .gridviewmargin{
        margin-left:30%;
        margin-right:10%;
        
    }
    .mybtns{
        width:25%;
        height:30%;
        background-color:#C19E45;
        border-color:#C19E45;
        margin-bottom:20px;
    }
    .mybtnsm{
        background-color:#C19E45;
        border-color:#C19E45;
        margin-top:4px;
        margin-bottom:10px;
    }
    .mybtnsm:hover{
        background-color:#DED77C;
        border-color:#C19E45;
    }
    .mybtns:hover{
        background-color:#DED77C;
        border-color:#C19E45;
    }
.Employepanel{
    margin-top:100px;
}
.gridviewmargin1{
        margin-left:29%;
        margin-right:10%;
        
    }
.alertcolor{
   background-color:#C19E45;
   filter: alpha(opacity=60);
   opacity: 0.7;
  /* CSS3 */
}
.alertlabel{
    color:red;
}
   
</style>
       <script>
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
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
       <div class="header">
          <br />
           <div class="newcontainer"><div class="newrow">
           <div class="messagealert" id="alert_container">  </div>	
     <h2  class="downpayment" style="margin-left:0%;">Registeration / Membership Fee Rs. 10,000</h2>
               
           <br /><br />
        <asp:Panel ID="addpanel" runat="server" Visible="true">
              
            <asp:HiddenField ID="tbid" Value="" runat="server" />
           
            <div class="form-group shortgroupdiv">
            <b>    <asp:Label ID="lbreg" runat="server" Text="Registeration no. :" for="tbreg"></asp:Label></b>

               <asp:TextBox ID="tbreg" runat="server"  class="form-control input-sm shorttb" Font-Bold="true"></asp:TextBox>   
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" ControlToValidate="tbreg" runat="server" ErrorMessage="* Please Enter Registeration No. !"  SetFocusOnError="True" class="validationtxt"></asp:RequiredFieldValidator>
   
           </div> 
           
             <div class="form-group shortgroupdiv">
               <b> <asp:Label ID="lbname" runat="server" Text="Name :" for="tbname"></asp:Label></b>

                <asp:TextBox ID="tbname" runat="server"  class="form-control input-sm shorttb" Font-Bold="true"></asp:TextBox>      
                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" ControlToValidate="tbname"  runat="server" ErrorMessage="* Please Enter Name !"  SetFocusOnError="True" class="validationtxt"></asp:RequiredFieldValidator>

           </div>    
             
             
            <div class="form-group shortgroupdiv">
               <b> <asp:Label ID="Label1" runat="server" Text="Father/Husband Name" for="tbname"></asp:Label></b>

                  <asp:TextBox ID="tbsof" runat="server"  class="form-control input-sm shorttb" Font-Bold="true"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" ControlToValidate="tbsof" runat="server" ErrorMessage="* Please Enter Father/Husband Name !"  SetFocusOnError="True" class="validationtxt"></asp:RequiredFieldValidator>

            </div>

            <div class="form-group shortgroupdiv">
               <b> <asp:Label ID="Label2" runat="server" Text="Postal Address" for="tbname"></asp:Label></b>

                 <asp:TextBox ID="tbcurrentAddress" runat="server"  class="form-control input-sm shorttb" Font-Bold="true"></asp:TextBox>
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ControlToValidate="tbcurrentAddress" runat="server" ErrorMessage="* Please Enter Postal Address !"  SetFocusOnError="True" class="validationtxt"></asp:RequiredFieldValidator>

           </div>
           <div class="form-group shortgroupdiv">
               <b> <asp:Label ID="Label3" runat="server" Text="Profession" for="tbname"></asp:Label></b>

                 <asp:TextBox ID="tbprofession" runat="server"  class="form-control input-sm shorttb" Font-Bold="true"></asp:TextBox>
                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ControlToValidate="tbprofession" runat="server" ErrorMessage="* Please Enter Profession !"  SetFocusOnError="True" class="validationtxt"></asp:RequiredFieldValidator>
           </div>
             <div class="form-group shortgroupdiv">
              <b>  <asp:Label ID="Label4" runat="server" Text="Phone" for="tbname"></asp:Label></b>

            <asp:TextBox ID="tbPhone" runat="server"  class="form-control input-sm shorttb" Font-Bold="true"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="tbphone" runat="server" ErrorMessage="* Please Enter Phone No. !"  SetFocusOnError="True" class="validationtxt"></asp:RequiredFieldValidator>
                 </div>
             <div class="form-group shortgroupdiv">
             <b>   <asp:Label ID="Label5" runat="server" Text="CNIC" for="tbcnic"></asp:Label></b>
                
               

                <asp:TextBox ID="tbcnic" runat="server"  class="form-control input-sm shorttb" Font-Bold="true"></asp:TextBox>
                 <asp:RegularExpressionValidator runat="server"  ControlToValidate="tbcnic"
ValidationExpression="^[0-9+]{5}-[0-9+]{7}-[0-9]{1}$"
EnableClientScript="true"
ErrorMessage="Enter correct format of CNIC xxxxx-xxxxxx-x" SetFocusOnError="True" class="validationtxt" ></asp:RegularExpressionValidator>
                 </div>
             <div class="form-group shortgroupdiv">
                <b><asp:Label ID="Label9" runat="server" Text="Cash/Pay Order No" for="tbname"></asp:Label></b>
            <asp:TextBox ID="tb_cash_paordernumber" runat="server" class="form-control input-sm shorttb" Font-Bold="true"></asp:TextBox>
                              <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="tb_cash_paordernumber" runat="server" ErrorMessage="* Please Enter Cash/Pay Order No"  SetFocusOnError="True" class="validationtxt"></asp:RequiredFieldValidator>

             </div>
            
             <div class="form-group shortgroupdiv">
                <asp:Label ID="Label7" runat="server" Text="In Favour of" for="tbname" Font-Bold="true"></asp:Label>

            <asp:TextBox ID="tbfavourof" runat="server"  class="form-control input-sm shorttb" Text="Adam's GARDEN (Pvt.) Ltd. " ReadOnly="true" Font-Bold="true"></asp:TextBox>
                 </div>
             <div class="form-group shortgroupdiv">
                <asp:Label ID="Label8" runat="server" Text="JS Bank Account" for="tbname" Font-Bold="true"></asp:Label>

            <asp:TextBox ID="tbjsbankaccout" runat="server" Text="0000760785" ReadOnly="true" class="form-control input-sm shorttb" Font-Bold="true"></asp:TextBox>
                 </div>
            
            

             <div class="form-group shortgroupdiv">
                <asp:Label ID="Label10" runat="server" Text="Amount" for="tbname" Font-Bold="true"></asp:Label>
            <asp:TextBox ID="tbamount" runat="server" Text="10000" ReadOnly="true" class="form-control input-sm shorttb" Font-Bold="true"></asp:TextBox>
            </div>
             <div class="form-group shortgroupdiv">
                <asp:Label ID="Label11" runat="server" Text="Amount In Words" for="tbname" Font-Bold="true"></asp:Label>
            <asp:TextBox ID="tbamountinwords" runat="server" Text="Ten Thousand" ReadOnly="true" class="form-control input-sm shorttb" Font-Bold="true"></asp:TextBox>
                 </div>
             <div class="form-group shortgroupdiv">
                <asp:Label ID="Label12" runat="server" Text="Date" for="tbdate" Font-Bold="true"></asp:Label>
            <asp:TextBox ID="tbdate" CssClass="textboxtb" runat="server" Font-Bold="true" Width="70%"></asp:TextBox><asp:ImageButton ID="ImageButton" runat="server" Height="31px" ImageUrl="~/Images/abc.gif" Width="62px" OnClick="ImageButton_Click" CausesValidation="false" />
                 <br />
                 <asp:Calendar ID="Cal1" runat="server" OnSelectionChanged="Cal1_SelectionChanged"></asp:Calendar>
                 </div>
             <div class="clear"></div>
            <asp:Button ID="add_db_btn" runat="server" Text="Save"  class="btn btn-primary btn-sm mybtnsm" OnClick="add_db_btn_Click" Font-Bold="true" /> 
           
            
        </asp:Panel>
        </div></div></div>
</asp:Content>