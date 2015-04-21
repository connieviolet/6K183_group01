<%@ Page Title="Overdue Materials" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="overdueMaterials.aspx.vb" Inherits="admin_materialsDueToday" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <h1>Overdue Material Report</h1> <br /> <br />
   
   <center><asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:cs_SLPL %>" 
        
           SelectCommand="SELECT PL_UserExtended.FirstName, PL_UserExtended.LastName, PL_Materials.Title, PL_Rentals.DateDueBack, PL_UserExtended.PrimaryPhone, PL_UserExtended.Email, PL_Materials.MaterialID, PL_Materials.Author FROM aspnet_Users INNER JOIN PL_UserExtended ON aspnet_Users.UserId = PL_UserExtended.UserID INNER JOIN PL_Rentals ON aspnet_Users.UserId = PL_Rentals.UserID INNER JOIN PL_Materials ON PL_Rentals.MaterialID = PL_Materials.MaterialID WHERE (PL_Rentals.DateDueBack &lt; @Datedueback)">
       <SelectParameters>
           <asp:ControlParameter ControlID="Label1" Name="Datedueback" 
               PropertyName="Text" />
       </SelectParameters>
    </asp:SqlDataSource>
    <p>
    </p>
    <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="MaterialID" 
        DataSourceID="SqlDataSource1" Width="778px">
        <Columns>
            <asp:BoundField DataField="FirstName" HeaderText="FirstName" 
                SortExpression="FirstName" />
            <asp:BoundField DataField="LastName" HeaderText="LastName" 
                SortExpression="LastName" />
            <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
            <asp:BoundField DataField="DateDueBack" HeaderText="DateDueBack" DataFormatString="{0:M-dd-yyyy}"
                SortExpression="DateDueBack" />
            <asp:BoundField DataField="PrimaryPhone" HeaderText="PrimaryPhone" 
                SortExpression="PrimaryPhone" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
            <asp:BoundField DataField="MaterialID" HeaderText="MaterialID" 
                InsertVisible="False" ReadOnly="True" SortExpression="MaterialID" />
            <asp:BoundField DataField="Author" HeaderText="Author" 
                SortExpression="Author" />
        </Columns>
    </asp:GridView></center> 
</asp:Content>

