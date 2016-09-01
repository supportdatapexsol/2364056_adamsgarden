<%@ Page Title="" Language="C#" MasterPageFile="~/sitedashboardmaster.master" AutoEventWireup="true" CodeFile="admin_add_client_installment.aspx.cs" Inherits="admin_view_installment" %>

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
            width:100%;
            margin-right:3%;
			   border:2px solid #c19f45;
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
      <div class="clear"></div>
    <div class="header">
    <div class="newcontainer">
         <div class="messagealert" id="alert_container">  </div>	
        <div class="newrow">
                   <h2 class="downpayment">Client Installment Status</h2>
        
        

      
         
          <br />

           <br /><br />
      <!--  
       --> <asp:Panel ID="addpanel" runat="server" Visible="false">
            <asp:HiddenField ID="tbid" Value="" runat="server" />
           
             <div class="form-group shortgroupdiv">
                <asp:Label ID="lbname" runat="server" Text="Name :" for="tbname"></asp:Label>
                <asp:TextBox ID="tbname" runat="server" ReadOnly="True" class="form-control input-sm shorttb"></asp:TextBox>      
           </div>    
             
            <div class="form-group shortgroupdiv">
                <asp:Label ID="Label1" runat="server" Text="Father/Husband Name" for="tbname"></asp:Label>
                  <asp:TextBox ID="tbsof" runat="server" ReadOnly="True" class="form-control input-sm shorttb"></asp:TextBox>
            </div>

            <div class="form-group shortgroupdiv">
                <asp:Label ID="Label2" runat="server" Text="Postal Address" for="tbname"></asp:Label>
                 <asp:TextBox ID="tbcurrentAddress" runat="server" ReadOnly="True" class="form-control input-sm shorttb"></asp:TextBox>
           </div>
           <div class="form-group shortgroupdiv">
                <asp:Label ID="Label3" runat="server" Text="Profession" for="tbname"></asp:Label>
                 <asp:TextBox ID="tbprofession" runat="server" ReadOnly="True" class="form-control input-sm shorttb"></asp:TextBox>
           </div>
             <div class="form-group shortgroupdiv">
                <asp:Label ID="Label4" runat="server" Text="Phone" for="tbname"></asp:Label>
            <asp:TextBox ID="tbPhone" runat="server" ReadOnly="True" class="form-control input-sm shorttb"></asp:TextBox>
                 </div>
             <div class="form-group shortgroupdiv">
                <asp:Label ID="Label5" runat="server" Text="CNIC" for="tbname"></asp:Label>
            <asp:TextBox ID="tbcnic" runat="server" ReadOnly="True" class="form-control input-sm shorttb"></asp:TextBox>

                 </div>
            
             <div class="form-group shortgroupdiv">
                <asp:Label ID="Label6" runat="server" Text="Date" for="tbname"></asp:Label>
            <asp:TextBox ID="tbdate" runat="server" ReadOnly="True" class="form-control input-sm shorttb"></asp:TextBox>
                 </div>
             <div class="form-group shortgroupdiv">
                <asp:Label ID="Label7" runat="server" Text="In Favour of" for="tbname"></asp:Label>
            <asp:TextBox ID="tbfavourof" runat="server" ReadOnly="True" class="form-control input-sm shorttb"></asp:TextBox>
                 </div>
             <div class="form-group midgroupdiv">
                <asp:Label ID="Label8" runat="server" Text="JS Bank Account" for="tbname"></asp:Label>
            <asp:TextBox ID="tbjsbankaccout" runat="server" ReadOnly="True" class="form-control input-sm shorttb"></asp:TextBox>
                 </div>
            <div class="form-group midgroupdiv">
                <asp:Label ID="Label13" runat="server" Text="Plot Number" for="tbpropertID"></asp:Label>
            <asp:TextBox ID="tbplotno" runat="server" ReadOnly="True" class="form-control input-sm shorttb"></asp:TextBox>
                 </div>
            <div class="form-group midgroupdiv">
                <asp:Label ID="Lbregno" runat="server" Text="Registration No" for="tbregno"></asp:Label>
            <asp:TextBox ID="tbregno" runat="server" ReadOnly="True" class="form-control input-sm shorttb"></asp:TextBox>
                 </div>
             <div class="form-group midgroupdiv">
                <asp:Label ID="Label9" runat="server" Text="Cash/Pay Order No" for="tbname"></asp:Label>
            <asp:TextBox ID="tb_cash_paordernumber" runat="server" class="form-control input-sm shorttb"></asp:TextBox>
                                  <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="tb_cash_paordernumber" runat="server" ErrorMessage="* Please Enter Cash/Pay Order No"  SetFocusOnError="True" class="validationtxt"></asp:RequiredFieldValidator>

             </div>

            
           <div class="form-group midgroupdiv">
                <asp:Label ID="Label14" runat="server" Text="Amount" for="tbname"></asp:Label>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="tbamount" runat="server" ErrorMessage="* Please Enter Amount"  SetFocusOnError="True" class="validationtxt"></asp:RequiredFieldValidator>
            <asp:TextBox ID="tbamount" runat="server" class="form-control input-sm shorttb"></asp:TextBox>
                 </div>
             <div class="form-group midgroupdiv">
                <asp:Label ID="Label11" runat="server" Text="Amount In Words" for="tbname"></asp:Label>
            <asp:TextBox ID="tbamountinwords" runat="server" class="form-control input-sm shorttb"></asp:TextBox>
                                  <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="tbamountinwords" runat="server" ErrorMessage="* Please Enter Amount In Words"  SetFocusOnError="True" class="validationtxt"></asp:RequiredFieldValidator>

                 </div>
             <div class="clear"></div>
            <asp:Button ID="add_db_btn" runat="server" Text="Save" OnClick="add_db_btn_Click" class="btn btn-primary btn-sm mybtnsm" /> 
            <asp:Button ID="cancelbtn" runat="server" Text="Cancel" CausesValidation="False" OnClick="cancelbtn_Click" class="btn btn-primary btn-sm mybtnsm" />
           

        </asp:Panel>
        
        <asp:Panel ID="Employepanel" runat="server">
            <asp:Label ID="Label12" runat="server" Text="Client Information" Font-Bold="True" Font-Size="Large"></asp:Label>
            <br />
            <div style=" height:auto; overflow: auto">
                <asp:Panel ID="Panel" runat="server" Width="160%" >
    <asp:GridView ID="GridView1" runat="server"  OnSelectedIndexChanging="GridView1_SelectedIndexChanging" 
        AutoGenerateSelectButton="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" 
         Width="100%" OnPageIndexChanging="GridView1_PageIndexChanging" AllowPaging="true" BackColor="White">
         <FooterStyle BackColor="#C19E45" ForeColor="#000000" />
            <PagerStyle BackColor="#C19E45" ForeColor="#000000" HorizontalAlign="Left" />
        <SelectedRowStyle BackColor="#DED77C" ForeColor="Black" />
            <HeaderStyle BackColor="#C19E45" Font-Bold="True" ForeColor="#FFFFFF" />
    </asp:GridView>
            </asp:Panel>    </div>
            
        </asp:Panel>
    </div>
</asp:Content>

