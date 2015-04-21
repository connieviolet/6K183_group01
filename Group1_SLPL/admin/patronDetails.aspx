<%@ Page Title="Patron Details" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="patronDetails.aspx.vb" Inherits="admin_patronDetails" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
<title>View, edit, & delete patrons</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
        ConnectionString="<%$ ConnectionStrings:cs_SLPL %>" 
        SelectCommand="SELECT PL_Materials.MaterialID, PL_Materials.Title, PL_Materials.Author, PL_Materials.ISBN, PL_Materials.CallNumber, PL_Rentals.DateDueBack FROM PL_Rentals INNER JOIN PL_Materials ON PL_Rentals.MaterialID = PL_Materials.MaterialID WHERE (PL_Rentals.UserID = @UserID)">
        <SelectParameters>
            <asp:QueryStringParameter Name="UserID" QueryStringField="UserID" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:cs_SLPL %>" 
        
        DeleteCommand = "DELETE FROM [aspnet_Users] WHERE [UserID] = @UserID"

        UpdateCommand = "UPDATE [PL_UserExtended] SET [FirstName] = @FirstName, [LastName] = @LastName, [City] = @City, [Birthday] = @Birthday, [Address1] = @Address1, [Address2] = @Address2, [State] = @State, [ZipCode] = @ZipCode, [Email] = @Email, [PrimaryPhone] = @PrimaryPhone, [SecondaryPhone] = @SecondaryPhone WHERE [UserID] = @UserID"

        
        SelectCommand="SELECT PL_UserExtended.FirstName, PL_UserExtended.LastName, aspnet_Users.UserName, aspnet_Roles.RoleName, PL_UserExtended.UserID, PL_UserExtended.Birthday, PL_UserExtended.Address1, PL_UserExtended.Address2, PL_UserExtended.City, PL_UserExtended.State, PL_UserExtended.ZipCode, PL_UserExtended.PrimaryPhone, PL_UserExtended.SecondaryPhone, PL_UserExtended.Email FROM PL_UserExtended INNER JOIN aspnet_Users ON PL_UserExtended.UserID = aspnet_Users.UserId INNER JOIN aspnet_Roles ON aspnet_Users.ApplicationId = aspnet_Roles.ApplicationId INNER JOIN aspnet_UsersInRoles ON aspnet_Users.UserId = aspnet_UsersInRoles.UserId AND aspnet_Roles.RoleId = aspnet_UsersInRoles.RoleId WHERE (aspnet_Users.UserId = @UserID)">

        <DeleteParameters>
            <asp:Parameter Name="UserID" />
        </DeleteParameters>

        <SelectParameters>
            <asp:QueryStringParameter Name="UserID" QueryStringField="UserID" />
        </SelectParameters>

        <UpdateParameters>
        <asp:parameter Name="FirstName" Type="String" />
        <asp:parameter Name="LastName" Type="String" />
        <asp:parameter Name="City" Type="String" />
        <asp:parameter Name="Birthday" Type="String" />
        <asp:parameter Name="Address1" Type="String" />
        <asp:parameter Name="Address2" Type="String" />
        <asp:parameter Name="State" Type="String" />
        <asp:parameter Name="ZipCode" Type="String" />
        <asp:parameter Name="Email" Type="String" />
        <asp:parameter Name="PrimaryPhone" Type="String" />
        <asp:parameter Name="SecondaryPhone" Type="String" />
            <asp:Parameter Name="UserID" />
        </UpdateParameters>


    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:cs_SLPL %>" 
        SelectCommand="SELECT * FROM [us_states]"></asp:SqlDataSource>
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="UserID" 
        DataSourceID="SqlDataSource1" Width="249px">
        <EditItemTemplate>
            FirstName:
            <asp:TextBox ID="FirstNameTextBox" runat="server" 
                Text='<%# Bind("FirstName") %>' />
            <br />
            LastName:
            <asp:TextBox ID="LastNameTextBox" runat="server" 
                Text='<%# Bind("LastName") %>' />
            <br />
            UserName:
            <asp:TextBox ID="UserNameTextBox" runat="server" 
                Text='<%# Bind("UserName") %>' />
            <br />
            RoleName:
            <asp:TextBox ID="RoleNameTextBox" runat="server" 
                Text='<%# Bind("RoleName") %>' />
            <br />
            UserID:
            <asp:Label ID="UserIDLabel1" runat="server" Text='<%# Eval("UserID") %>' />
            <br />
            Birthday:
            <asp:TextBox ID="BirthdayTextBox" runat="server" 
                Text='<%# Bind("Birthday", "{0:M-dd-yyyy}") %>' />
            <br />
            Address1:
            <asp:TextBox ID="Address1TextBox" runat="server" 
                Text='<%# Bind("Address1") %>' />
            <br />
            Address2:
            <asp:TextBox ID="Address2TextBox" runat="server" 
                Text='<%# Bind("Address2") %>' />
            <br />
            City:
            <asp:TextBox ID="CityTextBox" runat="server" Text='<%# Bind("City") %>' />
            <br />
            State:
            <asp:TextBox ID="StateTextBox" runat="server" Text='<%# Bind("State") %>' />
            <br />
            ZipCode:
            <asp:TextBox ID="ZipCodeTextBox" runat="server" Text='<%# Bind("ZipCode") %>' />
            <br />
            PrimaryPhone:
            <asp:TextBox ID="PrimaryPhoneTextBox" runat="server" 
                Text='<%# Bind("PrimaryPhone") %>' />
            <br />
            SecondaryPhone:
            <asp:TextBox ID="SecondaryPhoneTextBox" runat="server" 
                Text='<%# Bind("SecondaryPhone") %>' />
            <br />
            Email:
            <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            FirstName:
            <asp:TextBox ID="FirstNameTextBox" runat="server" 
                Text='<%# Bind("FirstName") %>' />
            <br />
            LastName:
            <asp:TextBox ID="LastNameTextBox" runat="server" 
                Text='<%# Bind("LastName") %>' />
            <br />
            UserName:
            <asp:TextBox ID="UserNameTextBox" runat="server" 
                Text='<%# Bind("UserName") %>' />
            <br />
            RoleName:
            <asp:TextBox ID="RoleNameTextBox" runat="server" 
                Text='<%# Bind("RoleName") %>' />
            <br />
            UserID:
            <asp:TextBox ID="UserIDTextBox" runat="server" 
                Text='<%# Bind("UserID") %>' />
            <br />
            Birthday:
            <asp:TextBox ID="BirthdayTextBox" runat="server" 
                Text='<%# Bind("Birthday", "{0:M-dd-yyyy}") %>' />
            <br />
            Address1:
            <asp:TextBox ID="Address1TextBox" runat="server" 
                Text='<%# Bind("Address1") %>' />
            <br />
            Address2:
            <asp:TextBox ID="Address2TextBox" runat="server" 
                Text='<%# Bind("Address2") %>' />
            <br />
            City:
            <asp:TextBox ID="CityTextBox" runat="server" Text='<%# Bind("City") %>' />
            <br />
            State:
            <asp:TextBox ID="StateTextBox" runat="server" Text='<%# Bind("State") %>' />
            <br />
            ZipCode:
            <asp:TextBox ID="ZipCodeTextBox" runat="server" Text='<%# Bind("ZipCode") %>' />
            <br />
            PrimaryPhone:
            <asp:TextBox ID="PrimaryPhoneTextBox" runat="server" 
                Text='<%# Bind("PrimaryPhone") %>' />
            <br />
            SecondaryPhone:
            <asp:TextBox ID="SecondaryPhoneTextBox" runat="server" 
                Text='<%# Bind("SecondaryPhone") %>' />
            <br />
            Email:
            <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            FirstName:
            <asp:Label ID="FirstNameLabel" runat="server" Text='<%# Bind("FirstName") %>' />
            <br />
            LastName:
            <asp:Label ID="LastNameLabel" runat="server" Text='<%# Bind("LastName") %>' />
            <br />
            UserName:
            <asp:Label ID="UserNameLabel" runat="server" Text='<%# Bind("UserName") %>' />
            <br />
            RoleName:
            <asp:Label ID="RoleNameLabel" runat="server" Text='<%# Bind("RoleName") %>' />
            <br />
            UserID:
            <asp:Label ID="UserIDLabel" runat="server" Text='<%# Eval("UserID") %>' />
            <br />
            Birthday:
            <asp:Label ID="BirthdayLabel" runat="server"  Text='<%# Bind("Birthday", "{0:M-dd-yyyy}") %>'  />
            <br />
            Address1:
            <asp:Label ID="Address1Label" runat="server" Text='<%# Bind("Address1") %>' />
            <br />
            Address2:
            <asp:Label ID="Address2Label" runat="server" Text='<%# Bind("Address2") %>' />
            <br />
            City:
            <asp:Label ID="CityLabel" runat="server" Text='<%# Bind("City") %>' />
            <br />
            State:
            <asp:Label ID="StateLabel" runat="server" Text='<%# Bind("State") %>' />
            <br />
            ZipCode:
            <asp:Label ID="ZipCodeLabel" runat="server" Text='<%# Bind("ZipCode") %>' />
            <br />
            PrimaryPhone:
            <asp:Label ID="PrimaryPhoneLabel" runat="server" 
                Text='<%# Bind("PrimaryPhone") %>' />
            <br />
            SecondaryPhone:
            <asp:Label ID="SecondaryPhoneLabel" runat="server" 
                Text='<%# Bind("SecondaryPhone") %>' />
            <br />
            Email:
            <asp:Label ID="EmailLabel" runat="server" Text='<%# Bind("Email") %>' />
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                CommandName="Edit" Text="Edit" />
            &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                CommandName="Delete" Text="Delete" OnClientClick="return confirm('Are you sure you wish to delete this customer record?')"/>
        </ItemTemplate>
    </asp:FormView>

    <asp:label ID = "lbl_DeletedCustomer" runat="server" text=""></asp:label>
    </asp:Content>

