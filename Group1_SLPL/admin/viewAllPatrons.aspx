<%@ Page Title="View All Patrons" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="viewAllPatrons.aspx.vb" Inherits="admin_viewAllPatrons" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <h1>View All Patrons<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:cs_SLPL %>" 
        
        SelectCommand="SELECT * FROM [PL_UserExtended]"></asp:SqlDataSource>
   </h1><center><h2> Search for a patron: <asp:TextBox ID="PatronSearchTextBox" runat="server"></asp:TextBox>
       <asp:Button ID="Button_search" runat="server" Text="Search" />
    </h2>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="UserID" DataSourceID="SqlDataSource1" AllowPaging="True" 
        AllowSorting="True" Width="971px">
        <Columns>
            <asp:BoundField DataField="UserID" HeaderText="UserID" ReadOnly="True" 
                SortExpression="UserID" />
            <asp:BoundField DataField="FirstName" HeaderText="FirstName" 
                SortExpression="FirstName" />
            <asp:BoundField DataField="LastName" HeaderText="LastName" 
                SortExpression="LastName" />
            <asp:BoundField DataField="Birthday" HeaderText="Birthday" 
                SortExpression="Birthday" DataFormatString="{0:M-dd-yyyy}" />
            <asp:BoundField DataField="Address1" HeaderText="Address1" 
                SortExpression="Address1" />
            <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
            <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
            <asp:BoundField DataField="PrimaryPhone" HeaderText="PrimaryPhone" 
                SortExpression="PrimaryPhone" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
            <asp:HyperLinkField DataNavigateUrlFields="UserID" 
                DataNavigateUrlFormatString="patronDetails.aspx?userID={0}" Text="Select" />
        </Columns>
    </asp:GridView>
    </center>
</asp:Content>

