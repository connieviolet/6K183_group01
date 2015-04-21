Imports System.Data.SqlClient
Partial Class admin_returnMaterial
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        materialIDTextBox.Focus()

    End Sub

    Protected Sub returnButton_Click(sender As Object, e As System.EventArgs) Handles returnButton.Click
        Dim strMaterialId As String = materialIDTextBox.Text

        Dim sqlConn As New SqlConnection(ConfigurationManager.ConnectionStrings("cs_SLPL").ConnectionString)

        Dim sqlAdp As New SqlDataAdapter
        Dim sqlCmd As New SqlCommand

        sqlCmd.Connection = sqlConn
        sqlCmd.CommandText = "sp_PL_MaterialReturn"
        sqlCmd.CommandType = Data.CommandType.StoredProcedure

        sqlCmd.Parameters.Add(New SqlParameter("@MaterialID", strMaterialId))

        sqlConn.Open()
        sqlCmd.ExecuteNonQuery()
        sqlConn.Close()

        Response.Redirect("ViewAllRentals.aspx")

    End Sub

End Class
