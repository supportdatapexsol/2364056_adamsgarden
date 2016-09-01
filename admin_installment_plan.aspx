<%@ Page Title="" Language="C#" MasterPageFile="~/sitedashboardmaster.master" AutoEventWireup="true" CodeFile="admin_installment_plan.aspx.cs" Inherits="admin_installment_plan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
                                    .hiddencol { display: none; }

  
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
    <meta name="viewport" content="width=device-width,height=device-height,initial-scale=1.0"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     
    <div class="header">
                              <div class="messagealert" id="alert_container">  </div>	

    <div class="content-wrapper new-class">
      <div class="newcontainer">
           <div class="newrow">
    <h2 class="downpayment">Property Installment Plans</h2>

            <div style=" height:auto; overflow: auto">

        <asp:Panel ID="Employepanel" runat="server" Width="140%">
        &nbsp;&nbsp;&nbsp;

        <asp:GridView ID="gvPerson" runat="server" AutoGenerateColumns="False"  
        BorderColor="#3366CC" BorderStyle="None"   
            onpageindexchanging="gvPerson_PageIndexChanging" 
            onrowcancelingedit="gvPerson_RowCancelingEdit" 
            onrowdatabound="gvPerson_RowDataBound" onrowdeleting="gvPerson_RowDeleting" 
            onrowediting="gvPerson_RowEditing" onrowupdating="gvPerson_RowUpdating" 
            onsorting="gvPerson_Sorting"  Width="100%" CellPadding="2" AllowPaging="true" BackColor="White" style="margin-left: 5px; float:left">
        
            <Columns>
                <asp:CommandField ShowEditButton="True" />
                <asp:CommandField ShowDeleteButton="True" />
                <asp:BoundField DataField="id" HeaderText="Id" ReadOnly="True" 
                    SortExpression="PersonID" ItemStyle-CssClass="hiddencol"  HeaderStyle-CssClass="hiddencol" />
                <asp:TemplateField HeaderText="Monthly Installments" SortExpression="installment_cost_per_month">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("installment_cost_per_month") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("installment_cost_per_month") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>


               


                <asp:TemplateField HeaderText="Plot Size" SortExpression="plot_size">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("plot_size") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("plot_size") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>


                 <asp:TemplateField HeaderText="Installment Duration" SortExpression="duration">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("installments_duration") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("installments_duration") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Down Payment" SortExpression="down_payment">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("down_payment") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("down_payment") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Lum Sum Discount" SortExpression="lum_sum_discount">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("lum_sum_discount") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("lum_sum_discount") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                
                <asp:TemplateField HeaderText="Dimensions (W x H)" SortExpression="Size">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Marla") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("Marla") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>


                <asp:TemplateField HeaderText="Total Cost" SortExpression="totalcost">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("totalcost") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("totalcost") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Membership Fee" SortExpression="membershipfee">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("membership_fee") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label8" runat="server" Text='<%# Bind("membership_fee") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>


            </Columns>
              <FooterStyle BackColor="#C19E45" ForeColor="#000000" />
            <PagerStyle BackColor="#C19E45" ForeColor="#000000" HorizontalAlign="Left" />
        <SelectedRowStyle BackColor="#DED77C" ForeColor="Black" />
            <HeaderStyle BackColor="#C19E45" Font-Bold="True" ForeColor="#ffffff" />
        <AlternatingRowStyle BackColor="#CCCCCC" />
        </asp:GridView>
        </asp:Panel>
    </div>
        <br />
      
    </div>
</div></div></div>
</asp:Content>

