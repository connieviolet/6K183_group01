Imports System.Data.SqlClient
Partial Class patron_Default2
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        Dim connectionstring As String = ConfigurationManager.ConnectionStrings("cs_SLPL").ConnectionString
        Dim selectstatement As String = "SELECT aspnet_Users.UserName, PL_UserExtended.FirstName, PL_UserExtended.Fines, PL_UserExtended.LastName, PL_UserExtended.Birthday, PL_UserExtended.Address1, PL_UserExtended.Address2, PL_UserExtended.City, PL_UserExtended.State, PL_UserExtended.ZipCode, PL_UserExtended.PrimaryPhone, PL_UserExtended.SecondaryPhone, PL_UserExtended.Email, PL_UserExtended.Fines FROM aspnet_Users INNER JOIN PL_UserExtended ON aspnet_Users.UserId = PL_UserExtended.UserID WHERE aspnet_Users.UserName ='" + Page.User.Identity.Name + "'"
        Using myconnection As New SqlConnection(connectionstring)
            myconnection.Open()
            Dim mycommand As New SqlCommand(selectstatement, myconnection)
            Dim sqlreader As Data.SqlClient.SqlDataReader = mycommand.ExecuteReader

            If sqlreader.HasRows Then
                sqlreader.Read()
                tb_UserName.Text = sqlreader("UserName")
                tb_FirstName.Text = sqlreader("FirstName")
                tb_LastName.Text = sqlreader("LastName")
                tb_Birthday.Text = sqlreader("Birthday")
                tb_Address1.Text = sqlreader("Address1")
                Dim address2 As String = sqlreader("Address2")
                tb_Address2.Text = address2
                tb_City.Text = sqlreader("City")
                tb_State.Text = sqlreader("State")
                tb_Zipcode.Text = sqlreader("Zipcode")
                tb_PrimaryPhone.Text = sqlreader("PrimaryPhone")
                Dim secondaryphone As String = sqlreader("SecondaryPhone")
                tb_SecondaryPhone.Text = secondaryphone
                Dim email As String = sqlreader("Email")
                    tb_Email.Text = email
            End If
            tb_Fines.Text = FormatCurrency(sqlreader("Fines"), 2)
        End Using
    End Sub

    Protected Sub Page_PreInit(sender As Object, e As System.EventArgs) Handles Me.PreInit

    End Sub
End Class
