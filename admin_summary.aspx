<%@ Page Title="" Language="C#" MasterPageFile="~/sitedashboardmaster.master" AutoEventWireup="true" CodeFile="admin_summary.aspx.cs" Inherits="admin_summary" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
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
     .downpayment{
            margin-left:0%;
            background-color:#C19F45;
            color:white;
            width:100%;
            text-align:center;
            padding-top:1%;
            padding-bottom:1%;
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="gridviewmargin">
        <h2 class="downpayment">Client's Summary</h2>
  <asp:Panel ID="Panel1" runat="server" Visible="true" Width="130%">
        Total Payment Paid:
    <asp:Label ID="totalprice" runat="server" Text=""></asp:Label>
    <asp:GridView ID="viewclients" runat="server" Width="100%">
         <FooterStyle BackColor="#99CCCC" ForeColor="#000000" />
            <PagerStyle BackColor="#99CCCC" ForeColor="#000000" HorizontalAlign="Left" />
            <HeaderStyle BackColor="#C19E45" Font-Bold="True" ForeColor="#CCCCFF" />
        <AlternatingRowStyle BackColor="#CCCCCC" />
    </asp:GridView>
       
        <asp:TextBox ID="TextBox1" runat="server" Font-Bold="True" placeholder="Search client by CNIC"></asp:TextBox>
      <asp:Button ID="Button1" runat="server" Text="Search" OnClick="Button1_Click" class="btn btn"/>
  </asp:Panel>
     <asp:Panel ID="viewData" runat="server" Visible="true" Width="130%">
    <asp:GridView ID="GridView1" runat="server" BackColor="White"  AutoGenerateSelectButton="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AllowPaging="true" PageSize="8" Width="100%" OnPageIndexChanging="GridView1_PageIndexChanging">
        <FooterStyle BackColor="#99CCCC" ForeColor="#000000" />
            <PagerStyle BackColor="#99CCCC" ForeColor="#000000" HorizontalAlign="Left" />
        <SelectedRowStyle BackColor="#DED77C" ForeColor="Black" />
            <HeaderStyle BackColor="#C19E45" Font-Bold="True" ForeColor="#CCCCFF" />
        <AlternatingRowStyle BackColor="#CCCCCC" />
    </asp:GridView>
  
       
    </asp:Panel>
         
    </div>
</asp:Content>

