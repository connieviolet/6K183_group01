<%@ Page Title="Rent Material" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="RentMaterial.aspx.vb" Inherits="admin_RentMaterial" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    
    
    <h1>Rent Material</h1> <br />
   <center> User Name: <asp:TextBox ID="userNameTextBox" runat="server"></asp:TextBox>
    <br />
    <br />

    <p>
    Material ID:<asp:TextBox ID="materialIDTextBox" runat="server"></asp:TextBox>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:cs_SLPL %>" 
            SelectCommand="SELECT [MaterialID] FROM [PL_Materials]"></asp:SqlDataSource>
        <br /> <br />
        <asp:Button ID="rentButton" runat="server" Text="Rent" />
        <br />
        <asp:Label ID="Label1" CssClass="Error" runat="server"></asp:Label>
    </p>
   <center><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate = "materialIDTextBox"
                        ErrorMessage="The material ID is required!" CssClass="Error"></asp:RequiredFieldValidator>
    </center> <br />
     <center><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate = "userNameTextBox"
                    ErrorMessage="The patron user name is required!" CssClass="Error"></asp:RequiredFieldValidator>
                    </center> 
 <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="materialIDTextBox" runat="server" ErrorMessage="Only Numbers allowed in Material ID Field." ValidationExpression="\d+"></asp:RegularExpressionValidator>
</asp:Content>

