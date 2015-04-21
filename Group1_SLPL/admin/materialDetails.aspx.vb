Imports System.Data.SqlClient
Partial Class admin_materialDetails
    Inherits System.Web.UI.Page



    Protected Sub DeleteButton_Click(sender As Object, e As System.EventArgs)
        Response.Write("<script>alert('The record has been deleted from the system.');</script>")
        Response.AddHeader("REFRESH", ".1;URL=viewallmaterials.aspx")
    End Sub

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub FormView1_ItemUpdated(sender As Object, e As System.Web.UI.WebControls.FormViewUpdatedEventArgs) Handles FormView1.ItemUpdated
        Response.Write("<script>alert('The record has been updated.');</script>")
        Response.AddHeader("REFRESH", ".1;URL=viewallmaterials.aspx")
    End Sub
End Class
