Imports System.Data.SqlClient

Partial Class admin_RentMaterial
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        userNameTextBox.Focus()
    End Sub
    Protected Sub rentButton_Click(sender As Object, e As System.EventArgs) Handles rentButton.Click
        Dim strMaterialID As String = materialIDTextBox.Text
        Dim strUserName As String = userNameTextBox.Text
        Dim RentDAte As DateTime = DateTime.Now
        Dim DateDueBack As DateTime = DateAdd("d", 30, Today)
        Dim materialidaccum As Boolean = False
        Dim patronidaccum As Boolean = False
        Dim availableaccum As Boolean = False
        Dim connectionstring As String = ConfigurationManager.ConnectionStrings("cs_SLPL").ConnectionString
        Dim updatesql As String = "SELECT * FROM PL_Materials"
        Dim updatesql1 As String = "SELECT UserName FROM aspnet_Users"

        Using myCommand As New SqlConnection(connectionstring)
            Dim query As New SqlCommand(updatesql, myCommand)
            myCommand.Open()
            Using ninja As SqlDataReader = query.ExecuteReader
                While ninja.Read
                    If (ninja.Item("MaterialID") = strMaterialID) Then
                        materialidaccum = True
                        If (ninja.Item("Available") = "Y") Then
                            availableaccum = True
                        End If
                    End If
                End While
            End Using
        End Using

        Using myCommand As New SqlConnection(connectionstring)
            Dim query As New SqlCommand(updatesql1, myCommand)
            myCommand.Open()
            Using ninja As SqlDataReader = query.ExecuteReader
                While ninja.Read
                    If (ninja.Item("UserName") = strUserName) Then
                        patronidaccum = True
                    End If
                End While
            End Using
        End Using

        If (materialidaccum = False) Then
            Label1.Text = "The material requested isn't in the database."
        ElseIf (patronidaccum = False) Then
            Label1.Text = "The patron entered is not in the database."
        ElseIf (availableaccum = False) Then
            Label1.Text = "The material is not available."
        Else
            Dim sqlConn As New SqlConnection(ConfigurationManager.ConnectionStrings("cs_SLPL").ConnectionString)


            Dim materialidcmd As String = "SELECT MaterialID from PL_Materials"


            Dim sqlAdp As New SqlDataAdapter
            Dim sqlCmd As New SqlCommand

            sqlCmd.Connection = sqlConn
            sqlCmd.CommandText = "sp_PL_RentMaterials"
            sqlCmd.CommandType = Data.CommandType.StoredProcedure

            sqlCmd.Parameters.Add(New SqlParameter("@UserName", strUserName))
            sqlCmd.Parameters.Add(New SqlParameter("@MaterialID", strMaterialID))
            sqlCmd.Parameters.Add(New SqlParameter("@RentDate", RentDAte))
            sqlCmd.Parameters.Add(New SqlParameter("@DateDueBack", DateDueBack))
            sqlConn.Open()
            sqlCmd.ExecuteNonQuery()
            sqlConn.Close()

            Response.Redirect("ViewAllRentals.aspx")
        End If
    End Sub

    
End Class
