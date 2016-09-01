<%@ Page Title="" Language="C#" MasterPageFile="~/sitedashboardmaster.master" AutoEventWireup="true" CodeFile="admin_add_installment_plans.aspx.cs" Inherits="admin_add_installment_plans" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
  
            .button{
        margin-left:30%;
        margin-right:10%;
        
    }
       .Employepanel{
    margin-top:100px;
}
        
        .inserttable {
            margin-left: 0px;
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
                  <div class="messagealert" id="alert_container">  </div>	

      <div class="newcontainer">

           <div class="newrow">
               <h2 class="downpayment">Add Installment Plan</h2>

    <asp:Panel ID="pnlAdd" runat="server" Visible="False" cssClass="inserttable" Width="100%">
            <div class="form-group midgroupdiv">
            Enter Installment cost per month :
            <asp:TextBox ID="tbinstallmentcost" runat="server" class="form-control input-sm midtb"></asp:TextBox>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbinstallmentcost" ErrorMessage="Enter monthly installment cost ! " Font-Bold="False" ForeColor="Red"></asp:RequiredFieldValidator>

            </div>
            
            <div class="form-group midgroupdiv">
            Enter duration:
            <asp:TextBox ID="tbFirstName" runat="server" class="form-control input-sm midtb"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="tbFirstName" ErrorMessage="Enter duration !" ForeColor="Red"></asp:RequiredFieldValidator>

                </div>
            <br />
            <div class="form-group midgroupdiv">
            Enter plot size:

            <asp:TextBox ID="tbplotsize" runat="server" class="form-control input-sm midtb"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="tbplotsize" ErrorMessage="Enter plot size (Marla/Kanal) !" ForeColor="Red"></asp:RequiredFieldValidator>

                </div>
            <br />
             <div class="form-group midgroupdiv">
            Enter downpayment cost:

            <asp:TextBox ID="tbdownpayment" runat="server" class="form-control input-sm midtb"></asp:TextBox>
                                                  <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="tbdownpayment" ErrorMessage="Enter down payment amount!" ForeColor="Red"></asp:RequiredFieldValidator>

            </div>

            <br />
            <div class="form-group midgroupdiv">

            Enter lum sum discount :

            <asp:TextBox ID="tblumsum" runat="server" class="form-control input-sm midtb"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="tblumsum" ErrorMessage="Enter lum sum discount !" ForeColor="Red"></asp:RequiredFieldValidator>

            </div>
            <br />
            <div class="form-group midgroupdiv">

            Enter size(width x height):

            <asp:TextBox ID="tbsize" runat="server" class="form-control input-sm midtb"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="tbsize" ErrorMessage="Enter width x height !" ForeColor="Red"></asp:RequiredFieldValidator>

            </div>
            <br />
            <div class="form-group midgroupdiv">

            Enter total cost:

            <asp:TextBox ID="tbtotalcost" runat="server" class="form-control input-sm midtb"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="tbtotalcost" ErrorMessage="Enter total cost !" ForeColor="Red"></asp:RequiredFieldValidator>

            </div>
            <br />
            <div class="form-group midgroupdiv">

            Enter membership fee:
            <asp:TextBox ID="tbmembershipfee" runat="server" class="form-control input-sm midtb"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="tbmembershipfee" ErrorMessage="Enter membership fee !" ForeColor="Red"></asp:RequiredFieldValidator>


            </div>
            <br />
             <asp:Button ID="lbtnSubmit" runat="server" Text="Add" OnClick="lbtnSubmit_Click" class="btn btn-default" Width="75px" />

            &nbsp;&nbsp;&nbsp;

            
        </asp:Panel>
               </div></div></div></div>
</asp:Content>

