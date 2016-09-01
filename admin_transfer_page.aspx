<%@ Page Title="" Language="C#" MasterPageFile="~/sitedashboardmaster.master" AutoEventWireup="true" CodeFile="admin_transfer_page.aspx.cs" Inherits="admin_transfer_page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <style>
      .gridviewmargin{
        margin-left:30%;
        margin-right:10%;
        
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
 <div class="gridviewmargin"> 
                  <div class="messagealert" id="alert_container">  </div>	

    <asp:RadioButtonList ID="RadioButtonList1" runat="server" Height="52px">
        <asp:ListItem Value="Adam's Garden Transfer">Adam's Garden Transfer</asp:ListItem>
        <asp:ListItem Value="Client's Transfer">Client's Transfer</asp:ListItem>

    </asp:RadioButtonList>
     <asp:Button ID="Button1" runat="server" Text="Select" OnClick="Button1_Click" />
     </div>
</asp:Content>

