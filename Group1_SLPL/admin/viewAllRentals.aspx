<%@ Page Title="View All Rentals" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="viewAllRentals.aspx.vb" Inherits="admin_viewAllRentals" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<h1>View All Rentals</h1><br /> <br />
   <center> <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:cs_SLPL %>" 
        SelectCommand="SELECT PL_Rentals.RentalID, PL_Rentals.UserID, PL_Rentals.MaterialID, PL_Rentals.RentDate, PL_Rentals.DateDueBack, aspnet_Users.UserName, PL_Materials.Title FROM PL_Rentals INNER JOIN aspnet_Users ON PL_Rentals.UserID = aspnet_Users.UserId INNER JOIN PL_Materials ON PL_Rentals.MaterialID = PL_Materials.MaterialID"></asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="RentalID" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="RentalID" HeaderText="RentalID" 
                InsertVisible="False" ReadOnly="True" SortExpression="RentalID" />
            <asp:BoundField DataField="UserID" HeaderText="UserID" 
                SortExpression="UserID" />
            <asp:BoundField DataField="MaterialID" HeaderText="MaterialID" 
                SortExpression="MaterialID" />
            <asp:BoundField DataField="RentDate" HeaderText="RentDate" 
                SortExpression="RentDate" />
            <asp:BoundField DataField="DateDueBack" HeaderText="DateDueBack" 
                SortExpression="DateDueBack" />
            <asp:BoundField DataField="UserName" HeaderText="UserName" 
                SortExpression="UserName" />
            <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
            <asp:HyperLinkField DataNavigateUrlFields="MaterialID" 
                DataNavigateUrlFormatString="materialDetails.aspx?materialID={0}" 
                Text="Material Details" />
        </Columns>
    </asp:GridView></center>
</asp:Content>

