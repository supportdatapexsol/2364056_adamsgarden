<%@ Page Title="" Language="C#" MasterPageFile="~/sitedashboardmaster.master" AutoEventWireup="true" CodeFile="printable_downpayment_form.aspx.cs" Inherits="printable_downpayment_form" %>
<%@ Import Namespace="System.Data" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" type="text/css" media="print" href="Content/styles.css">
     <style>
         .button
         {
        margin-left:30%;
        margin-right:10%;
        
             } 
        .nointernaldiv
        {
            width:30%;
            float:left;
            display:block;
        }
        .radioninternalclass
        {
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
        .image{
           background-image:url('Images/logo.jpg');
             margin-left: 40px;
         }
         .camera_button {
             
             width:50px;
             height:50px;
             float:right;
         }
         .sellerimg{
             width:200px;
             height:200px;
             border:2px solid #C19F45;
         }
    </style>
<script language="javascript" type="text/javascript">

    window.onload = function () {
        var input = document.querySelector('input[type=checkbox]');

        function check() {
            var a = input.checked ? "checked" : "not checked";
            document.getElementById('cashid').innerHTML = 'cashid ' + a;
        }
        input.onchange = check;
        check();
    };
    function generateDownpayPage() {
        var output = "waqas khan";
        var OpenWindow = window.open("down_payment_cam.aspx", "mywin", "width=1000,height=1000");
        OpenWindow.dataFromParent = output; // dataFromParent is a variable in child.html
        OpenWindow.init();

    };




    window.setInterval("refreshDiv()", 1000);
    function refreshDiv() {
        var buyer = document.getElementById("Imge1");
        buyer.onerror = function () {

            buyer.src = 'Captures/alternative1.png';
        };
      
        document.getElementById("Imge1").src = 'Captures/DownPayment.jpg?rand=' + Math.random();

    }

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

function imageIsLoaded(e) {
    $('#clientimage').attr('src', e.target.result);
   
};




    
$(function () {
    $("#btnPrint").click(function () {
        var contents = $("#dvContents1").html();
        var frame1 = $('<iframe />');
        frame1[0].name = "frame1";
        frame1.css({ "position": "absolute", "top": "-1000000px" });
        $("body").append(frame1);
        var frameDoc = frame1[0].contentWindow ? frame1[0].contentWindow : frame1[0].contentDocument.document ? frame1[0].contentDocument.document : frame1[0].contentDocument;
        frameDoc.document.open();
        //Create a new HTML document.
        frameDoc.document.write('<html><head><title>Adams Garden Down Payment Form</title>');
        frameDoc.document.write('</head><body style="-webkit-print-color-adjust: exact;background-color:white; height: 930px;left: 0; right: 0;border-style:double;border-width:12px;border-color:black;background-position: center; background-repeat: no-repeat; background-size:700px 500px;align-content:center;>');
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
    <div class="header" >
      <div class ="newcontainer">
        <div class="newrow">
      <asp:Panel ID="tranferId" runat="server"  >
                                   <div class="row">
                                        
                           
                                           
                            <div class="container" id="dvContents1" style="   height: 1000px;left: 0;background-color:white;right: 0;border-style:double;border-width:12px;border-color:black ;color:black">
                 <div class="row">
                                <div   class="col-sm-12">
                   <div   class="col-sm-6">
                       <asp:Image id="Image2" runat="server" AlternateText="Image text"  ImageAlign="left"
                        ImageUrl="Images/logo.jpg" Width="50%"  style="width:200px;height:100px; margin-top: 8px;margin-left:30%"/>
                       
                       </div>

                    <div  class="col-sm-6" >
                                                   
                        <%String regNo = Session["reg_id"].ToString();
                         DataTable dt = viewtranfserform.getData(regNo);
                              DataRow client = dt.Rows[0]; %>
                       <img id="img" src='data:image/jpg;base64,<%=client["image"] != System.DBNull.Value ? Convert.ToBase64String((byte[])client["image"]) : string.Empty %>'  style="width:150px;height:150px;margin-left:10%;margin-top:5%;border:double"/>
                          
                       
                            </div>
                   </div>
                     </div>
                   
                           
                            
                        
                     <div  style="text-align:justify;float:left; margin-left: 20px;">
                   
                                      
                    <b style="font-size:11px;">The Director Marketing</b>
                         <br /><br />
                    <b style="font-size:12px">APPLICATION FOR BOOKING OF A PLOT IN ADAM'S GARDEN NEW INTERNATIONAL AIRPORT ISLAMABAD</b>
                    <p style="font-size:14px">I understand to be bound by all Terms & Conditions of "ADAM'S GARDEN" as per following particulars</p>
                    <p style="font-size:14px">which are true and correct to the best of my knowledge and belief.</p>      
                           </div>
                            
                                    <br />
                                    <br />
                                    <br /> 
                                    <br />
                                    <br />
                                <br />
                   <h3 class="h2style" style="margin-left:35%; background-color:#C19F45;color:black;      width:30%;text-align:center; ">Down Payment</h3>
                                           
                          
                      
                    <div style="background-image:url('Images/logo.png'); margin-left: 40px;" >
                         
                  <!--          <div style="background-image:url('Images/logo3.png'); background-position: center; background-repeat: no-repeat; background-size:700px 500px;align-content:center; margin-left: 40px;" >
-->
                         
                        <div class="row">
                        <div  class="col-sm-12" >
                        <b>Name : </b>   
                          <label><u><%=client["name"].ToString()%></u></label>

                        <p style="margin-top:-3px"><small>IN CAPITAL LETTERS</small></p>
                            </div>
                             </div>
                        <div class="row">
                       <div  class="col-sm-12" >
                            <b >S/O, D/O, W/O : </b>
                           <label><u><%=client["relation_of"].ToString()%></u></label>

                             <b style="margin-left:3%">C.N.I.C : </b>  
                           <label><u><%=client["applicant_cnic"].ToString()%></u></label>
                          </div>
                            </div>
                        <br />
                   <!--occupation-->
                        <div class="row">
                        <div  class="col-sm-12" >
                        <b>Occupation : </b>  
                        <label><u><%=client["occupation"].ToString()%></u></label>
 
                            </div>
                             </div>
                        <br />     
                        <!-- present address-->     
                        <div class="row">
                        <div  class="col-sm-12" >
                        <b>Present Address : </b> 
                            <label><u><%=client["present_address"].ToString()%></u></label>
  
                            </div>
                             </div>
                        <br />
                        <!-- Telephone-->     
                        <div class="row">
                        <div  class="col-sm-12" >
                        <b>Tel : </b> 
                           <label><u><%=client["telephone"].ToString()%></u></label>

                             <b style="margin-left:3%">Mobile : </b> 
                                   <label><u><%=client["mobile"].ToString()%></u></label>

                             <b style="margin-left:3%">Email : </b>  
                             <label><u><%=client["email"].ToString()%></u></label>
 
                            </div>
                             </div>
                        <br />
                        <!-- Permanent address-->     
                        <div class="row">
                        <div  class="col-sm-12" >
                        <b>Permanent Address : </b> 
                            <label><u><%=client["permanent_address"].ToString()%></u></label> 
                            </div>
                             </div>
                        <br />
                           <!-- plot size-->     
                        <div class="row">
                        <div  class="col-sm-12" >
                        <b>Plot Size : </b>  
                            <% String plotSize = client["plot_size"].ToString();
                                if(plotSize == "4 Marla")
                                {
                                    marla4id.Checked = true;
                                   
                                }
                                else if(plotSize == "5 Marla")
                                {
                                    marla5id.Checked = true;
                                }
                                else if(plotSize == "7 Marla")
                                {
                                    marla7id.Checked = true;
                                }
                                else if(plotSize == "10 Marla")
                                {
                                    marla10id.Checked = true;

                                }
                                else if(plotSize == "1 Kanal")
                                {
                                    kanal1id.Checked = true;
                                }
                                %>
                            <asp:CheckBox ID="marla4id" runat="server" Text="4 Marla" Enabled="false"/>
                            <asp:CheckBox ID="marla5id" runat="server" Text="5 Marla" Enabled="false"/>
                            <asp:CheckBox ID="marla7id" runat="server" Text="7 Marla" Enabled="false"/>
                            <asp:CheckBox ID="marla10id" runat="server" Text="10 Marla" Enabled="false"/>
                            <asp:CheckBox ID="kanal1id" runat="server" Text="1 Kanal" Enabled="false"/>
                            </div>
                             </div>
                        <br />
                       <!-- Nominee name-->     
                        <div class="row">
                        <div  class="col-sm-12" >
                        <b>Nominee Name : </b> 
                            <label><u><%=client["nominee_name"].ToString()%></u></label>
                            </div>
                             </div>
                        <br />
                       <!-- Nominee Address and CNIC-->     
                        <div class="row">
                        <div  class="col-sm-12" >
                        <b>Nominee Address : </b> 
                            <label><u><%=client["nominee_address"].ToString()%></u></label>
                            <b style="margin-left:3%">Nominee CNIC : </b> 
                            <label><u><%=client["nominee_cnic"].ToString()%></u></label>
                            </div>
                             </div>
                        <br />
                         <!-- Payment Made Through-->     
                        <div class="row">
                        <div  class="col-sm-12" >
                           <b>Payment Made Through : </b>  
                            <% String paymentMethod = client["payment_made_through"].ToString();
                                if(paymentMethod == "Cash")
                                {
                                    cashid.Checked = true;
                                   
                                }
                                else if(paymentMethod == "Cheque")
                                {
                                    chequeid.Checked = true;


                                }
                                else if(paymentMethod == "Draft")
                                {
                                    draftid.Checked = true;

                                }
                                else if(paymentMethod == "Pay Order")
                                {
                                    payorderid.Checked = true;

                                }
                                     %>
   <asp:CheckBox ID="cashid" runat="server" Text="Cash" Enabled="false"  />               
   <asp:CheckBox ID="chequeid" runat="server" Text="Cheque" Enabled="false" />               
   <asp:CheckBox ID="draftid" runat="server" Text="Draft" Enabled="false"  />               
   <asp:CheckBox ID="payorderid" runat="server" Text="Payorder" Enabled="false"   />               

                       
                            <b style="margin-left:3%">No : </b> 
                            <label><u><%=client["cash_payorder_no"].ToString()%></u></label>
                            </div>
                             </div>
                        <br />
                        <!--Amount Rs.-->     
                        <div class="row">
                        <div  class="col-sm-12" >
                        <b>Amount Rs. : </b> 
                            <label><u><%=client["payment_amount_in_Rs"].ToString()%></u></label>
                            <b style="margin-left:3%">Amount In Words. : </b> 
                            <label><u><%=client["payment_amount_in_wors"].ToString()%></u></label>
                            </div>
                            <br />
                            <br />
                             <!--Signature-->     
                        <div class="row">
                        <div  class="col-sm-12" >
                        <b>Director Marketing Signature  </b> 
                            <b>_________________ </b> 
                            <b>Applicant Signature  </b>
                            <b>_________________</b> 
                            </div>
                             </div>
                       
                         </div>
                        <br /><br /><br /><br />
                        <div class="row">
                        <div  class="col-sm-12" >
                            <b style="margin-left:15%">Office 07, 2nd Floor, Al-Anayat Mall, G-11 Markaz Islamabad.</b>
                             </div>
                            </div>  </div>
                                </div></div></asp:Panel>
            <div class="container">
                                            <input type="button" id="btnPrint" value="Print"  class="btn btn"/>
                                        </div>
        </div></div>
                                       
                                       </div>
                     
       
      
    
</asp:Content>

