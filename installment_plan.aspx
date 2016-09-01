<%@ Page Title="" Language="C#" MasterPageFile="~/sitemaster.Master" AutoEventWireup="true" CodeFile="installment_plan.aspx.cs" Inherits="installment_plan" %>
<%@ Import Namespace="System.Data"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        @import url(http://fonts.googleapis.com/css?family=Roboto:400,500,700,300,100);

body {
  font-family: "Roboto", helvetica, arial, sans-serif;
  font-size: 16px;
  font-weight: 400;
  text-rendering: optimizeLegibility;
}

div.table-title {
   display: block;
  margin: auto;
  max-width: 600px;
  padding:1px;
  width: 100%;
}




/*** Table Styles **/

.table-fill {
  background: white;

  border-radius:3px;
  border-collapse: collapse;
  height: 320px;
  margin: auto;
  max-width: 100%;
  padding:1px;
  width: 100%;
  box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
  animation: float 5s infinite;
  
}
 
th {
    color:#C19E45;
    background-color:#171721;
  background-image:url("TablePics/hrdarkblue.jpg");
  /*background:#1b1e24;*/
  border-bottom:4px solid #9ea7af;
  border-right: 0px solid #343a45;
  font-size:18px;
  font-weight: bolder;
  padding:1px;
  text-align:left;
  text-shadow: 0 1px 1px rgba(0, 0, 0, 0.1);
  vertical-align:middle;
}

th:first-child {
}
 
th:last-child {
  border-top-right-radius:3px;
  border-right:none;
}
  
tr {
  border-top: 1px solid #C1C3D1;
  border-bottom: 1px solid #C1C3D1;
  background-image:url("TablePics/cell-blue.jpg");
  /*color:#666B85;*/
  font-size:16px;
  font-weight:bold;
  text-shadow: 0 1px 1px rgba(256, 256, 256, 0.1);
}
 
tr:hover td {
  background:#4E5066;
  color:#FFFFFF;
  border-top: 1px solid #22262e;
  border-bottom: 1px solid #22262e;
}
 
tr:first-child {
  border-top:none;
}

tr:last-child {
  border-bottom:none;
}
 
tr:nth-child(odd) td {
  background:#EBEBEB;
}
 
tr:nth-child(odd):hover td {
  background:#4E5066;
}

tr:last-child td:first-child {
  border-bottom-left-radius:3px;
}
 
tr:last-child td:last-child {
  border-bottom-right-radius:3px;
}
 
td {
  /*background:#FFFFFF;*/
    background-image:url("TablePics/cell-blue.jpg");
  padding:1px;
  text-align:left;
  vertical-align:middle;
  font-weight:bold;
  font-size:16px;
  
  text-shadow: -1px -1px 1px rgba(0, 0, 0, 0.1);
  border-right: 1px solid #C1C3D1;
}

td:last-child {
  border-right: 0px;
}

th.text-left {
  text-align: left;
}

th.text-center {
  text-align: center;
}

th.text-right {
  text-align: right;
}

td.text-left {
  text-align: left;
}

td.text-center {
  text-align: center;
}

td.text-right {
  text-align: right;
}
.h3installment{
    font-size: 2.5em;
    padding-left: 15%;
    margin-top:30px;
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <div class="table-title">
<h3 class="h3installment">Installment Plan</h3>
</div>
<table class="table">
  <thead class="thead-inverse">;
    <tr>
      <th>Plot Size</th>
        <% DataTable tb=installmentplan.view(); %>
         <% foreach (DataRow row in tb.Rows)
              {%>
                <th>
                     <%=row["Marla"].ToString() %>
                    <br />(100 sqd)
                </th>
          <%} %>
    </tr>
  </thead>
  <tbody>
      
          
      <tr>
      <th scope="row">Marla/Kanal</th>
          <% foreach (DataRow row in tb.Rows)
              {%>
                <td>
                     <%=row["plot_size"].ToString() %>
                </td>
          <%} %>
    </tr>
    <tr>
      <th scope="row">Membership Fee</th>
       <% foreach (DataRow row in tb.Rows)
              {%>
                <td>
                     <%=row["membership_fee"].ToString() %>
                </td>
          <%} %>
    </tr>
    <tr>
      <th scope="row">Total Cost Of Plot</th>
      
       <% foreach (DataRow row in tb.Rows)
              {%>
                <td>
                     <%=row["totalcost"].ToString() %>
                </td>
          <%} %>
    </tr>
    <tr>
      <th scope="row">Down Payment</th>
      <% foreach (DataRow row in tb.Rows)
              {%>
                <td>
                     <%=row["down_payment"].ToString() %>
                </td>
          <%} %>
    </tr>
      <tr>
      <th scope="row">Installment Per Month</th>
      <% foreach (DataRow row in tb.Rows)
              {%>
                <td>
                     <%=row["installment_cost_per_month"].ToString() %>
                </td>
          <%} %>
    </tr>
      
      <tr>
      <th>10% Discount on lum sum total price of plot</th>
      <% foreach (DataRow row in tb.Rows)
              {%>
                <td>
                     <%=row["lum_sum_discount"].ToString() %>
                </td>
          <%} %>

    </tr>
  </tbody>
</table>
   
</asp:Content>

