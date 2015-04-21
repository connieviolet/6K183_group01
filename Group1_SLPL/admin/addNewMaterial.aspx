<%@ Page Title="Add New Material" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="addNewMaterial.aspx.vb" Inherits="admin_addNewMaterials2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

<h1>Add New Material</h1> <center>

    <asp:FormView ID="FormView1" runat="server" DefaultMode="Insert" HorizontalAlign="Center">
        <InsertItemTemplate>
    <table align="center">
    <tr>
    <td align = "right"> *Title: </td><td align="left"><asp:TextBox ID= "tb_MaterialName" runat = "server" Text='<%# Bind("Title") %>'/></td>
    </tr>

    <tr>
    <td align = "right"> *Material Type: </td><td align="left"><asp:DropDownList ID="ddl_MaterialType" runat="server" DataSourceID="SqlDataSource2" DataTextField="MaterialType" DataValueField="MaterialType" SelectedValue='<%# Bind("MaterialType") %>'>
</asp:DropDownList></td>

    <tr>
    <td align = "right"> *Call Number: </td><td align="left"><asp:TextBox ID= "tb_CallNumber" runat = "server" Text='<%# Bind("CallNumber") %>'/></td>
    </tr>

    <tr>
    <td align = "right"> Author: </td><td align="left"><asp:TextBox ID= "tb_Author" runat = "server" Text='<%# Bind("Author") %>'/></td>
    </tr>

    <tr>
    <td align = "right"> *Publisher: </td><td align="left"><asp:TextBox ID= "tb_Publisher" runat = "server" Text='<%# Bind("Publisher") %>'/></td>
    </tr>

    <tr>
    <td align = "right"> *Copyright: </td><td align="left"><asp:TextBox ID= "tb_Copyright" runat = "server" Text='<%# Bind("Copyright") %>'/>

        </td>
    </tr>

    <tr>
    <td align = "right"> *ISBN: </td><td align="left"><asp:TextBox ID= "tb_ISBN" runat = "server" Text='<%# Bind("ISBN") %>'/>

        </td>
    </tr>

    <tr>
    <td align = "right"> Description: </td><td align="left"><asp:TextBox ID= "tb_Description" runat = "server" Text='<%# Bind("Description") %>'/></td>
    </tr>

    <tr>
    <td align = "right"> Available: </td><td align="left"><asp:DropDownList ID="ddl_Available" runat="server" DataSourceID="SqlDataSource3" DataTextField="Available" DataValueField="Available" SelectedValue='<%# Bind("Available") %>'>
</asp:DropDownList></td>
    
    <tr>
    <td align="right">File Name: </td><td align="left"><asp:FileUpload ID="FileUpload1" runat="server"  /></td>
    </tr>
    </table>

       <center> <asp:Button ID="InsertButton1" cssclass="InsertButton1" runat="server" CausesValidation="True" 
            CommandName="Insert1" Text="Add New Item" onclick="InsertButton1_Click" align="center" /></center>
                <center><asp:Button ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />   
    </center><center><asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="tb_Copyright" runat="server" ErrorMessage="Only Numbers allowed in Copyright Field." ValidationExpression="\d+"></asp:RegularExpressionValidator>
   
   
    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ControlToValidate="tb_ISBN" runat="server" ErrorMessage="Only Numbers allowed in ISBN field." ValidationExpression="\d+"></asp:RegularExpressionValidator>
        <br />
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate = "tb_MaterialName"
                        ErrorMessage="The material title is required!" CssClass="Error"></asp:RequiredFieldValidator>
        <br />
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate = "tb_CallNumber"
                        ErrorMessage="The call number is required!" CssClass="Error"></asp:RequiredFieldValidator>
        <br />
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate = "tb_Publisher"
                        ErrorMessage="The publisher name is required!" CssClass="Error"></asp:RequiredFieldValidator>
        <br />
    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate = "tb_Copyright"
                        ErrorMessage="The copyright field is required!" CssClass="Error"></asp:RequiredFieldValidator>
        <br />
    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate = "tb_ISBN"
                        ErrorMessage="The ISBN field is required!" CssClass="Error"></asp:RequiredFieldValidator>
        &nbsp; &nbsp;

        &nbsp; &nbsp;</center>

    </InsertItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:cs_SLPL %>" 
        SelectCommand="SELECT * FROM [MaterialType]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
        ConnectionString="<%$ ConnectionStrings:cs_SLPL %>" 
        SelectCommand="SELECT * FROM [PL_Available]"></asp:SqlDataSource>
     </center>
    </asp:Content>

