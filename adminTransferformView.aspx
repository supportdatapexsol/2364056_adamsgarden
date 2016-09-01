<%@ Page Title="" Language="C#" MasterPageFile="~/sitedashboardmaster.master" AutoEventWireup="true" CodeFile="adminTransferformView.aspx.cs" Inherits="Admin_installment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>

          .button{
        margin-left:30%;
        margin-right:10%;
        
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
         .downpayment{
            margin-left:0%;
            background-color:#C19F45;
            color:white;
            width:100%;
            text-align:center;
            padding-top:1%;
            padding-bottom:1%;
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
        .button{
        margin-left:30%;
        margin-right:10%;
        
    }
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
.gridviewmargin1{
        margin-left:29%;
        margin-right:10%;
        
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
 <script>
     function changeprogreesbar() {
         var elms = document.getElementsByClassName('pbwidth')
         for (var i = 0; i < elms.length; i++) {
             
                 elms[i].setAttribute("width", "50%");
            
         }
     }
 </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

     <div class="clear"></div>
    <div class="header">
    <div class="newcontainer">
        <div class="newrow">
                        <div class="downpayment"><b style="font-size:large">Transfer Property Records</b>
                <div style="float:right">
                 <asp:TextBox ID="Search" runat="server" Font-Bold="True"  placeholder="Search " class="textboxtb"></asp:TextBox>
          
          
      <asp:Button ID="Button3" runat="server" Text="Search"   OnClick="Button3_Click" Font-Size="Small"/>
        </div>
       </div>
         <asp:HiddenField ID="tbregno" runat="server" />
     <asp:HiddenField ID="tbid" runat="server" />
        <asp:HiddenField ID="date" runat="server" />
    <asp:HiddenField ID="cinstallment" runat="server" Value="0" />
    <asp:HiddenField ID="tinstallment" runat="server" Value="0"/>
    <asp:HiddenField ID="percentage" runat="server" Value="0"/>
                    <div class="progress">
                      
</div>
      
        
   
    
         <asp:Panel ID="viewData" runat="server" >

             <br />
             <asp:Label ID="lbviewpanel" runat="server" Text="Transfer Of Clients" Font-Bold="True" Font-Size="Large"></asp:Label>
             


             <br />
                                        <div style=" height:30%; overflow: scroll">

             <asp:GridView ID="GridView2" runat="server"    AutoGenerateEditButton="false" 
                 OnRowEditing="GridView2_RowEditing" OnRowUpdating="GridView2_RowUpdating"  OnItemDataBound="makeuneditable" 
                 OnRowDataBound="GridView2_RowDataBound" AllowCustomPaging="True" AllowPaging="True" AutoGenerateDeleteButton="false" 
                 OnRowCancelingEdit="GridView2_RowCancelingEdit" Width="100%" OnRowDeleting="GridView2_RowDeleting"
                  OnRowUpdated="GridView2_RowUpdated" OnPageIndexChanging="GridView2_PageIndexChanging" >
                 <Columns>
                   
                          <asp:TemplateField HeaderText="Image">
                 <HeaderStyle Width="7%" />
           
            <ItemTemplate>
                <img src='data:image/jpg;base64,<%# Eval("image") != System.DBNull.Value ? Convert.ToBase64String((byte[])Eval("image")) : string.Empty %>' alt="image" height="100" width="200"/>
            </ItemTemplate>
        </asp:TemplateField>
                 </Columns>
               <FooterStyle BackColor="#C19E45" ForeColor="#000000" />
            <PagerStyle BackColor="#C19E45" ForeColor="#000000" HorizontalAlign="Left" />
        <SelectedRowStyle BackColor="#DED77C" ForeColor="Black" />
            <HeaderStyle BackColor="#C19E45" Font-Bold="True" ForeColor="#FFFFFF" />
        <AlternatingRowStyle BackColor="#CCCCCC" />
          
                </asp:GridView>
                
                </div>
               
             
                 <asp:Button ID="viewFormId" runat="server" Text="View Transfer Form" OnClick="viewFormId_Click" CssClass="btn btn"  />
                
        </asp:Panel>
        <asp:Panel ID="Employepanel" runat="server" >
            <div style=" height:30%; overflow: scroll">


            <asp:Label ID="Label12" runat="server" Text="Client Information" Font-Bold="True" Font-Size="Large"></asp:Label>
            <br />
    <asp:GridView ID="GridView1" runat="server" OnSelectedIndexChanging="GridView1_SelectedIndexChanging" 
        AutoGenerateSelectButton="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" 
         Width="100%" OnPageIndexChanging="GridView1_PageIndexChanging" AllowPaging="true">
         <FooterStyle BackColor="#C19E45" ForeColor="#000000" />
            <PagerStyle BackColor="#C19E45" ForeColor="#000000" HorizontalAlign="Left" />
        <SelectedRowStyle BackColor="#DED77C" ForeColor="Black" />
            <HeaderStyle BackColor="#C19E45" Font-Bold="True" ForeColor="#FFFFFF" />
        <AlternatingRowStyle BackColor="#CCCCCC" />
    </asp:GridView>
            </div>
        </asp:Panel>
    </div>
      </div> 
        </div> 
        </asp:Content>

