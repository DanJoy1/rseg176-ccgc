Public Class _Default
    Inherits Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        cardioheading.Visible = False
        cardio.Visible = False
        lblMessage.Visible = False
        containercloud.Visible = False
        pdiv.Visible = False
    End Sub

    Protected Sub btnSubmit_Click(sender As Object, e As EventArgs) Handles btnSubmit.Click
        Dim Database As New CloudComputing.Database
        Dim LifeExpectancy As String = ""
        Dim LifeExpectancyResult As New List(Of LifeExpectancy)
        Dim CardioResult As New List(Of Cardiovascular)

        'If txtLocation.Text <> "" Then
        '    LifeExpectancy = Database.GetLifeExpectancy(txtLocation.Text)
        '    If Not LifeExpectancy = "" Then
        '        lblResults.Text = "The life expectancy for zip code: " + txtLocation.Text + " is " + LifeExpectancy.ToString() + " years."
        '    Else
        '        lblResults.Text = "The zip code entered is not valid. Please enter a valid zip code."
        '    End If
        'Else
        '    lblResults.Text = "Please enter a valid Massachusetts zip code"
        'End If

        If txtLocation.Text <> "" Then
            lblMessage.Visible = False
            LifeExpectancyResult = Database.GetLifeExpectancyData(txtLocation.Text)
            If LifeExpectancyResult.Count > 0 Then
                FillTable(LifeExpectancyResult)
                CardioResult = Database.GetCardioVascularData(txtLocation.Text)
                If CardioResult.Count > 0 Then
                    FillCardioTable(CardioResult)
                End If
            Else
                lblMessage.Visible = True
                lblMessage.Text = "No data is available for the zip code or city entered."
                cardioheading.Visible = False
                cardio.Visible = False
                containercloud.Visible = False
            End If

        Else
            lblMessage.Visible = True
            lblMessage.Text = "Please enter a valid Massachusetts zip code or city."
            cardioheading.Visible = False
            cardio.Visible = False
            containercloud.Visible = False
        End If
    End Sub

    Private Sub FillTable(LifeData As List(Of LifeExpectancy))
        Dim tHeader As New TableHeaderRow
        tHeader.TableSection = TableRowSection.TableHeader

        'tHeader.BackColor = Color.Silver
        tHeader.BorderStyle = BorderStyle.Solid
        Dim tc0 As New TableHeaderCell
        tc0.Text = "City"
        tc0.Scope = TableHeaderScope.Column
        tHeader.Cells.Add(tc0)

        Dim tc1 As New TableHeaderCell
        tc1.Text = "Zip Code"
        tc1.Scope = TableHeaderScope.Column
        tHeader.Cells.Add(tc1)

        Dim tc2 As New TableHeaderCell
        tc2.Text = "County"
        tc2.Scope = TableHeaderScope.Column
        tHeader.Cells.Add(tc2)

        Dim tc3 As New TableHeaderCell
        tc3.Text = "Life Expectancy"
        tc3.Scope = TableHeaderScope.Column
        tHeader.Cells.Add(tc3)

        Dim tc4 As New TableHeaderCell
        tc4.Text = "County Poverty %"
        tc4.Scope = TableHeaderScope.Column
        tHeader.Cells.Add(tc4)

        Dim tc5 As New TableHeaderCell
        tc5.Text = "2015 Population"
        tc5.Scope = TableHeaderScope.Column
        tHeader.Cells.Add(tc5)

        LifeExpectancyTable.Rows.Add(tHeader)

        For Each row In LifeData
            Dim tRow As New TableRow
            tRow.BorderStyle = BorderStyle.Double
            Dim tCell00 As New TableCell
            Dim h00 As New Label()
            h00.Text = row.city
            tCell00.Controls.Add(h00)
            'tCell00.HorizontalAlign = HorizontalAlign.Center
            tCell00.VerticalAlign = VerticalAlign.Middle
            tRow.Cells.Add(tCell00)

            Dim tCell01 As New TableCell
            Dim h01 As New Label()
            h01.Text = row.zipcode
            tCell01.Controls.Add(h01)
            'tCell00.HorizontalAlign = HorizontalAlign.Center
            tCell01.VerticalAlign = VerticalAlign.Middle
            tRow.Cells.Add(tCell01)

            Dim tCell02 As New TableCell
            Dim h02 As New Label()
            h02.Text = row.county
            tCell02.Controls.Add(h02)
            'tCell00.HorizontalAlign = HorizontalAlign.Center
            tCell02.VerticalAlign = VerticalAlign.Middle
            tRow.Cells.Add(tCell02)

            Dim tCell03 As New TableCell
            Dim h03 As New Label()
            h03.Text = row.lifeexpectancy
            tCell03.Controls.Add(h03)
            'tCell00.HorizontalAlign = HorizontalAlign.Center
            tCell03.VerticalAlign = VerticalAlign.Middle
            tRow.Cells.Add(tCell03)

            Dim tCell04 As New TableCell
            Dim h04 As New Label()
            h04.Text = row.countypoverty
            tCell04.Controls.Add(h04)
            'tCell00.HorizontalAlign = HorizontalAlign.Center
            tCell04.VerticalAlign = VerticalAlign.Middle
            tRow.Cells.Add(tCell04)

            Dim tCell05 As New TableCell
            Dim h05 As New Label()
            h05.Text = row.population
            tCell05.Controls.Add(h05)
            'tCell00.HorizontalAlign = HorizontalAlign.Center
            tCell05.VerticalAlign = VerticalAlign.Middle
            tRow.Cells.Add(tCell05)

            LifeExpectancyTable.Rows.Add(tRow)
        Next
    End Sub

    Private Sub FillCardioTable(CardioData As List(Of Cardiovascular))
        Dim tHeader As New TableHeaderRow
        tHeader.TableSection = TableRowSection.TableHeader

        cardioheading.Visible = True
        cardio.Visible = True
        containercloud.Visible = True
        pdiv.Visible = True

        'tHeader.BackColor = Color.Silver
        tHeader.BorderStyle = BorderStyle.Solid
        Dim tc0 As New TableHeaderCell
        tc0.Text = "Class"
        tc0.Scope = TableHeaderScope.Column
        tHeader.Cells.Add(tc0)

        Dim tc1 As New TableHeaderCell
        tc1.Text = "Topic"
        tc1.Scope = TableHeaderScope.Column
        tHeader.Cells.Add(tc1)

        Dim tc2 As New TableHeaderCell
        tc2.Text = "Gender"
        tc2.Scope = TableHeaderScope.Column
        tHeader.Cells.Add(tc2)

        Dim tc3 As New TableHeaderCell
        tc3.Text = "Race/Ethnicity"
        tc3.Scope = TableHeaderScope.Column
        tHeader.Cells.Add(tc3)

        Dim tc4 As New TableHeaderCell
        tc4.Text = "Number of Deaths"
        tc4.Scope = TableHeaderScope.Column
        tHeader.Cells.Add(tc4)

        Dim tc5 As New TableHeaderCell
        tc5.Text = "Units"
        tc5.Scope = TableHeaderScope.Column
        tHeader.Cells.Add(tc5)

        CardiovascularTable.Rows.Add(tHeader)

        For Each row In CardioData
            Dim tRow As New TableRow

            tRow.BorderStyle = BorderStyle.Double
            Dim tCell00 As New TableCell
            Dim h00 As New Label()
            h00.Text = row.cclass
            tCell00.Controls.Add(h00)
            'tCell00.HorizontalAlign = HorizontalAlign.Center
            tCell00.VerticalAlign = VerticalAlign.Middle
            tRow.Cells.Add(tCell00)

            Dim tCell01 As New TableCell
            Dim h01 As New Label()
            h01.Text = row.topic
            tCell01.Controls.Add(h01)
            'tCell00.HorizontalAlign = HorizontalAlign.Center
            tCell01.VerticalAlign = VerticalAlign.Middle
            tRow.Cells.Add(tCell01)

            Dim tCell02 As New TableCell
            Dim h02 As New Label()
            h02.Text = row.strat1
            tCell02.Controls.Add(h02)
            'tCell00.HorizontalAlign = HorizontalAlign.Center
            tCell02.VerticalAlign = VerticalAlign.Middle
            tRow.Cells.Add(tCell02)

            Dim tCell03 As New TableCell
            Dim h03 As New Label()
            h03.Text = row.strat2
            tCell03.Controls.Add(h03)
            'tCell00.HorizontalAlign = HorizontalAlign.Center
            tCell03.VerticalAlign = VerticalAlign.Middle
            tRow.Cells.Add(tCell03)

            Dim tCell04 As New TableCell
            Dim h04 As New Label()
            h04.Text = row.value
            If row.value <> "" Then
                h04.Text = row.value
            Else
                h04.Text = "NA"
            End If
            tCell04.Controls.Add(h04)

            'tCell00.HorizontalAlign = HorizontalAlign.Center
            tCell04.VerticalAlign = VerticalAlign.Middle
            tRow.Cells.Add(tCell04)

            Dim tCell05 As New TableCell
            Dim h05 As New Label()
            h05.Text = row.unit
            tCell05.Controls.Add(h05)
            'tCell00.HorizontalAlign = HorizontalAlign.Center
            tCell05.VerticalAlign = VerticalAlign.Middle
            tRow.Cells.Add(tCell05)

            CardiovascularTable.Rows.Add(tRow)
        Next
    End Sub
End Class