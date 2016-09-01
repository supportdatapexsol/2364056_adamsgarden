<%@ Page Title="" Language="C#" MasterPageFile="~/sitedashboardmaster.master"  EnableEventValidation="false" AutoEventWireup="true" CodeFile="Admin_installment.aspx.cs" Inherits="Admin_installment" %>

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
 <script>
     function changeprogreesbar() {
         var elms = document.getElementsByClassName('pbwidth')
         for (var i = 0; i < elms.length; i++) {
             
                 elms[i].setAttribute("width", "50%");
            
         }
     }
 </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

     <div class="clear"></div>
                      <div class="messagealert" id="alert_container">  </div>	

    <div class="header">
    <div class="newcontainer">
        <div class="newrow">
                        <div class="downpayment"><b style="font-size:large">Client Installments Record</b>
                <div style="float:right">
                 <asp:TextBox ID="Search" runat="server" Font-Bold="True"  placeholder="Search client by CNIC" class="textboxtb"></asp:TextBox>
          
          
      <asp:Button ID="Button3" runat="server" Text="Search"   OnClick="Button3_Click" Font-Size="Small"/>
        </div>
       </div>
         <asp:HiddenField ID="tbregno" runat="server" />
     <asp:HiddenField ID="tbid" runat="server" />
    <asp:HiddenField ID="pid" runat="server" />
    <asp:HiddenField ID="cinstallment" runat="server" Value="0" />
    <asp:HiddenField ID="tinstallment" runat="server" Value="0"/>
    <asp:HiddenField ID="percentage" runat="server" Value="0" />
                    <asp:Panel ID="viewData" runat="server" >

           <asp:Label ID="Label1" runat="server" Text="Installments Graph" Font-Bold="True" Font-Size="Large"></asp:Label>
                    <div class="progress">
  <div class="progress-bar progress-bar-success" role="progressbar"

                    aria-valuenow=<%=double.Parse(percentage.Value)%> aria-valuemin="0" aria-valuemax="100" style="width:<%=double.Parse(percentage.Value)%>%;">
                           <%=double.Parse(percentage.Value)%>% &nbsp <%=cinstallment.Value +" paid"%>
             </div>
                        <div class="progress-bar progress-bar-danger" role="progressbar" style="width:<%=100-double.Parse(percentage.Value)%>%;">
                    <%=(100-(double.Parse(percentage.Value)))%>% &nbsp <%=(double.Parse(tinstallment.Value)-double.Parse(cinstallment.Value)) +" unpaid"%>
  </div>
</div>
      
        

                               <asp:Label ID="lbviewpanel" runat="server" Text="Installments Of Clients" Font-Bold="True" Font-Size="Large"></asp:Label>

             <div style=" height:auto; overflow: scroll">

         <asp:Panel ID="viewData1" runat="server" width="180%" >

             
             <asp:GridView ID="GridView2" runat="server" DataKeyNames="Payment_id"   AutoGenerateEditButton="True" 
                 OnRowEditing="GridView2_RowEditing" OnRowUpdating="GridView2_RowUpdating"  OnItemDataBound="makeuneditable" 
                 OnRowDataBound="GridView2_RowDataBound" AllowCustomPaging="True" AllowPaging="True" AutoGenerateDeleteButton="false" 
                 OnRowCancelingEdit="GridView2_RowCancelingEdit" Width="100%" OnRowDeleting="GridView2_RowDeleting"
                  OnRowUpdated="GridView2_RowUpdated" OnPageIndexChanging="GridView2_PageIndexChanging" BackColor="White"  >
           
                 <FooterStyle BackColor="#C19E45" ForeColor="#000000" />
            <PagerStyle BackColor="#C19E45" ForeColor="#000000" HorizontalAlign="Left" />
        <SelectedRowStyle BackColor="#DED77C" ForeColor="Black" />
            <HeaderStyle BackColor="#C19E45" Font-Bold="True" ForeColor="#ffffff" />
           
                </asp:GridView>
              </asp:Panel>
                                </div>

                </asp:Panel>
                 
                
                        <asp:Panel ID="Employepanel" runat="server" >

             <asp:Label ID="Label12" runat="server" Text="Client Information" Font-Bold="True" Font-Size="Large"></asp:Label>


                    <div style=" height:auto; overflow: auto">

        <asp:Panel ID="Employepanel1" runat="server" Width="160%" >

    <asp:GridView ID="GridView1" runat="server" OnSelectedIndexChanging="GridView1_SelectedIndexChanging" 
        AutoGenerateSelectButton="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" 
         Width="100%" OnPageIndexChanging="GridView1_PageIndexChanging" AllowPaging="true" BackColor="White">
         <FooterStyle BackColor="#C19E45" ForeColor="#000000" />
            <PagerStyle BackColor="#C19E45" ForeColor="#000000" HorizontalAlign="Left" />
        <SelectedRowStyle BackColor="#DED77C" ForeColor="Black" />
            <HeaderStyle BackColor="#C19E45" Font-Bold="True" ForeColor="#ffffff" />
    </asp:GridView>
            
        </asp:Panel>
        </div>
                            </asp:Panel>



        <asp:Panel ID="pSearchID" runat="server" BackColor="White" Width="107%">
                         
                             <form class="form-horizontal" role="form">
                            
                                 <div class="form-group">
                                      <label class="control-label col-sm-2" for="lbName">Name:</label>
                                      <div class="col-sm-10">
                                         <asp:Label ID="lbName" runat="server"  class="form-control" Font-Bold="true" ></asp:Label>

                                      </div>
                                     
                                 </div>
                                <div class="form-group">
                                      <label class="control-label col-sm-2" for="lbrelation">Relation of:</label>
                                      <div class="col-sm-10">
                                         <asp:Label ID="lbrelation" runat="server"  class="form-control" Font-Bold="true" ></asp:Label>

                                      </div>
                                     
                                 </div>
                                <div class="form-group">
                                      <label class="control-label col-sm-2" for="lbcnic">Cnic:</label>
                                      <div class="col-sm-10">
                                         <asp:Label ID="lbcnic" runat="server"  class="form-control" Font-Bold="true" ></asp:Label>

                                      </div>
                                     
                                 </div>
                                <div class="form-group">
                                      <label class="control-label col-sm-2" for="lbmobile">Mobile:</label>
                                      <div class="col-sm-10">
                                         <asp:Label ID="lbmobile" runat="server"  class="form-control" Font-Bold="true" ></asp:Label>

                                      </div>
                                     
                                 </div>
                                <div class="form-group">
                                      <label class="control-label col-sm-2" for="lbtel">Telephone:</label>
                                      <div class="col-sm-10">
                                         <asp:Label ID="lbtel" runat="server"  class="form-control" Font-Bold="true" ></asp:Label>

                                      </div>
                                     
                                 </div>
                                <div class="form-group">
                                      <label class="control-label col-sm-2" for="lbadd">Present Address:</label>
                                      <div class="col-sm-10">
                                         <asp:Label ID="lbadd" runat="server"  class="form-control" Font-Bold="true" ></asp:Label>

                                      </div>
                                     
                                 </div>
                                <div class="form-group">
                                      <label class="control-label col-sm-2" for="lboccupation">Occupation:</label>
                                      <div class="col-sm-10">
                                         <asp:Label ID="lboccupation" runat="server"  class="form-control" Font-Bold="true" ></asp:Label>

                                      </div>
                                     
                                 </div>
                                <div class="form-group">
                                      <label class="control-label col-sm-2" for="lbplot">Plot No:</label>
                                      <div class="col-sm-10">
                                         <asp:Label ID="lbplot" runat="server"  class="form-control" Font-Bold="true" ></asp:Label>

                                      </div>
                                     
                                 </div>
                                <div class="form-group">
                                      <label class="control-label col-sm-2" for="lbreg">Registeration No:</label>
                                      <div class="col-sm-10">
                                         <asp:Label ID="lbreg" runat="server"  class="form-control" Font-Bold="true" ></asp:Label>

                                      </div>
                                     
                                 </div>
                                
                                </form>
            </asp:Panel>
    </div>
      </div>  </div>
        </asp:Content>

