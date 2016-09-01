<%@ Page Title="" Language="C#" MasterPageFile="~/sitedashboardmaster.master" EnableEventValidation="false" AutoEventWireup="true" CodeFile="admin_view_client_installment_plan.aspx.cs" Inherits="View_client_installmentplan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <style>
     
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
        <div class="newcontainer">            
                       <div class="messagealert" id="alert_container">  </div>	
             <div class="newrow">   
        <div class="downpayment"><b style="font-size:large">Client Installment Detail</b>
            <div style="float:right">
               <asp:TextBox ID="Search" runat="server" Font-Bold="True"  placeholder="Search client by CNIC" CssClass="textboxtb" ></asp:TextBox>
          
          
      <asp:Button ID="Button3" runat="server" Text="Search"   OnClick="Button3_Click" Font-Size="Small"/>
                </div>
               </div>
       <br />
   <!-- <div class="alert alert-success gridviewmargin alertcolor">
    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
      <asp:Label ID="alert" class="alertlabel" runat="server" Text="this label is not hiden" Visible="false" onchange="javascript: checkalert();"></asp:Label>
  </div>-->
    
               <asp:Panel ID="clientpaymentplan" runat="server"  >
             
                  
               
              <div style=" height:auto; overflow: scroll">
               <asp:Panel ID="Panel1" runat="server"  Width="140%">

               <asp:GridView ID="paymentplan_client" runat="server" Width="100%" AllowPaging="true" PageSize="7" OnPageIndexChanging="paymentplan_client_PageIndexChanging" BackColor="White">
                     <FooterStyle BackColor="#99CCCC" ForeColor="#000000" />
            <PagerStyle BackColor="#99CCCC" ForeColor="#000000" HorizontalAlign="Left" />
            <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
            <HeaderStyle BackColor="#C19E45" Font-Bold="True" ForeColor="#ffffff" />
                   </asp:GridView>
               <asp:GridView ID="client_detail" runat="server" Width="100%"><FooterStyle BackColor="#99CCCC" ForeColor="#000000" />
              <FooterStyle BackColor="#99CCCC" ForeColor="#000000" />
            <PagerStyle BackColor="#99CCCC" ForeColor="#000000" HorizontalAlign="Left" />
            <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
            <HeaderStyle BackColor="#C19E45" Font-Bold="True" ForeColor="#ffffff" /></asp:GridView>
                   </asp:Panel>
                   </div>
          </asp:Panel>
        <asp:Panel ID="pSearchID" runat="server" BackColor="White" Width="107%"  >
                         
                             <form class="form-horizontal" role="form" >
                          
                                 <div class="form-group">
                                      <label class="control-label col-sm-3" for="lbName">Name:</label>
                                      <div class="col-sm-10">
                                         <asp:Label ID="lbName" runat="server"  class="form-control" Font-Bold="true" ></asp:Label>

                                      </div>
                                     
                                 </div>
                                 
                            
                            <div class="form-group">
                                <label class="control-label col-sm-3" for="lbCnic">CNIC:</label>
                                      <div class="col-sm-10">
                                         <asp:Label ID="lbCnic" runat="server"  class="form-control" Font-Bold="true"></asp:Label>

                           </div>
                           </div>
                                 
                            <div class="form-group">
                                <label class="control-label col-sm-3" for="lbtotalcost">Total Cost :</label>
                                      <div class="col-sm-10">
                                         <asp:Label ID="lbtotalcost" runat="server"  class="form-control" Font-Bold="true"></asp:Label>

                                      </div>
                           </div>

                            <div class="form-group">
                                <label class="control-label col-sm-3" for="lbduration">Duration:</label>
                                      <div class="col-sm-10">
                                         <asp:Label ID="lbduration" runat="server"  class="form-control" Font-Bold="true"></asp:Label>

                                      </div>
                           </div>
                           
                            <div class="form-group">
                                <label class="control-label col-sm-3" for="lbPlotSize">Plot Size. :</label>
                                      <div class="col-sm-10">
                                         <asp:Label ID="lbPlotSize" runat="server"  class="form-control" Font-Bold="true"></asp:Label>

                                      </div>
                           </div>
                           
                            <div class="form-group">
                                <label class="control-label col-sm-3" for="lbdownpayment">Down Payment Cost :</label>
                                      <div class="col-sm-10">
                                         <asp:Label ID="lbdownpayment" runat="server"  class="form-control" Font-Bold="true"></asp:Label>

                                      </div>
                           </div>
                               
                           <div class="form-group">
                                <label class="control-label col-sm-3" for="lblumsum">Lum Sum Discount :</label>
                                      <div class="col-sm-10">
                                         <asp:Label ID="lblumsum" runat="server"  class="form-control" Font-Bold="true"></asp:Label>

                                      </div>
                           </div>
                           
                                 <!---------------------->
                            <div class="form-group">
                                <label class="control-label col-sm-3" for="lbdimension">Dimensions of Plot :</label>
                                      <div class="col-sm-10">
                                         <asp:Label ID="lbdimension" runat="server"  class="form-control" Font-Bold="true"></asp:Label>

                                      </div>
                           </div>
                                 <div class="form-group">
                                <label class="control-label col-sm-3" for="lbmembershipfee">Membership Fee :</label>
                                      <div class="col-sm-10">
                                         <asp:Label ID="lbmembershipfee" runat="server"  class="form-control" Font-Bold="true"></asp:Label>

                                      </div>
                           </div>
                            <div class="form-group">
                                <label class="control-label col-sm-3" for="lbregno">Regno :</label>
                                      <div class="col-sm-10">
                                         <asp:Label ID="lbregno" runat="server"  class="form-control" Font-Bold="true"></asp:Label>

                                      </div>
                           </div>
                           
                       
                            </form>
                                 
                        </asp:Panel>
                 </div></div>

    </div>
</asp:Content>

