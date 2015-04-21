<%@ Page Title="View All Materials" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="viewAllMaterials.aspx.vb" Inherits="admin_viewAllMaterials" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<h1> View All Materials </h1> <center><asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:cs_SLPL %>"
        
        
        SelectCommand="SELECT [Title], [Author], [ISBN], [MaterialID], [Available], [Description], [MaterialType], [CallNumber], [Copyright], [Publisher] FROM [PL_Materials]">
    </asp:SqlDataSource> 
    <h2> Search for a material: <asp:TextBox ID="MaterialSearchTextBox" runat="server"></asp:TextBox>
       <asp:Button ID="Button_search" runat="server" Text="Search" />
    </h2>
    
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="MaterialID" DataSourceID="SqlDataSource1" AllowPaging="True" 
        AllowSorting="True" Width="972px">
        <Columns>
            <asp:BoundField DataField="Title" HeaderText="Title" 
                SortExpression="Title" />
            <asp:BoundField DataField="Author" HeaderText="Author" 
                SortExpression="Author" />
            <asp:BoundField DataField="Description" HeaderText="Description" 
                SortExpression="Description" />
            <asp:BoundField DataField="Available" HeaderText="Available" 
                SortExpression="Available" />
            <asp:HyperLinkField DataNavigateUrlFields="MaterialID" 
                DataNavigateUrlFormatString="materialDetails.aspx?MaterialID={0}" 
                Text="Select" />
        </Columns>
    </asp:GridView>
    </center>
</asp:Content>

