﻿<%@ Page Title="Password Recovery" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="passwordRecovery.aspx.vb" Inherits="passwordRecovery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
 <h1>Forgot Your Password?</h1>
  <center>  <asp:PasswordRecovery ID="PasswordRecovery1" runat="server">
      <UserNameTemplate>
          <table cellpadding="1" cellspacing="0" style="border-collapse:collapse;">
              <tr>
                  <td>
                      <table cellpadding="0">
                          <tr>
                              <td align="center" colspan="2">
                                  &nbsp;</td>
                          </tr>
                          <tr>
                              <td align="center" colspan="2">
                                  Enter your User Name to receive your password.</td>
                          </tr>
                          <tr>
                              <td align="right">
                                  <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">User Name:</asp:Label>
                              </td>
                              <td>
                                  <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                                  <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" 
                                      ControlToValidate="UserName" ErrorMessage="User Name is required." 
                                      ToolTip="User Name is required." ValidationGroup="PasswordRecovery1">*</asp:RequiredFieldValidator>
                              </td>
                          </tr>
                          <tr>
                              <td align="center" colspan="2" style="color:Red;">
                                  <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                              </td>
                          </tr>
                          <tr>
                              <td align="right" colspan="2">
                                  <asp:Button ID="SubmitButton" runat="server" CommandName="Submit" Text="Submit" 
                                      ValidationGroup="PasswordRecovery1" />
                              </td>
                          </tr>
                      </table>
                  </td>
              </tr>
          </table>
      </UserNameTemplate>
    </asp:PasswordRecovery></center>

</asp:Content>

