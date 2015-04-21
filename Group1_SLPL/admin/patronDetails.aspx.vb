Imports System.Data.SqlClient
Imports System.Web
Imports System.Data
Partial Class admin_patronDetails
    Inherits System.Web.UI.Page
    Protected Sub DeleteButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim selUser As Label = CType(FormView1.FindControl("UserNameLabel"), Label)
        Membership.DeleteUser(selUser.Text)

    End Sub

    Protected Sub Formview1_ItemDeleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewDeletedEventArgs) Handles FormView1.ItemDeleted
        Response.Write("<script>alert('The record has been deleted from the system.');</script>")
        Response.AddHeader("REFRESH", ".1;URL=viewallpatrons.aspx")

    End Sub

    Protected Sub FormView1_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewUpdatedEventArgs) Handles FormView1.ItemUpdated
        Response.Write("<script>alert('The record has been updated..');</script>")
        Response.AddHeader("REFRESH", ".1;URL=viewallpatrons.aspx")
    End Sub


    Protected Sub FormView1_PageIndexChanging(sender As Object, e As System.Web.UI.WebControls.FormViewPageEventArgs) Handles FormView1.PageIndexChanging

    End Sub
End Class
