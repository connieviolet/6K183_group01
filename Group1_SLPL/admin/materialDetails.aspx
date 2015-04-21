<%@ Page Title="Material Details" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="materialDetails.aspx.vb" Inherits="admin_materialDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <h1>Material Details</h1>
    <center><asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:cs_SLPL %>" 
        DeleteCommand = "DELETE FROM [PL_Materials] WHERE [MaterialID] = @MaterialID"
        Updatecommand = "UPDATE [PL_Materials] SET [MaterialType] = @MaterialType, [CallNumber] = @CallNumber, [Title] = @Title, [Author] = @Author, [Publisher] = @Publisher, [Copyright] = @Copyright, [ISBN] = @ISBN, [Description] = @Description, [Available] = @Available, [PhotoName] = @PhotoName WHERE [MaterialID] = @MaterialID"
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
        ConnectionString="<%$ ConnectionStrings:cs_SLPL %>" SelectCommand="SELECT [MaterialType] FROM [dbo.PL_MaterialType]" 
        >
    </asp:SqlDataSource>
 
        <asp:SqlDataSource ID="SqlDataSource5" runat="server" 
            ConnectionString="<%$ ConnectionStrings:cs_SLPL %>" 
            SelectCommand="SELECT PL_UserExtended.FirstName, PL_UserExtended.LastName, PL_UserExtended.Email, PL_UserExtended.PrimaryPhone, PL_Rentals.DateDueBack FROM PL_Rentals INNER JOIN PL_Materials ON PL_Rentals.MaterialID = PL_Materials.MaterialID INNER JOIN aspnet_Users ON PL_Rentals.UserID = aspnet_Users.UserId INNER JOIN PL_UserExtended ON aspnet_Users.UserId = PL_UserExtended.UserID WHERE (PL_Rentals.MaterialID = @MaterialID)">
            <SelectParameters>
                <asp:QueryStringParameter Name="MaterialID" QueryStringField="MaterialID" />
            </SelectParameters>
        </asp:SqlDataSource>
 
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
        ConnectionString="<%$ ConnectionStrings:cs_SLPL %>" 
        
        SelectCommand="SELECT PL_UserExtended.UserID, PL_UserExtended.FirstName, PL_UserExtended.LastName, PL_UserExtended.Address1, PL_UserExtended.City, PL_UserExtended.State, PL_UserExtended.ZipCode, PL_Rentals.RentDate, PL_Rentals.DateDueBack FROM PL_Rentals INNER JOIN PL_UserExtended ON PL_Rentals.UserID = PL_UserExtended.UserID WHERE (PL_Rentals.MaterialID = @materialID)">
        <SelectParameters>
            <asp:QueryStringParameter Name="MaterialID" QueryStringField="MaterialID" Type= "Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
 
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="MaterialID" 
        DataSourceID="SqlDataSource1">
        <EditItemTemplate>

            <asp:Label ID="Label2" runat="server"></asp:Label>
          <table>
			<tr>
				<td align="right"> Material ID: </td><td align="left"><asp:TextBox ID="tb_ToolID" runat="server" enabled="false" Text='<%# Bind("MaterialID") %>' /></td>
			</tr>
            
             <tr>
				<td align="right"> Material Type: </td><td align="left"> <asp:TextBox ID="TextBox3" runat="server" enabled="false" Text='<%# Bind("MaterialType") %>' />

                    </td>
            </tr>

			<tr>
				<td align="right"> Call Number: </td><td align="left"><asp:TextBox ID="tb_ToolName" runat="server" Text='<%# Bind("CallNumber") %>' /></td>
			</tr>
            
			<tr>
				<td align="right"> Title </td><td align="left"><asp:TextBox ID="tb_ToolMfg" runat="server" Text='<%# Bind("Title") %>' /></td>
			</tr>
            
            <tr>
				<td align="right"> Author </td><td align="left"><asp:TextBox ID="tb_ToolDesc" runat="server" Text='<%# Bind("Author") %>' /></td>
			</tr>
            
            <tr>
				<td align="right"> Publisher: </td><td align="left"><asp:TextBox ID="tb_ToolCost" runat="server" Text='<%# Bind("Publisher") %>' /></td>
			</tr>
            
            <tr>
				<td align="right"> Copyright: </td><td align="left"><asp:TextBox ID="tb_ToolDailyRental" runat="server" Text='<%# Bind("Copyright") %>' /></td>
			</tr>
            
            <tr>
				<td align="right"> ISBN: </td><td align="left"><asp:TextBox ID="tb_ToolPhotoName" runat="server" Text='<%# Bind("ISBN") %>' /></td>
			</tr>

            <tr>
				<td align="right"> Description: </td><td align="left"><asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Description") %>' /></td>
			</tr>

            <tr>
				<td align="right"> PhotoName </td><td align="left"><asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("PhotoName") %>' /></td>
			</tr>


                        <tr>
				<td align="right"> Available: </td>
				<td align="left">
					 <asp:DropDownList ID="ddl_ToolAvail" runat="server" DataSourceID="SqlDataSource2" 
						DataTextField="Available" DataValueField="Available" SelectedValue='<%# Bind("Available") %>'>
					</asp:DropDownList>
				</td>
            </tr>
		    
              <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
		  </table>



            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />

            &nbsp; &nbsp;

			<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />

  
        </EditItemTemplate>
        <InsertItemTemplate>
    
            MaterialType:
            <asp:TextBox ID="MaterialTypeTextBox" runat="server" 
                Text='<%# Bind("MaterialType") %>' />
            <br />
            CallNumber:
            <asp:TextBox ID="CallNumberTextBox" runat="server" 
                Text='<%# Bind("CallNumber") %>' />
            <br />
            Title:
            <asp:TextBox ID="TitleTextBox" runat="server" Text='<%# Bind("Title") %>' />
            <br />
            Author:
            <asp:TextBox ID="AuthorTextBox" runat="server" Text='<%# Bind("Author") %>' />
            <br />
            Publisher:
            <asp:TextBox ID="PublisherTextBox" runat="server" 
                Text='<%# Bind("Publisher") %>' />
            <br />
            Copyright:
            <asp:TextBox ID="CopyrightTextBox" runat="server" 
                Text='<%# Bind("Copyright") %>' />
            <br />
            ISBN:
            <asp:TextBox ID="ISBNTextBox" runat="server" Text='<%# Bind("ISBN") %>' />
            <br />
            Description:
            <asp:TextBox ID="DescriptionTextBox" runat="server" 
                Text='<%# Bind("Description") %>' />
            <br />
            Available:
            <asp:TextBox ID="AvailableTextBox" runat="server" 
                Text='<%# Bind("Available") %>' />
            <br />
            PhotoName:
            <asp:TextBox ID="PhotoNameTextBox" runat="server" 
                Text='<%# Bind("PhotoName") %>' />
            <br />
    
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            MaterialID:
            <asp:Label ID="MaterialIDLabel" runat="server" 
                Text='<%# Eval("MaterialID") %>' />
            <br />
            MaterialType:
            <asp:Label ID="MaterialType" runat="server" Text='<%# Bind("MaterialType") %>' />
            <br />
            CallNumber:
            <asp:Label ID="CallNumberLabel" runat="server" 
                Text='<%# Bind("CallNumber") %>' />
            <br />
            Title:
            <asp:Label ID="TitleLabel" runat="server" Text='<%# Bind("Title") %>' />
            <br />
            Author:
            <asp:Label ID="AuthorLabel" runat="server" Text='<%# Bind("Author") %>' />
            <br />
            Publisher:
            <asp:Label ID="PublisherLabel" runat="server" Text='<%# Bind("Publisher") %>' />
            <br />
            Copyright:
            <asp:Label ID="CopyrightLabel" runat="server" Text='<%# Bind("Copyright") %>' />
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
            PhotoName:
            <asp:Label ID="PhotoNameLabel" runat="server" Text='<%# Bind("PhotoName") %>' />
            <br />

            <asp:button ID = "EditButton" runat="server"  commandname = "Edit" text = "Edit" /> 
            <asp:button ID = "DeleteButton" runat="server" commandname = "Delete" text = "Delete" OnClick = "DeleteButton_Click" OnClientClick="return confirm('Are you sure you wish to delete this customer record?')" />
            <br />
            <br />
            <br />

            <br /> <br />

            <center><asp:DataList ID="MaterialPhotoDataList" runat="server" 
                DataSourceID= "SQLDataSource1" >
            <ItemTemplate>
            <asp:Image ID="MaterialImage1" runat="server" ImageUrl='<%# Eval ("PhotoName", "~/images/Materials/{0}") %>'  AlternateText="Image Unavailable" Height= "200px" />
           </ItemTemplate>
            
            
            </asp:DataList></center>
            <a href= "viewAllMaterials.aspx"> View All Materials </a>
        </ItemTemplate>
    </asp:FormView>
    <br />
   
    <h3>Rental Information</h3> <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSource5">
            <Columns>
                <asp:BoundField DataField="FirstName" HeaderText="FirstName" 
                    SortExpression="FirstName" />
                <asp:BoundField DataField="LastName" HeaderText="LastName" 
                    SortExpression="LastName" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                <asp:BoundField DataField="PrimaryPhone" HeaderText="PrimaryPhone" 
                    SortExpression="PrimaryPhone" />
                <asp:BoundField DataField="DateDueBack" HeaderText="DateDueBack" 
                    SortExpression="DateDueBack" />
            </Columns>
        </asp:GridView>
 </center>
    </asp:Content>

