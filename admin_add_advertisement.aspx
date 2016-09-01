<%@ Page Title="" Language="C#" MasterPageFile="~/sitedashboardmaster.master" AutoEventWireup="true" CodeFile="admin_add_advertisement.aspx.cs" Inherits="admin_add_advertiement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
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
.panel{
    margin-left:30%;
        margin-right:10%;
}

        </style>
  <script type="text/javascript">  
  function SelectedItemCLR(source) {   

      for (var i = 0; i < source.options.length; i++) {   
        if (i != source.selectedIndex)   
              source.options[i].style.backgroundColor = "White";   
          else   
              source.options[i].style.backgroundColor = "Red"; 

      }   
  }  
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
                        <div class="messagealert" id="alert_container">  </div>	

    <div class="header">
       <div class="newcontainer">
                  <div class="newrow">

           <h2 class="downpayment">Add Advertisement</h2>
       <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        <asp:Panel ID="pnlAdd" runat="server" Visible="False" style="margin-left: 9px" Width="616px">
            
             
            <div class="form-group longgroupdiv">
                &nbsp;<asp:Label ID="Label2" runat="server" Text="Enter status :" Font-Bold="True"></asp:Label>
                <asp:DropDownList ID="tbstatus" runat="server" Width="35%" SelectedColor="green" class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">
                <asp:ListItem Text="advertisement" Value="advertisement"></asp:ListItem>
                <asp:ListItem Text="slider" Value="slider">
                 
                </asp:ListItem>

            </asp:DropDownList>           

            </div>
            

         <div class="form-group longgroupdiv">
            <asp:Label ID="Label3" runat="server" Text="Upload an Image :" Font-Bold="True"></asp:Label>
            <asp:FileUpload ID="FileUpload1" runat="server" Width="322px"  />
        </div>
                <br />
            <asp:Button ID="lbtnSubmit" runat="server" Text="Save" OnClick="Submit_Click"  class="btn btn-default"/>
            &nbsp;&nbsp;&nbsp;
             
            
        </asp:Panel><br />
                     <div class="clear"></div>
              </div>

    </div></div>
</asp:Content>

