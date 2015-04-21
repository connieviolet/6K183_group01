<%@ Page Title="Cost Details" Language="vb" MasterPageFile="~/Site.Master" AutoEventWireup="false"
    CodeBehind="About.aspx.vb" Inherits="WebApplication1.About" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h1>Cost Details</h1>
    <p>These are all of the things that we are spending money on.  We include these materials in three seperate sections: one time purchases, recurring charges, and development charges.
    This is an important distinction because it shows us what cash flows will look like in year one, and in following years.  These are both very important
    factors to consider when analyzing economic feasibility of an information system.</p>
    <iframe src="http://instruct.biz.uiowa.edu/courses/6k183/cnoreikis/teamwebsite/cost%20detailsnew.pdf" style="width:718px; height:700px;" frameborder="1"></iframe>
    <h1>Cost Benefit Analysis</h1>
    <p> This is a Excel spreadsheet made for ecnomic analytics.  It explicitly states all cash flows for multiple years, so that management can analyze
    costs and benefits.  As we expect, net cash flow is negative in year one.  However, as time goes on, we see that this system provides ecnomic benifit to
    the South Liberty Public Library. </p>
    <iframe src="http://instruct.biz.uiowa.edu/courses/6k183/cnoreikis/teamwebsite/Cost_Benefit_Analysis.pdf" style="width:718px; height:700px;" frameborder="1"></iframe>
    
</asp:Content>
