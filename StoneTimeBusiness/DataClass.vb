Imports System
Imports System.Data.OleDb
Imports System.Data.SqlClient
'Imports Microsoft.Data.Odbc

Imports System.IO
Imports System.Text
Imports System.Net
Imports System.Net.Sockets
Imports System.Diagnostics
Imports System.Configuration

Imports System.Exception

Public Class DataAccess
    Public ConnectionString As String
    Private SConnection As SqlClient.SqlConnection
    Private AConnection As OleDb.OleDbConnection
    '        Private ODBCConnection As ODBCConnection
    Public LogObject As Boolean = False
    Public RunTime As Double
    Public Statements As New Collection
    Public Provider As ProviderType '= ProviderType.Oracle
    Public ExceptionMessage As String
    Public MyRoot As String

    Public Enum ProviderType
        SQLServer = 1
        MSAccess = 2
        Oracle = 3
        Informix = 4
    End Enum

    Private Timer As DateTime

    'Public Shared Function sp_ValidateLogin(ByVal KeyID As Int32) As Int32
    '    Dim db As New DataAccess
    '    Dim cn As SqlConnection = New SqlConnection(Configuration.ConfigurationManager.ConnectionStrings("ApplicationServices").ConnectionString)
    '    Dim sqlcmd As SqlCommand = New SqlCommand("sp_OutputParams", cn)
    '    sqlcmd.CommandType = CommandType.StoredProcedure
    '    Dim sp As SqlParameter

    '    'db.ConnectionString()

    '    Dim SBError As New StringBuilder
    '    sp = sqlcmd.Parameters.Add("@MyID", SqlDbType.Int)
    '    'sp.Value = HotelID
    '    ' Count Output Parameter
    '    sp = sqlcmd.Parameters.Add("@MyResult", SqlDbType.Int)
    '    'sp.Size = 40
    '    sp.Direction = ParameterDirection.Output
    '    Try
    '        cn.Open()
    '        sqlcmd.ExecuteNonQuery()
    '        Return CType(sqlcmd.Parameters("@MyResult").Value, Int32)
    '    Catch objException As SqlException
    '        Dim objError As SqlError
    '        SBError.Append("There was a SQL database-related error encountered.")
    '        For Each objError In objException.Errors
    '            SBError.Append("<li>" & objError.Message)
    '        Next
    '        Throw New Exception("SQLDAL.sp_OutputParams SqlException: " & SBError.ToString())
    '    Catch ex As Exception
    '        SBError.Append("There was a general error encountered.")
    '        SBError.Append("<li>" + ex.Message)
    '        Throw New Exception("SQLDAL.sp_OutputParams Gen Exception: " & SBError.ToString())
    '    Finally
    '        cn.Close()
    '        cn.Dispose()
    '        cn = Nothing
    '    End Try
    'End Function

    Public Function Reader(ByVal sql As String) As SqlClient.SqlDataReader
        StartTimer()

        Debug.WriteLine("DataAccess.Reader - " & sql)

        Try
            Select Case Provider

                Case ProviderType.SQLServer

                    If SConnection.State = ConnectionState.Open Then
                    Else
                        SConnection.Open()
                    End If

                    Dim MyCommand1 As SqlClient.SqlCommand = New SqlClient.SqlCommand(sql, SConnection)

                    Dim Rdr As SqlClient.SqlDataReader

                    Rdr = MyCommand1.ExecuteReader(CommandBehavior.CloseConnection)
                    Reader = Rdr

            End Select

            ExceptionMessage = "No Error"

        Catch exp As Exception
            'Dim err As Logger = New Logger("[DataAccess.Query()]" & Chr(13) & Chr(10) & Chr(5) & "[Parameters:] " & sql & Chr(13) & Chr(10) & Chr(5) & Chr(5) & "[Exception] " & exp.Message)
            ExceptionMessage = exp.Message
            'Exceptions.Write("DataAccess.Reader", "", sql, ExceptionTypes.DataAccessError, exp.Message)

        End Try

        StopTimer(sql)

    End Function

    Public Function GetCount(ByVal sql As String) As Integer
        StartTimer()

        Try
            Select Case Provider

                Case ProviderType.SQLServer

                    If SConnection.State = ConnectionState.Open Then
                    Else
                        SConnection.Open()
                    End If

                    Dim MyCommand1 As SqlClient.SqlCommand = New SqlClient.SqlCommand(sql, SConnection)

                    Dim Rdr As SqlClient.SqlDataReader

                    Return MyCommand1.ExecuteScalar()
                    'GetCount = Rdr

            End Select

            ExceptionMessage = "No Error"

        Catch exp As Exception
            'Dim err As Logger = New Logger("[DataAccess.Query()]" & Chr(13) & Chr(10) & Chr(5) & "[Parameters:] " & sql & Chr(13) & Chr(10) & Chr(5) & Chr(5) & "[Exception] " & exp.Message)
            ExceptionMessage = exp.Message
            'Exceptions.Write("DataAccess.GetCount", "", sql, ExceptionTypes.DataAccessError, exp.Message)
        End Try

        StopTimer(sql)
        Return -1
    End Function

    'Executes query and returns a DataTable with results
    Public Function Query(ByVal sql As String) As DataTable

        StartTimer()

        Debug.WriteLine("DataAccess.Query - " & sql)

        Try
            Select Case Provider

                Case ProviderType.MSAccess
                    Dim MyCommand1 As OleDbDataAdapter = New OleDbDataAdapter(sql, AConnection)

                    Dim DS As New DataTable
                    MyCommand1.Fill(DS)
                    Return DS

                Case ProviderType.SQLServer
                    Dim MyCommand1 As SqlClient.SqlDataAdapter = New SqlClient.SqlDataAdapter(sql, SConnection)

                    Dim DS As New DataTable

                    MyCommand1.Fill(DS)
                    Return DS


            End Select

            ExceptionMessage = "No Error"

        Catch exp As Exception
            'Dim err As Logger = New Logger("[DataAccess.Query()]" & Chr(13) & Chr(10) & Chr(5) & "[Parameters:] " & sql & Chr(13) & Chr(10) & Chr(5) & Chr(5) & "[Exception] " & exp.Message)
            ExceptionMessage = exp.Message
            'Exceptions.Write("DataAccess.Query", "", sql, ExceptionTypes.DataAccessError, exp.Message)
        End Try

        StopTimer(sql)


    End Function

    Public Function Query(ByVal sql As String, ByVal startRecord As Integer, ByVal maxRecords As Integer) As DataSet
        StartTimer()

        Debug.WriteLine("DataAccess.Query(DataSet) - " & sql)

        Dim iDA As Common.DbDataAdapter
        Dim ds As New DataSet

        Try
            Select Case Provider
                Case ProviderType.MSAccess
                    iDA = New OleDbDataAdapter(sql, AConnection)
                Case ProviderType.SQLServer
                    iDA = New SqlClient.SqlDataAdapter(sql, SConnection)
            End Select

            If Not iDA Is Nothing Then iDA.Fill(ds, startRecord, maxRecords, "")

            Return ds

            ExceptionMessage = "No Error"

        Catch exp As Exception
            ExceptionMessage = exp.Message
            'Exceptions.Write("DataAccess.Query(DataSet)", "", sql, ExceptionTypes.DataAccessError, exp.Message)
        End Try

        StopTimer(sql)
        Return New DataSet()

    End Function
    Private Function PrepareSPCommand(ByVal spName As String, ByRef spparamvalues As String, ByVal ParamArray dataParams() As IDbDataParameter) As IDbCommand
        Dim iDBCommand As IDbCommand
        Dim iDBParam As IDbDataParameter

        Select Case Provider
            Case ProviderType.MSAccess
                iDBCommand = New OleDbCommand(spName, AConnection)
            Case ProviderType.SQLServer
                iDBCommand = New SqlCommand(spName, SConnection)
        End Select

        iDBCommand.CommandType = CommandType.StoredProcedure
        iDBCommand.CommandTimeout = 100
        For Each iDBParam In dataParams
            spparamvalues += "[" & iDBParam.ParameterName & "=" & iDBParam.Value & "]"
            iDBCommand.Parameters.Add(iDBParam)
        Next
        Return iDBCommand
    End Function
    Public Function ExecuteSPNonQuery(ByVal spName As String, ByVal ParamArray dataParams() As IDbDataParameter) As Integer
        StartTimer()

        Dim iDBCommand As IDbCommand
        Dim spparamvalues As String = ""
        Try
            iDBCommand = PrepareSPCommand(spName, spparamvalues, dataParams)
            Debug.WriteLine("DataAccess.ExecuteSP - " & spName & "-" & spparamvalues)

            iDBCommand.Connection.Open()
            ExecuteSPNonQuery = iDBCommand.ExecuteNonQuery()
            iDBCommand.Connection.Close()

            ExceptionMessage = "No Error"
        Catch exp As Exception
            ExceptionMessage = exp.Message
            'Exceptions.Write("DataAccess.ExecuteSPNonQuery", "", spName & "-" & spparamvalues, ExceptionTypes.DataAccessError, exp.Message)
        End Try
        StopTimer(spName)
        Return -1

    End Function
    Public Function ExecuteSPDataSet(ByVal spName As String, ByVal ParamArray dataParams() As IDbDataParameter) As DataSet
        StartTimer()

        Dim iDBCommand As IDbCommand
        Dim iDBAdapter As IDbDataAdapter
        Dim spparamvalues As String = ""
        Dim ds As New DataSet

        Try
            iDBCommand = PrepareSPCommand(spName, spparamvalues, dataParams)
            Debug.WriteLine("DataAccess.ExecuteSP - " & spName & "-" & spparamvalues)

            Select Case Provider
                Case ProviderType.MSAccess
                    iDBAdapter = New OleDbDataAdapter(iDBCommand)
                Case ProviderType.SQLServer
                    iDBAdapter = New SqlDataAdapter(iDBCommand)
            End Select
            iDBAdapter.Fill(ds)

            ExecuteSPDataSet = ds

            ExceptionMessage = "No Error"
        Catch exp As Exception
            ExceptionMessage = exp.Message
            'Exceptions.Write("DataAccess.ExecuteSPDataSet", "", spName & "-" & spparamvalues, ExceptionTypes.DataAccessError, exp.Message)
        End Try
        StopTimer(spName)
        Return New DataSet

    End Function
    Public Function ExecuteSPDataTable(ByVal spName As String, ByVal ParamArray dataParams() As IDbDataParameter) As DataTable
        Dim ds As DataSet = ExecuteSPDataSet(spName, dataParams)
        If ds.Tables.Count > 0 Then
            Return ds.Tables(0)
        Else
            Return New DataTable
        End If
    End Function
    Public Function ExecuteBatch(ByVal sql() As String) As Boolean
        StartTimer()

        Dim lsql As String

        Select Case Provider

            'Case ProviderType.MSAccess

            '	Dim myCommand As New OleDbCommand(sql, AConnection)

            '	If myCommand.Connection.State = ConnectionState.Open Then
            '	Else
            '		myCommand.Connection.Open()
            '	End If

            '	ExecuteSQL = myCommand.ExecuteNonQuery()
            '	AConnection.Close()

            Case ProviderType.SQLServer

                Dim myCommand As SqlClient.SqlCommand

                If SConnection.State = ConnectionState.Open Then
                Else
                    SConnection.Open()
                End If

                myCommand = SConnection.CreateCommand()
                Dim myTrans As SqlClient.SqlTransaction

                ' Start a local transaction
                myTrans = SConnection.BeginTransaction(IsolationLevel.ReadCommitted)
                ' Assign transaction object for a pending local transaction
                myCommand.Transaction = myTrans

                Try

                    ' Loop through statements
                    Dim s As String

                    For Each s In sql
                        lsql &= s & Chr(13) & Chr(10)
                        myCommand.CommandText = s
                        myCommand.ExecuteNonQuery()
                    Next

                    myTrans.Commit()
                    ExceptionMessage = "No Error"

                Catch exp As Exception
                    myTrans.Rollback()
                    'Dim err As Logger = New Logger("[DataAccess.ExecuteSQL()]" & Chr(13) & Chr(10) & Chr(5) & "[Parameters:] " & lsql & Chr(13) & Chr(10) & Chr(5) & Chr(5) & "[Exception] " & exp.Message)
                    ExceptionMessage = exp.Message

                Finally
                    SConnection.Close()
                    StopTimer(lsql)

                End Try
                '	Dim myCommand As New SqlClient.SqlCommand(sql, SConnection)

                '	If myCommand.Connection.State = ConnectionState.Open Then
                '	Else
                '		myCommand.Connection.Open()
                '	End If

                '	ExecuteSQL = myCommand.ExecuteNonQuery()
                '	SConnection.Close()


        End Select

        If ExceptionMessage = "No Error" Then
            Return True
        Else
            Return False
        End If

    End Function

    ' Executes a statement and returns rows affected
    Public Function ExecuteSQL(ByVal sql As String, Optional ByVal HasIdentity As Boolean = False) As Integer
        StartTimer()

        Try
            Select Case Provider

                Case ProviderType.MSAccess

                    Dim myCommand As New OleDbCommand(sql, AConnection)

                    If myCommand.Connection.State = ConnectionState.Open Then
                    Else
                        myCommand.Connection.Open()
                    End If

                    ExecuteSQL = myCommand.ExecuteNonQuery()
                    AConnection.Close()

                Case ProviderType.SQLServer

                    Dim myCommand As New SqlClient.SqlCommand(sql, SConnection)

                    If myCommand.Connection.State = ConnectionState.Open Then
                    Else
                        myCommand.Connection.Open()
                    End If

                    Dim ret As Integer = myCommand.ExecuteNonQuery()

                    If HasIdentity Then
                        Return Me.Query("Select @@Identity").Rows(0).Item(0)
                    Else
                        Return ret
                    End If

                    SConnection.Close()


            End Select

            ExceptionMessage = "No Error"
            StopTimer(sql)

        Catch exp As Exception
            'Dim err As Logger = New Logger("[DataAccess.ExecuteSQL()]" & Chr(13) & Chr(10) & Chr(5) & "[Parameters:] " & sql & Chr(13) & Chr(10) & Chr(5) & Chr(5) & "[Exception] " & exp.Message)
            ExceptionMessage = exp.Message

            'if exp.Source =
            'Exceptions.Write("", sql, exp)
        End Try

    End Function

    Public Function Exception(ByVal sql As String) As Integer
        StartTimer()

        Select Case Provider

            Case ProviderType.MSAccess

                Dim myCommand As New OleDbCommand(sql, AConnection)

                If myCommand.Connection.State = ConnectionState.Open Then
                Else
                    myCommand.Connection.Open()
                End If

                Exception = myCommand.ExecuteNonQuery()
                AConnection.Close()

            Case ProviderType.SQLServer

                Dim myCommand As New SqlClient.SqlCommand(sql, SConnection)

                If myCommand.Connection.State = ConnectionState.Open Then
                Else
                    myCommand.Connection.Open()
                End If

                Dim ret As Integer = myCommand.ExecuteNonQuery()

                Return ret

                SConnection.Close()

        End Select

        ExceptionMessage = "No Error"
        StopTimer(sql)

    End Function

    'Public Sub New()
    'Dim config As New ConfigurationManager.ConfigurationManager()

    'ConnectionString = ConfigurationManager.GetConfigStringValue("ConnectionString")
    'OConnection = New OracleConnection(ConnectionString)
    '	ExceptionMessage = "Please enter a connection String"

    'End Sub

    Public Sub New()
        ' Get default connection Strings from Config
        Dim ConnectionString As String = ConfigurationManager.ConnectionStrings("ApplicationServices").ConnectionString()
        Dim ConnectionProvider As Integer = 1 'CInt(ConfigurationManager.GetConfigStringValue("ConnectionProvider"))

        Connect(ConnectionString, ConnectionProvider)
        'ConnectionString = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source= " & myroot & "\HumaneSociety.mdb;"
    End Sub

    Public Sub New(ByVal ConnectionString As String, ByVal ConnectionProvider As Integer)
        Connect(ConnectionString, ConnectionProvider)
    End Sub
    Public Sub Connect(ByVal conn As String, ByVal prv As Integer)

        Select Case prv
            Case 1
                Provider = ProviderType.SQLServer
            Case 2
                Provider = ProviderType.Oracle
            Case 3
                Provider = ProviderType.MSAccess
            Case 4
                Provider = ProviderType.Informix

        End Select

        ConnectionString = conn

        Select Case Provider

            Case ProviderType.MSAccess
                AConnection = New OleDbConnection(ConnectionString)

            Case ProviderType.SQLServer
                SConnection = New SqlClient.SqlConnection(ConnectionString)

        End Select
    End Sub

    'Protected Overrides Sub Finalize()

    '    Try
    '        Select Case Provider

    '            Case ProviderType.MSAccess
    '                AConnection.Close()

    '            Case ProviderType.SQLServer
    '                SConnection.Close()

    '            Case ProviderType.Oracle
    '                OConnection.Close()

    '            Case ProviderType.Informix
    '                ODBCConnection.Close()

    '        End Select

    '        MyBase.Finalize()

    '    Catch ex As Exception
    '        Dim err As Logger = New Logger("[DataAccess.ExecuteSQL()]" & Chr(13) & Chr(10) & Chr(5) & "[Exception] " & ex.Message)
    '        ExceptionMessage = ex.Message()

    '    End Try
    'End Sub

    Public Sub Log(ByVal str As String)
        If LogObject Then
            'Dim log As Logger = New Logger(str)
        End If

    End Sub

    Public Sub StartTimer()
        ' Timer = DateTime.Now

    End Sub

    Public Sub StopTimer(ByVal sql As String)
        'RunTime = (DateTime.Now.Ticks - Timer.Ticks) / 10000000

        '' Get LongRunningQueryTimeout from Configuration Manager if set
        'Try
        '    Dim Timeout As String = ConfigurationManager..GetConfigStringValue("LongRunningQueryTimeout")

        '    If IsNumeric(Timeout) Then
        '        If RunTime > CDbl(Timeout) Then
        '            'Dim err As Logger = New Logger("[" & DateTime.Now & " - DataAccess - " & Format(RunTime, "#,##0.000") & "]" & sql & Chr(13) & Chr(10))
        '            Debug.WriteLine("Long Running Query = " & Format(RunTime, "#,##0.000") & "]" & sql & Chr(13))
        '            'Exceptions.Write("DataAccess.LongRunningQuery", "", sql, ExceptionTypes.DataAccessPerformance, "")
        '        End If
        '    Else
        '    End If

        'Catch e As Exception
        'End Try

        'Statements.Add(RunTime & " - " & sql)

    End Sub
End Class
