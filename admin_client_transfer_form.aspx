<%@ Page Title="" Language="C#" MasterPageFile="~/sitedashboardmaster.master" AutoEventWireup="true" CodeFile="admin_client_transfer_form.aspx.cs" Inherits="admin_client_transfer_form" %>

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

        .search{
            margin-left:20%;
            height:160%;
            width:100%;
            text-align:center;
        }
    </style>
    <script>
        function generateBuyerPage() {
            var output = "waqas khan";
            var OpenWindow = window.open("Admin_BuyerCamera.aspx", "mywin", "width=1000,height=1000");
            OpenWindow.dataFromParent = output; // dataFromParent is a variable in child.html
            OpenWindow.init();
        };
        window.setInterval("refreshDiv()", 1000);
        function refreshDiv() {
            var buyer = document.getElementById("Imge1");
            buyer.onerror = function () {

                buyer.src = 'Captures/alternative.png';
            };
            document.getElementById("Imge1").src = 'Captures/Buyer.jpg?rand=' + Math.random();

        }
        function checkImage() {
            var u = document.getElementById("Imge1").src.toString();
            var n = u.indexOf("/C");
            var url = u.substr(n);
            if (url == "/Captures/alternative.png") {
                alert("Please Capture Buyer Image");
                return false;
            }
            else {
                return true;
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
      <div class="header">

 <div class="newcontainer">
                <div class="newrow">

                       <h2 class="downpayment">Add Buyer Information </h2>
        <asp:Panel runat="server" ID="pid"  class="search">
                    <br /><br />
                        <br />
                    <br />
                    <br />
                    <br />
                    <br />
       
                                        <div class="midgroupdiv">
                            
                           
                            <b>Enter Registeration No. to Add Client :</b>
                            <asp:TextBox ID="tbregno" runat="server" class="form-control input-sm shorttb"></asp:TextBox>
                            <br />
                            <asp:Button ID="Button1" runat="server" Text="Select" class="btn btn" OnClick="Button1_Click" />
                        </div>
                </asp:Panel>
      
               
               <asp:Panel ID="pnlAdd" runat="server" cssClass="inserttable" Width="100%">
                  
                   <div id="result" style="float:right;width:30%">
                           
                            <img id="Imge1" src="Captures/Buyer.jpg"  onclick="generateBuyerPage()" style="width:155px;height:155px"/>
                            </div>
                   <br />
                   <br />
                                      <br />
                   <br />
                                      <br />
                   <br />
                   <br />
    <br />
        <div class="form-group midgroupdiv">
           <b>Registeration No. :</b>
            <asp:TextBox ID="tbpregno" ReadOnly="true" runat="server" class="form-control input-sm midtb"></asp:TextBox>
            </div>   
         <div class="form-group midgroupdiv">
           <b>Name :</b>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbname" ErrorMessage="Enter name ! " Font-Bold="False" ForeColor="Red"></asp:RequiredFieldValidator>
          <asp:RegularExpressionValidator runat="server"  ControlToValidate="tbname"
ValidationExpression="^[a-zA-Z]+$"
EnableClientScript="true"
ErrorMessage="Enter name in alphabets" SetFocusOnError="True" class="validationtxt" ></asp:RegularExpressionValidator>

               <asp:TextBox ID="tbname" runat="server" class="form-control input-sm midtb"></asp:TextBox>
            </div>
                    <div class="form-group midgroupdiv">
            <b>CNIC :</b>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="tbname" ErrorMessage="Enter name ! " Font-Bold="False" ForeColor="Red"></asp:RequiredFieldValidator>
                         <asp:RegularExpressionValidator runat="server"  ControlToValidate="tbcnic"
ValidationExpression="^[0-9+]{5}-[0-9+]{7}-[0-9]{1}$"
EnableClientScript="true"
ErrorMessage="Enter correct format of CNIC xxxxx-xxxxxxx-x" SetFocusOnError="True" class="validationtxt" ></asp:RegularExpressionValidator>

            <asp:TextBox ID="tbcnic" runat="server" class="form-control input-sm midtb"></asp:TextBox>
            </div>
        <div class="form-group midgroupdiv">
          <b> S/O, F/O, W/O :</b>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="tbrelation" ErrorMessage="Enter S/O, W/O F/O ! " Font-Bold="False" ForeColor="Red"></asp:RequiredFieldValidator>
            <asp:TextBox ID="tbrelation" runat="server" class="form-control input-sm midtb"></asp:TextBox>
            </div>
        <div class="form-group midgroupdiv">
          <b> Occupation :</b>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="tboccupation" ErrorMessage="Enter Occupation ! " Font-Bold="False" ForeColor="Red"></asp:RequiredFieldValidator>
            <asp:TextBox ID="tboccupation" runat="server" class="form-control input-sm midtb"></asp:TextBox>
            </div> 
        <div class="form-group midgroupdiv">
           <b>Present Address :</b>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="tbpaddress" ErrorMessage="Enter Present Address ! " Font-Bold="False" ForeColor="Red"></asp:RequiredFieldValidator>
            <asp:TextBox ID="tbpaddress" runat="server" class="form-control input-sm midtb"></asp:TextBox>
            </div> 
        <div class="form-group midgroupdiv">
           <b>Postal Address :</b>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="tbpostaladdress" ErrorMessage="Enter Postal Address ! " Font-Bold="False" ForeColor="Red"></asp:RequiredFieldValidator>
            <asp:TextBox ID="tbpostaladdress" runat="server" class="form-control input-sm midtb"></asp:TextBox>
            </div>  
        <div class="form-group midgroupdiv">
           <b>Tel :</b>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="tbtel" ErrorMessage="Enter Telephone No ! " Font-Bold="False" ForeColor="Red"></asp:RequiredFieldValidator>
            <asp:TextBox ID="tbtel" runat="server" class="form-control input-sm midtb"></asp:TextBox>
            </div>   
        <div class="form-group midgroupdiv">
           <b>Mobile :</b>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="tbmobile" ErrorMessage="Enter Mobile No ! " Font-Bold="False" ForeColor="Red"></asp:RequiredFieldValidator>
            <asp:TextBox ID="tbmobile" runat="server" class="form-control input-sm midtb"></asp:TextBox>
            </div>    
        <div class="form-group midgroupdiv">
           <b>Email :</b>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="tbemail" ErrorMessage="Enter Email ! " Font-Bold="False" ForeColor="Red"></asp:RequiredFieldValidator>
            <asp:TextBox ID="tbemail" runat="server" class="form-control input-sm midtb"></asp:TextBox>
            </div> 
        <div class="form-group midgroupdiv">
          <b> Nominee Name :</b>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="tbnomineename" ErrorMessage="Enter Nominee Name ! " Font-Bold="False" ForeColor="Red"></asp:RequiredFieldValidator>
            <asp:TextBox ID="tbnomineename" runat="server" class="form-control input-sm midtb"></asp:TextBox>
            </div>  
        <div class="form-group midgroupdiv">
           <b>Nominee Address :</b>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="tbnomineeaddress" ErrorMessage="Enter Nominee Address ! " Font-Bold="False" ForeColor="Red"></asp:RequiredFieldValidator>
            <asp:TextBox ID="tbnomineeaddress" runat="server" class="form-control input-sm midtb"></asp:TextBox>
            </div>
        <div class="form-group midgroupdiv">
          <b> Nominee Cnic :</b>
           <asp:RegularExpressionValidator runat="server"  ControlToValidate="tbnomineecnic"
ValidationExpression="^[0-9+]{5}-[0-9+]{7}-[0-9]{1}$"
EnableClientScript="true"
ErrorMessage="Enter correct format of CNIC xxxxx-xxxxxxx-x" SetFocusOnError="True" class="validationtxt" ></asp:RegularExpressionValidator>

             <asp:TextBox ID="tbnomineecnic" runat="server" class="form-control input-sm midtb"></asp:TextBox>
            </div>    
                    <div class="form-group midgroupdiv">
           <b>Nominee No :</b>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="tbnomineecnic" ErrorMessage="Enter Nominee No. ! " Font-Bold="False" ForeColor="Red"></asp:RequiredFieldValidator>
            <asp:TextBox ID="tbnomineeno" runat="server" class="form-control input-sm midtb"></asp:TextBox>
            </div>    
            
            <br />
             <asp:Button ID="lbtnSubmit" runat="server" Text="Add" OnClick="lbtnSubmit_Click"  OnClientClick=" return checkImage();"    class="btn btn-default" Width="75px" />

            &nbsp;&nbsp;&nbsp;
                       
        </asp:Panel>

            </div>               
               </div></div>
</asp:Content>

