
Partial Class MasterPage
    Inherits System.Web.UI.MasterPage

    Protected Sub LoginStatus1_LoggedOut(sender As Object, e As System.EventArgs) Handles LoginStatus1.LoggedOut
        Response.Redirect("~/default.aspx")
    End Sub


    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        dateLabel.Text = DateTime.Now.ToLongDateString
    End Sub
End Class

