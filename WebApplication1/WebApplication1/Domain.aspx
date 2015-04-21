<%@ Page Title="Domain Model and Use Case" Language="vb" MasterPageFile="~/Site.Master" AutoEventWireup="false"
    CodeBehind="About.aspx.vb" Inherits="WebApplication1.About" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h1>Business Domain Model</h1>
    <p>This is the domain model for our information system.  It contains a very high level overview of the functions that our information system will accomplish.</p>
    <iframe src="http://instruct.biz.uiowa.edu/courses/6k183/cnoreikis/teamwebsite/ERD.pdf" style="width:718px; height:700px;" frameborder="0"></iframe>
    <h1>Multiplicities and Relations</h1>
    <p> These are the multiplicities and relationships between different classes in our Domain Model.  Multiplicities are a data modeling tool used by 
    developers to identify how classes will relate to eachother.  For example, a material may never be checked out at all, or it may be checked out many times.
    The relationship represents the lines between classes on our diagram.  Each connection on the diagram represents some association between two classes in our 
    information system.</p>
    <iframe src="http://instruct.biz.uiowa.edu/courses/6k183/cnoreikis/teamwebsite/randm.pdf"style="width:718px; height:700px;" frameborder="0"></iframe>
</asp:Content>