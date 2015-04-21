<%@ Page Title="Rules, Constraints, Dictionary" Language="vb" MasterPageFile="~/Site.Master" AutoEventWireup="false"
    CodeBehind="About.aspx.vb" Inherits="WebApplication1.About" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
<h1>Business Rules, Constraints, and Dictionary</h1>
<p> Business rules are essential business processes that our information system must follow.  All rules must be able to be evaluated in terms 
of a true / false statement.  For example, a patron may check out, at most, 10 items.  This statement can be evaluated as true or false when a patron
checks out materials.</p>
<p>Busienss constraints are properties that our system must follow.  For example, all coding must be done to corporate standards.</p>
<p>The dictionary is a set of terms that librarians or our information system will use.  The librarians currently at South Central Library have a 
system set up that we must account for in our dictionary.  In addition, we have defined user classes that are also important to add to our dictionary.</p>
    <iframe src="http://instruct.biz.uiowa.edu/courses/6k183/cnoreikis/teamwebsite/BR.pdf" style="width:718px; height:700px;" frameborder="0"></iframe>
</asp:Content>