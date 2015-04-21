<%@ Page Title="Add New Patron" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="addNewPatron.aspx.vb" Inherits="admin_addNewPatron" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .style1 {
            height: 26px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
<h1>Add a New Patron</h1> <br />
    
       <center> 
           <asp:CreateUserWizard ID="CreateUserWizard1" runat="server" 
        DisplayCancelButton="True" LoginCreatedUser="False" align="center">
            <WizardSteps>
                <asp:CreateUserWizardStep ID="CreateUserWizardStep1" runat="server" >
                    <ContentTemplate>
                        <table>
                            <tr>
                                <td align="center" colspan="2">
                                    Sign Up for Your New Account</td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">User Name:</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="UserName" runat="server" horizontal-align="left"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" 
                                        ControlToValidate="UserName" ErrorMessage="User Name is required." 
                                        ToolTip="User Name is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="Password" runat="server" TextMode="Password" horizontal-align="left"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" 
                                        ControlToValidate="Password" ErrorMessage="Password is required." 
                                        ToolTip="Password is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="ConfirmPasswordLabel" runat="server" 
                                        AssociatedControlID="ConfirmPassword">Confirm Password:</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="ConfirmPassword" runat="server" TextMode="Password" horizontal-align="left"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" 
                                        ControlToValidate="ConfirmPassword" 
                                        ErrorMessage="Confirm Password is required." 
                                        ToolTip="Confirm Password is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="EmailLabel" runat="server" AssociatedControlID="Email">E-mail:</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="Email" runat="server" horizontal-align="left"></asp:TextBox>
                                    
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="QuestionLabel" runat="server" AssociatedControlID="Question">Security Question:</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="Question" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="QuestionRequired" runat="server" 
                                        ControlToValidate="Question" ErrorMessage="Security question is required." 
                                        ToolTip="Security question is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="AnswerLabel" runat="server" AssociatedControlID="Answer">Security Answer:</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="Answer" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="AnswerRequired" runat="server" 
                                        ControlToValidate="Answer" ErrorMessage="Security answer is required." 
                                        ToolTip="Security answer is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" colspan="2">
                                    <asp:CompareValidator ID="PasswordCompare" runat="server" 
                                        ControlToCompare="Password" ControlToValidate="ConfirmPassword" 
                                        Display="Dynamic" 
                                        ErrorMessage="The Password and Confirmation Password must match." 
                                        ValidationGroup="CreateUserWizard1"></asp:CompareValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" colspan="2" style="color:Red;">
                                    <asp:Literal ID="ErrorMessage" runat="server" EnableViewState="False"></asp:Literal>
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                </asp:CreateUserWizardStep>
                <asp:WizardStep ID="UserProfile" runat="server" Title="User Profile">

               
                <table align="center">
                <tr>
                <td align="right">*First Name:</td><td align="left">
                    <asp:TextBox ID="tb_FirstName" runat="server" Columns="50"></asp:TextBox></td>
                </tr>

                <tr>
                <td align="right">*Last Name:</td><td align="left"><asp:TextBox ID="tb_LastName" runat="server" Columns="50"></asp:TextBox></td>
                </tr>

                <tr>
                <td align="right">*Birthday:</td><td align="left"><asp:TextBox ID="tb_Birthday" runat="server" Columns="50"></asp:TextBox>Format: "yyyy-mm-dd"
                    


                    
                    </td>
                </tr>

                <tr>
                <td align="right">*Address 1:</td><td align="left"><asp:TextBox ID="tb_Address1" runat="server" Columns="50"></asp:TextBox></td>
                </tr>

                <tr>
                <td align="right">Address 2:</td><td align="left"><asp:TextBox ID="tb_Address2" runat="server" Columns="50"></asp:TextBox></td>
                </tr>
                
                <tr>
                <td align="right">*City:</td><td align="left"><asp:TextBox ID="tb_City" runat="server" Columns="50"></asp:TextBox></td>
                </tr>

                <tr>
                <td align="right">*Zip Code:</td><td align="left"><asp:TextBox ID="tb_Zip" runat="server" Columns="50"></asp:TextBox></td>
                </tr>

                <tr>
                <td align="right">Primary Phone:</td><td align="left"><asp:TextBox ID="tb_PrimaryPhone" runat="server" Columns="50"></asp:TextBox>
                    <asp:MaskedEditExtender ID="tb_PrimaryPhone_MaskedEditExtender" runat="server" 
                        Mask="999-999-9999"
                        TargetControlID="tb_PrimaryPhone"
                        ClearMaskOnLostFocus="false"
                        MessageValidatorTip="true"
                        OnFocusCssClass="MaskedEditFocus"
            OnInvalidCssClass="MaskedEditError"
            MaskType="None"
            InputDirection="LeftToRight"
            AcceptNegative="Left"
            DisplayMoney="Left" Filtered="-"
            ErrorTooltipEnabled="True" />
                    </td>
                </tr>

                <tr>
                <td align="right">Secondary Phone:</td><td align="left"><asp:TextBox ID="tb_SecondaryPhone" runat="server" Columns="50"></asp:TextBox>
                    <asp:MaskedEditExtender ID="tb_SecondaryPhone_MaskedEditExtender" 
                        runat="server"  Mask="999-999-9999" TargetControlID="tb_SecondaryPhone" ClearMaskOnLostFocus="false" MessageValidatorTip="true"
             OnFocusCssClass="MaskedEditFocus" OnInvalidCssClass="MaskedEditError" MaskType="None" InputDirection="LeftToRight" AcceptNegative="Left" DisplayMoney="Left" Filtered="-"
             ErrorTooltipEnabled="True" />
                 
                    </td>
                </tr>

                <tr>
                <td align="right" class="style1">Email:</td><td align="left" class="style1"><asp:TextBox ID="tb_Email" runat="server" Columns="50"></asp:TextBox></td>
                </tr>
                <tr>
                 <td align="right">State:</td><td align="left">
                    <asp:DropDownList ID="ddl_state" 
                        runat="server" DataSourceID="SqlDataSource1" DataTextField="States" 
                        DataValueField="States"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:cs_SLPL %>" 
                        SelectCommand="SELECT * FROM [us_states]"></asp:SqlDataSource>
                    </td>
                </tr>
                
              
                </table>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate = "tb_FirstName"
                        ErrorMessage="The first name field is required!" CssClass="Error"></asp:RequiredFieldValidator>
                        <br />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator7" CssClass="Error" ControlToValidate = "tb_Birthday" runat="server"
                ValidationExpression="(19[0-9][0-9]|20[0-9][0-9])-([0-9]|0[1-9]|1[012])-[0-2][0-9]" Text="Invalid format for Birthday - Format is yyyy-mm-dd"></asp:RegularExpressionValidator>
                <br />
<asp:RegularExpressionValidator ID="RegularExpressionValidator2" CssClass="Error" ControlToValidate = "tb_Zip" runat="server"
                ValidationExpression="[0-9][0-9][0-9][0-9][0-9]"  ErrorMessage="Incorrect format for zip code"></asp:RegularExpressionValidator>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate = "tb_LastName"
                        ErrorMessage="The last name field is required!" CssClass="Error"></asp:RequiredFieldValidator>
<br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate = "tb_Address1"
                        ErrorMessage="The Address 1 field is required!" CssClass="Error"></asp:RequiredFieldValidator>
<br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate = "tb_City"
                        ErrorMessage="The City field is required!" CssClass="Error"></asp:RequiredFieldValidator>
<br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate = "tb_Zip"
                        ErrorMessage="The Zip Code field is required!" CssClass="Error"></asp:RequiredFieldValidator>
<br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate = "tb_Birthday"
                        ErrorMessage="The Birthday field is required!" CssClass="Error"></asp:RequiredFieldValidator>
                

                <br />
           
                </asp:WizardStep>
                <asp:CompleteWizardStep ID="CompleteWizardStep1" runat="server" >
                </asp:CompleteWizardStep>
            </WizardSteps>
        </asp:CreateUserWizard>
    

           *Indicates Required Field.<br />
    
    </center>
</asp:Content>
