<%@ Page Title="" Language="C#" MasterPageFile="~/sitemaster.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="masterpage.WebForm1" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Drawing" %>
<%@ Import Namespace="System.IO" %>




<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>




<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    














    
    <div class="content">
	<div class="content-grid">
		<div class="container">
			<h3>Advertisement</h3>
           <%
                DataTable tb=advertisement.returnAvertisementImage();
                foreach (DataRow row in tb.Rows)
                {
                   byte[] imagedata = (byte[])row[0];
                System.Drawing.Image img = System.Drawing.Image.FromStream(new MemoryStream(imagedata));
                               %>
             <div class="col-md-4 box_2">
                    
		     	 <a href="<%="data:Image/jpg;base64," + Convert.ToBase64String((byte[])imagedata)%>" class="mask" target="_blank">
			     	   	<img class="img-responsive zoom-img"   src='<%="data:Image/jpg;base64," + Convert.ToBase64String((byte[])imagedata)%>'alt="" />
                    
			     	 </a>
		     	   <div class="most-1">
			     	   	 <h5><a href="">Ads</a></h5>
			     	    	<p></p>
			     	   </div>
		     
		</div>
            <%} %>
			 
		 	<div class="clearfix"> </div>
		
		      </div>
        </div>
        </div>
        


   
 <!--   <div class="project">     -->
             <!--   <h3>Site Map</h3> -->
    
             <!--   <img src="Images/site map.jpg"  height="auto" width=100% alt=""/>-->

        <!--<div class="container">
        <h3>Site Map</h3>
		
			<!--<h3>Properties</h3>-->
            
           
				<!--<div class="project-top">
					<div class="col-md-3 project-grid">
						<div class="project-grid-top">
							 <a href="single.html" class="mask"><img src="images/ga.jpg" class="img-responsive zoom-img" alt=""/></a>
							 <div class="col-md1">
								 <div class="col-md2">
									 <div class="col-md3">
									 	<span class="star"> 4.5</span>
									 </div>
									 <div class="col-md4">
									 	<strong>Venice</strong>
									 	<small>50 Reviews</small>
									 </div>
									 <div class="clearfix"> </div>
								 </div>
								 <p>2, 3, 4 BHK Flats</p>
								 <p class="cost">$65,000</p>
								 <a href="single.html" class="hvr-sweep-to-right more">See Details</a>
							 </div>
						</div>
					</div>
					<div class="col-md-3 project-grid">
						<div class="project-grid-top">
							  <a href="single.html" class="mask"><img src="images/ga1.jpg" class="img-responsive zoom-img" alt=""/></a>
							 <div class="col-md1">
								 <div class="col-md2">
									 <div class="col-md3">
									 	<span class="star"> 4.5</span>
									 </div>
									 <div class="col-md4">
									 	<strong>Venice</strong>
									 	<small>50 Reviews</small>
									 </div>
									 <div class="clearfix"> </div>
								 </div>
								 <p>2, 3, 4 BHK Flats</p>
								 <p class="cost">$65,000</p>
								 <a href="single.html" class="hvr-sweep-to-right more">See Details</a>
							 </div>
						</div>
					</div>
					<div class="col-md-3 project-grid">
						<div class="project-grid-top">
							  <a href="single.html" class="mask"><img src="images/ga2.jpg" class="img-responsive zoom-img" alt=""/></a>
							 <div class="col-md1">
								 <div class="col-md2">
									 <div class="col-md3">
									 	<span class="star"> 4.5</span>
									 </div>
									 <div class="col-md4">
									 	<strong>Venice</strong>
									 	<small>50 Reviews</small>
									 </div>
									 <div class="clearfix"> </div>
								 </div>
								 <p>2, 3, 4 BHK Flats</p>
								 <p class="cost">$65,000</p>
								 <a href="single.html" class="hvr-sweep-to-right more">See Details</a>
							 </div>
						</div>
					</div>
					<div class="col-md-3 project-grid">
						<div class="project-grid-top">
							  <a href="single.html" class="mask"><img src="images/ga3.jpg" class="img-responsive zoom-img" alt=""/></a>
							 <div class="col-md1">
								 <div class="col-md2">
									 <div class="col-md3">
									 	<span class="star"> 4.5</span>
									 </div>
									 <div class="col-md4">
									 	<strong>Venice</strong>
									 	<small>50 Reviews</small>
									 </div>
									 <div class="clearfix"> </div>
								 </div>
								 <p>2, 3, 4 BHK Flats</p>
								 <p class="cost">$65,000</p>
								 <a href="single.html" class="hvr-sweep-to-right more">See Details</a>
							 </div>
						</div>
					</div>
					<div class="clearfix"> </div>
				</div>	
		</div>
	</div>-->
<!--//project-->


   

</asp:Content>
