<%@ Page Title="" Language="C#" MasterPageFile="~/sitemaster.Master" AutoEventWireup="true" CodeFile="offers_and_promotion.aspx.cs" Inherits="offers_and_promotion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>



    .video_youtube{
        margin-top:0.5%;
        
    }
    .listitem{
        
        display:block;
        float:left;
        border:4px solid black;
        margin-right:4px;
        margin-left:6%;
    }
    .mylist li{
        
        float:left;
        width:25%;
    }
   .listitem_video{
       
        float:left;
        margin:10px;
        width:100%;
        hight:50%;
   }
    .clear{clear:both;}
    #photos{
       margin:5%;
        display:none;
    }
    #videos{
        margin:5%;
        display:none;
    }
    </style>
    <script>
        function showDiv() {
            var x = document.getElementById("mySelect").selectedIndex;
            var y = document.getElementById("mySelect").options;
            var value = y[x].text;
            if (value == "Photos") {
                document.getElementById("photos").style.display = 'block';
                document.getElementById("videos").style.display = 'none';
               
            }
            else {
               
                document.getElementById("videos").style.display = 'block';
                document.getElementById("photos").style.display = 'none';
            }
           
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <h3 class="gallery_heading" style="margin-top:30px;">Gallery </h3><br />

         

      <nav class="dropdown">
         <select id="mySelect" onchange="showDiv()">
             <option>Please Select Gallery Type</option>
			<option>videos</option>
		    <option>Photos</option>
             
			</select>
		</nav>
	

     <div>
         
        
     <div id="videos">
         <h4 class="videos_gallery">Videos Gallery</h4>
         <ul class="mylist">
            <li class="listitem_video"><iframe class="video_youtube" width="100%" height="100%" src="https://www.youtube.com/embed/60AyJgWK84w" frameborder="0" allowfullscreen></iframe></li>
            <li class="listitem_video"><iframe class="video_youtube" width="100%" height="100%" src="https://www.youtube.com/embed/60AyJgWK84w" frameborder="0" allowfullscreen></iframe></li>
         </ul>
     </div>
     <!--<iframe  class="video_youtube" width="80%" height="640" src="https://www.youtube.com/embed/ZEuwu7Sr5G4" frameborder="0" allowfullscreen></iframe>-->
     
        <div class="clear" id="photos">
             <h4 class="videos_gallery">Photo Gallery</h4>
           <ul class="mylist">
              <li class="listitem"><img src="Images/img2.jpg" width="100%" /></li>
              <li class="listitem"><img src="Images/img2.jpg" width="100%" /></li>
               <li class="listitem"><img src="Images/img2.jpg" width="100%"  /></li>
               <li class="listitem"><img src="Images/img2.jpg" width="100%" /></li>
              <li class="listitem"><img src="Images/img2.jpg"  width="100%" /></li>
               <li class="listitem"><img src="Images/img2.jpg" width="100%" /></li>
              <li class="listitem"><img src="Images/img2.jpg"  width="100%"/></li>
              <li class="listitem"><img src="Images/img2.jpg" width="100%" /></li>
           </ul>
       </div>
    </div>
    <div class="clear"></div>
</asp:Content>

