Imports System.Data.SqlClient
Partial Class admin_addNewPatron
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
     
        Dim UserSettings As WizardStep = CType(CreateUserWizard1.FindControl("UserProfile"), WizardStep)
        Dim firstname As TextBox = CType(UserSettings.FindControl("tb_FirstName"), TextBox)
        firstname.Focus()
    End Sub

    Protected Sub CreateUserWizard1_ActiveStepChanged(sender As Object, e As System.EventArgs) Handles CreateUserWizard1.ActiveStepChanged
        If CreateUserWizard1.ActiveStep.Title = "Complete" Then

            Dim UserSettings As WizardStep = CType(CreateUserWizard1.FindControl("UserProfile"), WizardStep)

            Dim firstname As TextBox = CType(UserSettings.FindControl("tb_FirstName"), TextBox)
            Dim lastname As TextBox = CType(UserSettings.FindControl("tb_LastName"), TextBox)
            Dim city As TextBox = CType(UserSettings.FindControl("tb_City"), TextBox)
            Dim zip As TextBox = CType(UserSettings.FindControl("tb_Zip"), TextBox)
            Dim primaryPhone As TextBox = CType(UserSettings.FindControl("tb_PrimaryPhone"), TextBox)
            Dim secondaryPhone As TextBox = CType(UserSettings.FindControl("tb_SecondaryPhone"), TextBox)
            Dim state As String = ddl_state.SelectedItem.Text()
            Dim birthday As TextBox = CType(UserSettings.FindControl("tb_Birthday"), TextBox)
            Dim address1 As TextBox = CType(UserSettings.FindControl("tb_Address1"), TextBox)
            Dim address2 As TextBox = CType(UserSettings.FindControl("tb_Address2"), TextBox)
            Dim email As TextBox = CType(UserSettings.FindControl("tb_Email"), TextBox)
            Dim newuser As MembershipUser = Membership.GetUser(CreateUserWizard1.UserName)
            Dim newUserID As Guid = CType(newuser.ProviderUserKey, Guid)


            If (primaryPhone.Text.Equals("___-___-____")) Then
                primaryPhone.Text = ""
            End If

            If (secondaryPhone.Text.Equals("___-___-____")) Then
                primaryPhone.Text = ""
            End If

            If (birthday.Text.Equals("____-__-__")) Then
                birthday.Text = "1990-12-12"
            End If

            Roles.AddUserToRole(newuser.UserName, "r_Patron")

            Dim connectionstring As String = ConfigurationManager.ConnectionStrings("cs_SLPL").ConnectionString
            Dim updateSQL As String = "INSERT INTO [PL_UserExtended] ([UserID], [FirstName], [LastName], [Birthday], [City], [ZipCode], [State], [Address1], [Address2], [PrimaryPhone], [SecondaryPhone], [Email]) VALUES (@UserID, @FirstName, @LastName, @Birthday, @City, @ZipCode, @State, @Address1, @Address2, @PrimaryPhone, @SecondaryPhone, @Email)"
            Using myConnection As New SqlConnection(connectionstring)
                myConnection.Open()
                Dim mycommand As New SqlCommand(updateSQL, myConnection)
                mycommand.Parameters.Add(New SqlParameter("@State", state))
                mycommand.Parameters.AddWithValue("@FirstName", firstname.Text.Trim())
                mycommand.Parameters.AddWithValue("@LastName", lastname.Text.Trim())
                mycommand.Parameters.AddWithValue("@City", city.Text.Trim())
                mycommand.Parameters.AddWithValue("@ZipCode", zip.Text.Trim())
                mycommand.Parameters.AddWithValue("@UserID", newUserID)
                mycommand.Parameters.AddWithValue("@Address1", address1.Text.Trim())
                mycommand.Parameters.AddWithValue("@Address2", address2.Text.Trim())
                mycommand.Parameters.AddWithValue("@PrimaryPhone", primaryPhone.Text.Trim())
                mycommand.Parameters.AddWithValue("@SecondaryPhone", secondaryPhone.Text.Trim())
                mycommand.Parameters.AddWithValue("@Email", email.Text.Trim())
                mycommand.Parameters.AddWithValue("@Birthday", birthday.Text.Trim())
                mycommand.ExecuteNonQuery()
                myConnection.Close()
            End Using
            Response.Write("<script>alert('The record has been added to the system.');</script>")
            Response.AddHeader("REFRESH", ".1;URL=viewallpatrons.aspx")
        Else

        End If

    End Sub

    Protected Sub CreateUserWizard1_CancelButtonClick(sender As Object, e As System.EventArgs) Handles CreateUserWizard1.CancelButtonClick
        Response.Redirect("viewAllPatrons.aspx")

    End Sub


    Protected Sub CancelButton_Click(sender As Object, e As System.EventArgs)
        Response.Redirect("viewAllPatrons.aspx")
    End Sub
  
    Protected Sub PreviousButton_Click(sender As Object, e As System.EventArgs)
        Response.Redirect("addNewPatron.aspx")

    End Sub

    Protected Sub ContinueButton_Click(sender As Object, e As System.EventArgs)

    End Sub

  
   
    Protected Sub CreateUserWizard1_CreatedUser(sender As Object, e As System.EventArgs) Handles CreateUserWizard1.CreatedUser
    End Sub
End Class
