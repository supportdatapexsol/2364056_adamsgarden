<%@ Page Title="" Language="C#" MasterPageFile="~/sitemaster.Master" AutoEventWireup="true" CodeFile="contect.aspx.cs" Inherits="contect" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <!--contact-->
<div class="contact">
	<div class="container">
		<h3>Contact</h3>
	 <div class="contact-top">
		<div class="col-md-6 contact-top1">
		  <div class="contact-address">
		  	<div class="col-md-8 contact-address1">
			  	 <h4>Project by:Pervez Sundho</h4>
				<p style="font-size:large;color:dimgrey">Head Office:Office 7,2nd floor,Al Anayat Mall, G-11 Markaz Islamabad</p>
				<p style="font-size:x-large;color:dimgrey">Sales & Marketing Team</p>
					<ul class="nav-bottom" >
						<li style="font-size:large;color:dimgrey">Tel:0512361261</li>
						<li style="font-size:large;color:dimgrey">Fax:0512361621</li>
                        <li style="font-size:large;color:dimgrey">Mob:03237777039,03215151604,03315555852</li>
                        <li style="font-size:large;color:dimgrey">Email:sales@adamgarden.com</li>
						<li ><a href="www.adamgardan.co.uk" style="font-size:large;color:dimgrey;">www.adamgargan.co.uk</a></li>
					</ul>		
		  	</div>
		  	<div class="clearfix"></div>
		  </div>
		  <div class="contact-address">
		  
		  	<div class="clearfix"></div>
		  </div>
		</div>
		<div class="col-md-6 contact-right">
	
             <form>
                        <asp:TextBox ID="YourName" placeholder="name" runat="server" Width="250px" /><br />

                <asp:TextBox ID="YourEmail" runat="server" Width="250px" placeholder="emaill"/>
                        <asp:TextBox ID="YourSubject" runat="server" Width="400px" placeholder="subjecttt"/><br />

                  <asp:TextBox ID="Comments" runat="server" TextMode="MultiLine" Rows="10" Width="400px" /> <br />
			   <label class="hvr-sweep-to-right">
                   <asp:Button ID="btnSubmit" runat="server" Text="Send" 
                    OnClick="Button1_Click" />
	           </label>
                          <br />      <asp:Label ID="DisplayMessage" runat="server" Visible="false" />

			</form>
		</div>
		<div class="clearfix"> </div>
</div>
	</div>
	<div class="map">
	     <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d4793.3699818324585!2d72.8322309578666!3d33.55886931873451!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0xdf60a93a7c064480!2sLiaquat+Ali+Khan+International+Airport!5e0!3m2!1sen!2s!4v1469875679087" ></iframe>	    

	    </div>
</div>
<!--//contact-->

</asp:Content>

