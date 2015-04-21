Imports System.Data.SqlClient
Imports System.Web
Imports System.Data
Partial Class admin_viewAllPatrons
    Inherits System.Web.UI.Page
    'patron search functionality with button click
    Protected Sub Button_search_Click(sender As Object, e As System.EventArgs) Handles Button_search.Click
        Dim searchword As String

        searchword = "Select * From PL_UserExtended where (FirstName Like '%" + PatronSearchTextBox.Text.ToString() + "%') OR (LastName Like '%" + PatronSearchTextBox.Text.ToString() + "%') OR (PrimaryPhone Like '%" + PatronSearchTextBox.Text.ToString() + "%') OR (Email Like '%" + PatronSearchTextBox.Text.ToString() + "%')"
        SqlDataSource1.SelectCommand = searchword
    End Sub

    Protected Sub Button_search_Load(sender As Object, e As System.EventArgs) Handles Button_search.Load
        PatronSearchTextBox.Focus()
    End Sub
End Class
