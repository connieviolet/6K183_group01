<%@ Page Title="View All Materials" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="viewAllMaterials.aspx.vb" Inherits="admin_viewAllMaterials" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<h1>View All Materials</h1> <center><asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:cs_SLPL %>" 
        
        SelectCommand="SELECT [MaterialID], [MaterialType], [CallNumber], [Title], [Author], [Publisher], [Copyright], [ISBN], [Description], [Available] FROM [PL_Materials]" 
        DeleteCommand="DELETE FROM [PL_Materials] WHERE [MaterialID] = @MaterialID" 
        InsertCommand="INSERT INTO [PL_Materials] ([MaterialType], [CallNumber], [Title], [Author], [Publisher], [Copyright], [ISBN], [Description], [Available]) VALUES (@MaterialType, @CallNumber, @Title, @Author, @Publisher, @Copyright, @ISBN, @Description, @Available)" 
        
        UpdateCommand="UPDATE [PL_Materials] SET [MaterialType] = @MaterialType, [CallNumber] = @CallNumber, [Title] = @Title, [Author] = @Author, [Publisher] = @Publisher, [Copyright] = @Copyright, [ISBN] = @ISBN, [Description] = @Description, [Available] = @Available WHERE [MaterialID] = @MaterialID">
    
    <DeleteParameters>
        <asp:Parameter Name="MaterialID" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="MaterialType" Type="String" />
        <asp:Parameter Name="CallNumber" Type="String" />
        <asp:Parameter Name="Title" Type="String" />
        <asp:Parameter Name="Author" Type="String" />
        <asp:Parameter Name="Publisher" Type="String" />
        <asp:Parameter Name="Copyright" Type="Int32" />
        <asp:Parameter Name="ISBN" Type="Decimal" />
        <asp:Parameter Name="Description" Type="String" />
        <asp:Parameter Name="Available" Type="String" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="MaterialType" Type="String" />
        <asp:Parameter Name="CallNumber" Type="String" />
        <asp:Parameter Name="Title" Type="String" />
        <asp:Parameter Name="Author" Type="String" />
        <asp:Parameter Name="Publisher" Type="String" />
        <asp:Parameter Name="Copyright" Type="Int32" />
        <asp:Parameter Name="ISBN" Type="Decimal" />
        <asp:Parameter Name="Description" Type="String" />
        <asp:Parameter Name="Available" Type="String" />
        <asp:Parameter Name="MaterialID" Type="Int32" />
    </UpdateParameters>
    </asp:SqlDataSource>
    <h2> Search for a material: <asp:TextBox ID="MaterialSearchTextBox" runat="server"></asp:TextBox>
       <asp:Button ID="Button_search" runat="server" Text="Search" />
    </h2>
    <a href="addNewMaterial.aspx">Add A New Material</a>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="MaterialID" DataSourceID="SqlDataSource1" AllowPaging="True" 
        AllowSorting="True" Width="900px" style="margin-left: 0px">
        <Columns>
            <asp:BoundField DataField="MaterialID" HeaderText="MaterialID" 
                SortExpression="MaterialID" InsertVisible="False" ReadOnly="True" />
            <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
            <asp:BoundField DataField="Author" HeaderText="Author" 
                SortExpression="Author" />
            <asp:BoundField DataField="ISBN" HeaderText="ISBN" SortExpression="ISBN" />
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

