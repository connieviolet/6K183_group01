
Partial Class admin_materialsDueToday
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        Dim dtmTest As Date = DateTime.Now
        Label1.Text = dtmTest
    End Sub
End Class
