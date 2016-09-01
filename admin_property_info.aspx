<%@ Page Title="" Language="C#"  MasterPageFile="~/sitedashboardmaster.master" AutoEventWireup="true" CodeFile="admin_property_info.aspx.cs" Inherits="property_info" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        
 
        .button{
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

  
        .nointernaldiv{
            width:30%;
            float:left;
            display:block;
        }
        .radioninternalclass{
            width:70%;
            float:left;
            display:block;
        }
        .paymentradiolabel{
             width:20%;
             text-align: left;
             margin-right:2%;
             height:10%;
             float:left;
             display:block;
        }
         .shorttb{
		  border:2px solid #c19f45;
            width:100%;
			  margin-right:3%;
			  border-radius: 50px;
        }
         .textboxtb{
		  border:2px solid #c19f45;
           
			  border-radius: 50px;
        }
        .shortgroupdiv{
            width:50%;
            float:left;

        }
        .midgroupdiv{
            width:33.33%;
            float:left;
        }
        .longgrouptb{
            width:100%;
            clear:both;
        }
        .clear{clear:both;}
        .radioitem{
            width:8%;
             text-align: left;
             margin-right:2%;
             height:10%;
             float:left;
             display:block;

        }
        .radioitem1{
            width:12%;
             text-align: left;
             margin-right:2%;
             height:10%;
             float:left;
             display:block;

        }
        .noinradio{
            width:50%;
             text-align: left;
             height:20%;

        }
        #save{
            width:20%;
        }
        .adamscontent{
            margin-left:5%;
            color:white;
            width:80%;
            text-align:center;
            padding-top:5%;
            padding-bottom:5%;
        }
        .dawnpayment{
            margin-left:0%;
            background-color:#C19F45;
            color:white;
            width:100%;
            text-align:center;
            padding-top:1%;
            padding-bottom:1%;
        }
        .logo_image{
            margin-left:11%;
             float:left;
             display:block;
             width:200px;
             height:200px;
             border:2px solid black;
        }
        .logo_image img{
            width:100%;
            height:100%;
        }
        .client_image{
            margin-left:50%;
            float:left;
           
             width:200px;
             height:200px;
             
        }
        .client_image img{
            margin-top:1%;
             width:100%;
            height:100%;
        }
        .btn{
          background-color:#C19E45;
          color:white;
          border-color:#C19E45;
        }
       .adamcontent{
          
          width:100%;
         padding: 6px 12px;
    line-height: 1.428571429;
    color: #555;
    vertical-align: auto;
    background-color: #F1F4F7;
    
    -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,0.075);
    box-shadow: inset 0 1px 1px rgba(0,0,0,0.075);
    -webkit-transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
    transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
       }
       .adamcontent h1{
           font-size:2.5em;
       }
       .adamcontent h2{
           font-size:1.0em;
       }
       .adamcontent h3{
           font-size:.5em;
       }
       .validationtxt{float:right;color:red;margin-right:10px;}
        .validationradio{float:left;color:red;margin-right:10px;}
      
   
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
    </script>
<script language="javascript" type="text/javascript">
$(function () {
    $(":file").change(function () {
        if (this.files && this.files[0]) {
            var reader = new FileReader();
            reader.onload = imageIsLoaded;
            reader.readAsDataURL(this.files[0]);
            alert(this.files[0]);
        }
    });
});





</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    
 <div class="header">
 <div class="newcontainer">
    
        
                                                      <div class="messagealert" id="alert_container">  </div>	
               <div class="newrow">
            <div class="downpayment"><b style="font-size:large">Property Information</b>
                <div style="float:right">
                    
                  <asp:TextBox ID="searchtb" runat="server" Font-Bold="True"  placeholder="Search client by CNIC" class=" textboxtb"></asp:TextBox>
          
      <asp:Button ID="searchbtn" runat="server" Text="Search"   OnClick="searchbtn_Click" Font-Size="Small"/>
                    </div>
               </div>
           
              
      
               <br /><br />
   

                     <asp:Panel runat="server" id="scrollId" style=" height:auto; overflow: scroll">

                        <asp:Panel ID="pInfoId" runat="server" Width="170%">
                            <asp:GridView ID="GridView1" runat="server"  AllowPaging="true"  
                                AutoGenerateColumns="False" BackColor="White"  BorderColor="#C19E45" BorderStyle="None"  
                                CellPadding="1"  PageSize="7" style="margin-left: 9px;"  
                                OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDataBound="GridView1_RowDataBound" 
                                OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" 
                                OnRowUpdating="GridView1_RowUpdating" AllowSorting="True" Height="40px" Width="107%" OnPageIndexChanging="GridView1_PageIndexChanging" >
       
                                <RowStyle BackColor="White" ForeColor="#000000" />
                                <Columns>
                                <asp:CommandField ShowEditButton="True" />
               
                                  <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" ItemStyle-CssClass="hiddencol"  HeaderStyle-CssClass="hiddencol" />           

                                         <asp:BoundField DataField="name" HeaderText="Name" ReadOnly="True"  />
                                         <asp:BoundField DataField="applicant_cnic" HeaderText="CNIC" ReadOnly="True"  />
                                         <asp:BoundField DataField="plot_no" HeaderText="Plot No" ReadOnly="True"  >
                                               <HeaderStyle Width="5%"  />
                                             </asp:BoundField>

                                         <asp:BoundField DataField="registrationo" HeaderText="RegNo" ReadOnly="True"  />
                                        <asp:BoundField DataField="plot_size" HeaderText="Plot Size" ReadOnly="True"  >
                                            <HeaderStyle Width="5%"  />
                                                     </asp:BoundField>
                                        <asp:TemplateField HeaderText="Street No" >
                                             <HeaderStyle Width="5%"  />
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("street_no") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("street_no") %>' ></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Plot Address">
                                            <HeaderStyle Width="17%"  />
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("plot_address") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("plot_address") %>' ></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                
                                        <asp:TemplateField HeaderText="Owner Name">
                                            <HeaderStyle Width="10%" />
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("owner_property_name") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label6" runat="server" Text='<%# Bind("owner_property_name") %>' ></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>


                                        <asp:TemplateField HeaderText="Owner address">
                                             <HeaderStyle Width="17%"  />
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("owner_property_address") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label7" runat="server" Text='<%# Bind("owner_property_address") %>' ></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        

                                         <asp:TemplateField HeaderText="Owner CNIC">
                                              <HeaderStyle Width="7%"  />
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("owner_property_cnic") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label9" runat="server" Text='<%# Bind("owner_property_cnic") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                <asp:TemplateField HeaderText="Property Type">
                                                                  <HeaderStyle Width="7%"  />

                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("property_type") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label8" runat="server" Text='<%# Bind("property_type") %>' ></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>



                                    </Columns>
                                    <FooterStyle BackColor="#99CCCC" ForeColor="#000000" />
                                    <PagerStyle BackColor="#99CCCC" ForeColor="#000000" HorizontalAlign="Left" />
                                    <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                                    <HeaderStyle BackColor="#C19E45" Font-Bold="True" ForeColor="#ffffff" />
                           </asp:GridView>

                        </asp:Panel>
                        </asp:Panel>

                        <asp:Panel ID="pSearchID" runat="server" BackColor="White" Width="107%"  >
                         
                             <form class="form-horizontal" role="form" >
                          
                                 <div class="form-group">
                                      <label class="control-label col-sm-3" for="lbName">Name:</label>
                                      <div class="col-sm-10">
                                         <asp:Label ID="lbName" runat="server"  class="form-control" Font-Bold="true" ></asp:Label>

                                      </div>
                                     
                                 </div>
                                 
                            
                            <div class="form-group">
                                <label class="control-label col-sm-3" for="lbCnic">CNIC:</label>
                                      <div class="col-sm-10">
                                         <asp:Label ID="lbCnic" runat="server"  class="form-control" Font-Bold="true"></asp:Label>

                           </div>
                           </div>
                            <div class="form-group">
                                <label class="control-label col-sm-3" for="lbPlotNo">Plot No.:</label>
                                      <div class="col-sm-10">
                                         <asp:Label ID="lbPlotNo" runat="server"  class="form-control" Font-Bold="true"></asp:Label>

                                      </div>
                           </div>

                            <div class="form-group">
                                <label class="control-label col-sm-3" for="lbReg">Registeration No.:</label>
                                      <div class="col-sm-10">
                                         <asp:Label ID="lbReg" runat="server"  class="form-control" Font-Bold="true"></asp:Label>

                                      </div>
                           </div>
                           
                            <div class="form-group">
                                <label class="control-label col-sm-3" for="lbPlotSize">Plot Size. :</label>
                                      <div class="col-sm-10">
                                         <asp:Label ID="lbPlotSize" runat="server"  class="form-control" Font-Bold="true"></asp:Label>

                                      </div>
                           </div>
                           
                            <div class="form-group">
                                <label class="control-label col-sm-3" for="lbStreet">Street No. :</label>
                                      <div class="col-sm-10">
                                         <asp:Label ID="lbStreet" runat="server"  class="form-control" Font-Bold="true"></asp:Label>

                                      </div>
                           </div>
                           <div class="form-group">
                                <label class="control-label col-sm-3" for="lbPlotAdd">Plot Address :</label>
                                      <div class="col-sm-10">
                                         <asp:Label ID="lbPlotAdd" runat="server"  class="form-control" Font-Bold="true"></asp:Label>

                                      </div>
                           </div>
                           
                                 <!---------------------->
                            <div class="form-group">
                                <label class="control-label col-sm-3" for="lbOwnerName">Owner Name :</label>
                                      <div class="col-sm-10">
                                         <asp:Label ID="lbOwnerName" runat="server"  class="form-control" Font-Bold="true"></asp:Label>

                                      </div>
                           </div>
                                 <div class="form-group">
                                <label class="control-label col-sm-3" for="lbOwnerAddress">Owner Address :</label>
                                      <div class="col-sm-10">
                                         <asp:Label ID="lbOwnerAddress" runat="server"  class="form-control" Font-Bold="true"></asp:Label>

                                      </div>
                           </div>
                            <div class="form-group">
                                <label class="control-label col-sm-3" for="lbOwnerCnic">Owner Cnic :</label>
                                      <div class="col-sm-10">
                                         <asp:Label ID="lbOwnerCnic" runat="server"  class="form-control" Font-Bold="true"></asp:Label>

                                      </div>
                           </div>
                           <div class="form-group">
                                <label class="control-label col-sm-3" for="lbPropertyType">Property Type :</label>
                                      <div class="col-sm-10">
                                         <asp:Label ID="lbPropertyType" runat="server"  class="form-control" Font-Bold="true"></asp:Label>

                                      </div>
                           </div> 
                       
                            </form>
                                 
                        </asp:Panel>

                   </div>
            
      </div>		
	
         <!--   <div class="logo_image">
                  <img src="Images/logo.jpg"/>
                  
            </div>-->
            </div>
            <div class="clear"></div>    

    
</asp:Content>

