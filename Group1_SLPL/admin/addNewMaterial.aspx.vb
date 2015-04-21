Imports System.Data.SqlClient
Partial Class admin_addNewMaterials2
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        Dim Title As TextBox = CType(FormView1.FindControl("tb_MaterialName"), TextBox)
        Title.Focus()

    End Sub


    Protected Sub InsertButton1_Click(sender As Object, e As System.EventArgs) Handles FormView1.ItemInserting
        Dim datadropA As DropDownList
        datadropA = FormView1.FindControl("ddl_MaterialType")
        Dim datadropB As DropDownList
        datadropB = FormView1.FindControl("ddl_Available")
        Dim filepath As String = Server.MapPath("..\images")
        Dim findcontrol As FileUpload = CType(FormView1.FindControl("FileUpload1"), FileUpload)
 
        Dim Title As TextBox = CType(FormView1.FindControl("tb_MaterialName"), TextBox)
        Dim MaterialType As String = datadropA.SelectedItem().ToString()
        Dim CallNumber As TextBox = CType(FormView1.FindControl("tb_CallNumber"), TextBox)
        Dim Author As TextBox = CType(FormView1.FindControl("tb_Author"), TextBox)
        Dim Publisher As TextBox = CType(FormView1.FindControl("tb_Publisher"), TextBox)
        Dim Copyright As TextBox = CType(FormView1.FindControl("tb_Copyright"), TextBox)
        Dim ISBN As TextBox = CType(FormView1.FindControl("tb_ISBN"), TextBox)
        Dim Description As TextBox = CType(FormView1.FindControl("tb_Description"), TextBox)
        Dim Available As String = datadropB.SelectedItem.ToString()
        Dim photoname As String = findcontrol.FileName

        If findcontrol.HasFile Then
            Try
                findcontrol.SaveAs(filepath & "\Materials\" & ISBN.Text & ".jpg")
            Catch ex As Exception
            End Try
        End If

        Dim connectionstring As String = ConfigurationManager.ConnectionStrings("cs_SLPL").ConnectionString
        Dim updatesql As String = "INSERT INTO [PL_Materials] ([MaterialType], [CallNumber], [Title], [Author], [Publisher], [Copyright], [ISBN], [Description], [Available], [PhotoName]) VALUES (@MaterialType, @CallNumber, @Title, @Author, @Publisher, @Copyright, @ISBN, @Description, @Available, @PhotoName)"

        Using myConnection As New SqlConnection(connectionstring)
            myConnection.Open()
            Dim mycommand As New SqlCommand(updatesql, myConnection)
            mycommand.Parameters.Add(New SqlParameter("Available", Available))
            mycommand.Parameters.AddWithValue("@MaterialType", MaterialType)
            mycommand.Parameters.AddWithValue("@CallNumber", CallNumber.Text)
            mycommand.Parameters.AddWithValue("@Title", Title.Text)
            mycommand.Parameters.AddWithValue("@Author", Author.Text)
            mycommand.Parameters.AddWithValue("@Publisher", Publisher.Text)
            mycommand.Parameters.AddWithValue("@Copyright", Copyright.Text)
            mycommand.Parameters.AddWithValue("@ISBN", ISBN.Text)
            mycommand.Parameters.AddWithValue("@Description", Description.Text)
            mycommand.Parameters.AddWithValue("@PhotoName", ISBN.Text + ".jpg")
            mycommand.ExecuteNonQuery()
            myConnection.Close()
        End Using
        Response.Write("<script>alert('The material had been added to the database.');</script>")
        Response.AddHeader("REFRESH", ".1;URL=viewallmaterials.aspx")
    End Sub


    Protected Sub FormView1_ModeChanging(sender As Object, e As System.Web.UI.WebControls.FormViewModeEventArgs) Handles FormView1.ModeChanging

    End Sub
End Class
