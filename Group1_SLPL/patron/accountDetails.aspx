<%@ Page Title="Account Details" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="accountDetails.aspx.vb" Inherits="patron_Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
              <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                  ConnectionString="<%$ ConnectionStrings:cs_SLPL %>" 
                  
                  SelectCommand="SELECT aspnet_Users.UserName, PL_UserExtended.FirstName, PL_UserExtended.LastName, PL_UserExtended.Birthday, PL_UserExtended.Address1, PL_UserExtended.Address2, PL_UserExtended.City, PL_UserExtended.State, PL_UserExtended.ZipCode, PL_UserExtended.PrimaryPhone, PL_UserExtended.SecondaryPhone, PL_UserExtended.Email, PL_UserExtended.Fines FROM aspnet_Users INNER JOIN PL_UserExtended ON aspnet_Users.UserId = PL_UserExtended.UserID"></asp:SqlDataSource>
              <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                  ConnectionString="<%$ ConnectionStrings:cs_SLPL %>" 
                  SelectCommand="SELECT PL_Materials.Title, PL_Materials.MaterialType, PL_Rentals.RentDate, PL_Rentals.DateDueBack FROM PL_Rentals INNER JOIN aspnet_Users ON PL_Rentals.UserID = aspnet_Users.UserId INNER JOIN PL_Materials ON PL_Rentals.MaterialID = PL_Materials.MaterialID WHERE (aspnet_Users.UserName = @UserName)">
                  <SelectParameters>
                      <asp:ControlParameter ControlID="tb_UserName" DefaultValue="" 
                          Name="UserName" PropertyName="Text" />
                  </SelectParameters>
              </asp:SqlDataSource>
          <table>
			<tr>
				<td align="right"> UserName: </td><td align="left"><asp:Label ID="tb_UserName" runat="server" enabled="false" /></td>
			</tr>

			<tr>
				<td align="right"> First Name: </td><td align="left"><asp:Label ID="tb_FirstName" runat="server" enabled="false" /></td>
			</tr>

			<tr>
				<td align="right"> Last Name: </td><td align="left"><asp:Label ID="tb_LastName" runat="server" enabled="false" /></td>
			</tr>

			<tr>
				<td align="right"> Birthday: </td><td align="left"><asp:Label ID="tb_Birthday" runat="server" enabled="false" /></td>
			</tr>

			<tr>
				<td align="right"> Address 1: </td><td align="left"><asp:Label ID="tb_Address1" runat="server" enabled="false" /></td>
			</tr>

			<tr>
				<td align="right"> Address 2: </td><td align="left"><asp:Label ID="tb_Address2" runat="server" enabled="false" /></td>
			</tr>

			<tr>
				<td align="right"> City: </td><td align="left"><asp:Label ID="tb_City" runat="server" enabled="false" /></td>
			</tr>

			<tr>
				<td align="right"> State: </td><td align="left"><asp:Label ID="tb_State" runat="server" enabled="false" /></td>
			</tr>

			<tr>
				<td align="right"> Zipcode </td><td align="left"><asp:Label ID="tb_Zipcode" runat="server" enabled="false" /></td>
			</tr>

			<tr>
				<td align="right"> Primary Phone: </td><td align="left"><asp:Label ID="tb_PrimaryPhone" runat="server" enabled="false" /></td>
			</tr>

			<tr>
				<td align="right"> Secondary Phone: </td><td align="left"><asp:Label ID="tb_SecondaryPhone" runat="server" enabled="false" /></td>
			</tr>

			<tr>
				<td align="right"> Email: </td><td align="left"><asp:Label ID="tb_Email" runat="server" enabled="false" /></td>
			</tr>

			<tr>
				<td align="right"> Fines: </td><td align="left"><asp:Label ID="tb_Fines" runat="server" enabled="false" /></td>
			</tr>
            </table>


            <asp:Label ID = "tb_Header" runat = "server" Enabled="False">Rented Materials</asp:Label>
            

              <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                  DataSourceID="SqlDataSource2">
                  <Columns>
                      <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                      <asp:BoundField DataField="MaterialType" HeaderText="MaterialType" 
                          SortExpression="MaterialType" />
                      <asp:BoundField DataField="RentDate" HeaderText="RentDate" 
                          SortExpression="RentDate" />
                      <asp:BoundField DataField="DateDueBack" HeaderText="DateDueBack" 
                          SortExpression="DateDueBack" />
                  </Columns>
              </asp:GridView>



            

</asp:Content>

