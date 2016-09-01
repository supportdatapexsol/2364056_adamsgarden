<%@ Page Title="" Language="C#" MasterPageFile="~/sitedashboardmaster.master" AutoEventWireup="true" CodeFile="admin_profile.aspx.cs" Inherits="admin_profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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
        .search{
            margin-left:40%;
            height:160%;
            width:100%;
            text-align:center;
            margin-top:20%
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

<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
     <div class="container">
                                       <div class="messagealert" id="alert_container">  </div>	

         <p class="downpayment"><b style="font-size:large">Make changes to your user account</b> </p>
         <asp:Panel ID="login" runat="server" >

             <div class="midgroupdiv">
                  
                 <div class="search">
                <asp:TextBox ID="tbcheckpassword" TextMode="Password" runat="server" Font-Bold="true" placeholder="Enter Password" class="form-control input-sm shorttb"></asp:TextBox>
                     <br />
                 <asp:Button ID="btnlogin" runat="server" Text="Submit" OnClick="btnlogin_Click"  class="btn btn"/>
                     </div>
              </div>
         </asp:Panel>
               <asp:Panel ID="profilePanel" runat="server">
                   <asp:Panel ID="Panel1" runat="server">
                <asp:TextBox ID="tbid"  Text='<%# Eval("Id") %>' runat="server" Visible="false"></asp:TextBox>
                       </asp:Panel>
                   <asp:LinkButton ID="lbname" runat="server" OnClick="LinkButton1_Click" ForeColor="#2e2e2e" Font-Bold="true" Font-Underline="true">Change username</asp:LinkButton>
                   <asp:Panel ID="uname" runat="server">
                <b>Username:</b><asp:TextBox ID="tbuname"  Text='<%# Eval("username") %>' runat="server"></asp:TextBox>
                       </asp:Panel>
                   <br />
                  <asp:LinkButton ID="lbpass" runat="server" OnClick="lbpass_Click" ForeColor="#2e2e2e" Font-Bold="true" Font-Underline="true">Change password</asp:LinkButton>
                   <asp:Panel ID="ppass" runat="server">
                <b>New Password:</b><asp:TextBox ID="tbpass" runat="server" Text='<%# Bind("password") %>'></asp:TextBox>
                       </asp:Panel>
                   <br />
                  <asp:LinkButton ID="lbsecq" runat="server" OnClick="lbsecq_Click"  ForeColor="#2e2e2e" Font-Bold="true" Font-Underline="true">Change Security questions</asp:LinkButton>
                   <asp:Panel ID="psecque" runat="server">

                <b>Security Question 1:</b><br />
                <asp:Label ID="lbsec1" runat="server" Text='<%#Eval("security_que1") %>'></asp:Label>
                       <asp:TextBox ID="tbsec1" runat="server" placeholder="Enter your answer"></asp:TextBox>
                 <br />
                <b>Security Question 2:</b><br />
                <asp:Label ID="lbsec2" runat="server" Text='<%#Eval("security_que2") %>'></asp:Label>
                       <asp:TextBox ID="tbsec2" runat="server" placeholder="Enter your answer"></asp:TextBox>
                   <br />
                <b>Security Question 3:</b><br />
                <asp:Label ID="lbsec3" runat="server" Text='<%#Eval("security_que3") %>'></asp:Label>
                       <asp:TextBox ID="tbsec3" runat="server" placeholder="Enter your answer"></asp:TextBox>
                </asp:Panel>
                   <br />
                <asp:LinkButton ID="lbupdate" runat="server"  ForeColor="#2e2e2e" Font-Bold="true" Font-Underline="true" OnClick="lbupdate_Click">Update Adam Garden's Owner Record</asp:LinkButton>
<br />
                   <asp:Button ID="Submit" runat="server" Text="Submit" OnClick="Submit_Click" class="btn btn"/>
                   </asp:Panel>
      
    </div>
</div>
</asp:Content>

