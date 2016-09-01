<%@ Page Title="" Language="C#" MasterPageFile="~/sitedashboardmaster.master" AutoEventWireup="true" CodeFile="admin_installment_record.aspx.cs" Inherits="admin_installment_record" %>
<%@ Import Namespace="System.Data" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script>
        $(function () {
            $("#btnPrint").click(function () {
                var contents = $("#printRecord").html();
                var frame1 = $('<iframe />');
                frame1[0].name = "frame1";
                frame1.css({ "position": "absolute", "top": "-1000000px" });
                $("body").append(frame1);
                var frameDoc = frame1[0].contentWindow ? frame1[0].contentWindow : frame1[0].contentDocument.document ? frame1[0].contentDocument.document : frame1[0].contentDocument;
                frameDoc.document.open();
                //Create a new HTML document.
                frameDoc.document.write('<html><head><title>Adams Garden Transfer Form</title>');
                frameDoc.document.write('</head><body style="-webkit-print-color-adjust: exact;background-color:white;left: 0; right: 0;border-color:black;background-position: center; background-repeat: no-repeat; background-size:700px 500px;align-content:center;>');
                //Append the external CSS file.


                //Append the DIV contents.
                frameDoc.document.write(contents);
                frameDoc.document.write('</body></html>');
                frameDoc.document.close();
                setTimeout(function () {
                    window.frames["frame1"].focus();
                    window.frames["frame1"].print();
                    frame1.remove();
                }, 500);
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="clear"></div>
                      <div class="messagealert" id="alert_container">  </div>	

    <div class="header">
    <div class="newcontainer">
        <div class="newrow">
                        <div class="downpayment"><b style="font-size:large">Client Installments Record</b>
                <div style="float:right">
                 <asp:TextBox ID="Search" runat="server" Font-Bold="True"  placeholder="Search client by CNIC" class="textboxtb"></asp:TextBox>
          
          
      <asp:Button ID="Button3" runat="server" Text="Search"   OnClick="Button3_Click" Font-Size="Small"/>
        </div>
       </div>
         <asp:HiddenField ID="tbregno" runat="server" />
     <asp:HiddenField ID="tbid" runat="server" />
    <asp:HiddenField ID="pid" runat="server" />
    <asp:HiddenField ID="cinstallment" runat="server" Value="0" />
    <asp:HiddenField ID="tinstallment" runat="server" Value="0"/>
    <asp:HiddenField ID="percentage" runat="server" Value="0" />

              <asp:Panel ID="Employepanel" runat="server" >

             <asp:Label ID="Label12" runat="server" Text="Client Information" Font-Bold="True" Font-Size="Large"></asp:Label>


                    <div style=" height:auto; overflow: auto">

        <asp:Panel ID="Employepanel1" runat="server" Width="160%" >

    <asp:GridView ID="GridView1" runat="server" OnSelectedIndexChanging="GridView1_SelectedIndexChanging" 
        AutoGenerateSelectButton="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" 
         Width="100%" OnPageIndexChanging="GridView1_PageIndexChanging" AllowPaging="true" BackColor="White">
         <FooterStyle BackColor="#C19E45" ForeColor="#000000" />
            <PagerStyle BackColor="#C19E45" ForeColor="#000000" HorizontalAlign="Left" />
        <SelectedRowStyle BackColor="#DED77C" ForeColor="Black" />
            <HeaderStyle BackColor="#C19E45" Font-Bold="True" ForeColor="#ffffff" />
    </asp:GridView>
            
        </asp:Panel>
        </div>
                            </asp:Panel>
                    <asp:Panel ID="viewData" runat="server" >

      <div class="container">
                         <input type="button" id="btnPrint" value="Print Payment List"  class="btn btn"/>
             <br />
                        <br />
      <div id="printRecord">
        <asp:Panel runat="server" ID="informationRecordID" BackColor="White" Width="100%">

                               <asp:Label ID="lbviewpanel" runat="server"  Font-Bold="True" Font-Size="Large"></asp:Label>
 
                         
            
                            
                           
                           
     
                            <%
    if (IsPostBack)
    {


        DataTable dt = installment.getClientInstallment(tbregno.Value.ToString()); //get clientdata
        DataRow dr = dt.Rows[0];
        DataTable dnew = retrieveCalculatedInfo(dr);
        //  DateTime downpaymentdate= DateTime.Parse(dr["datedownpayment"].ToString());


        int val = 20;
        for (int i = 0; i < 80; i++)
        {
            if (i % val == 0)
            {

                                             %>
                         <table border="0" style="width:100%">
                           
                            <tr >
                                    <td colspan="1">
                                        <img src="Images/logo.jpg" width="200px" height="100px" /></td>
                                <td><h2 style="text-align:center">Client Installment List</h2></td>
                                    </tr>
                                <tr>
                                    <td>Plot No : <%=dnew.Rows[i]["PlotNo"].ToString()%></td>
                                    <td>Registeration No : <%=dnew.Rows[i]["registrationo"].ToString()%></td>
                                    <td>Total Cost : <%=dnew.Rows[i]["totalcost"].ToString()%></td>
                                    </tr>
                             <tr>
                                    <td>Down Payment : <%=dnew.Rows[i]["down_payment"].ToString()%></td>
                                    <td>Down Payment date : <%=dnew.Rows[i]["DownPaymentDate"].ToString()%></td>
                                    <td>Installment Per Month : <%=dnew.Rows[i]["payment_permonth"].ToString()%></td>

                                </tr>
                             </table>
            <!--------table content-->
                        <table align="left"  cellpadding="10" border="1" style="width:100%">
                                    <tr>
                                        <th colspan="2">Due Date of Payment</th>
                                        <th colspan="2">Remaining Installment Cost</th>
                                    </tr>
            <%} %>
                            <%  if (i != 79)
    {%>
                                    <tr>
                                        <td colspan="2"><%=dnew.Rows[i]["DateofPayment"].ToString()%></td>
                                        <td colspan="2"><%=dnew.Rows[i]["RemainingInstallmentCost"].ToString()%></td>
                                    </tr>
                                    <%}
    else
    {%>
                            <tr>
                                        <td colspan="2"><%=dnew.Rows[i]["DateofPayment"].ToString()%></td>
                                        <td colspan="2">Installments has been completed</td>
                                    </tr>
                                            
                                        <caption>
                                          <% }
        }
    }%> ;
                                    </caption>
                            
                            
                                   
  
                        </table>
            </asp:Panel>
          </div>
          </div>

                         <!-------- end of table content-->
      <!--       <div style=" height:300px; overflow: auto">

         <asp:Panel ID="viewData1" runat="server" width="100%" >

             
             <asp:GridView ID="GridView2" runat="server"   AutoGenerateEditButton="True" 
                  Width="100%"   BackColor="White" >
           
                 <FooterStyle BackColor="#C19E45" ForeColor="#000000" />
            <PagerStyle BackColor="#C19E45" ForeColor="#000000" HorizontalAlign="Left" />
        <SelectedRowStyle BackColor="#DED77C" ForeColor="Black" />
            <HeaderStyle BackColor="#C19E45" Font-Bold="True" ForeColor="#ffffff" />
           
                </asp:GridView>
              </asp:Panel>
                                </div>-->

                        </asp:Panel>
                 <asp:Panel ID="new" runat="server" width="180%" >

             
             
              </asp:Panel>
                
                      



        <asp:Panel ID="pSearchID" runat="server" BackColor="White" Width="107%">
                         
                             <form class="form-horizontal" role="form">
                            
                                 <div class="form-group">
                                      <label class="control-label col-sm-2" for="lbName">Name:</label>
                                      <div class="col-sm-10">
                                         <asp:Label ID="lbName" runat="server"  class="form-control" Font-Bold="true" ></asp:Label>

                                      </div>
                                     
                                 </div>
                                <div class="form-group">
                                      <label class="control-label col-sm-2" for="lbrelation">Relation of:</label>
                                      <div class="col-sm-10">
                                         <asp:Label ID="lbrelation" runat="server"  class="form-control" Font-Bold="true" ></asp:Label>

                                      </div>
                                     
                                 </div>
                                <div class="form-group">
                                      <label class="control-label col-sm-2" for="lbcnic">Cnic:</label>
                                      <div class="col-sm-10">
                                         <asp:Label ID="lbcnic" runat="server"  class="form-control" Font-Bold="true" ></asp:Label>

                                      </div>
                                     
                                 </div>
                                <div class="form-group">
                                      <label class="control-label col-sm-2" for="lbmobile">Mobile:</label>
                                      <div class="col-sm-10">
                                         <asp:Label ID="lbmobile" runat="server"  class="form-control" Font-Bold="true" ></asp:Label>

                                      </div>
                                     
                                 </div>
                                <div class="form-group">
                                      <label class="control-label col-sm-2" for="lbtel">Telephone:</label>
                                      <div class="col-sm-10">
                                         <asp:Label ID="lbtel" runat="server"  class="form-control" Font-Bold="true" ></asp:Label>

                                      </div>
                                     
                                 </div>
                                <div class="form-group">
                                      <label class="control-label col-sm-2" for="lbadd">Present Address:</label>
                                      <div class="col-sm-10">
                                         <asp:Label ID="lbadd" runat="server"  class="form-control" Font-Bold="true" ></asp:Label>

                                      </div>
                                     
                                 </div>
                                <div class="form-group">
                                      <label class="control-label col-sm-2" for="lboccupation">Occupation:</label>
                                      <div class="col-sm-10">
                                         <asp:Label ID="lboccupation" runat="server"  class="form-control" Font-Bold="true" ></asp:Label>

                                      </div>
                                     
                                 </div>
                                <div class="form-group">
                                      <label class="control-label col-sm-2" for="lbplot">Plot No:</label>
                                      <div class="col-sm-10">
                                         <asp:Label ID="lbplot" runat="server"  class="form-control" Font-Bold="true" ></asp:Label>

                                      </div>
                                     
                                 </div>
                                <div class="form-group">
                                      <label class="control-label col-sm-2" for="lbreg">Registeration No:</label>
                                      <div class="col-sm-10">
                                         <asp:Label ID="lbreg" runat="server"  class="form-control" Font-Bold="true" ></asp:Label>

                                      </div>
                                     
                                 </div>
                                
                                </form>
            </asp:Panel>

    </div>
      </div> 

    </div>

</asp:Content>

