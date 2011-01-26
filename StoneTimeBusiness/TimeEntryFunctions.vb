Imports System.Data.SqlClient
Imports System.Diagnostics
Public Class TimeEntryFunctions
    Dim FUNCTION_NAME As String
    
    Public Function SaveContact(ByVal ContactID As Integer, ByVal ClientID As Integer, ByVal FirstName As String, ByVal MiddleName As String, ByVal LastName As String, ByVal Email As String, ByVal Phone As String, ByVal Fax As String, ByVal Address1 As String, ByVal Address2 As String, ByVal City As String, ByVal State As String, ByVal zip As String) As DataTable
        'updates or saves data for an existing or new contact
        'calls the SAVE_CONTACT_DATA stored procedure
        Dim cn As SqlConnection = New SqlConnection(Configuration.ConfigurationManager.ConnectionStrings("ApplicationServices").ConnectionString)
        Dim myCmd As SqlClient.SqlCommand = New SqlCommand
        Dim dp1 As New SqlClient.SqlParameter
        Dim dp2 As New SqlClient.SqlParameter
        Dim dp3 As New SqlClient.SqlParameter
        Dim dp4 As New SqlClient.SqlParameter
        Dim dp5 As New SqlClient.SqlParameter
        Dim dp6 As New SqlClient.SqlParameter
        Dim dp7 As New SqlClient.SqlParameter
        Dim dp8 As New SqlClient.SqlParameter
        Dim dp9 As New SqlClient.SqlParameter
        Dim dp10 As New SqlClient.SqlParameter
        Dim dp11 As New SqlClient.SqlParameter
        Dim dp12 As New SqlClient.SqlParameter
        Dim dp13 As New SqlClient.SqlParameter

        cn.Open()

        myCmd.CommandType = CommandType.StoredProcedure
        myCmd.CommandText = "SAVE_CONTACT_DATA"
        myCmd.Connection = cn

        'here we use the client drop down in the actual contact area so that we can
        'change which client a contact belongs to
        dp1.Direction = ParameterDirection.Input
        dp1.ParameterName = "@CLIENT_ID"
        dp1.Value = ClientID
        myCmd.Parameters.Add(dp1)

        dp2.Direction = ParameterDirection.Input
        dp2.ParameterName = "@CONTACT_ID"
        dp2.Value = ContactID
        myCmd.Parameters.Add(dp2)

        dp3.Direction = ParameterDirection.Input
        dp3.ParameterName = "@FIRST_NAME"
        dp3.Value = FirstName
        myCmd.Parameters.Add(dp3)

        dp4.Direction = ParameterDirection.Input
        dp4.ParameterName = "@MIDDLE_NAME"
        dp4.Value = MiddleName
        myCmd.Parameters.Add(dp4)

        dp5.Direction = ParameterDirection.Input
        dp5.ParameterName = "@LAST_NAME"
        dp5.Value = LastName
        myCmd.Parameters.Add(dp5)

        dp6.Direction = ParameterDirection.Input
        dp6.ParameterName = "@EMAIL"
        dp6.Value = Email
        myCmd.Parameters.Add(dp6)

        dp12.Direction = ParameterDirection.Input
        dp12.ParameterName = "@PHONE"
        dp12.Value = Phone
        myCmd.Parameters.Add(dp12)

        dp13.Direction = ParameterDirection.Input
        dp13.ParameterName = "@FAX"
        dp13.Value = Fax
        myCmd.Parameters.Add(dp13)

        dp7.Direction = ParameterDirection.Input
        dp7.ParameterName = "@ADDRESS1"
        dp7.Value = Address1
        myCmd.Parameters.Add(dp7)

        dp8.Direction = ParameterDirection.Input
        dp8.ParameterName = "@ADDRESS2"
        dp8.Value = Address2
        myCmd.Parameters.Add(dp8)

        dp9.Direction = ParameterDirection.Input
        dp9.ParameterName = "@CITY"
        dp9.Value = City
        myCmd.Parameters.Add(dp9)

        dp10.Direction = ParameterDirection.Input
        dp10.ParameterName = "@STATE_ID"
        dp10.Value = State
        myCmd.Parameters.Add(dp10)

        dp11.Direction = ParameterDirection.Input
        dp11.ParameterName = "@ZIP"
        dp11.Value = zip
        myCmd.Parameters.Add(dp11)

        Dim da As IDbDataAdapter
        Dim ds As New DataSet

        da = New SqlDataAdapter(myCmd)
        da.Fill(ds)
        Dim dt As New DataTable
        dt = ds.Tables(0)

        If cn.State = ConnectionState.Open Then
            cn.Close()
        End If

        Return dt

    End Function
    Public Function SaveClientData(ByVal clientid As String, ByVal companyname As String, ByVal website As String, ByVal address1 As String, _
                                   ByVal address2 As String, ByVal city As String, ByVal state As String, ByVal zip As String, ByVal comment As String) As Int16
        'updates or saves a clients data
        'calls the SAVE_CLIENT_DATA stored procedure
        Dim cn As SqlConnection = New SqlConnection(Configuration.ConfigurationManager.ConnectionStrings("ApplicationServices").ConnectionString)
        Dim myCmd As SqlClient.SqlCommand = New SqlCommand("SAVE_CLIENT_DATA", cn)
        Dim dp1 As New SqlClient.SqlParameter
        Dim dp2 As New SqlClient.SqlParameter
        Dim dp3 As New SqlClient.SqlParameter
        Dim dp4 As New SqlClient.SqlParameter
        Dim dp5 As New SqlClient.SqlParameter
        Dim dp6 As New SqlClient.SqlParameter
        Dim dp7 As New SqlClient.SqlParameter
        Dim dp8 As New SqlClient.SqlParameter
        Dim dp9 As New SqlClient.SqlParameter
        Dim dp10 As New SqlClient.SqlParameter

        myCmd.CommandType = CommandType.StoredProcedure
        dp1.Direction = ParameterDirection.Input
        dp1.ParameterName = "@CLIENT_ID"
        dp1.Value = clientid
        myCmd.Parameters.Add(dp1)

        dp2.Direction = ParameterDirection.Input
        dp2.ParameterName = "@COMPANY_NAME"
        dp2.Value = companyname
        myCmd.Parameters.Add(dp2)

        dp3.Direction = ParameterDirection.Input
        dp3.ParameterName = "@COMMENT"
        dp3.Value = comment
        myCmd.Parameters.Add(dp3)

        dp4.Direction = ParameterDirection.Input
        dp4.ParameterName = "@COMPANY_WEBSITE"
        dp4.Value = website
        myCmd.Parameters.Add(dp4)

        dp5.Direction = ParameterDirection.Input
        dp5.ParameterName = "@ADDRESS1"
        dp5.Value = address1
        myCmd.Parameters.Add(dp5)

        dp6.Direction = ParameterDirection.Input
        dp6.ParameterName = "@ADDRESS2"
        dp6.Value = address2
        myCmd.Parameters.Add(dp6)

        dp7.Direction = ParameterDirection.Input
        dp7.ParameterName = "@CITY"
        dp7.Value = city
        myCmd.Parameters.Add(dp7)

        dp8.Direction = ParameterDirection.Input
        dp8.ParameterName = "@STATE_ID"
        dp8.Value = state
        myCmd.Parameters.Add(dp8)

        dp9.Direction = ParameterDirection.Input
        dp9.ParameterName = "@ZIP"
        dp9.Value = zip
        myCmd.Parameters.Add(dp9)

        dp10.Direction = ParameterDirection.Input
        dp10.ParameterName = "@TYPE"
        dp10.Value = "CLIENT"
        myCmd.Parameters.Add(dp10)

        cn.Open()
        SaveClientData = myCmd.ExecuteScalar()
        If cn.State = ConnectionState.Open Then
            cn.Close()
        End If

    End Function
    Public Function GetClientData(ByVal clientid As String) As DataTable
        'Fills the client fields with data for the currently selected client
        Dim cn As SqlConnection = New SqlConnection(Configuration.ConfigurationManager.ConnectionStrings("ApplicationServices").ConnectionString)
        Dim myCmd As SqlClient.SqlCommand = New SqlCommand("GET_CLIENTS", cn)
        Dim dp1 As New SqlClient.SqlParameter
        Dim da As IDbDataAdapter
        Dim ds As New DataSet
        Dim dt As New DataTable

        myCmd.CommandType = CommandType.StoredProcedure
        dp1.Direction = ParameterDirection.Input
        dp1.ParameterName = "@CLIENT_ID"
        dp1.Value = clientid
        myCmd.Parameters.Add(dp1)

        cn.Open()

        da = New SqlDataAdapter(myCmd)
        da.Fill(ds)

        If cn.State = ConnectionState.Open Then
            cn.Close()
        End If

        dt = ds.Tables(0)

        Return dt
        
    End Function
    Public Function GetContactList(ByVal clientid As Integer) As DataTable
        'Populates the client address fields for the currently selected client
        Dim cn As SqlConnection = New SqlConnection(Configuration.ConfigurationManager.ConnectionStrings("ApplicationServices").ConnectionString)
        Dim myCmd As SqlClient.SqlCommand = New SqlCommand("GET_CONTACTS", cn)
        Dim dp1 As New SqlClient.SqlParameter
        Dim dp2 As New SqlClient.SqlParameter
        Dim da As IDbDataAdapter
        Dim ds As New DataSet
        Dim dt As New DataTable

        myCmd.CommandType = CommandType.StoredProcedure
        dp1.Direction = ParameterDirection.Input
        dp1.ParameterName = "@CLIENT_ID"
        dp1.Value = clientid
        If (clientid > 0) Then
            myCmd.Parameters.Add(dp1)
        End If

        cn.Open()

        da = New SqlDataAdapter(myCmd)
        da.Fill(ds)

        If cn.State = ConnectionState.Open Then
            cn.Close()
        End If

        dt = ds.Tables(0)

        Return dt

    End Function
    Public Function GetClientAddress(ByVal clientid As String) As DataTable
        'Populates the client address fields for the currently selected client
        Dim cn As SqlConnection = New SqlConnection(Configuration.ConfigurationManager.ConnectionStrings("ApplicationServices").ConnectionString)
        Dim myCmd As SqlClient.SqlCommand = New SqlCommand("GET_ADDRESS", cn)
        Dim dp1 As New SqlClient.SqlParameter
        Dim dp2 As New SqlClient.SqlParameter
        Dim da As IDbDataAdapter
        Dim ds As New DataSet
        Dim dt As New DataTable

        myCmd.CommandType = CommandType.StoredProcedure
        dp1.Direction = ParameterDirection.Input
        dp1.ParameterName = "@ADDRESS_ID"
        dp1.Value = clientid
        myCmd.Parameters.Add(dp1)

        dp2.Direction = ParameterDirection.Input
        dp2.ParameterName = "@TYPE"
        dp2.Value = "Client"
        myCmd.Parameters.Add(dp2)

        cn.Open()

        da = New SqlDataAdapter(myCmd)
        da.Fill(ds)

        If cn.State = ConnectionState.Open Then
            cn.Close()
        End If

        dt = ds.Tables(0)

        Return dt
        
    End Function
    Public Function SaveUser(ByVal userid As String, ByVal firstname As String, ByVal lastname As String, ByVal middlename As String, _
                         ByVal role As String, ByVal employeetype As String, ByVal status As String, ByVal password As String, ByVal username As String, _
                         ByVal startdate As String, ByVal enddate As String, ByVal title As String, ByVal ptogroupid As String, ByVal email As String) As DataTable
        Try
            ' save user data to SQL Server database - "Yoda" using stored procedure SAVE_USER_DATA
            Dim cn As SqlConnection = New SqlConnection(Configuration.ConfigurationManager.ConnectionStrings("ApplicationServices").ConnectionString)
            Dim myCmd As SqlClient.SqlCommand = New SqlCommand("SAVE_USER_DATA", cn)
            myCmd.CommandType = CommandType.StoredProcedure
            ' get the USER_ID of the user to be updated 
            Dim strUser As String = userid.ToString()

            ' connect to database
            cn.Open()

            '   @First STRING,
            Dim sFirstName As String = firstname
            Dim dpFirst As New SqlClient.SqlParameter
            dpFirst.Direction = ParameterDirection.Input
            dpFirst = myCmd.CreateParameter()
            dpFirst.ParameterName = "@First"
            dpFirst.Value = sFirstName
            myCmd.Parameters.Add(dpFirst)

            '   @Middle STRING
            Dim sMiddleName As String = middlename
            Dim dpMiddle As New SqlClient.SqlParameter
            dpMiddle.Direction = ParameterDirection.Input
            dpMiddle = myCmd.CreateParameter()
            dpMiddle.ParameterName = "@Middle"
            dpMiddle.Value = sMiddleName
            myCmd.Parameters.Add(dpMiddle)

            '   @Last STRING
            Dim sLastName As String = lastname
            Dim dpLast As New SqlClient.SqlParameter
            dpLast.Direction = ParameterDirection.Input
            dpLast = myCmd.CreateParameter()
            dpLast.ParameterName = "@Last"
            dpLast.Value = sLastName
            myCmd.Parameters.Add(dpLast)

            ' @USER_ID INT,
            Dim USER_ID As String = userid.ToString()
            Dim dpUSER_ID As New SqlClient.SqlParameter
            dpUSER_ID.Direction = ParameterDirection.Input
            dpUSER_ID = myCmd.CreateParameter()
            dpUSER_ID.ParameterName = "@USER_ID"
            If Len(USER_ID) > 0 Then
                dpUSER_ID.Value = USER_ID
            Else
                dpUSER_ID.Value = DBNull.Value
            End If
            myCmd.Parameters.Add(dpUSER_ID)

            ' @USER_TYPE_ID INT,
            Dim USER_TYPE_ID As String = role
            Dim dpUSER_TYPE_ID As New SqlClient.SqlParameter
            dpUSER_TYPE_ID.Direction = ParameterDirection.Input
            dpUSER_TYPE_ID = myCmd.CreateParameter()
            dpUSER_TYPE_ID.ParameterName = "@USER_TYPE_ID"
            dpUSER_TYPE_ID.Value = USER_TYPE_ID
            myCmd.Parameters.Add(dpUSER_TYPE_ID)

            ' @PTO_Group_ID
            Dim dtPto As New SqlClient.SqlParameter
            dtPto.Direction = ParameterDirection.Input
            dtPto = myCmd.CreateParameter()
            dtPto.ParameterName = "@PTO_Group_ID"
            dtPto.Value = ptogroupid
            myCmd.Parameters.Add(dtPto)

            ' @EMPLOYEE_TYPE_ID INT,
            Dim EMPLOYEE_TYPE_ID As String = employeetype
            Dim dpEMPLOYEE_TYPE_ID As New SqlClient.SqlParameter
            dpEMPLOYEE_TYPE_ID.Direction = ParameterDirection.Input
            dpEMPLOYEE_TYPE_ID = myCmd.CreateParameter()
            dpEMPLOYEE_TYPE_ID.ParameterName = "@EMPLOYEE_TYPE_ID"
            dpEMPLOYEE_TYPE_ID.Value = EMPLOYEE_TYPE_ID
            myCmd.Parameters.Add(dpEMPLOYEE_TYPE_ID)

            ' @USERNAME STRING,
            Dim sUserName As String = username
            Dim dpUserName As New SqlClient.SqlParameter
            dpUserName.Direction = ParameterDirection.Input
            dpUserName = myCmd.CreateParameter()
            dpUserName.ParameterName = "@USERNAME"
            dpUserName.Value = sUserName
            myCmd.Parameters.Add(dpUserName)

            ' @Email
            Dim dpEmail As New SqlClient.SqlParameter
            dpEmail.Direction = ParameterDirection.Input
            dpEmail = myCmd.CreateParameter()
            dpEmail.ParameterName = "@Email"
            dpEmail.Value = email
            myCmd.Parameters.Add(dpEmail)

            '   @PASSWORD   STRING
            Dim sPW As String = password
            Dim dpPassword As SqlClient.SqlParameter
            dpPassword = myCmd.CreateParameter()
            dpPassword.Direction = ParameterDirection.Input

            dpPassword.ParameterName = "@Password"
            dpPassword.Value = sPW
            myCmd.Parameters.Add(dpPassword)


            Dim dpStatus As SqlClient.SqlParameter

            dpStatus = myCmd.CreateParameter()
            dpStatus.ParameterName = "@Status"
            dpStatus.Value = status
            myCmd.Parameters.Add(dpStatus)

            Dim dpStartDate As SqlClient.SqlParameter
            dpStartDate = myCmd.CreateParameter()
            dpStartDate.ParameterName = "@START_DATE"
            If IsDate(startdate) Then
                dpStartDate.Value = startdate
            Else
                dpStartDate.Value = DBNull.Value
            End If
            myCmd.Parameters.Add(dpStartDate)

            Dim dpTermDate As SqlClient.SqlParameter
            dpTermDate = myCmd.CreateParameter()
            dpTermDate.ParameterName = "@TERMINATION_DATE"
            If IsDate(enddate) Then
                dpTermDate.Value = enddate
            Else
                dpTermDate.Value = DBNull.Value
            End If
            myCmd.Parameters.Add(dpTermDate)


            Dim dpTitle As SqlClient.SqlParameter

            dpTitle = myCmd.CreateParameter()
            dpTitle.ParameterName = "@TITLE_ID"
            dpTitle.Value = title
            myCmd.Parameters.Add(dpTitle)


            ' Call stored procedure SAVE_USER_DATA
            myCmd.Prepare()
            Debug.WriteLine(myCmd.CommandText)

            Debug.WriteLine(myCmd.ToString)

            Dim RETURN_VALUE As Object
            RETURN_VALUE = myCmd.ExecuteScalar()

            Debug.WriteLine("User Insert Return Value: " & RETURN_VALUE)

            If cn.State = ConnectionState.Open Then
                cn.Close()
            End If

        Catch ex As Exception
            Debug.Write(FUNCTION_NAME & " Error: " & ex.Message)
        End Try
    End Function
    Public Function GetRoles() As DataTable
        Dim cn As SqlConnection = New SqlConnection(Configuration.ConfigurationManager.ConnectionStrings("ApplicationServices").ConnectionString)
        Dim myCmd As SqlClient.SqlCommand = New SqlCommand("GET_USER_TYPES", cn)
        myCmd.CommandType = CommandType.StoredProcedure

        cn.Open()
        myCmd.Prepare()

        Dim da As IDbDataAdapter
        Dim ds As New DataSet

        da = New SqlDataAdapter(myCmd)
        da.Fill(ds)
        Dim dt As New DataTable
        dt = ds.Tables(0)

        Return dt

    End Function
    Public Function GetPTOGroupTypes() As DataTable
        Dim cn As SqlConnection = New SqlConnection(Configuration.ConfigurationManager.ConnectionStrings("ApplicationServices").ConnectionString)
        Dim myCmd As SqlClient.SqlCommand = New SqlCommand("GET_PTOGROUP_DATA", cn)
        myCmd.CommandType = CommandType.StoredProcedure

        cn.Open()

        Dim da As IDbDataAdapter
        Dim ds As New DataSet

        da = New SqlDataAdapter(myCmd)
        da.Fill(ds)

        If cn.State = ConnectionState.Open Then
            cn.Close()
        End If

        Dim dt As New DataTable
        dt = ds.Tables(0)

        Return dt
    End Function
    Public Function GetEmployeeTypes() As DataTable
        ' missing table - not used
        Dim cn As SqlConnection = New SqlConnection(Configuration.ConfigurationManager.ConnectionStrings("ApplicationServices").ConnectionString)
        Dim myCmd As SqlClient.SqlCommand = New SqlCommand("GET_EMPLOYEE_TYPES", cn)
        myCmd.CommandType = CommandType.StoredProcedure

        cn.Open()
        myCmd.Prepare()

        Dim da As IDbDataAdapter
        Dim ds As New DataSet

        da = New SqlDataAdapter(myCmd)
        da.Fill(ds)
        Dim dt As New DataTable
        dt = ds.Tables(0)

        Return dt

    End Function
    Public Sub DeleteUserTime(ByVal projectId As Integer, ByVal taskId As Integer, ByVal phaseId As Integer, ByVal billable As Boolean, ByVal userId As Integer)
        Try
            'Dim bQueryFailed As Boolean
            FUNCTION_NAME = "GetUserInfo"
            Dim dp1 As New SqlClient.SqlParameter
            Dim dp2 As New SqlClient.SqlParameter
            Dim dp3 As New SqlClient.SqlParameter
            Dim dp4 As New SqlClient.SqlParameter
            Dim dp5 As New SqlClient.SqlParameter

            Dim cn As SqlConnection = New SqlConnection(Configuration.ConfigurationManager.ConnectionStrings("ApplicationServices").ConnectionString)
            Dim myCmd As SqlClient.SqlCommand = New SqlCommand("DeleteUserTime", cn)
            myCmd.CommandType = CommandType.StoredProcedure

            dp1 = myCmd.CreateParameter()
            dp1.Direction = ParameterDirection.Input
            dp1.ParameterName = "@UserId"
            dp1.Value = userId
            myCmd.Parameters.Add(dp1)

            dp2 = myCmd.CreateParameter()
            dp2.Direction = ParameterDirection.Input
            dp2.ParameterName = "@ProjectId"
            dp2.Value = projectId
            myCmd.Parameters.Add(dp2)

            dp3 = myCmd.CreateParameter()
            dp3.Direction = ParameterDirection.Input
            dp3.ParameterName = "@TaskId"
            dp3.Value = taskId
            myCmd.Parameters.Add(dp3)

            dp4 = myCmd.CreateParameter()
            dp4.Direction = ParameterDirection.Input
            dp4.ParameterName = "@PhaseId"
            dp4.Value = phaseId
            myCmd.Parameters.Add(dp4)

            dp5 = myCmd.CreateParameter()
            dp5.Direction = ParameterDirection.Input
            dp5.ParameterName = "@Billable"
            dp5.Value = billable
            myCmd.Parameters.Add(dp5)
            cn.Open()

            Dim da As IDbDataAdapter
            Dim ds As New DataSet

            da = New SqlDataAdapter(myCmd)
            da.Fill(ds)


            cn.Close()
            cn.Dispose()
        Catch ex As Exception
            Debug.WriteLine(ex.Message)
            Throw ex
        End Try
    End Sub
    Public Function GetMostRecentProjects(ByVal UserID As Integer) As DataTable
        Try
            Dim dt As New DataTable

            Dim dp1 As New SqlClient.SqlParameter("UserID", UserID)
            dp1.Direction = ParameterDirection.Input

            Dim cn As SqlConnection = New SqlConnection(Configuration.ConfigurationManager.ConnectionStrings("ApplicationServices").ConnectionString)
            Dim myCmd As SqlClient.SqlCommand = New SqlCommand("recent_projects", cn)
            myCmd.CommandType = CommandType.StoredProcedure

            dp1 = myCmd.CreateParameter()
            dp1.Direction = ParameterDirection.Input
            dp1.ParameterName = "@UserID"
            dp1.Value = UserID
            myCmd.Parameters.Add(dp1)

            cn.Open()

            Dim da As IDbDataAdapter
            Dim ds As New DataSet

            da = New SqlDataAdapter(myCmd)
            da.Fill(ds)

            dt = ds.Tables(0)


            Return dt
        Catch ex As Exception
            Debug.WriteLine(ex.Message)
            Throw ex
        End Try
    End Function
    Public Function GetUserInfo(ByVal Username As String) As DataTable

        Try
            'Dim bQueryFailed As Boolean
            FUNCTION_NAME = "GetUserInfo"
            Dim dp1 As New SqlClient.SqlParameter

            Dim cn As SqlConnection = New SqlConnection(Configuration.ConfigurationManager.ConnectionStrings("ApplicationServices").ConnectionString)
            Dim myCmd As SqlClient.SqlCommand = New SqlCommand("GetUserInfo", cn)
            myCmd.CommandType = CommandType.StoredProcedure

            dp1 = myCmd.CreateParameter()
            dp1.Direction = ParameterDirection.Input
            dp1.ParameterName = "@Username"
            dp1.Value = Username
            myCmd.Parameters.Add(dp1)

            cn.Open()

            Dim da As IDbDataAdapter
            Dim ds As New DataSet

            da = New SqlDataAdapter(myCmd)
            da.Fill(ds)
            Dim dt As New DataTable
            dt = ds.Tables(0)

            cn.Close()
            cn.Dispose()

            Return dt
        Catch ex As Exception
            Debug.WriteLine(ex.Message)
            Throw ex
        End Try
    End Function
    Public Function FormatHours(ByVal hours As Decimal)
        Dim value As String = hours.ToString()
        value = value.Replace(".0000", String.Empty)
        value = value.Replace("000", String.Empty)
        value = value.Replace("00", String.Empty)

        Return value

    End Function

    Public Function SaveTime(ByVal dt As DataTable, ByVal userID As Integer, ByVal replace As Boolean) As Boolean
        Dim succeeded As Boolean = True
        Try
            FUNCTION_NAME = "SaveTime"
            ' save time data to SQL Server database - "Yoda" using stored procedure UPDATE_TIME
            Dim cn As SqlConnection = New SqlConnection(Configuration.ConfigurationManager.ConnectionStrings("ApplicationServices").ConnectionString)
            Dim myCmd As SqlClient.SqlCommand = New SqlCommand("UPDATE_TIME", cn)
            myCmd.CommandType = CommandType.StoredProcedure
            ' get the USER_ID the time records are being entered for 
            Dim strUser As String = userID.ToString()
            Dim EditMode As Integer = 1

            ' connect to database
            cn.Open()

            ' loop through the time data table
            Dim dr As DataRow

            For Each dr In dt.Rows

                ' the proc parameters are:

                Dim iReplace As Integer
                If replace = True Then
                    iReplace = 1
                Else
                    iReplace = 0
                End If
                Dim REPLACE_FLAG As Integer = iReplace
                Dim dpREPLACE_FLAG As New SqlClient.SqlParameter
                dpREPLACE_FLAG.Direction = ParameterDirection.Input
                dpREPLACE_FLAG = myCmd.CreateParameter()
                dpREPLACE_FLAG.Direction = ParameterDirection.Input
                dpREPLACE_FLAG.ParameterName = "@REPLACE_FLAG"
                dpREPLACE_FLAG.Value = REPLACE_FLAG

                myCmd.Parameters.Add(dpREPLACE_FLAG)

                '   @USER_ID INT,
                Dim USER_ID As String = strUser
                Dim dpUSER_ID As New SqlClient.SqlParameter
                dpUSER_ID.Direction = ParameterDirection.Input
                dpUSER_ID = myCmd.CreateParameter()
                dpUSER_ID.Direction = ParameterDirection.Input
                dpUSER_ID.ParameterName = "@USER_ID"
                dpUSER_ID.Value = USER_ID
                myCmd.Parameters.Add(dpUSER_ID)

                '   @PROJECT_ID INT,
                Dim PROJECT_ID As Integer = dr("Project")
                Dim dpPROJECT_ID As New SqlClient.SqlParameter
                dpPROJECT_ID.Direction = ParameterDirection.Input
                dpPROJECT_ID = myCmd.CreateParameter()
                dpPROJECT_ID.Direction = ParameterDirection.Input
                dpPROJECT_ID.ParameterName = "@PROJECT_ID"
                dpPROJECT_ID.Value = PROJECT_ID
                myCmd.Parameters.Add(dpPROJECT_ID)

                '   @TASK_ID INT,
                Dim TASK_ID As Integer = Val(dr("Task"))
                Dim dpTASK_ID As New SqlClient.SqlParameter
                dpTASK_ID.Direction = ParameterDirection.Input
                dpTASK_ID = myCmd.CreateParameter()
                dpTASK_ID.Direction = ParameterDirection.Input
                dpTASK_ID.ParameterName = "@TASK_ID"
                If TASK_ID = 0 Then
                    TASK_ID = ""
                End If
                dpTASK_ID.Value = TASK_ID
                myCmd.Parameters.Add(dpTASK_ID)

                '   @PHASE_ID INT,
                Dim PHASE_ID As Integer = Val(dr("Milestone"))
                Dim dpPHASE_ID As New SqlClient.SqlParameter
                dpPHASE_ID.Direction = ParameterDirection.Input
                dpPHASE_ID = myCmd.CreateParameter()
                dpPHASE_ID.Direction = ParameterDirection.Input
                dpPHASE_ID.ParameterName = "@PHASE_ID"
                If PHASE_ID = 0 Then
                    PHASE_ID = ""
                End If
                dpPHASE_ID.Value = PHASE_ID
                myCmd.Parameters.Add(dpPHASE_ID)

                '@DESCRIPTION varchar(500),
                'Dim DESCRIPTION As String
                'If Not dr("Description") Is DBNull.Value Then
                '    DESCRIPTION = dr("DESCRIPTION")
                'Else
                '    DESCRIPTION = ""
                'End If


                '   @DATE datetime,
                Dim dtBILL_DATE As Date = dr(1)
                Dim dpBILL_DATE As New SqlClient.SqlParameter
                dpBILL_DATE.Direction = ParameterDirection.Input
                dpBILL_DATE = myCmd.CreateParameter()
                dpBILL_DATE.Direction = ParameterDirection.Input
                dpBILL_DATE.ParameterName = "@BILL_DATE"
                dpBILL_DATE.Value = dtBILL_DATE
                myCmd.Parameters.Add(dpBILL_DATE)

                '   @BILLABLE INT,
                Dim BILLABLE As Integer = dr("BILLABLE")
                If BILLABLE <> 0 Then
                    BILLABLE = 1
                End If
                Dim dpBILLABLE As New SqlClient.SqlParameter
                dpBILLABLE.Direction = ParameterDirection.Input
                dpBILLABLE = myCmd.CreateParameter()
                dpBILLABLE.Direction = ParameterDirection.Input
                dpBILLABLE.ParameterName = "@BILLABLE"
                dpBILLABLE.Value = BILLABLE
                myCmd.Parameters.Add(dpBILLABLE)

                '   @HOURS INT
                Dim HOURS As Decimal
                If dr("DURATION") Is DBNull.Value Then
                    HOURS = 0
                Else
                    If Trim(dr("DURATION")) = "" Then
                        HOURS = 0
                    Else
                        HOURS = dr("DURATION")
                    End If

                End If

                Dim dpHOURS As New SqlClient.SqlParameter
                dpHOURS.Direction = ParameterDirection.Input
                dpHOURS = myCmd.CreateParameter()
                dpHOURS.Direction = ParameterDirection.Input
                dpHOURS.ParameterName = "@HOURS"
                dpHOURS.Value = Val(HOURS)
                myCmd.Parameters.Add(dpHOURS)

                '------------------------
                '10/27 adding description call
                Dim strSQL As String = "SELECT TIME.DESCRIPTION FROM TIME WHERE TIME.USER_ID = " & USER_ID & " AND TIME.PROJECT_ID = " & PROJECT_ID & "  AND TIME.TASK_ID = " & TASK_ID & " AND TIME.PHASE_ID = " & PHASE_ID & " AND TIME.BILL_DATE = '" & dtBILL_DATE & "' AND TIME.BILLABLE = " & BILLABLE
                Dim myCmd2 As SqlClient.SqlCommand = New SqlCommand(strSQL, cn)
                Dim strOldDescription As String = myCmd2.ExecuteScalar

                Dim DESCRIPTION As String

                '10/29 adjusting description save to allow editing, 
                '"EditMode" is set to 1 in the dg_update function



                '** 11.18.2004 RGB -  Added Check to see if new description is emtpy
                If Not (strOldDescription = "") Then
                    If Not EditMode = 1 Then
                        '**Add new description  since old desc is there and mode indicates should stay
                        If CStr(dr("DESCRIPTION") & "").Trim.Length > 0 Then
                            '** Only add carriage returns in there if a new description to add.
                            DESCRIPTION = strOldDescription + vbCrLf + vbCrLf + CStr(dr("DESCRIPTION") & "").Trim
                        Else
                            '** no new desc just add old one.
                            DESCRIPTION = strOldDescription
                        End If
                    Else    '*** mode dictates adding just new one
                        DESCRIPTION = CStr(dr("DESCRIPTION") & "").Trim
                    End If
                Else
                    '*** No Old Desc add just new one
                    DESCRIPTION = CStr(dr("DESCRIPTION") & "").Trim
                End If


                Dim dpDESCRIPTION As New SqlClient.SqlParameter
                dpDESCRIPTION.Direction = ParameterDirection.Input
                dpDESCRIPTION = myCmd.CreateParameter()
                dpDESCRIPTION.Direction = ParameterDirection.Input
                dpDESCRIPTION.ParameterName = "@DESCRIPTION"
                dpDESCRIPTION.Value = DESCRIPTION
                myCmd.Parameters.Add(dpDESCRIPTION)
                '----------------------------------

                ' Call stored procedure UPDATE_TIME
                Debug.WriteLine(myCmd.CommandText)

                Dim RETURN_VALUE As Object
                RETURN_VALUE = myCmd.ExecuteScalar()
                Debug.WriteLine("Time Insert Return Value: " & RETURN_VALUE)

                ' clear out all parameters
                myCmd.Parameters.Clear()
            Next
        Catch ex As Exception
            Debug.WriteLine(ex.Message)
            Throw ex
        End Try
        Return succeeded
    End Function
    Public Function GetClientList() As DataTable
        'fills the client drop down list with all clients
        Dim cn As SqlConnection = New SqlConnection(Configuration.ConfigurationManager.ConnectionStrings("ApplicationServices").ConnectionString)
        Dim myCmd As SqlClient.SqlCommand = New SqlCommand("GET_CLIENTS", cn)
        Dim da As IDbDataAdapter
        Dim ds As New DataSet
        Dim dt As New DataTable


        myCmd.CommandType = CommandType.StoredProcedure
        cn.Open()

        da = New SqlDataAdapter(myCmd)
        da.Fill(ds)

        If cn.State = ConnectionState.Open Then
            cn.Close()
        End If

        dt = ds.Tables(0)

        Return dt
    End Function
    Public Function GetTerms(ByVal TermHeaderValue As String) As DataTable


        ' Dim dr As DataRow

        Dim cn As SqlConnection = New SqlConnection(Configuration.ConfigurationManager.ConnectionStrings("ApplicationServices").ConnectionString)
        Dim myCmd As SqlClient.SqlCommand = New SqlCommand("GET_Terms", cn)
        myCmd.CommandType = CommandType.StoredProcedure

        Dim dpTermHeader As New SqlClient.SqlParameter
        dpTermHeader.Direction = ParameterDirection.Input
        dpTermHeader = myCmd.CreateParameter()
        dpTermHeader.Direction = ParameterDirection.Input
        dpTermHeader.ParameterName = "@TermHeaderValue"
        dpTermHeader.Value = TermHeaderValue
        myCmd.Parameters.Add(dpTermHeader)

        cn.Open()

        Dim da As IDbDataAdapter
        Dim ds As New DataSet

        da = New SqlDataAdapter(myCmd)
        da.Fill(ds)
        Dim dt As New DataTable
        dt = ds.Tables(0)

        Return dt
    End Function
    Public Function GetTimeEntryData(ByVal Date1 As Date, ByVal UserId As Integer) As DataTable


        ' Dim dr As DataRow

        Dim cn As SqlConnection = New SqlConnection(Configuration.ConfigurationManager.ConnectionStrings("ApplicationServices").ConnectionString)
        Dim myCmd As SqlClient.SqlCommand = New SqlCommand("GET_TIME", cn)
        myCmd.CommandType = CommandType.StoredProcedure

        '   @START_DATE Date,
        Dim START_DATE As String = Date1
        Dim dpSTART_DATE As New SqlClient.SqlParameter
        dpSTART_DATE.Direction = ParameterDirection.Input
        dpSTART_DATE = myCmd.CreateParameter()
        dpSTART_DATE.Direction = ParameterDirection.Input
        dpSTART_DATE.ParameterName = "@START_DATE"
        dpSTART_DATE.Value = FormatDateTime(START_DATE, DateFormat.ShortDate)
        myCmd.Parameters.Add(dpSTART_DATE)

        '   @STOP_DATE date,
        Dim dtSTOP_DATE As String = Date1.AddDays(6)
        Dim dpSTOP_DATE As New SqlClient.SqlParameter
        dpSTOP_DATE.Direction = ParameterDirection.Input
        dpSTOP_DATE = myCmd.CreateParameter()
        dpSTOP_DATE.Direction = ParameterDirection.Input
        dpSTOP_DATE.ParameterName = "@STOP_DATE"
        dpSTOP_DATE.Value = FormatDateTime(dtSTOP_DATE, DateFormat.ShortDate)
        myCmd.Parameters.Add(dpSTOP_DATE)

        '   @USER_ID INT,
        Dim USER_ID As String = UserId

        Dim dpUSER_ID As New SqlClient.SqlParameter
        dpUSER_ID.Direction = ParameterDirection.Input
        dpUSER_ID = myCmd.CreateParameter()
        dpUSER_ID.Direction = ParameterDirection.Input
        dpUSER_ID.ParameterName = "@USER_ID"
        dpUSER_ID.Value = USER_ID
        myCmd.Parameters.Add(dpUSER_ID)

        cn.Open()

        Dim da As IDbDataAdapter
        Dim ds As New DataSet

        da = New SqlDataAdapter(myCmd)
        da.Fill(ds)
        Dim dt As New DataTable
        dt = ds.Tables(0)

        Return dt
    End Function
    Public Function GetUserData(ByVal UserID As String) As DataTable
        Try
            Dim dp1 As New SqlClient.SqlParameter

            Dim cn As SqlConnection = New SqlConnection(Configuration.ConfigurationManager.ConnectionStrings("ApplicationServices").ConnectionString)
            Dim myCmd As SqlClient.SqlCommand = New SqlCommand("GET_USER_DATA", cn)
            myCmd.CommandType = CommandType.StoredProcedure

            dp1.Direction = ParameterDirection.Input
            dp1.ParameterName = "@USER_ID"
            dp1.Value = UserID
            myCmd.Parameters.Add(dp1)

            cn.Open()
            myCmd.Prepare()

            Dim da As IDbDataAdapter
            Dim ds As New DataSet


            da = New SqlDataAdapter(myCmd)
            da.Fill(ds)
            Dim dt As New DataTable
            dt = ds.Tables(0)

            Return dt
        Catch ex As Exception
            Debug.WriteLine(ex.Message)
            Throw ex
        End Try
    End Function
    Public Function GetUserList(ByVal UserID As String) As DataTable
        Try
            FUNCTION_NAME = "GetUserList"
            Dim dt As New DataTable

            Dim dp1 As New SqlClient.SqlParameter("UserID", UserID)
            dp1.Direction = ParameterDirection.Input
            Dim cn As SqlConnection = New SqlConnection(Configuration.ConfigurationManager.ConnectionStrings("ApplicationServices").ConnectionString)
            Dim myCmd As SqlClient.SqlCommand = New SqlCommand("GET_USERS", cn)
            myCmd.CommandType = CommandType.StoredProcedure


            dp1 = myCmd.CreateParameter()
            dp1.Direction = ParameterDirection.Input
            dp1.ParameterName = "@USER_ID"
            dp1.Value = UserID
            myCmd.Parameters.Add(dp1)

            cn.Open()

            Dim da As IDbDataAdapter
            Dim ds As New DataSet

            da = New SqlDataAdapter(myCmd)
            da.Fill(ds)

            dt = ds.Tables(0)


            cn.Close()
            cn.Dispose()

            Return dt
        Catch ex As Exception
            Debug.WriteLine(ex.Message)
            Throw ex
        End Try
    End Function
    Public Function GetPhases() As DataTable
        '   Populating the Phase drop list, if a phase is added to a project
        '   from the Phase Textbox, then that phase is additionally added to
        '   the Phase drop list

        Dim cn As SqlConnection = New SqlConnection(Configuration.ConfigurationManager.ConnectionStrings("ApplicationServices").ConnectionString)
        Dim myCmd As SqlClient.SqlCommand = New SqlCommand("GET_PHASES", cn)

        cn.Open()
        myCmd.Prepare()

        Dim da As IDbDataAdapter
        Dim ds As New DataSet
        Dim dr As DataRow

        da = New SqlDataAdapter(myCmd)
        da.Fill(ds)
        Dim dt As New DataTable
        dt = ds.Tables(0)

        dr = dt.NewRow
        dr("PHASE_ID") = 0
        dr("NAME") = ""
        dt.Rows.InsertAt(dr, 0)

        Return dt

    End Function
    Public Function GetTasks() As DataTable
        '   Populating the Task drop list, if a task is added to a project
        '   from the Task Textbox, then that task is additionally added to
        '   the Task drop list

        Dim cn As SqlConnection = New SqlConnection(Configuration.ConfigurationManager.ConnectionStrings("ApplicationServices").ConnectionString)
        Dim myCmd As SqlClient.SqlCommand = New SqlCommand("GET_TASKS", cn)

        cn.Open()
        myCmd.Prepare()

        Dim da As IDbDataAdapter
        Dim ds As New DataSet
        Dim dr As DataRow

        da = New SqlDataAdapter(myCmd)
        da.Fill(ds)
        Dim dt As New DataTable
        dt = ds.Tables(0)

        dr = dt.NewRow
        dr("TASK_ID") = 0
        dr("NAME") = ""
        dt.Rows.InsertAt(dr, 0)



    End Function
    Public Function GetTaskListAvailable(ByVal ProjectID As Integer) As DataTable

        Try
            FUNCTION_NAME = "GetTaskListAvailable"
            'Dim dp1 As New SqlClient.SqlParameter
            Dim dp2 As New SqlClient.SqlParameter


            Dim cn As SqlConnection = New SqlConnection(Configuration.ConfigurationManager.ConnectionStrings("ApplicationServices").ConnectionString)
            Dim myCmd As SqlClient.SqlCommand = New SqlCommand("GET_PROJECT_TASKS_AVAILABLE", cn)
            myCmd.CommandType = CommandType.StoredProcedure

            dp2 = myCmd.CreateParameter()
            dp2.Direction = ParameterDirection.Input
            dp2.ParameterName = "@PROJECT_ID"
            dp2.Value = ProjectID
            myCmd.Parameters.Add(dp2)
            cn.Open()

            Dim da As IDbDataAdapter
            Dim ds As New DataSet

            da = New SqlDataAdapter(myCmd)
            da.Fill(ds)
            Dim dt As New DataTable
            dt = ds.Tables(0)

            cn.Close()
            cn.Dispose()

            Return dt
        Catch ex As Exception
            Debug.WriteLine(ex.Message)
            Throw ex
        End Try
    End Function
    Public Function GetTaskList(ByVal UserID As String) As DataTable

        Try

            FUNCTION_NAME = "GetTaskList"
            Dim dp1 As New SqlClient.SqlParameter
            'dp1.Direction = ParameterDirection.Input


            Dim cn As SqlConnection = New SqlConnection(Configuration.ConfigurationManager.ConnectionStrings("ApplicationServices").ConnectionString)
            Dim myCmd As SqlClient.SqlCommand = New SqlCommand("GET_PROJECT_DATA", cn)
            myCmd.CommandType = CommandType.StoredProcedure

            dp1 = myCmd.CreateParameter()
            dp1.Direction = ParameterDirection.Input
            dp1.ParameterName = "@USER_ID"
            dp1.Value = UserID
            myCmd.Parameters.Add(dp1)

            cn.Open()

            Dim da As IDbDataAdapter
            Dim ds As New DataSet

            da = New SqlDataAdapter(myCmd)
            da.Fill(ds)
            Dim dt As New DataTable
            dt = ds.Tables(0)


            ' define new table to return result
            Dim dtSelect As New DataTable

            Dim dc(1) As DataColumn
            Dim drSelect As DataRow

            dc(0) = New DataColumn
            dc(0).ColumnName = "TASK_ID"
            dc(1) = New DataColumn
            dc(1).ColumnName = "NAME"

            ' add columns to datatable
            Dim i As Integer
            For i = 0 To 1
                dtSelect.Columns.Add(dc(i))
            Next i

            dtSelect.AcceptChanges()

            ' GET UNIQUE PROJECTS
            Dim dr As DataRow


            For Each dr In dt.Rows

                If Not dr("PROJECT_TASK_ID") Is DBNull.Value Then
                    Dim strTask As String = dr("PROJECT_TASK_ID")
                    Dim drA As DataRow()
                    Dim l As Integer

                    drA = dtSelect.Select("TASK_ID=" & strTask & "")

                    If Not drA Is Nothing Then
                        l = drA.GetLength(0)
                        If l = 0 Then
                            ' this is the first instance of this project. add it to the return datatable.

                            If Not dr("PROJECT_TASK_NAME") Is DBNull.Value Then
                                drSelect = dtSelect.NewRow()
                                drSelect(0) = dr("PROJECT_TASK_ID")
                                drSelect(1) = dr("PROJECT_TASK_NAME")
                                dtSelect.Rows.Add(drSelect)
                                dtSelect.AcceptChanges()
                            End If

                        End If
                    End If
                End If
            Next

            cn.Close()
            cn.Dispose()

            Return dtSelect


        Catch ex As Exception
            Debug.WriteLine(ex.Message)
            Throw ex
        End Try
    End Function

    Public Function GetTaskList(ByVal UserID As String, ByVal ProjectID As Integer) As DataTable
        Try
            FUNCTION_NAME = "GetTaskList"
            Dim dp1 As New SqlClient.SqlParameter
            'dp1.Direction = ParameterDirection.Input
            Dim bQueryFailed As Boolean
            Dim cn As SqlConnection = New SqlConnection(Configuration.ConfigurationManager.ConnectionStrings("ApplicationServices").ConnectionString)
            Dim myCmd As SqlClient.SqlCommand = New SqlCommand("GET_PROJECT_DATA", cn)
            myCmd.CommandType = CommandType.StoredProcedure

            dp1 = myCmd.CreateParameter()
            dp1.Direction = ParameterDirection.Input
            dp1.ParameterName = "@USER_ID"
            dp1.Value = UserID
            myCmd.Parameters.Add(dp1)

            cn.Open()

            Dim da As IDbDataAdapter
            Dim ds As New DataSet

            da = New SqlDataAdapter(myCmd)
            da.Fill(ds)
            Dim dt As New DataTable
            dt = ds.Tables(0)


            ' define new table to return result
            Dim dtSelect As New DataTable

            Dim dc(1) As DataColumn
            Dim drSelect As DataRow

            dc(0) = New DataColumn
            dc(0).Unique = True
            dc(0).ColumnName = "TASK_ID"
            dc(1) = New DataColumn
            dc(1).ColumnName = "NAME"

            ' add columns to datatable
            Dim i As Integer
            For i = 0 To 1
                dtSelect.Columns.Add(dc(i))
            Next i

            dtSelect.AcceptChanges()

            ' GET UNIQUE PROJECTS
            Dim dr As DataRow


            For Each dr In dt.Rows

                If Not dr("PROJECT_TASK_ID") Is DBNull.Value Then
                    If dr("PROJECT_ID") = ProjectID Then
                        Dim strTask As Integer = dr("PROJECT_TASK_ID")
                        Dim drA As DataRow()
                        Dim l As Integer
                        Dim dr1 As DataRow
                        drA = dtSelect.Select("TASK_ID=" & strTask)
                        'Debug.WriteLine("Query Results")
                        'For Each dr1 In drA
                        '    Debug.WriteLine(dr1(0) & " - " & dr1(1))
                        'Next

                        'Debug.WriteLine("Current Return Data")

                        For Each dr1 In dtSelect.Rows
                            'Debug.WriteLine(dr1(0) & " - " & dr1(1))
                            If dr1(0) = strTask Then
                                bQueryFailed = True
                            Else
                                bQueryFailed = False
                            End If
                        Next

                        If Not drA Is Nothing Then
                            l = drA.GetLength(0)
                            If l = 0 Then
                                If bQueryFailed = False Then
                                    ' this is the first instance of this project. add it to the return datatable.

                                    'Debug.WriteLine("ADD TASK: " & strTask)
                                    drSelect = dtSelect.NewRow()
                                    drSelect(0) = dr("PROJECT_TASK_ID")
                                    drSelect(1) = dr("PROJECT_TASK_NAME")

                                    dtSelect.Rows.Add(drSelect)
                                    dtSelect.AcceptChanges()

                                End If
                            End If
                        End If
                    End If
                End If
            Next

            cn.Close()
            cn.Dispose()

            Return dtSelect
        Catch ex As Exception
            Debug.WriteLine(ex.Message)
            Throw ex
        End Try
    End Function

    'Public Function GetPhaseList(ByVal UserID As Integer) As DataTable
    '    Try
    '        FUNCTION_NAME = "GetPhaseList"
    '        Dim dp1 As New SqlClient.SqlParameter
    '        'dp1.Direction = ParameterDirection.Input

    '        Dim cn As SqlConnection = New SqlConnection(Configuration.ConfigurationManager.ConnectionStrings("ApplicationServices").ConnectionString)
    '        Dim myCmd As SqlClient.SqlCommand = New SqlCommand("GET_PROJECT_DATA", cn)
    '        myCmd.CommandType = CommandType.StoredProcedure

    '        dp1 = myCmd.CreateParameter()
    '        dp1.Direction = ParameterDirection.Input
    '        dp1.ParameterName = "@USER_ID"
    '        dp1.Value = UserID
    '        myCmd.Parameters.Add(dp1)

    '        cn.Open()

    '        Dim da As IDbDataAdapter
    '        Dim ds As New DataSet

    '        da = New SqlDataAdapter(myCmd)
    '        da.Fill(ds)
    '        Dim dt As New DataTable
    '        dt = ds.Tables(0)


    '        ' define new table to return result
    '        Dim dtSelect As New DataTable

    '        Dim dc(1) As DataColumn
    '        Dim drSelect As DataRow

    '        dc(0) = New DataColumn
    '        dc(0).ColumnName = "PHASE_ID"
    '        dc(1) = New DataColumn
    '        dc(1).ColumnName = "NAME"

    '        ' add columns to datatable
    '        Dim i As Integer
    '        For i = 0 To 1
    '            dtSelect.Columns.Add(dc(i))
    '        Next i

    '        dtSelect.AcceptChanges()

    '        ' GET UNIQUE PROJECTS
    '        Dim dr As DataRow

    '        For Each dr In dt.Rows
    '            If dr("PHASE_ID") Is DBNull.Value Then

    '            Else

    '                Dim strPhase As String = dr("PHASE_ID")
    '                Dim drA As DataRow()

    '                Dim l As Integer

    '                drA = dtSelect.Select("PHASE_ID=" & strPhase & "")
    '                l = drA.GetLength(0)
    '                If l = 0 Then
    '                    ' this is the first instance of this project. add it to the return datatable.
    '                    drSelect = dtSelect.NewRow()
    '                    drSelect(0) = dr("PHASE_ID")
    '                    drSelect(1) = dr("PHASE_NAME")
    '                    dtSelect.Rows.Add(drSelect)
    '                    dtSelect.AcceptChanges()
    '                End If

    '            End If
    '        Next

    '        cn.Close()
    '        cn.Dispose()

    '        Return dtSelect
    '    Catch ex As Exception
    '        Debug.WriteLine(ex.Message)
    '        Throw ex
    '    End Try
    'End Function

    Public Function GetPhaseList(ByVal ProjectID As Integer) As DataTable

        '        SELECT DISTINCT TASKS.TASK_ID, TASKS.NAME
        'FROM         PROJECT_TASKS INNER JOIN
        '                      TASKS ON PROJECT_TASKS.TASK_ID = TASKS.TASK_ID INNER JOIN
        '                      PROJECT_USERS ON PROJECT_TASKS.PROJECT_ID = PROJECT_USERS.PROJECT_ID
        Try
            FUNCTION_NAME = "GetPhaseList"
            'Dim dp1 As New SqlClient.SqlParameter
            Dim dp2 As New SqlClient.SqlParameter


            Dim cn As SqlConnection = New SqlConnection(Configuration.ConfigurationManager.ConnectionStrings("ApplicationServices").ConnectionString)
            Dim myCmd As SqlClient.SqlCommand = New SqlCommand("GET_PROJECT_PHASES", cn)
            myCmd.CommandType = CommandType.StoredProcedure

            'dp1 = myCmd.CreateParameter()
            'dp1.Direction = ParameterDirection.Input
            'dp1.ParameterName = "@USER_ID"
            'dp1.Value = UserID
            'myCmd.Parameters.Add(dp1)

            dp2 = myCmd.CreateParameter()
            dp2.Direction = ParameterDirection.Input
            dp2.ParameterName = "@PROJECT_ID"
            dp2.Value = ProjectID
            myCmd.Parameters.Add(dp2)
            cn.Open()

            Dim da As IDbDataAdapter
            Dim ds As New DataSet

            da = New SqlDataAdapter(myCmd)
            da.Fill(ds)
            Dim dt As New DataTable
            dt = ds.Tables(0)


            cn.Close()
            cn.Dispose()

            Return dt
        Catch ex As Exception
            Debug.WriteLine(ex.Message)
            Throw ex
        End Try
    End Function
    Public Function GetPhaseListAvailable(ByVal ProjectID As Integer) As DataTable

        '        SELECT DISTINCT TASKS.TASK_ID, TASKS.NAME
        'FROM         PROJECT_TASKS INNER JOIN
        '                      TASKS ON PROJECT_TASKS.TASK_ID = TASKS.TASK_ID INNER JOIN
        '                      PROJECT_USERS ON PROJECT_TASKS.PROJECT_ID = PROJECT_USERS.PROJECT_ID
        Try
            FUNCTION_NAME = "GetPhaseList"
            'Dim dp1 As New SqlClient.SqlParameter
            Dim dp2 As New SqlClient.SqlParameter


            Dim cn As SqlConnection = New SqlConnection(Configuration.ConfigurationManager.ConnectionStrings("ApplicationServices").ConnectionString)
            Dim myCmd As SqlClient.SqlCommand = New SqlCommand("GET_PROJECT_PHASES_AVAILABLE", cn)
            myCmd.CommandType = CommandType.StoredProcedure

            'dp1 = myCmd.CreateParameter()
            'dp1.Direction = ParameterDirection.Input
            'dp1.ParameterName = "@USER_ID"
            'dp1.Value = UserID
            'myCmd.Parameters.Add(dp1)

            dp2 = myCmd.CreateParameter()
            dp2.Direction = ParameterDirection.Input
            dp2.ParameterName = "@PROJECT_ID"
            dp2.Value = ProjectID
            myCmd.Parameters.Add(dp2)
            cn.Open()

            Dim da As IDbDataAdapter
            Dim ds As New DataSet

            da = New SqlDataAdapter(myCmd)
            da.Fill(ds)
            Dim dt As New DataTable
            dt = ds.Tables(0)


            cn.Close()
            cn.Dispose()

            Return dt
        Catch ex As Exception
            Debug.WriteLine(ex.Message)
            Throw ex
        End Try
    End Function
    Public Function GetPhaseListX(ByVal UserID As Integer, ByVal ProjectID As Integer) As DataTable
        Dim db As New DataAccess
        Dim dt As New DataTable

        dt = db.Query("SELECT DISTINCT PHASES.PHASE_ID, PHASES.NAME as NAME " & _
                        "FROM         PROJECT_PHASES INNER JOIN " & _
                        "PHASES ON PROJECT_PHASES.PHASE_ID = PHASES.PHASE_ID INNER JOIN " & _
                        "PROJECT_USERS ON PROJECT_PHASES.PROJECT_ID = PROJECT_USERS.PROJECT_ID " & _
                        "WHERE PROJECT_USERS.PROJECT_ID = " & ProjectID & " AND PROJECT_USERS.USER_ID = " & UserID & " ORDER BY PHASES.NAME")
        Return dt

    End Function
    Public Function GetProjectListX(ByVal UserID As Integer) As DataTable

        Dim db As New DataAccess
        Dim dt As New DataTable

        '***11.18.2004 RGB - ADDED EXISTS in where clause to keep out projects with no tasks and or phases
        Dim strSQL As String = "SELECT DISTINCT projects.PROJECT_CODE, projects.PROJECT_ID, projects.NAME PROJECT_NAME " & _
                               "  FROM PROJECT_USER_RATES INNER JOIN PROJECTS ON PROJECT_USER_RATES.PROJECT_ID = PROJECTS.PROJECT_ID " & _
                               "                          INNER JOIN CHARTER ON PROJECTS.CHARTER_ID = CHARTER.CHARTER_ID " & _
                               " WHERE " & _
                                " EXISTS (SELECT 1 FROM PROJECT_TASKS WHERE PROJECT_ID = PROJECTS.PROJECT_ID) " & _
                                " AND EXISTS (SELECT 1 FROM PROJECT_PHASES WHERE PROJECT_ID = PROJECTS.PROJECT_ID)" & _
                               " AND PROJECT_USER_RATES.ACTIVE_FLAG = 1 " & _
                               "   AND PROJECT_USER_RATES.USER_ID = " & UserID & _
                               "   AND CHARTER.CHARTER_STATUS_ID = 1 " & _
                               "   OR PROJECTS.GLOBAL=1 " & _
                               " ORDER BY PROJECTS.PROJECT_CODE "

        dt = db.Query(strSQL)

        'Page.Cache.Insert("PROJECT_LIST", dt, Nothing, DateTime.Now.AddHours(2), TimeSpan.Zero)

        Return dt

    End Function

    Public Function GetProjectList(ByVal UserID As Integer) As DataTable
        Try
            FUNCTION_NAME = "GetProjectList"
            Dim dp1 As New SqlClient.SqlParameter("UserID", UserID)
            dp1.Direction = ParameterDirection.Input

            Dim cn As SqlConnection = New SqlConnection(Configuration.ConfigurationManager.ConnectionStrings("ApplicationServices").ConnectionString)
            Dim myCmd As SqlClient.SqlCommand = New SqlCommand("GET_ALL_PROJECT_DATA", cn)
            myCmd.CommandType = CommandType.StoredProcedure

            dp1 = myCmd.CreateParameter()
            dp1.Direction = ParameterDirection.Input
            dp1.ParameterName = "@USER_ID"
            dp1.Value = UserID
            myCmd.Parameters.Add(dp1)

            cn.Open()

            Dim da As IDbDataAdapter
            Dim ds As New DataSet

            da = New SqlDataAdapter(myCmd)
            da.Fill(ds)
            Dim dt As New DataTable
            dt = ds.Tables(0)

            ' define new table to return result
            Dim dtSelect As New DataTable

            Dim dc(1) As DataColumn
            Dim drSelect As DataRow

            dc(0) = New DataColumn
            dc(0).ColumnName = "PROJECT_ID"
            dc(1) = New DataColumn
            dc(1).ColumnName = "PROJECT_CODE"

            ' add columns to datatable
            Dim i As Integer
            For i = 0 To 1
                dtSelect.Columns.Add(dc(i))
            Next i

            dtSelect.AcceptChanges()

            ' GET UNIQUE PROJECTS
            Dim dr As DataRow
            For Each dr In dt.Rows
                Dim strProject As String = dr("PROJECT_ID")
                Dim drA As DataRow()
                Dim l As Integer

                drA = dtSelect.Select("PROJECT_ID='" & strProject & "'")
                l = drA.GetLength(0)
                If l = 0 Then
                    ' this is the first instance of this project. add it to the return datatable.
                    drSelect = dtSelect.NewRow()
                    drSelect(0) = dr("PROJECT_ID")
                    drSelect(1) = dr("PROJECT_CODE")
                    dtSelect.Rows.Add(drSelect)
                    dtSelect.AcceptChanges()
                End If
            Next

            cn.Close()
            cn.Dispose()

            Return dtSelect

        Catch ex As Exception
            Debug.WriteLine(ex.Message)
            Throw ex
        End Try
    End Function
    Public Function GetRates() As DataTable

        '   Populate the Rate dropdown list, new rates must be added to 
        '   the Rates table from back end, "Add Rates" is reserved for
        '   the second release of TimeWeasel

        Dim cn As SqlConnection = New SqlConnection(Configuration.ConfigurationManager.ConnectionStrings("ApplicationServices").ConnectionString)
        Dim myCmd As SqlClient.SqlCommand = New SqlCommand("GET_RATES", cn)
        myCmd.CommandType = CommandType.StoredProcedure


        Dim dp As New SqlClient.SqlParameter
        dp.Direction = ParameterDirection.Input

        dp = myCmd.CreateParameter()
        dp.Direction = ParameterDirection.Input
        dp.ParameterName = "@RATE_ID"
        dp.Value = DBNull.Value
        myCmd.Parameters.Add(dp)

        cn.Open()
        myCmd.Prepare()

        Dim da As IDbDataAdapter
        Dim ds As New DataSet

        da = New SqlDataAdapter(myCmd)
        da.Fill(ds)
        Dim dt As New DataTable
        dt = ds.Tables(0)

        Return dt
    End Function
    Public Function GetActiveProjectList(ByVal UserID As Integer) As DataTable
        Try
            FUNCTION_NAME = "GetProjectList"
            Dim dp1 As New SqlClient.SqlParameter("UserID", UserID)
            dp1.Direction = ParameterDirection.Input

            Dim cn As SqlConnection = New SqlConnection(Configuration.ConfigurationManager.ConnectionStrings("ApplicationServices").ConnectionString)
            Dim myCmd As SqlClient.SqlCommand = New SqlCommand("GET_ACTIVE_PROJECT_DATA", cn)
            myCmd.CommandType = CommandType.StoredProcedure

            dp1 = myCmd.CreateParameter()
            dp1.Direction = ParameterDirection.Input
            dp1.ParameterName = "@USER_ID"
            dp1.Value = UserID
            myCmd.Parameters.Add(dp1)

            cn.Open()



            Dim da As IDbDataAdapter
            Dim ds As New DataSet

            da = New SqlDataAdapter(myCmd)
            da.Fill(ds)
            Dim dt As New DataTable
            dt = ds.Tables(0)

            ' define new table to return result
            Dim dtSelect As New DataTable

            Dim dc(1) As DataColumn
            Dim drSelect As DataRow

            dc(0) = New DataColumn
            dc(0).ColumnName = "PROJECT_ID"
            dc(1) = New DataColumn
            dc(1).ColumnName = "PROJECT_CODE"

            ' add columns to datatable
            Dim i As Integer
            For i = 0 To 1
                dtSelect.Columns.Add(dc(i))
            Next i

            dtSelect.AcceptChanges()

            ' GET UNIQUE PROJECTS
            Dim dr As DataRow
            For Each dr In dt.Rows
                Dim strProject As String = dr("PROJECT_ID")
                Dim drA As DataRow()
                Dim l As Integer

                drA = dtSelect.Select("PROJECT_ID='" & strProject & "'")
                l = drA.GetLength(0)
                If l = 0 Then
                    ' this is the first instance of this project. add it to the return datatable.
                    drSelect = dtSelect.NewRow()
                    drSelect(0) = dr("PROJECT_ID")
                    drSelect(1) = dr("PROJECT_CODE")
                    dtSelect.Rows.Add(drSelect)
                    dtSelect.AcceptChanges()
                End If
            Next

            Return dtSelect

        Catch ex As Exception
            Debug.WriteLine(ex.Message)
            Throw ex
        End Try
    End Function
    Public Function GetProjectUsers(ByVal ProjectID As Integer) As DataTable
        '   display users that have been added to the respective project (along with 
        '   their rate, and rate descriptions), in the dgUser datagrid.
        '   The "Active Rate" should automatically be set to True.  If a user is added
        '   for a second time with a new rate, the new rate (active rate = true) over-
        '   rides the previous rate (active rate = false) 

        Try
            FUNCTION_NAME = "GetProjectUsers"

            Dim dp1 As New SqlClient.SqlParameter
            dp1.Direction = ParameterDirection.Input

            Dim cn As SqlConnection = New SqlConnection(Configuration.ConfigurationManager.ConnectionStrings("ApplicationServices").ConnectionString)
            Dim myCmd As SqlClient.SqlCommand = New SqlCommand("GET_PROJECT_USERS", cn)
            myCmd.CommandType = CommandType.StoredProcedure

            dp1 = myCmd.CreateParameter()
            dp1.Direction = ParameterDirection.Input
            dp1.ParameterName = "@PROJECT_ID"
            dp1.Value = ProjectID
            myCmd.Parameters.Add(dp1)

            cn.Open()
            myCmd.Prepare()

            Dim da As IDbDataAdapter
            Dim ds As New DataSet

            da = New SqlDataAdapter(myCmd)
            da.Fill(ds)
            Dim dt As New DataTable
            dt = ds.Tables(0)

            '' define new table to return result
            'Dim dtSelect As New DataTable

            'Dim dc(3) As DataColumn
            'Dim drSelect As DataRow

            'dc(0) = New DataColumn
            'dc(0).ColumnName = "USERNAME"
            'dc(1) = New DataColumn
            'dc(1).ColumnName = "RATE"
            'dc(2) = New DataColumn
            'dc(2).ColumnName = "ACTIVE_FLAG"
            'dc(3) = New DataColumn
            'dc(3).ColumnName = "DESCRIPTION"

            '' add columns to datatable
            'dtSelect.Columns.Add(dc(0))
            'dtSelect.Columns.Add(dc(1))
            'dtSelect.Columns.Add(dc(2))
            'dtSelect.Columns.Add(dc(3))

            '' GET UNIQUE USERS
            'Dim dr As DataRow
            'For Each dr In dt.Rows
            '    If dr("USERNAME") Is DBNull.Value Then
            '    Else
            '        drSelect = dtSelect.NewRow()
            '        drSelect(0) = dr("USERNAME")
            '        drSelect(1) = dr("Rate")
            '        drSelect(2) = dr("Active_Flag")
            '        drSelect(3) = dr("Description")

            '        ' look in the results of SP2 for this row's user
            '        'Dim drNew As DataRow()
            '        'Debug.WriteLine(dr("USER_ID"))
            '        'drNew = dt.Select("USER_ID = " & dr("USER_ID"))
            '        'Dim k As Integer
            '        'k = drNew.GetLength(0)

            '        'If k > 0 Then
            '        '    drSelect("Rate") = drNew(0)("Rate")
            '        '    drSelect("Active_Flag") = drNew(0)("Active_Flag")
            '        '    drSelect("Description") = drNew(0)("Description")
            '        'End If

            '        dtSelect.Rows.Add(drSelect)
            '        dtSelect.AcceptChanges()
            '    End If

            'Next

            Return dt

        Catch ex As Exception
            Debug.Write(FUNCTION_NAME & " Error: " & ex.Message)
            Throw ex
        End Try

    End Function
    Public Function GetProjectUsers(ByVal ProjectID As Integer, ByVal UserID As Integer)
        Try
            FUNCTION_NAME = "GetProjectUsers"
            Dim strSQL As String = "SELECT     PROJECT_USERS.PROJECT_ID , USERS.USERNAME, USERS.USER_ID " & _
                "FROM         PROJECT_USERS INNER JOIN " & _
                "PROJECT_USER_RATES ON PROJECT_USERS.USER_ID = PROJECT_USER_RATES.USER_ID INNER JOIN " & _
                "      USERS ON PROJECT_USERS.USER_ID = USERS.USER_ID AND PROJECT_USER_RATES.USER_ID = USERS.USER_ID " & _
                "WHERE(PROJECT_USER_RATES.ACTIVE_FLAG = 1) " & _
                "GROUP BY PROJECT_USERS.PROJECT_ID, USERS.USERNAME"

            Dim db As New DataAccess
            Dim dt As New DataTable
            dt = db.Query(strSQL)

            'Dim dp1 As New SqlClient.SqlParameter
            'dp1.Direction = ParameterDirection.Input

            'Dim cn As SqlConnection = New SqlConnection(Configuration.ConfigurationManager.ConnectionStrings("ApplicationServices").ConnectionString)
            'Dim myCmd As SqlClient.SqlCommand = New SqlCommand("GET_PROJECT_DATA", cn)
            'myCmd.CommandType = CommandType.StoredProcedure

            'dp1 = myCmd.CreateParameter()
            'dp1.Direction = ParameterDirection.Input
            'dp1.ParameterName = "@USER_ID"
            'dp1.Value = UserID
            'myCmd.Parameters.Add(dp1)

            'cn.Open()



            'Dim da As IDbDataAdapter
            'Dim ds As New DataSet

            'da = New SqlDataAdapter(myCmd)
            'da.Fill(ds)
            'Dim dt As New DataTable
            'dt = ds.Tables(0)

            '' define new table to return result
            'Dim dtSelect As New DataTable

            'Dim dc(2) As DataColumn
            'Dim drSelect As DataRow

            'dc(0) = New DataColumn
            'dc(0).ColumnName = "USER_ID"
            'dc(1) = New DataColumn
            'dc(1).ColumnName = "USERNAME"
            'dc(2) = New DataColumn
            'dc(2).ColumnName = "PROJECT_ID"

            '' add columns to datatable
            'Dim i As Integer
            'For i = 0 To 2
            '    dtSelect.Columns.Add(dc(i))
            'Next i

            'dtSelect.AcceptChanges()
            'i = 0
            '' GET UNIQUE PROJECTS
            'Dim dr As DataRow
            'For Each dr In dt.Rows
            '    If dr("USER_ID") Is DBNull.Value Then
            '    Else

            '        Dim strProject As String = dr("USER_ID")
            '        Dim drA As DataRow()
            '        Dim l As Integer

            '        drA = dtSelect.Select("PROJECT_ID=" & ProjectID & " AND USER_ID=" & strProject)
            '        If drA Is Nothing Then
            '        Else
            '            i = i + 1
            '            Debug.WriteLine(i)
            '            If i = 210 Then
            '                Debug.WriteLine("We are HEre")
            '            End If
            '            l = drA.GetLength(0)
            '            If l = 0 Then
            '                If dr("USER_ID") Is DBNull.Value Or dr("PROJECT_ID") Is DBNull.Value Or dr("FULL_USER_NAME") Is DBNull.Value Then
            '                Else


            '                    ' this is the first instance of this project. add it to the return datatable.
            '                    drSelect = dtSelect.NewRow()
            '                    drSelect(0) = dr("USER_ID")
            '                    drSelect(1) = dr("FULL_USER_NAME")
            '                    drSelect(2) = dr("PROJECT_ID")
            '                    Debug.WriteLine("User: " & dr("USER_ID") & " Project: " & dr("PROJECT_ID") & " UserName: " & dr("FULL_USER_NAME"))
            '                    dtSelect.Rows.Add(drSelect)
            '                    dtSelect.AcceptChanges()
            '                End If
            '            End If
            '        End If

            '    End If
            'Next

            Return dt

        Catch ex As Exception
            Debug.WriteLine(ex.Message)
            Throw ex
        End Try
    End Function

    Public Function GetProjectName(ByVal ItemID As Integer, ByVal strUser As String) As String
        Try
            Dim dtProject As New DataTable

            dtProject = GetProjectList(strUser)
            Dim dr() As DataRow
            dr = dtProject.Select("PROJECT_ID = " & ItemID)

            If dr.Length > 0 Then
                Return dr(0)("PROJECT_CODE")
            End If
        Catch ex As Exception
            Debug.WriteLine(ex.Message)
            Throw ex
        End Try
    End Function

    Public Function GetPhaseName(ByVal ItemID As Integer, ByVal strUser As String) As String
        Try
            Dim dt As New DataTable
            Dim db As New DataAccess


            dt = db.Query("SELECT NAME FROM PHASES WHERE PHASE_ID = " & ItemID) ' GetPhaseList(strUser)
            Dim dr() As DataRow
            '            dr = dt.Select("PHASE_ID = " & ItemID)
            If Not dt Is Nothing Then
                Return dt.Rows(0).Item(0)
                'If dr.Length > 0 Then
                '    Return dr(0)("NAME")
                'End If
            End If
        Catch ex As Exception
            Debug.WriteLine(ex.Message)
            Throw ex
        End Try
    End Function

    Public Function GetTaskName(ByVal ItemID As Integer, ByVal strUser As String) As String
        Try
            Dim dt As New DataTable

            dt = GetTaskList(strUser)
            Dim dr() As DataRow
            dr = dt.Select("TASK_ID = " & ItemID)

            If dr.Length > 0 Then
                Return dr(0)("NAME")
            End If
        Catch ex As Exception
            Debug.WriteLine(ex.Message)
            Throw ex
        End Try
    End Function

    Public Function TestDB() As String
        Dim db As New DataAccess
        Dim dt As New DataTable
        dt = db.Query("SELECT * FROM TASKS")
        Dim dr As DataRow
        For Each dr In dt.Rows
            Debug.WriteLine(dr(0))
        Next
    End Function

    Public Function IsGlobalProject(ByVal iProjectID As Integer) As Boolean
        Dim db As New DataAccess
        Dim dt As New DataTable
        Dim bReturn As Boolean

        dt = db.Query("SELECT PROJECT_ID FROM PROJECTS WHERE GLOBAL = 1 AND PROJECT_ID= " & CStr(iProjectID))

        If dt.Rows.Count = 1 Then
            bReturn = True
        Else
            bReturn = False
        End If

        Return bReturn
    End Function
    Public Function GetProjectContacts(ByVal iProjectID As Int16) As DataTable
        'returns a datatable of all contacts for a given project id
        Dim cn As SqlConnection = New SqlConnection(Configuration.ConfigurationManager.ConnectionStrings("ApplicationServices").ConnectionString)
        Dim myCmd As SqlClient.SqlCommand = New SqlCommand("GET_PROJECT_CONTACTS", cn)
        Dim dp1 As New SqlClient.SqlParameter
        Dim da As IDbDataAdapter
        Dim ds As New DataSet
        Dim dt As New DataTable

        myCmd.CommandType = CommandType.StoredProcedure
        dp1.Direction = ParameterDirection.Input
        dp1.ParameterName = "@PROJECT_ID"
        dp1.Value = iProjectID
        myCmd.Parameters.Add(dp1)

        cn.Open()

        da = New SqlDataAdapter(myCmd)
        da.Fill(ds)

        If cn.State = ConnectionState.Open Then
            cn.Close()
        End If

        dt = ds.Tables(0)
        GetProjectContacts = dt
    End Function
    Public Function GetClientContacts(ByVal iClientID As Int16) As DataTable
        'returns a datatable of all contacts for a given client id
        Dim cn As SqlConnection = New SqlConnection(Configuration.ConfigurationManager.ConnectionStrings("ApplicationServices").ConnectionString)
        Dim myCmd As SqlClient.SqlCommand = New SqlCommand("GET_CONTACTS", cn)
        Dim dp1 As New SqlClient.SqlParameter
        Dim da As IDbDataAdapter
        Dim ds As New DataSet
        Dim dt As New DataTable

        myCmd.CommandType = CommandType.StoredProcedure
        dp1.Direction = ParameterDirection.Input
        dp1.ParameterName = "@CLIENT_ID"
        dp1.Value = iClientID
        myCmd.Parameters.Add(dp1)

        cn.Open()

        da = New SqlDataAdapter(myCmd)
        da.Fill(ds)

        If cn.State = ConnectionState.Open Then
            cn.Close()
        End If

        dt = ds.Tables(0)
        GetClientContacts = dt
    End Function
    Public Function GetContact(ByVal iContactID As Integer) As DataTable
        'returns a datatable of all contacts for a given contact id
        Dim cn As SqlConnection = New SqlConnection(Configuration.ConfigurationManager.ConnectionStrings("ApplicationServices").ConnectionString)
        Dim myCmd As SqlClient.SqlCommand = New SqlCommand("GET_CONTACT_data", cn)
        Dim dp1 As New SqlClient.SqlParameter
        Dim da As IDbDataAdapter
        Dim ds As New DataSet
        Dim dt As New DataTable

        myCmd.CommandType = CommandType.StoredProcedure
        dp1.Direction = ParameterDirection.Input
        dp1.ParameterName = "@CONTACT_ID"
        dp1.Value = iContactID
        myCmd.Parameters.Add(dp1)

        cn.Open()

        da = New SqlDataAdapter(myCmd)
        da.Fill(ds)

        If cn.State = ConnectionState.Open Then
            cn.Close()
        End If

        dt = ds.Tables(0)
        GetContact = dt
    End Function
    Public Function GetStates() As DataTable
        'returns a datatable of all contacts for a given client id
        Dim cn As SqlConnection = New SqlConnection(Configuration.ConfigurationManager.ConnectionStrings("ApplicationServices").ConnectionString)
        Dim myCmd As SqlClient.SqlCommand = New SqlCommand("GET_STATES", cn)
        Dim dp1 As New SqlClient.SqlParameter
        Dim da As IDbDataAdapter
        Dim ds As New DataSet
        Dim dt As New DataTable

        cn.Open()

        da = New SqlDataAdapter(myCmd)
        da.Fill(ds)

        If cn.State = ConnectionState.Open Then
            cn.Close()
        End If

        dt = ds.Tables(0)
        Return dt
    End Function

    Public Function AddTextTask(ByVal NAME As String, ByVal DESCRIPTION As String) As Integer
        '   add a task to a project. A project charter must be created prior to adding
        '   resources, tasks and phases to a project.

        FUNCTION_NAME = "AddTextTask"
        Try
            ' save resource data to SQL Server database
            Dim cn As SqlConnection = New SqlConnection(Configuration.ConfigurationManager.ConnectionStrings("ApplicationServices").ConnectionString)
            Dim myCmd As SqlClient.SqlCommand = New SqlCommand("ADD_TASK", cn)
            myCmd.CommandType = CommandType.StoredProcedure

            ' connect to database
            cn.Open()

            Dim dpNAME As New SqlClient.SqlParameter
            dpNAME.Direction = ParameterDirection.Input
            dpNAME = myCmd.CreateParameter()
            dpNAME.ParameterName = "@NAME"
            dpNAME.Value = NAME
            myCmd.Parameters.Add(dpNAME)

            Dim dpDESCRIPTION As New SqlClient.SqlParameter
            dpDESCRIPTION.Direction = ParameterDirection.Input
            dpDESCRIPTION = myCmd.CreateParameter()
            dpDESCRIPTION.ParameterName = "@DESCRIPTION"
            dpDESCRIPTION.Value = DESCRIPTION
            myCmd.Parameters.Add(dpDESCRIPTION)

            ' Call stored procedure ADD_PROJECT_TASK
            myCmd.Prepare()
            Debug.WriteLine(myCmd.CommandText)

            Debug.WriteLine(myCmd.ToString)

            Dim RETURN_VALUE As Object
            RETURN_VALUE = myCmd.ExecuteScalar()
            Debug.WriteLine("User Insert Return Value: " & RETURN_VALUE)

        Catch ex As Exception
            Debug.Write(FUNCTION_NAME & " Error: " & ex.Message)
        End Try
    End Function
    Public Function AddPhase(ByVal NAME As String, ByVal DESCRIPTION As String) As Boolean
        '   add a resource to a project. A project charter must be created prior to adding
        '   resources, tasks and phases to a project.

        FUNCTION_NAME = "AddTextPhase"
        Try
            ' save resource data to SQL Server database
            Dim cn As SqlConnection = New SqlConnection(Configuration.ConfigurationManager.ConnectionStrings("ApplicationServices").ConnectionString)
            Dim myCmd As SqlClient.SqlCommand = New SqlCommand("ADD_PHASE", cn)
            myCmd.CommandType = CommandType.StoredProcedure

            ' connect to database
            cn.Open()

            Dim dpNAME As New SqlClient.SqlParameter
            dpNAME.Direction = ParameterDirection.Input
            dpNAME = myCmd.CreateParameter()
            dpNAME.ParameterName = "@NAME"
            dpNAME.Value = NAME
            myCmd.Parameters.Add(dpNAME)


            Dim dpDESCRIPTION As New SqlClient.SqlParameter
            dpDESCRIPTION.Direction = ParameterDirection.Input
            dpDESCRIPTION = myCmd.CreateParameter()
            dpDESCRIPTION.ParameterName = "@DESCRIPTION"
            dpDESCRIPTION.Value = DESCRIPTION
            myCmd.Parameters.Add(dpDESCRIPTION)

            ' Call stored procedure ADD_Phase
            myCmd.Prepare()
            Debug.WriteLine(myCmd.CommandText)

            Debug.WriteLine(myCmd.ToString)

            Dim RETURN_VALUE As Object
            RETURN_VALUE = myCmd.ExecuteScalar()
            Debug.WriteLine("User Insert Return Value: " & RETURN_VALUE)
            Return True
        Catch ex As Exception
            Throw ex
            Debug.Write(FUNCTION_NAME & " Error: " & ex.Message)
            Return False
        End Try
    End Function
    Public Function AddListPhase(ByVal PROJECT_ID As Integer, ByVal PHASE_ID As Integer)
        '   add a resource to a project. A project charter must be created prior to adding
        '   resources, tasks and phases to a project.

        FUNCTION_NAME = "AddListPhase"
        Try
            ' save resource data to SQL Server database
            Dim cn As SqlConnection = New SqlConnection(Configuration.ConfigurationManager.ConnectionStrings("ApplicationServices").ConnectionString)
            Dim myCmd As SqlClient.SqlCommand = New SqlCommand("ADD_PROJECT_PHASE", cn)
            myCmd.CommandType = CommandType.StoredProcedure

            ' connect to database
            cn.Open()

            Dim dpPROJECT_ID As New SqlClient.SqlParameter
            dpPROJECT_ID.Direction = ParameterDirection.Input
            dpPROJECT_ID = myCmd.CreateParameter()
            dpPROJECT_ID.ParameterName = "@PROJECT_ID"
            dpPROJECT_ID.Value = PROJECT_ID
            myCmd.Parameters.Add(dpPROJECT_ID)

            Dim dpPHASE_ID As New SqlClient.SqlParameter
            dpPHASE_ID.Direction = ParameterDirection.Input
            dpPHASE_ID = myCmd.CreateParameter()
            dpPHASE_ID.ParameterName = "@PHASE_ID"
            dpPHASE_ID.Value = PHASE_ID
            myCmd.Parameters.Add(dpPHASE_ID)

            ' Call stored procedure ADD_PROJECT_USER
            myCmd.Prepare()
            Debug.WriteLine(myCmd.CommandText)

            Debug.WriteLine(myCmd.ToString)

            Dim RETURN_VALUE As Object
            RETURN_VALUE = myCmd.ExecuteScalar()
            Debug.WriteLine("User Insert Return Value: " & RETURN_VALUE)

        Catch ex As Exception
            Debug.Write(FUNCTION_NAME & " Error: " & ex.Message)
        End Try
    End Function
    Public Function AddPhaseToProject(ByVal PROJECT_ID As Integer)
        '   add a resource to a project. A project charter must be created prior to adding
        '   resources, tasks and phases to a project.

        FUNCTION_NAME = "AddPhaseToProject"
        Try
            ' save resource data to SQL Server database
            Dim cn As SqlConnection = New SqlConnection(Configuration.ConfigurationManager.ConnectionStrings("ApplicationServices").ConnectionString)
            Dim myCmd As SqlClient.SqlCommand = New SqlCommand("ADD_PROJECT_Phase", cn)
            myCmd.CommandType = CommandType.StoredProcedure

            ' connect to database
            cn.Open()

            Dim db As New DataAccess
            Dim dt As New DataTable
            dt = db.Query("SELECT max(Phase_ID) FROM Phases")


            Dim dpPROJECT_ID As New SqlClient.SqlParameter
            dpPROJECT_ID.Direction = ParameterDirection.Input
            dpPROJECT_ID = myCmd.CreateParameter()
            dpPROJECT_ID.ParameterName = "@PROJECT_ID"
            dpPROJECT_ID.Value = PROJECT_ID
            myCmd.Parameters.Add(dpPROJECT_ID)

            Dim PHASE_ID As Integer = dt.Rows(0).Item(0)
            Dim dpPHASE_ID As New SqlClient.SqlParameter
            dpPHASE_ID.Direction = ParameterDirection.Input
            dpPHASE_ID = myCmd.CreateParameter()
            dpPHASE_ID.ParameterName = "@PHASE_ID"
            dpPHASE_ID.Value = PHASE_ID
            myCmd.Parameters.Add(dpPHASE_ID)

            ' Call stored procedure ADD_PROJECT_PHASE
            myCmd.Prepare()
            Debug.WriteLine(myCmd.CommandText)

            Debug.WriteLine(myCmd.ToString)

            Dim RETURN_VALUE As Object
            RETURN_VALUE = myCmd.ExecuteScalar()
            Debug.WriteLine("User Insert Return Value: " & RETURN_VALUE)

        Catch ex As Exception
            Debug.Write(FUNCTION_NAME & " Error: " & ex.Message)
        End Try
    End Function
    Public Function AddListTask(ByVal PROJECT_ID As Integer, ByVal TASK_ID As Integer)
        '   add a task to a project. A project charter must be created prior to adding
        '   resources, tasks and phases to a project.

        FUNCTION_NAME = "AddListTask"
        Try
            ' save resource data to SQL Server database
            Dim cn As SqlConnection = New SqlConnection(Configuration.ConfigurationManager.ConnectionStrings("ApplicationServices").ConnectionString)
            Dim myCmd As SqlClient.SqlCommand = New SqlCommand("ADD_PROJECT_TASK", cn)
            myCmd.CommandType = CommandType.StoredProcedure

            ' connect to database
            cn.Open()

            Dim dpPROJECT_ID As New SqlClient.SqlParameter
            dpPROJECT_ID.Direction = ParameterDirection.Input
            dpPROJECT_ID = myCmd.CreateParameter()
            dpPROJECT_ID.ParameterName = "@PROJECT_ID"
            dpPROJECT_ID.Value = PROJECT_ID
            myCmd.Parameters.Add(dpPROJECT_ID)

            Dim dpTASK_ID As New SqlClient.SqlParameter
            dpTASK_ID.Direction = ParameterDirection.Input
            dpTASK_ID = myCmd.CreateParameter()
            dpTASK_ID.ParameterName = "@TASK_ID"
            dpTASK_ID.Value = TASK_ID
            myCmd.Parameters.Add(dpTASK_ID)

            ' Call stored procedure ADD_PROJECT_TASK
            myCmd.Prepare()
            Debug.WriteLine(myCmd.CommandText)

            Debug.WriteLine(myCmd.ToString)

            Dim RETURN_VALUE As Object
            RETURN_VALUE = myCmd.ExecuteScalar()
            Debug.WriteLine("User Insert Return Value: " & RETURN_VALUE)

        Catch ex As Exception
            Debug.Write(FUNCTION_NAME & " Error: " & ex.Message)
        End Try
    End Function
    Public Function AddTaskToProject(ByVal PROJECT_ID As Integer, ByVal TASK_ID As Integer)
        '   add a task to a project. A project charter must be created prior to adding
        '   resources, tasks and phases to a project.

        FUNCTION_NAME = "AddTaskToProject"
        Try
            ' save resource data to SQL Server database
            Dim cn As SqlConnection = New SqlConnection(Configuration.ConfigurationManager.ConnectionStrings("ApplicationServices").ConnectionString)
            Dim myCmd As SqlClient.SqlCommand = New SqlCommand("ADD_PROJECT_TASK", cn)
            myCmd.CommandType = CommandType.StoredProcedure

            ' connect to database
            cn.Open()

            'Dim db As New DataAccess
            'Dim dt As New DataTable
            'dt = db.Query("SELECT max(Task_ID) FROM Tasks")

            Dim dpPROJECT_ID As New SqlClient.SqlParameter
            dpPROJECT_ID.Direction = ParameterDirection.Input
            dpPROJECT_ID = myCmd.CreateParameter()
            dpPROJECT_ID.ParameterName = "@PROJECT_ID"
            dpPROJECT_ID.Value = PROJECT_ID
            myCmd.Parameters.Add(dpPROJECT_ID)

            Dim dpTASK_ID As New SqlClient.SqlParameter
            dpTASK_ID.Direction = ParameterDirection.Input
            dpTASK_ID = myCmd.CreateParameter()
            dpTASK_ID.ParameterName = "@TASK_ID"
            dpTASK_ID.Value = TASK_ID
            myCmd.Parameters.Add(dpTASK_ID)

            ' Call stored procedure ADD_PROJECT_TASK
            myCmd.Prepare()
            Debug.WriteLine(myCmd.CommandText)

            Debug.WriteLine(myCmd.ToString)

            Dim RETURN_VALUE As Object
            RETURN_VALUE = myCmd.ExecuteScalar()
            Debug.WriteLine("User Insert Return Value: " & RETURN_VALUE)

        Catch ex As Exception
            Debug.Write(FUNCTION_NAME & " Error: " & ex.Message)
        End Try
    End Function
    Public Function AddResource(ByVal projectid As Integer, ByVal userid As Integer, ByVal rateid As Integer, ByVal ratenotes As String, ByVal taskid As Integer)
        '   add a resource to a project. A project charter must be created prior to adding
        '   resources, tasks and phases to a project.

        FUNCTION_NAME = "AddResource"
        Try
            ' save resource data to SQL Server database
            Dim cn As SqlConnection = New SqlConnection(Configuration.ConfigurationManager.ConnectionStrings("ApplicationServices").ConnectionString)
            Dim myCmd As SqlClient.SqlCommand = New SqlCommand("ADD_PROJECT_USER", cn)
            myCmd.CommandType = CommandType.StoredProcedure

            '' connect to database
            cn.Open()

            Dim PROJECT_ID As Integer = projectid
            Dim dpPROJECT_ID As New SqlClient.SqlParameter
            dpPROJECT_ID.Direction = ParameterDirection.Input
            dpPROJECT_ID = myCmd.CreateParameter()
            dpPROJECT_ID.ParameterName = "@PROJECT_ID"
            dpPROJECT_ID.Value = PROJECT_ID
            myCmd.Parameters.Add(dpPROJECT_ID)

            Dim dpTASK_ID As New SqlClient.SqlParameter
            dpTASK_ID.Direction = ParameterDirection.Input
            dpTASK_ID = myCmd.CreateParameter()
            dpTASK_ID.ParameterName = "@TASK_ID"
            dpTASK_ID.Value = taskid

            myCmd.Parameters.Add(dpTASK_ID)

            Dim USER_NAME As Integer = userid
            Dim dpUSER_NAME As New SqlClient.SqlParameter
            dpUSER_NAME.Direction = ParameterDirection.Input
            dpUSER_NAME = myCmd.CreateParameter()
            dpUSER_NAME.ParameterName = "@USER_ID"
            dpUSER_NAME.Value = userid
            myCmd.Parameters.Add(dpUSER_NAME)

            Dim RATE_ID As Integer = rateid
            Dim dpRATE_ID As New SqlClient.SqlParameter
            dpRATE_ID.Direction = ParameterDirection.Input
            dpRATE_ID = myCmd.CreateParameter()
            dpRATE_ID.ParameterName = "@RATE_ID"
            dpRATE_ID.Value = RATE_ID
            myCmd.Parameters.Add(dpRATE_ID)

            Dim DESCRIPTION As String = ratenotes
            Dim dpDESCRIPTION As New SqlClient.SqlParameter
            dpDESCRIPTION.Direction = ParameterDirection.Input
            dpDESCRIPTION = myCmd.CreateParameter()
            dpDESCRIPTION.ParameterName = "@RATE_DESCRIPTION"
            dpDESCRIPTION.Value = DESCRIPTION
            myCmd.Parameters.Add(dpDESCRIPTION)

            ' Call stored procedure ADD_PROJECT_USER
            myCmd.Prepare()
            Debug.WriteLine(myCmd.CommandText)

            Debug.WriteLine(myCmd.ToString)

            Dim RETURN_VALUE As Object
            RETURN_VALUE = myCmd.ExecuteScalar()
            Debug.WriteLine("User Insert Return Value: " & RETURN_VALUE)

        Catch ex As Exception
            Debug.Write(FUNCTION_NAME & " Error: " & ex.Message)
        End Try
    End Function
    Public Function SaveProject(ByVal CHARTER_ID As Integer, ByVal CLIENT_ID As Integer, ByVal PROJECT_CODE As String, ByVal BUSINESS_LINE_ID As Integer, _
                                 ByVal CHARTER_STATUS_ID As Integer, ByVal SUB_PROJECT As String, ByVal BILLING_CONTACT_ID As Integer, ByVal SPONSOR_CONTACT_ID As Integer, _
                                 ByVal TELEPHONE As String, ByVal COMPANY_WEBSITE As String, ByVal Industry As Integer, ByVal PO As String, ByVal PROJECT_MANAGER_ID As Integer, _
                                 ByVal ESTIMATED_START_DATE As Date, ByVal ESTIMATED_COMPLETION_DATE As Date, ByVal ESTIMATED_DURATION As String, ByVal ESTIMATED_BUDGET As Double, _
                                 ByVal TECHNOLOGY_ID As Integer, ByVal ACCOUNT_MANAGER_ID As Integer, ByVal PROJECT_TYPE_ID As Integer, ByVal BILLING_TERMS_ID As Integer, _
                                 ByVal PAYMENT_TERMS_ID As Integer, ByVal DESC As String, ByVal TOTAL_ESTIMATED_HOURS As String, ByVal AUTHORIZATION_ID As Integer, _
                                 ByVal BILLING_NOTES As String, ByVal PROJECT_NOTES As String, ByVal IsGlobal As Integer, ByVal IsBillable As Integer, ByVal MileStoneFlags As Integer, _
                                 ByVal UserId As Integer, ByVal TOTAL_ESTIMATED_COST As String, ByVal CURRENTUSER_ID As Integer)
        '   save all of the project charter data to the database using 
        '   the stored proc 'SAVE_CHARTER. The stored proc has been
        '   enhanced to allow for project charter updates

        FUNCTION_NAME = "Save"
        Try
            ' save time data to SQL Server database
            Dim cn As SqlConnection = New SqlConnection(Configuration.ConfigurationManager.ConnectionStrings("ApplicationServices").ConnectionString)
            Dim myCmd As SqlClient.SqlCommand = New SqlCommand("SAVE_CHARTER", cn)
            myCmd.CommandType = CommandType.StoredProcedure

            ' connect to database
            cn.Open()

            Dim dpCHARTER_ID As New SqlClient.SqlParameter
            dpCHARTER_ID.Direction = ParameterDirection.Input
            dpCHARTER_ID = myCmd.CreateParameter()
            dpCHARTER_ID.ParameterName = "@CHARTER_ID"
            If Len(CHARTER_ID) > 0 Then
                dpCHARTER_ID.Value = CHARTER_ID
            Else
                dpCHARTER_ID.Value = DBNull.Value
            End If
            myCmd.Parameters.Add(dpCHARTER_ID)

            ' @CLIENT_ID INT,
            Dim dpCLIENT_ID As New SqlClient.SqlParameter
            dpCLIENT_ID.Direction = ParameterDirection.Input
            dpCLIENT_ID = myCmd.CreateParameter()
            dpCLIENT_ID.ParameterName = "@CLIENT_ID"
            dpCLIENT_ID.Value = Val(CLIENT_ID)
            myCmd.Parameters.Add(dpCLIENT_ID)

            '   @PROJECT_CODE String,
            Dim dpPROJECT_CODE As New SqlClient.SqlParameter
            dpPROJECT_CODE.Direction = ParameterDirection.Input
            dpPROJECT_CODE = myCmd.CreateParameter()
            dpPROJECT_CODE.ParameterName = "@PROJECT_CODE"
            dpPROJECT_CODE.Value = PROJECT_CODE
            myCmd.Parameters.Add(dpPROJECT_CODE)


            '   @BUSINESS_LINE_ID 
            Dim dpBUSINESS_LINE_ID As New SqlClient.SqlParameter
            dpBUSINESS_LINE_ID.Direction = ParameterDirection.Input
            dpBUSINESS_LINE_ID = myCmd.CreateParameter()
            dpBUSINESS_LINE_ID.ParameterName = "@BUSINESS_LINE_ID"
            dpBUSINESS_LINE_ID.Value = Val(BUSINESS_LINE_ID)
            myCmd.Parameters.Add(dpBUSINESS_LINE_ID)

            '   @CHARTER_STATUS_ID 
            Dim dpCHARTER_STATUS_ID As New SqlClient.SqlParameter
            dpCHARTER_STATUS_ID.Direction = ParameterDirection.Input
            dpCHARTER_STATUS_ID = myCmd.CreateParameter()
            dpCHARTER_STATUS_ID.ParameterName = "@CHARTER_STATUS_ID"
            dpCHARTER_STATUS_ID.Value = Val(CHARTER_STATUS_ID)
            myCmd.Parameters.Add(dpCHARTER_STATUS_ID)

            '   @SUB_PROJECT STRING,
            Dim dpSUB_PROJECT As New SqlClient.SqlParameter
            dpSUB_PROJECT.Direction = ParameterDirection.Input
            dpSUB_PROJECT = myCmd.CreateParameter()
            dpSUB_PROJECT.ParameterName = "@SUB_PROJECT"
            dpSUB_PROJECT.Value = SUB_PROJECT
            myCmd.Parameters.Add(dpSUB_PROJECT)

            '   @BILLING_CONTACT_ID
            Dim dpBILLING_CONTACT_ID As New SqlClient.SqlParameter
            dpBILLING_CONTACT_ID.Direction = ParameterDirection.Input
            dpBILLING_CONTACT_ID = myCmd.CreateParameter()
            dpBILLING_CONTACT_ID.ParameterName = "@BILLING_CONTACT_ID"
            dpBILLING_CONTACT_ID.Value = BILLING_CONTACT_ID
            myCmd.Parameters.Add(dpBILLING_CONTACT_ID)

            '   @SPONSOR_CONTACT_ID
            Dim dpSPONSOR_CONTACT_ID As New SqlClient.SqlParameter
            dpSPONSOR_CONTACT_ID.Direction = ParameterDirection.Input
            dpSPONSOR_CONTACT_ID = myCmd.CreateParameter()
            dpSPONSOR_CONTACT_ID.ParameterName = "@SPONSOR_CONTACT_ID"
            dpSPONSOR_CONTACT_ID.Value = SPONSOR_CONTACT_ID
            myCmd.Parameters.Add(dpSPONSOR_CONTACT_ID)

            '   @TELEPHONE_ID INT,
            Dim dpTELEPHONE_ID As New SqlClient.SqlParameter
            dpTELEPHONE_ID.Direction = ParameterDirection.Input
            dpTELEPHONE_ID = myCmd.CreateParameter()
            dpTELEPHONE_ID.ParameterName = "@TELEPHONE_ID"
            dpTELEPHONE_ID.Value = TELEPHONE
            myCmd.Parameters.Add(dpTELEPHONE_ID)

            ''   @EMAIL STRING!
            'Dim sEMAIL As String = inputEmail.Text
            'Dim dpEMAIL As New SqlClient.SqlParameter
            'dpEMAIL.Direction = ParameterDirection.Input
            'dpEMAIL = myCmd.CreateParameter()
            'dpEMAIL.ParameterName = "@EMAIL"
            'dpEMAIL.Value = sEMAIL
            'myCmd.Parameters.Add(dpEMAIL)

            ''   @ADDRESS_ID STRING,
            'Dim sADDRESS_ID As String = inputAddress.Text
            'Dim dpADDRESS_ID As New SqlClient.SqlParameter
            'dpADDRESS_ID.Direction = ParameterDirection.Input
            'dpADDRESS_ID = myCmd.CreateParameter()
            'dpADDRESS_ID.ParameterName = "@ADDRESS_ID"
            'dpADDRESS_ID.Value = sADDRESS_ID
            'myCmd.Parameters.Add(dpADDRESS_ID)

            ''   @ADDRESS_ID2 STRING
            'Dim sADDRESS_ID2 As String = inputAddress2.Text
            'Dim dpADDRESS_ID2 As New SqlClient.SqlParameter
            'dpADDRESS_ID2.Direction = ParameterDirection.Input
            'dpADDRESS_ID2 = myCmd.CreateParameter()
            'dpADDRESS_ID2.ParameterName = "@ADDRESS_ID2"
            'dpADDRESS_ID2.Value = sADDRESS_ID2
            'myCmd.Parameters.Add(dpADDRESS_ID2)

            '   @COMPANY_WEBSITE STRING,
            Dim dpCOMPANY_WEBSITE As New SqlClient.SqlParameter
            dpCOMPANY_WEBSITE.Direction = ParameterDirection.Input
            dpCOMPANY_WEBSITE = myCmd.CreateParameter()
            dpCOMPANY_WEBSITE.ParameterName = "@COMPANY_WEBSITE"
            dpCOMPANY_WEBSITE.Value = COMPANY_WEBSITE
            myCmd.Parameters.Add(dpCOMPANY_WEBSITE)

            '   @INDUSTRY STRING,
            Dim dpINDUSTRY As New SqlClient.SqlParameter
            dpINDUSTRY.Direction = ParameterDirection.Input
            dpINDUSTRY = myCmd.CreateParameter()
            dpINDUSTRY.ParameterName = "@INDUSTRY_ID"
            dpINDUSTRY.Value = Industry
            myCmd.Parameters.Add(dpINDUSTRY)

            '   @FIRST_BILLED_DATE STRING, (for PHASE 2)
            '   @LAST_BILLED_DATE STRING, (for PHASE 2)

            '   @PO# STRING,
            Dim dpPO As New SqlClient.SqlParameter
            dpPO.Direction = ParameterDirection.Input
            dpPO = myCmd.CreateParameter()
            dpPO.ParameterName = "@PO#"
            dpPO.Value = PO
            myCmd.Parameters.Add(dpPO)

            '   @PROJECT_MANAGER_ID INT
            Dim dpPROJECT_MANAGER_ID As New SqlClient.SqlParameter
            dpPROJECT_MANAGER_ID.Direction = ParameterDirection.Input
            dpPROJECT_MANAGER_ID = myCmd.CreateParameter()
            dpPROJECT_MANAGER_ID.ParameterName = "@PROJECT_MANAGER_ID"
            dpPROJECT_MANAGER_ID.Value = PROJECT_MANAGER_ID
            myCmd.Parameters.Add(dpPROJECT_MANAGER_ID)

            '   @EXPECTED_START_DATE STRING
            Dim dpEXPECTED_START_DATE As New SqlClient.SqlParameter
            dpEXPECTED_START_DATE.Direction = ParameterDirection.Input
            dpEXPECTED_START_DATE = myCmd.CreateParameter()
            dpEXPECTED_START_DATE.ParameterName = "@EXPECTED_START_DATE"
            dpEXPECTED_START_DATE.Value = ESTIMATED_START_DATE
            myCmd.Parameters.Add(dpEXPECTED_START_DATE)

            '   @ESTIMATED_COMPLETION_DATE STRING
            Dim dpESTIMATED_COMPLETION_DATE As New SqlClient.SqlParameter
            dpESTIMATED_COMPLETION_DATE.Direction = ParameterDirection.Input
            dpESTIMATED_COMPLETION_DATE = myCmd.CreateParameter()
            dpESTIMATED_COMPLETION_DATE.ParameterName = "@ESTIMATED_COMPLETION_DATE"
            dpESTIMATED_COMPLETION_DATE.Value = ESTIMATED_COMPLETION_DATE
            myCmd.Parameters.Add(dpESTIMATED_COMPLETION_DATE)

            '   @ESTIMATED_DURATION INT, 
            Dim dpESTIMATED_DURATION As New SqlClient.SqlParameter
            dpESTIMATED_DURATION.Direction = ParameterDirection.Input
            dpESTIMATED_DURATION = myCmd.CreateParameter()
            dpESTIMATED_DURATION.ParameterName = "@ESTIMATED_DURATION"
            dpESTIMATED_DURATION.Value = ESTIMATED_DURATION
            myCmd.Parameters.Add(dpESTIMATED_DURATION)

            '   @ESTIMATED_BUDGET STRING
            Dim dpESTIMATED_BUDGET As New SqlClient.SqlParameter
            dpESTIMATED_BUDGET.Direction = ParameterDirection.Input
            dpESTIMATED_BUDGET = myCmd.CreateParameter()
            dpESTIMATED_BUDGET.ParameterName = "@ESTIMATED_BUDGET"
            dpESTIMATED_BUDGET.Value = Val(ESTIMATED_BUDGET)
            myCmd.Parameters.Add(dpESTIMATED_BUDGET)

            '   @TECHNOLOGY_ID INT, 
            Dim dpTECHNOLOGY_ID As New SqlClient.SqlParameter
            dpTECHNOLOGY_ID.Direction = ParameterDirection.Input
            dpTECHNOLOGY_ID = myCmd.CreateParameter()
            dpTECHNOLOGY_ID.ParameterName = "@TECHNOLOGY_ID"
            dpTECHNOLOGY_ID.Value = TECHNOLOGY_ID
            myCmd.Parameters.Add(dpTECHNOLOGY_ID)

            '   @ACCOUNT_MANAGER_ID INT,
            Dim dpACCOUNT_MANAGER_ID As New SqlClient.SqlParameter
            dpACCOUNT_MANAGER_ID.Direction = ParameterDirection.Input
            dpACCOUNT_MANAGER_ID = myCmd.CreateParameter()
            dpACCOUNT_MANAGER_ID.ParameterName = "@ACCOUNT_MANAGER_ID"
            dpACCOUNT_MANAGER_ID.Value = Val(ACCOUNT_MANAGER_ID)
            myCmd.Parameters.Add(dpACCOUNT_MANAGER_ID)

            '   @PROJECT_TYPE_ID INT, 
            Dim dpPROJECT_TYPE_ID As New SqlClient.SqlParameter
            dpPROJECT_TYPE_ID.Direction = ParameterDirection.Input
            dpPROJECT_TYPE_ID = myCmd.CreateParameter()
            dpPROJECT_TYPE_ID.ParameterName = "@PROJECT_TYPE_ID"
            dpPROJECT_TYPE_ID.Value = Val(PROJECT_TYPE_ID)
            myCmd.Parameters.Add(dpPROJECT_TYPE_ID)

            '   @BILLING_TERMS_ID INT, 
            Dim dpBILLING_TERMS_ID As New SqlClient.SqlParameter
            dpBILLING_TERMS_ID.Direction = ParameterDirection.Input
            dpBILLING_TERMS_ID = myCmd.CreateParameter()
            dpBILLING_TERMS_ID.ParameterName = "@BILLING_TERMS_ID"
            dpBILLING_TERMS_ID.Value = Val(BILLING_TERMS_ID)
            myCmd.Parameters.Add(dpBILLING_TERMS_ID)

            '   @PAYMENT_TERMS_ID INT,
            Dim dpPAYMENT_TERMS_ID As New SqlClient.SqlParameter
            dpPAYMENT_TERMS_ID.Direction = ParameterDirection.Input
            dpPAYMENT_TERMS_ID = myCmd.CreateParameter()
            dpPAYMENT_TERMS_ID.ParameterName = "@PAYMENT_TERMS_ID"
            dpPAYMENT_TERMS_ID.Value = Val(PAYMENT_TERMS_ID)
            myCmd.Parameters.Add(dpPAYMENT_TERMS_ID)

            '   @AUTHORIZATION_ID INT, 
            Dim dpAUTHORIZATION_ID As New SqlClient.SqlParameter
            dpAUTHORIZATION_ID.Direction = ParameterDirection.Input
            dpAUTHORIZATION_ID = myCmd.CreateParameter()
            dpAUTHORIZATION_ID.ParameterName = "@AUTHORIZATION_ID"
            dpAUTHORIZATION_ID.Value = Val(AUTHORIZATION_ID)
            myCmd.Parameters.Add(dpAUTHORIZATION_ID)

            '   @DESC STRING, 
            Dim dpDESC As New SqlClient.SqlParameter
            dpDESC.Direction = ParameterDirection.Input
            dpDESC = myCmd.CreateParameter()
            dpDESC.ParameterName = "@DESC"
            dpDESC.Value = DESC
            myCmd.Parameters.Add(dpDESC)

            '   @TOTAL_ESTIMATED_HOURS INT, reserved for Phase 2
            Dim dpTOTAL_ESTIMATED_HOURS As New SqlClient.SqlParameter
            dpTOTAL_ESTIMATED_HOURS.Direction = ParameterDirection.Input
            dpTOTAL_ESTIMATED_HOURS = myCmd.CreateParameter()
            dpTOTAL_ESTIMATED_HOURS.ParameterName = "@TOTAL_ESTIMATED_HOURS"
            dpTOTAL_ESTIMATED_HOURS.Value = Val(TOTAL_ESTIMATED_HOURS)
            myCmd.Parameters.Add(dpTOTAL_ESTIMATED_HOURS)

            '   @TOTAL_ESTIMATED_COST STRING, Reserved for Phase 2
            Dim dpTOTAL_ESTIMATED_COST As New SqlClient.SqlParameter
            dpTOTAL_ESTIMATED_COST.Direction = ParameterDirection.Input
            dpTOTAL_ESTIMATED_COST = myCmd.CreateParameter()
            dpTOTAL_ESTIMATED_COST.ParameterName = "@TOTAL_ESTIMATED_COST"
            dpTOTAL_ESTIMATED_COST.Value = TOTAL_ESTIMATED_COST
            myCmd.Parameters.Add(dpTOTAL_ESTIMATED_COST)

            '   @BILLING_NOTES STRING,
            Dim dpBILLING_NOTES As New SqlClient.SqlParameter
            dpBILLING_NOTES.Direction = ParameterDirection.Input
            dpBILLING_NOTES = myCmd.CreateParameter()
            dpBILLING_NOTES.ParameterName = "@BILLING_NOTES"
            dpBILLING_NOTES.Value = BILLING_NOTES
            myCmd.Parameters.Add(dpBILLING_NOTES)

            '   @PROJECT_NOTES STRING,
            Dim dpPROJECT_NOTES As New SqlClient.SqlParameter
            dpPROJECT_NOTES.Direction = ParameterDirection.Input
            dpPROJECT_NOTES = myCmd.CreateParameter()
            dpPROJECT_NOTES.ParameterName = "@PROJECT_NOTES"
            dpPROJECT_NOTES.Value = PROJECT_NOTES
            myCmd.Parameters.Add(dpPROJECT_NOTES)

            '   @UPDATED_DATE STRING, (reserved for second Time Weasel release)
            Dim dpUpdateDate As New SqlClient.SqlParameter
            dpUpdateDate.Direction = ParameterDirection.Input
            dpUpdateDate = myCmd.CreateParameter()
            dpUpdateDate.ParameterName = "@UPDATED_DATE"
            dpUpdateDate.Value = Date.Now
            myCmd.Parameters.Add(dpUpdateDate)

            '   @UPDATED_BY INT, (reserved for second Time Weasel release)
            Dim dpUpdateUser As New SqlClient.SqlParameter
            dpUpdateUser.Direction = ParameterDirection.Input
            dpUpdateUser = myCmd.CreateParameter()
            dpUpdateUser.ParameterName = "@UPDATED_BY"
            dpUpdateUser.Value = CURRENTUSER_ID
            myCmd.Parameters.Add(dpUpdateUser)

            Dim dpPROJECT_GLOBAL As New SqlClient.SqlParameter
            dpPROJECT_GLOBAL.Direction = ParameterDirection.Input
            dpPROJECT_GLOBAL = myCmd.CreateParameter()
            dpPROJECT_GLOBAL.ParameterName = "@PROJECT_GLOBAL"
            dpPROJECT_GLOBAL.Value = IsGlobal
            myCmd.Parameters.Add(dpPROJECT_GLOBAL)

            Dim dpPROJECT_BILLABLE As New SqlClient.SqlParameter
            dpPROJECT_BILLABLE.Direction = ParameterDirection.Input
            dpPROJECT_BILLABLE = myCmd.CreateParameter()
            dpPROJECT_BILLABLE.ParameterName = "@BILLABLE"
            dpPROJECT_BILLABLE.Value = IsBillable
            myCmd.Parameters.Add(dpPROJECT_BILLABLE)


            Dim dpMILESTONE_STATUS As SqlClient.SqlParameter
            dpMILESTONE_STATUS = myCmd.CreateParameter()
            dpMILESTONE_STATUS.ParameterName = "@MILESTONE_STATUS_FLAG"
            dpMILESTONE_STATUS.Value = MileStoneFlags
            myCmd.Parameters.Add(dpMILESTONE_STATUS)

            ' Call stored procedure SAVE_CHARTER

            Debug.WriteLine(myCmd.CommandText)

            Debug.WriteLine(myCmd.ToString)

            Dim RETURN_VALUE As Object
            RETURN_VALUE = myCmd.ExecuteScalar()
            Debug.WriteLine("Charter Insert Return Value: " & RETURN_VALUE)
            Return RETURN_VALUE
            '**RGB 11/24/2004
            '** Removed call to prepare and parameter.clea
            '** added call to dispose cmd and close connection
            myCmd.Dispose()
            If cn.State = ConnectionState.Open Then
                cn.Close()
            End If

        Catch ex As Exception
            Debug.Write(FUNCTION_NAME & " Error: " & ex.Message)
            Throw ex
        End Try
    End Function
    Public Function GetProject(ByVal projectid As Integer) As DataTable
        Dim cn As SqlConnection = New SqlConnection(Configuration.ConfigurationManager.ConnectionStrings("ApplicationServices").ConnectionString)
        Dim myCmd As SqlClient.SqlCommand = New SqlCommand("GET_CHARTER", cn)
        Dim da As IDbDataAdapter
        Dim ds As New DataSet
        Dim dt As New DataTable
        myCmd.CommandType = CommandType.StoredProcedure
        myCmd.Parameters.AddWithValue("@PROJECT_ID", projectid)

        cn.Open()

        da = New SqlDataAdapter(myCmd)
        da.Fill(ds)

        If cn.State = ConnectionState.Open Then
            cn.Close()
        End If

        dt = ds.Tables(0)

        Return dt
    End Function
    Public Function GetIndustries() As DataTable
        ' missing table - dead function 20110115 agh
        'returns a datatable of all contacts for a given client id
        Dim cn As SqlConnection = New SqlConnection(Configuration.ConfigurationManager.ConnectionStrings("ApplicationServices").ConnectionString)
        Dim myCmd As SqlClient.SqlCommand = New SqlCommand("GET_INDUSTRIES", cn)
        Dim da As IDbDataAdapter
        Dim ds As New DataSet
        Dim dt As New DataTable

        myCmd.CommandType = CommandType.StoredProcedure

        cn.Open()

        da = New SqlDataAdapter(myCmd)
        da.Fill(ds)

        If cn.State = ConnectionState.Open Then
            cn.Close()
        End If

        dt = ds.Tables(0)
        GetIndustries = dt
    End Function

    Public Function GetPTOAvailable(ByVal UserID As Integer) As DataTable
        Try
            Dim dp1 As New SqlClient.SqlParameter("USER_ID", UserID)
            dp1.Direction = ParameterDirection.Input

            Dim cn As SqlConnection = New SqlConnection(Configuration.ConfigurationManager.ConnectionStrings("ApplicationServices").ConnectionString)
            Dim myCmd As SqlClient.SqlCommand = New SqlCommand("PTO_AVAILABLE", cn)
            myCmd.CommandType = CommandType.StoredProcedure

            dp1 = myCmd.CreateParameter()
            dp1.Direction = ParameterDirection.Input
            dp1.ParameterName = "@USER_ID"
            dp1.Value = UserID
            myCmd.Parameters.Add(dp1)

            cn.Open()


            Dim da As IDbDataAdapter
            Dim ds As New DataSet

            da = New SqlDataAdapter(myCmd)
            da.Fill(ds)
            Dim dt As New DataTable
            dt = ds.Tables(0)

            cn.Close()
            cn.Dispose()


            Return dt
        Catch ex As Exception
            Debug.WriteLine(ex.Message)
            Throw ex
        End Try
    End Function


    Public Function DeletePTORequest(ByVal RequestID As Integer) As Integer
        Try
            Dim dp1 As New SqlClient.SqlParameter("@ID", RequestID)
            dp1.Direction = ParameterDirection.Input

            Dim cn As SqlConnection = New SqlConnection(Configuration.ConfigurationManager.ConnectionStrings("ApplicationServices").ConnectionString)
            Dim myCmd As SqlClient.SqlCommand = New SqlCommand("DELETE_PTO_REQUEST", cn)
            myCmd.CommandType = CommandType.StoredProcedure

            dp1 = myCmd.CreateParameter()
            dp1.Direction = ParameterDirection.Input
            dp1.ParameterName = "@ID"
            dp1.Value = RequestID
            myCmd.Parameters.Add(dp1)

            cn.Open()


            myCmd.ExecuteNonQuery()

            cn.Close()
            cn.Dispose()


        Catch ex As Exception
            Debug.WriteLine(ex.Message)
            Throw ex
        End Try
    End Function

    Public Function GET_PTO_REQUEST_RESPONSE(ByVal UserID As Integer) As DataTable
        Try
            Dim dp1 As New SqlClient.SqlParameter("@USER_ID", UserID)
            dp1.Direction = ParameterDirection.Input

            Dim cn As SqlConnection = New SqlConnection(Configuration.ConfigurationManager.ConnectionStrings("ApplicationServices").ConnectionString)
            Dim myCmd As SqlClient.SqlCommand = New SqlCommand("GET_PTO_REQUEST_RESPONSE", cn)
            myCmd.CommandType = CommandType.StoredProcedure

            'dp1 = myCmd.CreateParameter()
            'dp1.Direction = ParameterDirection.Input
            'dp1.ParameterName = "@USER_ID"
            'dp1.Value = UserID
            myCmd.Parameters.Add(dp1)

            cn.Open()
            Dim da As IDbDataAdapter
            Dim ds As New DataSet

            da = New SqlDataAdapter(myCmd)
            da.Fill(ds)
            Dim dt As New DataTable
            dt = ds.Tables(0)

            cn.Close()
            cn.Dispose()


            Return dt

        Catch ex As Exception
            Debug.WriteLine(ex.Message)
            Throw ex
        End Try
    End Function

    Public Function UPDATE_PTO_REQUEST_RESPONSE(ByVal UserID As Integer, ByVal RequestID As Integer, ByVal Status As String)
        Try
            Dim dp1 As New SqlClient.SqlParameter("@ManagerID", UserID)
            dp1.Direction = ParameterDirection.Input
            Dim dp2 As New SqlClient.SqlParameter("@RequestID", RequestID)
            dp1.Direction = ParameterDirection.Input
            Dim dp3 As New SqlClient.SqlParameter("@Status", Status)
            dp2.Direction = ParameterDirection.Input

            Dim cn As SqlConnection = New SqlConnection(Configuration.ConfigurationManager.ConnectionStrings("ApplicationServices").ConnectionString)
            Dim myCmd As SqlClient.SqlCommand = New SqlCommand("UPDATE_PTO_REQUEST_RESPONSE", cn)
            myCmd.CommandType = CommandType.StoredProcedure

            myCmd.Parameters.Add(dp1)
            myCmd.Parameters.Add(dp2)
            myCmd.Parameters.Add(dp3)

            cn.Open()
            myCmd.ExecuteNonQuery()

            cn.Close()
            cn.Dispose()


        Catch ex As Exception
            Debug.WriteLine(ex.Message)
            Throw ex
        End Try
    End Function

    Public Function GetForecast(ByVal ManagerID As Integer, ByVal StartDate As DateTime) As DataTable
        Try
            Dim dp1 As New SqlClient.SqlParameter("@MANAGER_ID", ManagerID)
            dp1.Direction = ParameterDirection.Input
            Dim dp2 As New SqlClient.SqlParameter("@START_DATE", StartDate)
            dp2.Direction = ParameterDirection.Input

            Dim cn As SqlConnection = New SqlConnection(Configuration.ConfigurationManager.ConnectionStrings("ApplicationServices").ConnectionString)
            Dim myCmd As SqlClient.SqlCommand = New SqlCommand("GetForecast", cn)
            myCmd.CommandType = CommandType.StoredProcedure

            'dp1 = myCmd.CreateParameter()
            'dp1.Direction = ParameterDirection.Input
            'dp1.ParameterName = "@ID"
            'dp1.Value = RequestID
            myCmd.Parameters.Add(dp1)
            myCmd.Parameters.Add(dp2)

            cn.Open()
            Dim da As IDbDataAdapter
            Dim ds As New DataSet

            da = New SqlDataAdapter(myCmd)
            da.Fill(ds)
            Dim dt As New DataTable
            dt = ds.Tables(0)

            cn.Close()
            cn.Dispose()


            Return dt

        Catch ex As Exception
            Debug.WriteLine(ex.Message)
            Throw ex
        End Try
    End Function

    Public Function GetUserForecast(ByVal UserID As Integer, ByVal StartDate As DateTime) As DataTable
        Try
            Dim dp1 As New SqlClient.SqlParameter("@pUSER_ID", UserID)
            dp1.Direction = ParameterDirection.Input
            Dim dp2 As New SqlClient.SqlParameter("@START_DATE", StartDate)
            dp2.Direction = ParameterDirection.Input

            Dim cn As SqlConnection = New SqlConnection(Configuration.ConfigurationManager.ConnectionStrings("ApplicationServices").ConnectionString)
            Dim myCmd As SqlClient.SqlCommand = New SqlCommand("GetUserForecast", cn)
            myCmd.CommandType = CommandType.StoredProcedure

            'dp1 = myCmd.CreateParameter()
            'dp1.Direction = ParameterDirection.Input
            'dp1.ParameterName = "@ID"
            'dp1.Value = RequestID
            myCmd.Parameters.Add(dp1)
            myCmd.Parameters.Add(dp2)

            cn.Open()
            Dim da As IDbDataAdapter
            Dim ds As New DataSet

            da = New SqlDataAdapter(myCmd)
            da.Fill(ds)
            Dim dt As New DataTable
            dt = ds.Tables(0)

            cn.Close()
            cn.Dispose()


            Return dt

        Catch ex As Exception
            Debug.WriteLine(ex.Message)
            Throw ex
        End Try
    End Function

    Public Function GetUserForecastSummary(ByVal UserID As Integer, ByVal ForecastDate As DateTime) As DataTable
        Try
            Dim dt As New DataTable
            'dt = Page.Cache.Get("FORECAST_SUMMARY")

            'If Not dt Is Nothing Then
            '    Return dt
            'End If

            Dim dp1 As New SqlClient.SqlParameter("@user_id", UserID)
            dp1.Direction = ParameterDirection.Input
            Dim dp2 As New SqlClient.SqlParameter("@FORECAST_DATE", ForecastDate)
            dp2.Direction = ParameterDirection.Input

            Dim cn As SqlConnection = New SqlConnection(Configuration.ConfigurationManager.ConnectionStrings("ApplicationServices").ConnectionString)
            Dim myCmd As SqlClient.SqlCommand = New SqlCommand("GetUserForecastSummary", cn)
            myCmd.CommandType = CommandType.StoredProcedure

            myCmd.Parameters.Add(dp1)
            myCmd.Parameters.Add(dp2)

            cn.Open()
            Dim da As IDbDataAdapter
            Dim ds As New DataSet

            da = New SqlDataAdapter(myCmd)
            da.Fill(ds)

            dt = ds.Tables(0)

            cn.Close()
            cn.Dispose()

            Return dt

        Catch ex As Exception
            Debug.WriteLine(ex.Message)
            Throw ex
        End Try
    End Function

    Public Function AddPTO(ByVal UserID As Integer, ByVal Hours As Integer, ByVal Note As String) As String
        Try
            Dim dp1 As New SqlClient.SqlParameter("@UserID", UserID)
            dp1.Direction = ParameterDirection.Input
            Dim dp2 As New SqlClient.SqlParameter("@Hours", Hours)
            dp2.Direction = ParameterDirection.Input
            Dim dp3 As New SqlClient.SqlParameter("@Note", Note)
            dp3.Direction = ParameterDirection.Input

            Dim cn As SqlConnection = New SqlConnection(Configuration.ConfigurationManager.ConnectionStrings("ApplicationServices").ConnectionString)
            Dim myCmd As SqlClient.SqlCommand = New SqlCommand("AddPTO", cn)
            myCmd.CommandType = CommandType.StoredProcedure

            myCmd.Parameters.Add(dp1)
            myCmd.Parameters.Add(dp2)
            myCmd.Parameters.Add(dp3)

            cn.Open()
            myCmd.ExecuteNonQuery()

            cn.Close()
            cn.Dispose()


        Catch ex As Exception
            Debug.WriteLine(ex.Message)
            Throw ex
        End Try
    End Function


    Public Function SubtractPTO(ByVal UserID As Integer, ByVal Hours As Integer, ByVal Note As String) As String
        Try
            Dim dp1 As New SqlClient.SqlParameter("@UserID", UserID)
            dp1.Direction = ParameterDirection.Input
            Dim dp2 As New SqlClient.SqlParameter("@Hours", Hours)
            dp2.Direction = ParameterDirection.Input
            Dim dp3 As New SqlClient.SqlParameter("@Note", Note)
            dp3.Direction = ParameterDirection.Input

            Dim cn As SqlConnection = New SqlConnection(Configuration.ConfigurationManager.ConnectionStrings("ApplicationServices").ConnectionString)
            Dim myCmd As SqlClient.SqlCommand = New SqlCommand("SubtractPTO", cn)
            myCmd.CommandType = CommandType.StoredProcedure

            myCmd.Parameters.Add(dp1)
            myCmd.Parameters.Add(dp2)
            myCmd.Parameters.Add(dp3)

            cn.Open()
            myCmd.ExecuteNonQuery()

            cn.Close()
            cn.Dispose()

        Catch ex As Exception
            Debug.WriteLine(ex.Message)
            Throw ex
        End Try
    End Function

    Public Function GetPTOHistory(ByVal UserID As Integer) As DataTable
        Dim dp1 As New SqlClient.SqlParameter("@USER_ID", UserID)
        dp1.Direction = ParameterDirection.Input
        Dim cn As SqlConnection = New SqlConnection(Configuration.ConfigurationManager.ConnectionStrings("ApplicationServices").ConnectionString)
        Dim myCmd As SqlClient.SqlCommand = New SqlCommand("GET_PTO_HISTORY", cn)
        myCmd.CommandType = CommandType.StoredProcedure
        myCmd.Parameters.Add(dp1)
        cn.Open()
        Dim da As IDbDataAdapter
        Dim ds As New DataSet

        da = New SqlDataAdapter(myCmd)
        da.Fill(ds)
        Dim dt As New DataTable
        dt = ds.Tables(0)
        cn.Close()
        cn.Dispose()
        Return dt
    End Function


    Public Function EarnedPTO(ByVal UserID As Integer) As DataTable
        Dim dp1 As New SqlClient.SqlParameter("@USERID", UserID)
        dp1.Direction = ParameterDirection.Input
        Dim cn As SqlConnection = New SqlConnection(Configuration.ConfigurationManager.ConnectionStrings("ApplicationServices").ConnectionString)
        Dim myCmd As SqlClient.SqlCommand = New SqlCommand("EarnedPTO", cn)
        myCmd.CommandType = CommandType.StoredProcedure
        myCmd.Parameters.Add(dp1)
        cn.Open()
        Dim da As IDbDataAdapter
        Dim ds As New DataSet

        da = New SqlDataAdapter(myCmd)
        da.Fill(ds)
        Dim dt As New DataTable
        dt = ds.Tables(0)
        cn.Close()
        Return dt
    End Function

    Public Function SaveForecast(ByVal User As String, ByVal Project As String, ByVal Rate As Integer, ByVal w1 As Integer, ByVal w2 As Integer, ByVal w3 As Integer, ByVal w4 As Integer, ByVal w5 As Integer, ByVal w6 As Integer, ByVal w7 As Integer, ByVal w8 As Integer, ByVal w9 As Integer, ByVal w10 As Integer, ByVal w11 As Integer, ByVal w12 As Integer, ByVal Start_Date As String) As String
        Try
            Dim dp1 As New SqlClient.SqlParameter("@User_ID", User)
            dp1.Direction = ParameterDirection.Input
            dp1.SqlDbType = SqlDbType.Int

            Dim dp2 As New SqlClient.SqlParameter("@Project_ID", Project)
            dp2.Direction = ParameterDirection.Input
            dp2.SqlDbType = SqlDbType.Int

            Dim dp3a As New SqlClient.SqlParameter("@Start_Date", Start_Date)
            dp3a.Direction = ParameterDirection.Input
            dp3a.SqlDbType = SqlDbType.DateTime

            Dim dp3 As New SqlClient.SqlParameter("@Rate", Rate)
            dp3.Direction = ParameterDirection.Input
            dp3.SqlDbType = SqlDbType.Int

            Dim dp4 As New SqlClient.SqlParameter("@w1", w1)
            dp4.Direction = ParameterDirection.Input
            dp4.SqlDbType = SqlDbType.Int

            Dim dp5 As New SqlClient.SqlParameter("@w2", w2)
            dp5.Direction = ParameterDirection.Input
            dp5.SqlDbType = SqlDbType.Int

            Dim dp6 As New SqlClient.SqlParameter("@w3", w3)
            dp6.Direction = ParameterDirection.Input
            dp6.SqlDbType = SqlDbType.Int

            Dim dp7 As New SqlClient.SqlParameter("@w4", w4)
            dp7.Direction = ParameterDirection.Input
            dp7.SqlDbType = SqlDbType.Int

            Dim dp8 As New SqlClient.SqlParameter("@w5", w5)
            dp8.Direction = ParameterDirection.Input
            dp8.SqlDbType = SqlDbType.Int

            Dim dp9 As New SqlClient.SqlParameter("@w6", w6)
            dp9.Direction = ParameterDirection.Input
            dp9.SqlDbType = SqlDbType.Int

            Dim dp10 As New SqlClient.SqlParameter("@w7", w7)
            dp10.Direction = ParameterDirection.Input
            dp10.SqlDbType = SqlDbType.Int

            Dim dp11 As New SqlClient.SqlParameter("@w8", w8)
            dp11.Direction = ParameterDirection.Input
            dp11.SqlDbType = SqlDbType.Int

            Dim dp12 As New SqlClient.SqlParameter("@w9", w9)
            dp12.Direction = ParameterDirection.Input
            dp12.SqlDbType = SqlDbType.Int

            Dim dp13 As New SqlClient.SqlParameter("@w10", w10)
            dp13.Direction = ParameterDirection.Input
            dp13.SqlDbType = SqlDbType.Int

            Dim dp14 As New SqlClient.SqlParameter("@w11", w11)
            dp14.Direction = ParameterDirection.Input
            dp14.SqlDbType = SqlDbType.Int

            Dim dp15 As New SqlClient.SqlParameter("@w12", w12)
            dp15.Direction = ParameterDirection.Input
            dp15.SqlDbType = SqlDbType.Int

            Dim cn As SqlConnection = New SqlConnection(Configuration.ConfigurationManager.ConnectionStrings("ApplicationServices").ConnectionString)
            Dim myCmd As SqlClient.SqlCommand = New SqlCommand("SaveForecast", cn)
            myCmd.CommandType = CommandType.StoredProcedure

            myCmd.Parameters.Add(dp2)
            myCmd.Parameters.Add(dp1)
            myCmd.Parameters.Add(dp3a)
            myCmd.Parameters.Add(dp3)

            myCmd.Parameters.Add(dp4)
            myCmd.Parameters.Add(dp5)
            myCmd.Parameters.Add(dp6)
            myCmd.Parameters.Add(dp7)
            myCmd.Parameters.Add(dp8)
            myCmd.Parameters.Add(dp9)
            myCmd.Parameters.Add(dp10)
            myCmd.Parameters.Add(dp11)
            myCmd.Parameters.Add(dp12)
            myCmd.Parameters.Add(dp13)
            myCmd.Parameters.Add(dp14)
            myCmd.Parameters.Add(dp15)

            cn.Open()
            myCmd.ExecuteNonQuery()
            cn.Close()
        Catch ex As Exception
            Debug.WriteLine(ex.Message)
            Throw ex
        End Try
    End Function
    Public Function StringDate(ByVal dtDate As Date) As String
        Dim FUNCTION_NAME As String = "StringDate"

        Dim ReturnDate As String
        ReturnDate = dtDate.Month & "/" & dtDate.Day & "/" & dtDate.Year
        Return dtDate
    End Function
    Public Function GetStartDate() As Date
        Dim FUNCTION_NAME As String = "GetStartDate"

        Dim CurrentMonday As Date
        Dim i As Integer
        ' find the Monday that represents the current week

        Do While CurrentMonday = Nothing
            i = i + 1
            ' 02012005 - changed it back - AGH
            ' 01/31/2005 AGH - Changed line below to compare to a "1" instead of vbMonday... 
            ' because the Weekday() command defines day 1 as vbMonday and vb Defaults vbMonday=2, this was not working 
            If Weekday(Today.AddDays(i), vbMonday) = vbMonday Then
                CurrentMonday = Today.AddDays(i - 8)
            End If
        Loop
        'End If

        Return CurrentMonday
    End Function

    Public Sub New()
        'Page = myPage
    End Sub

    Public Function IsBillableProject(ByVal iProjectID As Integer) As Boolean
        Dim db As New DataAccess
        Dim dt As New DataTable
        Dim bReturn As Boolean

        dt = db.Query("SELECT PROJECT_ID FROM PROJECTS WHERE BILLABLE = 1 AND PROJECT_ID= " & CStr(iProjectID))

        If dt.Rows.Count = 1 Then
            bReturn = True
        Else
            bReturn = False
        End If

        Return bReturn
    End Function



    Public Function ValidateManager(ByVal UserID As Integer) As Boolean
        'returns a containing all the lazy/inconsiderate managers that have not replied to the PTO_REQUEST_ID for the user.
        Dim cn As SqlConnection = New SqlConnection(Configuration.ConfigurationManager.ConnectionStrings("ApplicationServices").ConnectionString)
        Dim myCmd As SqlClient.SqlCommand = New SqlCommand("VALIDATE_MANAGER", cn)
        Dim dp1 As New SqlClient.SqlParameter
        Dim dp2 As New SqlClient.SqlParameter
        Dim da As IDbDataAdapter
        Dim ds As New DataSet
        Dim dt As New DataTable

        myCmd.CommandType = CommandType.StoredProcedure
        dp1.Direction = ParameterDirection.Input
        dp1.ParameterName = "@User_ID"
        dp1.SqlDbType = SqlDbType.Int
        dp1.Value = UserID
        myCmd.Parameters.Add(dp1)
        dp2.Direction = ParameterDirection.Output
        dp2.SqlDbType = SqlDbType.Int
        dp2.ParameterName = "@IsManager"
        myCmd.Parameters.Add(dp2)

        cn.Open()

        da = New SqlDataAdapter(myCmd)
        da.Fill(ds)

        myCmd.Connection = cn
        myCmd.ExecuteNonQuery()

        If cn.State = ConnectionState.Open Then
            cn.Close()
        End If

        If dp2.Value Is DBNull.Value Then
            Return False
        End If

        If dp2.Value = 0 Then
            Return False
        Else
            Return True
        End If

    End Function

    Public Function GetLazyManagers(ByVal UserID As Integer, ByVal PTO_Request_ID As Integer) As String
        'returns a containing all the lazy/inconsiderate managers that have not replied to the PTO_REQUEST_ID for the user.
        Dim cn As SqlConnection = New SqlConnection(Configuration.ConfigurationManager.ConnectionStrings("ApplicationServices").ConnectionString)
        Dim myCmd As SqlClient.SqlCommand = New SqlCommand("GET_LAZY_MANAGERS", cn)
        Dim dp1 As New SqlClient.SqlParameter
        Dim dp2 As New SqlClient.SqlParameter
        Dim da As IDbDataAdapter
        Dim ds As New DataSet
        Dim dt As New DataTable

        myCmd.CommandType = CommandType.StoredProcedure
        dp1.Direction = ParameterDirection.Input
        dp1.ParameterName = "@UserID"
        dp1.Value = UserID
        myCmd.Parameters.Add(dp1)
        dp2.Direction = ParameterDirection.Input
        dp2.ParameterName = "@PTO_REQUEST_ID"
        dp2.Value = PTO_Request_ID
        myCmd.Parameters.Add(dp2)

        cn.Open()

        da = New SqlDataAdapter(myCmd)
        da.Fill(ds)

        If cn.State = ConnectionState.Open Then
            cn.Close()
        End If

        dt = ds.Tables(0)
        Dim dr As DataRow
        Dim strReturn As String

        If dt.Rows.Count > 0 Then
            strReturn = "The following managers have not responded:\n\n"
        End If
        For Each dr In dt.Rows
            strReturn += dr(0).ToString & "\n"
        Next

        Return strReturn
    End Function

End Class
