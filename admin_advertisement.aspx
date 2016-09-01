<%@ Page Title="" Language="C#" MasterPageFile="~/sitedashboardmaster.master" AutoEventWireup="true" CodeFile="admin_advertisement.aspx.cs" Inherits="viewAdvertisement" %>

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
.panel{
    margin-left:30%;
        margin-right:10%;
}
.hiddencol{
    display:none;
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
           
                      <h2 class="downpayment">Advertisements</h2>

                   <div style=" height:auto; overflow: auto">

        <asp:GridView ID="ad_id" runat="server" AutoGenerateColumns="False"   onrowediting="gv_RowEditing"  onrowupdating="gv_RowUpdating" onrowdeleting="gv_RowDeleting"
        onrowcancelingedit="gv_RowCancelingEdit"    BackColor="White" Width="100%">
           
               
            <Columns>
            <asp:CommandField ShowEditButton="True"/>
                <asp:CommandField ShowDeleteButton="True" />
                <asp:BoundField DataField="id" HeaderText="Id" ReadOnly="True" ItemStyle-CssClass="hiddencol"  HeaderStyle-CssClass="hiddencol"/>
          
                <asp:TemplateField HeaderText="Images" >
                    <HeaderStyle  Width="100px"/>
                  <EditItemTemplate >
                   <asp:FileUpload ID="FileUpload2" FileName='<%# Eval("image")%>' runat="server" EnableViewState="true"/>
                </EditItemTemplate>
                
                    <ItemTemplate>
                        <asp:Image ID="Image1" runat="server"  Height="100px" Width="100px" 
                            ImageUrl='<%#"data:Image/jpg;base64," + Convert.ToBase64String((byte[])Eval("image")) %>'  />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Status" >
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Eval("slider_status") %>' ></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("slider_status") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Content" >
                    <EditItemTemplate>
                        <asp:TextBox ID="tbcontent" runat="server" Text='<%# Eval("content") %>' ></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lbcontent" runat="server" Text='<%# Eval("content") %>' ></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                 
                  

            </Columns>
            <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
            <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
            <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
            <HeaderStyle BackColor="#C19E45" Font-Bold="True" ForeColor="#ffffff" />
        </asp:GridView></div>
    
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        
    </div> </div></div>
</asp:Content>

