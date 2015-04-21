<%@ Page Title="View All Materials" Language="VB" MasterPageFile="~/MobileMaster.master" AutoEventWireup="false" CodeFile="viewAllMaterials.aspx.vb" Inherits="admin_viewAllMaterials" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <h1>View all materials</h1><asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:cs_SLPL %>" 
        
        SelectCommand="SELECT [MaterialID], [MaterialType], [CallNumber], [Title], [Author], [Publisher], [Copyright], [ISBN], [Description] FROM [PL_Materials]" 
        DeleteCommand="DELETE FROM [PL_Materials] WHERE [MaterialID] = @MaterialID" 
        InsertCommand="INSERT INTO [PL_Materials] ([MaterialType], [CallNumber], [Title], [Author], [Publisher], [Copyright], [ISBN], [Description]) VALUES (@MaterialType, @CallNumber, @Title, @Author, @Publisher, @Copyright, @ISBN, @Description)" 
        UpdateCommand="UPDATE [PL_Materials] SET [MaterialType] = @MaterialType, [CallNumber] = @CallNumber, [Title] = @Title, [Author] = @Author, [Publisher] = @Publisher, [Copyright] = @Copyright, [ISBN] = @ISBN, [Description] = @Description WHERE [MaterialID] = @MaterialID">
    
    <DeleteParameters>
        <asp:Parameter Name="MaterialID" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="MaterialType" Type="String" />
        <asp:Parameter Name="CallNumber" Type="String" />
        <asp:Parameter Name="Title" Type="String" />
        <asp:Parameter Name="Author" Type="String" />
        <asp:Parameter Name="Publisher" Type="String" />
        <asp:Parameter Name="Copyright" Type="Double" />
        <asp:Parameter Name="ISBN" Type="Double" />
        <asp:Parameter Name="Description" Type="String" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="MaterialType" Type="String" />
        <asp:Parameter Name="CallNumber" Type="String" />
        <asp:Parameter Name="Title" Type="String" />
        <asp:Parameter Name="Author" Type="String" />
        <asp:Parameter Name="Publisher" Type="String" />
        <asp:Parameter Name="Copyright" Type="Double" />
        <asp:Parameter Name="ISBN" Type="Double" />
        <asp:Parameter Name="Description" Type="String" />
        <asp:Parameter Name="MaterialID" Type="Int32" />
    </UpdateParameters>
    </asp:SqlDataSource>
    <h2> Search for a material: <asp:TextBox ID="MaterialSearchTextBox" runat="server"></asp:TextBox>
       <asp:Button ID="Button_search" runat="server" Text="Search" />
    </h2>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="MaterialID" DataSourceID="SqlDataSource1" AllowPaging="True" 
        AllowSorting="True" Width="500px">
        <Columns>
            <asp:BoundField DataField="MaterialID" HeaderText="MaterialID" 
                SortExpression="MaterialID" InsertVisible="False" ReadOnly="True" />
            <asp:BoundField DataField="MaterialType" HeaderText="MaterialType" 
                SortExpression="MaterialType" />
            <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
            <asp:BoundField DataField="Author" HeaderText="Author" 
                SortExpression="Author" />
        </Columns>
    </asp:GridView>
    
</asp:Content>

