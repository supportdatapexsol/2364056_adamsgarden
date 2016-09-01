<%@ Page Title="" Language="C#" MasterPageFile="~/sitedashboardmaster.master" EnableEventValidation="false" AutoEventWireup="true" CodeFile="admin_view_client_detail.aspx.cs" Inherits="admin_view_client_detail" %>

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
                 .hiddencol { display: none; }

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
    xAddEventListener(window, 'load',
        function () { new xTableHeaderFixed('GridView2', 'GHeader', 0); }, false);
</script>    

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="header">
      <div class="newcontainer">
   
               <div class="messagealert" id="alert_container">  </div>	
    
             <div class="newrow">
            <div class="downpayment"><b style="font-size:large">Client Detail</b>
                <div style="float:right">
               <asp:TextBox ID="searchtb" runat="server" Font-Bold="True"  placeholder="Search client by CNIC" class="textboxtb"></asp:TextBox>
          
          
      <asp:Button ID="searchbtn" runat="server" Text="Search"   OnClick="searchbtn_Click" Font-Size="Small"/>
                    </div>
               </div>
            
              
                  
                       
                <br /><br />


                      


                  <asp:Panel ID="viewData" runat="server" >
                    
                     <div style="height:5% ;overflow: scroll">

                    <asp:Panel ID="viewData1" runat="server" Visible="true" Width="220%">

                    
             <asp:GridView ID="GridView2"  runat="server"  AutoGenerateEditButton="True" AllowPaging="true"  PageSize="5"
                 AutoGenerateColumns="false" BackColor="White"  OnRowCancelingEdit="GridView2_RowCancelingEdit" Width="100%" OnRowEditing="GridView2_RowEditing" OnRowUpdating="GridView2_RowUpdating" OnPageIndexChanging="GridView2_PageIndexChanging" OnSelectedIndexChanged="GridView2_SelectedIndexChanged"  >
           
                 


           <FooterStyle BackColor="#99CCCC" ForeColor="#000000" />
            <PagerStyle BackColor="#99CCCC" ForeColor="#000000" HorizontalAlign="Left" />
            <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
            <HeaderStyle BackColor="#C19E45" Font-Bold="True" ForeColor="#ffffff"   />
         <Columns>
              <asp:TemplateField HeaderText="Image">
                  <HeaderStyle Width="5%" />
            <EditItemTemplate >
                   <asp:FileUpload ID="FileUpload2"  runat="server" EnableViewState="true"/>
                </EditItemTemplate>
        <ItemTemplate>
        <asp:Image ID="Image1" runat="server" Width="150px" Height="100px" ImageUrl='<%# "readimage.ashx?ID=" + Convert.ToString(Eval("id"))%>'/>
        </ItemTemplate>
        </asp:TemplateField>
                             <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" ItemStyle-CssClass="hiddencol"  HeaderStyle-CssClass="hiddencol"/>
             <asp:TemplateField HeaderText="Name">
                 <HeaderStyle Width="7%" />
                 <EditItemTemplate>
                       <asp:TextBox ID="tbname" runat="server" Text='<%# Bind("name") %>'></asp:TextBox>
                 </EditItemTemplate>
                 <ItemTemplate>
                             <asp:Label ID="lbname" runat="server" Text='<%# Bind("name") %>'  ></asp:Label>
                 </ItemTemplate>

             </asp:TemplateField>
             <asp:TemplateField HeaderText="Relation">
                 <EditItemTemplate>
                       <asp:TextBox ID="tbrelation" runat="server" Text='<%# Bind("relation_of") %>'></asp:TextBox>
                 </EditItemTemplate>
                 <ItemTemplate>
                             <asp:Label ID="lbrelation" runat="server" Text='<%# Bind("relation_of") %>' ></asp:Label>
                 </ItemTemplate>

             </asp:TemplateField>
              <asp:TemplateField HeaderText="Cnic">
                 <EditItemTemplate>
                       <asp:TextBox ID="tbcnic" runat="server" Text='<%# Bind("applicant_cnic") %>'></asp:TextBox>
                 </EditItemTemplate>
                 <ItemTemplate>
                             <asp:Label ID="lbcnic" runat="server" Text='<%# Bind("applicant_cnic") %>' ></asp:Label>
                 </ItemTemplate>

             </asp:TemplateField>

               <asp:TemplateField HeaderText="Occupation">
                 <EditItemTemplate>
                       <asp:TextBox ID="tboccupation" runat="server" Text='<%# Bind("occupation") %>'></asp:TextBox>
                 </EditItemTemplate>
                 <ItemTemplate>
                             <asp:Label ID="lboccupation" runat="server" Text='<%# Bind("occupation") %>' ></asp:Label>
                 </ItemTemplate>

             </asp:TemplateField>




             <asp:TemplateField HeaderText="Present Address">
                 <EditItemTemplate>
                       <asp:TextBox ID="tbaddress" runat="server" Text='<%# Bind("present_address") %>'></asp:TextBox>
                 </EditItemTemplate>
                 <ItemTemplate>
                             <asp:Label ID="lbaddress" runat="server" Text='<%# Bind("present_address") %>' ></asp:Label>
                 </ItemTemplate>

             </asp:TemplateField>
             <asp:TemplateField HeaderText="Telephone">
                 <EditItemTemplate>
                       <asp:TextBox ID="tbtele" runat="server" Text='<%# Bind("telephone") %>'></asp:TextBox>
                 </EditItemTemplate>
                 <ItemTemplate>
                             <asp:Label ID="lbtele" runat="server" Text='<%# Bind("telephone") %>' ></asp:Label>
                 </ItemTemplate>

             </asp:TemplateField>
             <asp:TemplateField HeaderText="Mobile">
                 <EditItemTemplate>
                       <asp:TextBox ID="tbmobile" runat="server" Text='<%# Bind("mobile") %>'></asp:TextBox>
                 </EditItemTemplate>
                 <ItemTemplate>
                             <asp:Label ID="lbmobile" runat="server" Text='<%# Bind("mobile") %>' ></asp:Label>
                 </ItemTemplate>

             </asp:TemplateField>
             <asp:TemplateField HeaderText="Email">
                 <EditItemTemplate>
                       <asp:TextBox ID="tbemail" runat="server" Text='<%# Bind("email") %>'></asp:TextBox>
                 </EditItemTemplate>
                 <ItemTemplate>
                             <asp:Label ID="lbemail" runat="server" Text='<%# Bind("email") %>' ></asp:Label>
                 </ItemTemplate>

             </asp:TemplateField>
             <asp:TemplateField HeaderText="Permanent Address">
                 <EditItemTemplate>
                       <asp:TextBox ID="tbPerAdd" runat="server" Text='<%# Bind("permanent_address") %>'></asp:TextBox>
                 </EditItemTemplate>
                 <ItemTemplate>
                             <asp:Label ID="lbPerAdd" runat="server" Text='<%# Bind("permanent_address") %>' ></asp:Label>
                 </ItemTemplate>

             </asp:TemplateField>
             <asp:TemplateField HeaderText="Nominee Name">
                 <EditItemTemplate>
                       <asp:TextBox ID="tbNomineeName" runat="server" Text='<%# Bind("nominee_name") %>'></asp:TextBox>
                 </EditItemTemplate>
                 <ItemTemplate>
                             <asp:Label ID="lbNomineeName" runat="server" Text='<%# Bind("nominee_name") %>' ></asp:Label>
                 </ItemTemplate>

             </asp:TemplateField>
             <asp:TemplateField HeaderText="Nominee Address">
                 <EditItemTemplate>
                       <asp:TextBox ID="tbNomineeAdd" runat="server" Text='<%# Bind("nominee_address") %>'></asp:TextBox>
                 </EditItemTemplate>
                 <ItemTemplate>
                             <asp:Label ID="lbNomineeAdd" runat="server" Text='<%# Bind("nominee_address") %>' ></asp:Label>
                 </ItemTemplate>

             </asp:TemplateField>
             <asp:TemplateField HeaderText="Nominee Cnic">
                 <EditItemTemplate>
                       <asp:TextBox ID="tbNomineeCnic" runat="server" Text='<%# Bind("nominee_cnic") %>'></asp:TextBox>
                 </EditItemTemplate>
                 <ItemTemplate>
                             <asp:Label ID="lbNomineeCnic" runat="server" Text='<%# Bind("nominee_cnic") %>' ></asp:Label>
                 </ItemTemplate>

             </asp:TemplateField>
             <asp:TemplateField HeaderText="Draft/Cheque No">
                 <EditItemTemplate>
                       <asp:TextBox ID="tbNo" runat="server" Text='<%# Bind("nominee_no") %>'></asp:TextBox>
                 </EditItemTemplate>
                 <ItemTemplate>
                             <asp:Label ID="lbNo" runat="server" Text='<%# Bind("nominee_no") %>' ></asp:Label>
                 </ItemTemplate>

             </asp:TemplateField>
       
     
        </Columns>  
                </asp:GridView>
                
                
                
                
               
        </asp:Panel></div>
                      </asp:Panel>
       

        <asp:Panel ID="pSearchID" runat="server" BackColor="White" >
                         
                             <form class="form-horizontal" role="form">
                            
                                 <div class="form-group">
                                      <label class="control-label col-sm-3" for="lbName">Name:</label>
                                      <div class="col-sm-10">
                                         <asp:Label ID="lbName" runat="server"  class="form-control" Font-Bold="true" ></asp:Label>

                                      </div>
                                     
                                 </div>
                                 <div class="form-group">
                           <label class="control-label col-sm-3" for="lbrelation">Relation of:</label>
                                      <div class="col-sm-10">
                                         <asp:Label ID="lbrelation" runat="server"  class="form-control" Font-Bold="true"></asp:Label>

                           </div>
                                <div class="form-group">
                                <label class="control-label col-sm-3" for="lbCnic">CNIC:</label>
                                      <div class="col-sm-10">
                                         <asp:Label ID="lbCnic" runat="server"  class="form-control" Font-Bold="true"></asp:Label>

                           </div>
                           </div>
                            <div class="form-group">
                                <label class="control-label col-sm-3" for="lbocc">Occupation:</label>
                                      <div class="col-sm-10">
                                         <asp:Label ID="lbocc" runat="server"  class="form-control" Font-Bold="true"></asp:Label>

                                      </div>
                           </div>

                            <div class="form-group">
                                <label class="control-label col-sm-3" for="lbpersadd">PresentAddress:</label>
                                      <div class="col-sm-10">
                                         <asp:Label ID="lbpersadd" runat="server"  class="form-control" Font-Bold="true"></asp:Label>

                                      </div>
                           </div>
                           
                            <div class="form-group">
                                <label class="control-label col-sm-3" for="lbtel">Telephone:</label>
                                      <div class="col-sm-10">
                                         <asp:Label ID="lbtel" runat="server"  class="form-control" Font-Bold="true"></asp:Label>

                                      </div>
                           </div>
                           
                            <div class="form-group">
                                <label class="control-label col-sm-3" for="lbmob">Mobile No. :</label>
                                      <div class="col-sm-10">
                                         <asp:Label ID="lbmob" runat="server"  class="form-control" Font-Bold="true"></asp:Label>

                                      </div>
                           </div>
                           <div class="form-group">
                                <label class="control-label col-sm-3" for="lbemail">Email :</label>
                                      <div class="col-sm-10">
                                         <asp:Label ID="lbemail" runat="server"  class="form-control" Font-Bold="true"></asp:Label>

                                      </div>
                           </div>
                           
                                 <!---------------------->
                            <div class="form-group">
                                <label class="control-label col-sm-3" for="lbpadd">PermanentAddress:</label>
                                      <div class="col-sm-10">
                                         <asp:Label ID="lbpadd" runat="server"  class="form-control" Font-Bold="true"></asp:Label>

                                      </div>
                           </div>
                                 <div class="form-group">
                                <label class="control-label col-sm-3" for="lbnname">Nominee Name:</label>
                                      <div class="col-sm-10">
                                         <asp:Label ID="lbnname" runat="server"  class="form-control" Font-Bold="true"></asp:Label>

                                      </div>
                           </div>
                            <div class="form-group">
                                <label class="control-label col-sm-3" for="lbnadd">NomineeAddress</label>
                                      <div class="col-sm-10">
                                         <asp:Label ID="lbnadd" runat="server"  class="form-control" Font-Bold="true"></asp:Label>

                                      </div>
                           </div>
                           <div class="form-group">
                                <label class="control-label col-sm-3" for="lbncnic">Nominee Cnic :</label>
                                      <div class="col-sm-10">
                                         <asp:Label ID="lbncnic" runat="server"  class="form-control" Font-Bold="true"></asp:Label>

                                      </div>
                           </div> 
                        <div class="form-group">
                                <label class="control-label col-sm-3" for="lbnno">Nominee No :</label>
                                      <div class="col-sm-10">
                                         <asp:Label ID="lbnno" runat="server"  class="form-control" Font-Bold="true"></asp:Label>

                                      </div>
                           </div> 
                                </div>
                             
                             </form>
            </asp:Panel>
            </div>
        </div></div>
</asp:Content>

