<%@ Page Title="Home" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">

<center><h1>Welcome to South Liberty Public Library</h1>
 <p>This is the place where dreams come true.</p></center>
 <center><asp:Image ID="Image1" runat="server" Height="500px" 
                        ImageUrl="~/images/library.jpg" Width="500px" alt="Image not available"/>
     <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
     </asp:Repeater>
     <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
         ConnectionString="<%$ ConnectionStrings:cs_SLPL %>" 
         SelectCommand="SELECT COUNT(*) AS Expr1 FROM PL_Materials WHERE (Available = 'Y')">
     </asp:SqlDataSource>
    </center>
 <center>Current materials available for circulation: 
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></center>
</asp:Content>