Imports System.Data.Sql
Imports System.Data.SqlClient
Imports System.Configuration
Imports System.Data
Imports System.Text.RegularExpressions

Public Class Database
    Private Const CONNECTION_STRING_KEY As String = "CloudComputing"
    Private _sqlConn As SqlConnection

    Public Property SqlConn As SqlConnection
        Get
            If IsNothing(_sqlConn) Then
                _sqlConn = New System.Data.SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings(CONNECTION_STRING_KEY).ConnectionString)
            End If
            If String.IsNullOrEmpty(_sqlConn.ConnectionString) Then
                _sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings(CONNECTION_STRING_KEY).ConnectionString
            End If
            Return _sqlConn
        End Get
        Set(value As SqlConnection)
            _sqlConn = value
        End Set
    End Property

    Public Function GetLifeExpectancy(ByVal searchstr As String) As String
        Dim oCmdString As String = "GetLifeExpectancyByZip"
        If Regex.IsMatch(searchstr, "^[0-9 ]+$") Then
            oCmdString = "GetLifeExpectancyByZip"
        Else
            oCmdString = "GetLifeExpectancyByCity"
        End If

        Dim LifeExpectancy As String = ""
        Using oConn As System.Data.SqlClient.SqlConnection = SqlConn
            oConn.Open()

            Dim oCmd As New SqlCommand
            oCmd.Connection = oConn
            oCmd.CommandText = oCmdString
            oCmd.CommandType = CommandType.StoredProcedure

            oCmd.Parameters.AddWithValue("@searchstr", searchstr)

            Using dr As SqlClient.SqlDataReader = oCmd.ExecuteReader(CommandBehavior.CloseConnection)
                If dr.HasRows Then
                    If dr.Read Then
                        LifeExpectancy = CType(dr("expectancy"), String)
                    End If
                Else
                    LifeExpectancy = ""
                End If
            End Using
        End Using
        Return LifeExpectancy
    End Function

    Public Function GetLifeExpectancyData(ByVal searchstr As String) As List(Of LifeExpectancy)
        Dim oCmdString As String = "GetLifeExpectancyByZip"
        Dim retVal As New List(Of LifeExpectancy)
        If Regex.IsMatch(searchstr, "^[0-9 ]+$") Then
            oCmdString = "GetLifeExpectancyByZip"
        Else
            oCmdString = "GetLifeExpectancyByCity"
        End If

        Using oConn As System.Data.SqlClient.SqlConnection = SqlConn
            oConn.Open()

            Dim oCmd As New SqlCommand
            oCmd.Connection = oConn
            oCmd.CommandText = oCmdString
            oCmd.CommandType = CommandType.StoredProcedure

            oCmd.Parameters.AddWithValue("@searchstr", searchstr)

            Using dr As SqlClient.SqlDataReader = oCmd.ExecuteReader(CommandBehavior.CloseConnection)
                If dr.HasRows Then
                    While dr.Read
                        Dim detailRow As New LifeExpectancy
                        detailRow.zipcode = CType(dr("zipcode"), String)
                        detailRow.city = CType(dr("city"), String)
                        detailRow.lifeexpectancy = CType(dr("expectancy"), String)
                        detailRow.county = CType(dr("county"), String)
                        detailRow.population = CType(dr("population"), String)
                        detailRow.countypoverty = CType(dr("countypoverty"), String)
                        retVal.Add(detailRow)
                    End While
                End If
            End Using
        End Using
        Return retVal
    End Function

    Public Function GetCardioVascularData(ByVal searchstr As String) As List(Of Cardiovascular)
        Dim oCmdString As String = "GetCardiovascularData"
        Dim retVal As New List(Of Cardiovascular)

        Using oConn As System.Data.SqlClient.SqlConnection = SqlConn
            oConn.Open()

            Dim oCmd As New SqlCommand
            oCmd.Connection = oConn
            oCmd.CommandText = oCmdString
            oCmd.CommandType = CommandType.StoredProcedure

            oCmd.Parameters.AddWithValue("@searchstr", searchstr)

            Using dr As SqlClient.SqlDataReader = oCmd.ExecuteReader(CommandBehavior.CloseConnection)
                If dr.HasRows Then
                    While dr.Read
                        Dim detailRow As New Cardiovascular
                        detailRow.cclass = CType(dr("class"), String)
                        detailRow.topic = CType(dr("topic"), String)
                        detailRow.stratcategory1 = CType(dr("stratificationcategory1"), String)
                        detailRow.strat1 = CType(dr("stratification1"), String)
                        detailRow.stratcategory2 = CType(dr("stratificationcategory2"), String)
                        detailRow.strat2 = CType(dr("stratification2"), String)
                        detailRow.value = CType(dr("data_value"), String)
                        detailRow.unit = CType(dr("data_value_unit"), String)
                        retVal.Add(detailRow)
                    End While
                End If
            End Using
        End Using
        Return retVal
    End Function
End Class
