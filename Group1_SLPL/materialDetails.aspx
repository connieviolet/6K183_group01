<%@ Page Title="Material Details" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="materialDetails.aspx.vb" Inherits="materialDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<h1>Material Details</h1><center><asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:cs_SLPL %>" 
        SelectCommand="SELECT [MaterialID], [MaterialType], [CallNumber], [Title], [Author], [Publisher], [Copyright], [ISBN], [Description], [Available], [PhotoName] FROM [PL_Materials] WHERE ([MaterialID] = @MaterialID)">
    <SelectParameters>
        <asp:QueryStringParameter Name="MaterialID" QueryStringField="MaterialID" 
            Type="Int32" />
    </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:cs_SLPL %>" 
        SelectCommand="SELECT [Available] FROM [PL_Available]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
        ConnectionString="<%$ ConnectionStrings:cs_SLPL %>" 
        SelectCommand="SELECT [MaterialType] FROM [dbo.PL_MaterialType]">
    </asp:SqlDataSource>
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="MaterialID" 
        DataSourceID="SqlDataSource1">
        
        <ItemTemplate>
            MaterialID:
            <asp:Label ID="MaterialLabel" runat="server" Text='<%# Bind("MaterialID") %>' />
            <br />
             Title:
            <asp:Label ID="TitleLabel" runat="server" Text='<%# Bind("Title") %>' />
            <br />
            Author:
            <asp:Label ID="AuthorLabel" runat="server" Text='<%# Bind("Author") %>' />
            <br />
            MaterialType:
            <asp:Label ID="MaterialTypeLabel" runat="server" 
                Text='<%# Bind("MaterialType") %>' />
            <br />
            CallNumber:
            <asp:Label ID="CallNumberLabel" runat="server" 
                Text='<%# Bind("CallNumber") %>' />
            <br />
           
           ISBN:
            <asp:Label ID="ISBNLabel" runat="server" Text='<%# Bind("ISBN") %>' />
            <br />
            Description:
            <asp:Label ID="DescriptionLabel" runat="server" 
                Text='<%# Bind("Description") %>' />
            <br />
            Available:
            <asp:Label ID="AvailableLabel" runat="server" Text='<%# Bind("Available") %>' />
            <br />
             <br /> <br />
             <center>
            <asp:DataList ID="MaterialPhotoDataList" runat="server" DataSourceID= "SQLDataSource1">
            <ItemTemplate>
            <asp:Image ID="MaterialImage1" runat="server" ImageUrl='<%# Eval ("PhotoName", "~/images/Materials/{0}") %>' Height= "200px" />
            </ItemTemplate>
            
            
            </asp:DataList></center>
            <a href= "viewAllMaterials.aspx"> View All Materials </a>
        </ItemTemplate>
    </asp:FormView>
  </center>
</asp:Content>

