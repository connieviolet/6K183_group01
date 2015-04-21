Imports System.Data
Imports System.Data.SqlClient
Partial Class _Default
    Inherits System.Web.UI.Page


    Protected Sub Page_PreInit(sender As Object, e As System.EventArgs) Handles Me.PreInit

        If (Request.Browser.IsMobileDevice) Then
            MasterPageFile = "MobileMaster.Master"
            Response.Redirect("~/mobile/default.aspx")
        End If

    End Sub

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        Dim connectionstring As String = ConfigurationManager.ConnectionStrings("cs_SLPL").ConnectionString
        Dim SQLStatement As String = "SELECT COUNT(*) AS Expr1 FROM PL_Materials WHERE (Available = 'Y')"
        Dim con As New SqlConnection(connectionstring)
        Dim cmd As New SqlCommand()

        cmd.CommandType = CommandType.Text
        cmd.CommandText = SQLStatement
        cmd.Connection = con

        Try
            con.Open()
            Dim sdr As SqlDataReader = cmd.ExecuteReader()
            While sdr.Read()
                Label1.Text = sdr("Expr1").ToString()
            End While
        Catch ex As Exception
        End Try
    End Sub
End Class
