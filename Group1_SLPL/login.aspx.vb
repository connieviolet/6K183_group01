
Partial Class login
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        Login1.Focus()
    End Sub

    Protected Sub Page_PreLoad(sender As Object, e As System.EventArgs) Handles Me.PreLoad

    End Sub

    Protected Sub Login1_LoggedIn(sender As Object, e As System.EventArgs) Handles Login1.LoggedIn
        If Roles.IsUserInRole(Login1.UserName, "r_Librarian") Then
            Response.Redirect("admin/Default.aspx")
        End If

        If Roles.IsUserInRole(Login1.UserName, "r_Patron") Then
            Response.Redirect("patron/Default.aspx")
        End If

    End Sub
End Class
