<%@ Page Title="Return Material" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="returnMaterial.aspx.vb" Inherits="admin_returnMaterial" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<h1>Return Material</h1> <br /> <br />
   <center> Material ID to be Returned:<asp:TextBox ID="materialIDTextBox" runat="server"></asp:TextBox>
    <br /> <br />
   <center><asp:Button ID="returnButton" runat="server" Text="Return" /></center> 
       <center> <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate = "materialIDTextBox"
                        ErrorMessage="The material ID is required!" CssClass="Error"></asp:RequiredFieldValidator></center>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ControlToValidate="materialIDTextBox" runat="server" ErrorMessage="Only Numbers allowed in ISBN field." ValidationExpression="\d+"></asp:RegularExpressionValidator>
</center></asp:Content>

