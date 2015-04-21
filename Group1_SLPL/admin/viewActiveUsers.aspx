<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="viewActiveUsers.aspx.vb" Inherits="admin_viewActiveUsers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:cs_SLPL %>" 
        SelectCommand="SELECT TOP (5) PL_UserExtended.FirstName, PL_UserExtended.LastName, aspnet_Membership_1.LastLoginDate FROM aspnet_Users INNER JOIN PL_UserExtended ON aspnet_Users.UserId = PL_UserExtended.UserID INNER JOIN aspnet_Membership AS aspnet_Membership_1 ON aspnet_Users.UserId = aspnet_Membership_1.UserId ORDER BY aspnet_Membership_1.LastLoginDate DESC">
    </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:cs_SLPL %>" SelectCommand="SELECT TOP(3) aspnet_Users.UserName, PL_UserExtended.FirstName, PL_UserExtended.LastName, aspnet_Membership.FailedPasswordAttemptCount FROM aspnet_Membership INNER JOIN aspnet_Users ON aspnet_Membership.UserId = aspnet_Users.UserId INNER JOIN PL_UserExtended ON aspnet_Users.UserId = PL_UserExtended.UserID
ORDER BY aspnet_Membership.FailedPasswordAttemptCount DESC
"></asp:SqlDataSource>
        <h1> 5 Most Recent Active Users:</h1>
        <p>This page demonstrates the user of a repeater control in ASP.</p>
    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
     <ItemTemplate> 
     <b>First Name:</b>
    <%# DataBinder.Eval(Container.DataItem, "FirstName")%> <br /><b>Last Name: </b> <%# DataBinder.Eval(Container.DataItem, "LastName")%> 
  <br /> <b>Login Time: </b> <%# DataBinder.Eval(Container.DataItem, "LastLoginDate")%> <hr>
    </ItemTemplate> <SeparatorTemplate> <br> </SeparatorTemplate>
    </asp:Repeater>
</asp:Content>

