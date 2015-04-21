Imports System.Data.SqlClient
Imports System.Web
Imports System.Data
Partial Class admin_viewAllMaterials
    Inherits System.Web.UI.Page
    'material search functionality with button click
    Protected Sub Button_search_Click(sender As Object, e As System.EventArgs) Handles Button_search.Click
        Dim searchword As String

        searchword = "Select * From PL_Materials where (Title Like '%" + MaterialSearchTextBox.Text.ToString() + "%') OR (Author Like '%" + MaterialSearchTextBox.Text.ToString() + "%') OR (Description Like '%" + MaterialSearchTextBox.Text.ToString() + "%') OR (ISBN Like '%" + MaterialSearchTextBox.Text.ToString() + "%') OR (MaterialID Like '%" + MaterialSearchTextBox.Text.ToString() + "%')"
        SqlDataSource1.SelectCommand = searchword
    End Sub

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        MaterialSearchTextBox.Focus()
    End Sub
End Class