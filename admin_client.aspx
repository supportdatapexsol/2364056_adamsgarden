<%@ Page Title="" Language="C#" MasterPageFile="~/sitedashboardmaster.master" AutoEventWireup="true" CodeFile="admin_client.aspx.cs" Inherits="admin_client" %>

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


    <div class="alert alert-success gridviewmargin alertcolor">
    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
      <asp:Label ID="alert" class="alertlabel" runat="server" Text="this label is not hiden" Visible="false" onchange="javascript: checkalert();"></asp:Label>
  </div>
      <div class="gridviewmargin">
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="View Client Information" />
       <asp:Button ID="Button2" runat="server"  Text="View Client Installment plan" OnClick="Button2_Click" />
            <asp:Panel ID="viewData" runat="server" Visible="true">
             
             <asp:Label ID="lbviewpanel" runat="server" Text="Installments Of Clients"></asp:Label>
             <asp:GridView ID="GridView2" runat="server" DataKeyNames="Id" AutoGenerateEditButton="True" OnRowEditing="GridView2_RowEditing1" OnRowUpdating="GridView2_RowUpdating1" OnRowCancelingEdit="GridView2_RowCancelingEdit" OnRowDeleting="GridView2_RowDeleting">
           
                 <AlternatingRowStyle BackColor="#CCCCCC" />
                 <HeaderStyle BackColor="#C19E45" ForeColor="White" />
                 <SelectedRowStyle BackColor="#3333CC" ForeColor="Red" />
         <Columns>
        <asp:TemplateField HeaderText="Image">
            <EditItemTemplate >
                   <asp:FileUpload ID="FileUpload2"  runat="server" EnableViewState="true"/>
                </EditItemTemplate>
        <ItemTemplate>
        <asp:Image ID="Image1" runat="server" Width="100px" Height="100px" 
                   ImageUrl='<%# "readimage.ashx?ID=" + Convert.ToString(Eval("id"))%>'/>
        </ItemTemplate>
        </asp:TemplateField>
     
        </Columns>        
  

           
                </asp:GridView>
                
                
                
                
                
        </asp:Panel>
          <asp:Panel ID="clientpaymentplan" runat="server" Visible="false">
              <asp:TextBox ID="Search" runat="server"></asp:TextBox>
              <asp:Button ID="Button3" runat="server" Text="Search" />
               <asp:GridView ID="paymentplan_client" runat="server"></asp:GridView>
               <asp:GridView ID="client_detail" runat="server"></asp:GridView>
          </asp:Panel>
    </div>
        
</asp:Content>

