<%@ Page Title="" Language="C#" MasterPageFile="~/sitedashboardmaster.master" AutoEventWireup="true" CodeFile="admin_unpaid_downpayment.aspx.cs" Inherits="property_info" EnableEventValidation="false"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        
 
        .button{
        margin-left:30%;
        margin-right:10%;
        
    }
        .mybtns {
            width: 25%;
            height: 30%;
            background-color: #C19E45;
            border-color: #C19E45;
            margin-bottom: 20px;
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
            width:100%;
            margin-right:3%;
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
<script language="javascript" type="text/javascript">
  
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

               <div class="downpayment"><b style="font-size:Large">Unpaid Downpayment Info</b>
                   <div style="float:right">
                <asp:TextBox ID="searchtb" runat="server" Font-Bold="True"  placeholder="Search client by CNIC" class="textboxtb"></asp:TextBox>
          
          
      <asp:Button ID="searchbtn" runat="server" Text="Search"   OnClick="searchbtn_Click" Font-Size="Small"/>
                       </div>
               </div>


            
                   
               <br /><br />
             <!--   <div class="gridviewmargin">-->
                  <asp:Panel runat="server" >

               <asp:Panel runat="server" ID="pUnpaidInfo"  >
                  
                   <div style=" height:500px; overflow: auto">
            <asp:GridView ID="GridView1" runat="server" Width="100%" AutoGenerateColumns="False" BackColor="White"  BorderColor="#C19E45" BorderStyle="None"  PageSize="7" style="margin-left: 9px;"  OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDataBound="GridView1_RowDataBound" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging1" AllowSorting="True"  >
       
             <RowStyle BackColor="White" ForeColor="#000000" />
            <Columns>
                <asp:CommandField ShowEditButton="True" />
                 
                
                <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True"  ItemStyle-CssClass="hiddencol"  HeaderStyle-CssClass="hiddencol"/>
                <asp:BoundField DataField="registrationo" HeaderText="Reg No." ReadOnly="True"  />

                <asp:TemplateField HeaderText="Name" >
                          <EditItemTemplate>
                                  <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("name") %>'></asp:TextBox>
                          </EditItemTemplate>
                          <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                          </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="CNIC" >
                          <EditItemTemplate>
                                  <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("applicant_cnic") %>'></asp:TextBox>
                          </EditItemTemplate>
                          <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("applicant_cnic") %>'></asp:Label>
                          </ItemTemplate>
                </asp:TemplateField>
                

                <asp:TemplateField HeaderText="Father/Husband Name" >
                          <EditItemTemplate>
                                  <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("relation_of") %>'></asp:TextBox>
                          </EditItemTemplate>
                          <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("relation_of") %>' ></asp:Label>
                          </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Address" >
                          <EditItemTemplate>
                                  <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("present_address") %>'></asp:TextBox>
                          </EditItemTemplate>
                          <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("present_address") %>' ></asp:Label>
                          </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Profession" >
                          <EditItemTemplate>
                                  <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("occupation") %>'></asp:TextBox>
                          </EditItemTemplate>
                          <ItemTemplate>
                                <asp:Label ID="Label6" runat="server" Text='<%# Bind("occupation") %>' ></asp:Label>
                          </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Phone" >
                          <EditItemTemplate>
                                  <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("telephone") %>'></asp:TextBox>
                          </EditItemTemplate>
                          <ItemTemplate>
                                <asp:Label ID="Label7" runat="server" Text='<%# Bind("telephone") %>'></asp:Label>
                          </ItemTemplate>
                </asp:TemplateField>
                
                <asp:BoundField DataField="date" HeaderText="Date" ReadOnly="True"  />
                
               
                
           

              
               



            </Columns>
            <FooterStyle BackColor="#99CCCC" ForeColor="#000000" />
            <PagerStyle BackColor="#99CCCC" ForeColor="#000000" HorizontalAlign="Left" />
            <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
            <HeaderStyle BackColor="#C19E45" Font-Bold="True" ForeColor="#ffffff" />
       </asp:GridView>
                       </div>
                   </asp:Panel></asp:Panel>
                </div>

            
       </div>			
		<div class="row">
         <!--   <div class="logo_image">
                  <img src="Images/logo.jpg"/>
                  
            </div>-->
            
            <div class="clear"></div>    
            <asp:Panel ID="pSearchID" runat="server" BackColor="White" Width="107%" >
                         
                             <form class="form-horizontal" role="form">
                        
                                 <div class="form-group">
                                      <label class="control-label col-sm-3" for="lbRegNo">Registeration no.:</label>
                                      <div class="col-sm-10">
                                         <asp:Label ID="lbRegNo" runat="server"  class="form-control" Font-Bold="true" ></asp:Label>

                                      </div>
                                 
                                      <label class="control-label col-sm-3" for="lbName">Name :</label>
                                      <div class="col-sm-10">
                                         <asp:Label ID="lbName" runat="server"  class="form-control" Font-Bold="true" ></asp:Label>

                                      </div>
                                     <label class="control-label col-sm-3" for="lbCnic">Cnic :</label>
                                      <div class="col-sm-10">
                                         <asp:Label ID="lbCnic" runat="server"  class="form-control" Font-Bold="true" ></asp:Label>

                                      </div>
                                     <label class="control-label col-sm-3" for="lbRelation">Father/Husband :</label>
                                      <div class="col-sm-10">
                                         <asp:Label ID="lbRelation" runat="server"  class="form-control" Font-Bold="true" ></asp:Label>

                                      </div>
                                     <label class="control-label col-sm-3" for="lbAddress">Address :</label>
                                      <div class="col-sm-10">
                                         <asp:Label ID="lbAddress" runat="server"  class="form-control" Font-Bold="true" ></asp:Label>

                                      </div>
                                     <label class="control-label col-sm-3" for="lbprofession">Profession :</label>
                                      <div class="col-sm-10">
                                         <asp:Label ID="lbprofession" runat="server"  class="form-control" Font-Bold="true" ></asp:Label>

                                      </div>
                                     <label class="control-label col-sm-3" for="lbphone">	Phone :</label>
                                      <div class="col-sm-10">
                                         <asp:Label ID="lbphone" runat="server"  class="form-control" Font-Bold="true" ></asp:Label>

                                      </div>
                                  </div>
                            </form>
                </asp:Panel>
            
        </div>       
                
                </div>
                   
                   
       
   </div>
    
</asp:Content>

