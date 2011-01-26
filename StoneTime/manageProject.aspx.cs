using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;

public partial class manageProject : BasePage
{
    StoneTimeBusiness.TimeEntryFunctions ui = new StoneTimeBusiness.TimeEntryFunctions();

    protected void Page_Load(object sender, EventArgs e)
    {
        //*Reset Script Messsage in case previously set
        //lblScriptMessage.Text == String.Empty

        if (!IsPostBack)
        {
            StringBuilder script = new StringBuilder();
            script.Append("javascript:var windowSettings = 'center:yes;resizable:no;dialogHeight:400px;dialogWidth:300px;status:no;toolbar:no;menubar:no;scrollbars:no';");
            script.Append("var url = 'manageContact.aspx';var w=window.showModalDialog(url, null, windowSettings);");
            script.Append("var ddl = document.getElementById('" + ddlBillingContact.ClientID + "');");
            //script.Append("var newValidTo = document.getElementById('" + hidNewValidTo.ClientID + "');");
            //script.Append("var newValidFrom = document.getElementById('" + hidNewValidFrom.ClientID + "');");
            //script.Append("var newLoanTypes = document.getElementById('" + hidNewLoanTypes.ClientID + "');");
            //script.Append("var newStates = document.getElementById('" + hidNewStates.ClientID + "');");
            //script.Append("var newLoanNumbers = document.getElementById('" + hidNewLoanNumbers.ClientID + "');");
            //script.Append("var newInvestorNumbers = document.getElementById('" + hidNewInvestorNumbers.ClientID + "');");
            //script.Append("var newAccessLevel = document.getElementById('" + hidNewAccessLevel.ClientID + "');");
            script.Append("if(w != null){");
            script.Append("alert('Saved');");
            //script.Append("newClient.value = w[1].split(',')[0];");
            //script.Append("newValidFrom.value = w[1].split(',')[1];");
            //script.Append("newValidTo.value = w[1].split(',')[2];");
            //script.Append("newAccessLevel.value = w[1].split(',')[3];");
            //script.Append("newLoanTypes.value = w[1].split(',')[4];");
            //script.Append("newStates.value = w[1].split(',')[5];");
            //script.Append("newLoanNumbers.value = w[1].split(',')[6];");
            //script.Append("newInvestorNumbers.value = w[1].split(',')[7];");
            script.Append("}");
            lnkNewBillingContact.OnClientClick=script.ToString();

            PopulateIndustry(); // fill ddlIndustry 
            PopulateTechnology();
            PopulateUserList(); // fill list of users inputUsers -  user listbox
            //   PopulateProjectUserList();
            PopulateClientList(); // fill inputClient - The client DropDownList
            PopulateRateList(); //   Populate the Rate dropdown list
            PopulateTaskDropDownList();
            PopulatePhaseDropDownList();
            //PopulateActiveProjectList();

            if (SelectedProjectID > 0)
            {
                PopulateProjectData();
            }
            //if(Session["PROJECT_ID"] == String.Empty ){
            //}else{
            //    //SelectedProjectID = Session["PROJECT_ID"];
            //    //PopulateProjectData(Session["PROJECT_ID"].ToString());
            //}
            //if( SelectedProjectID == 0){
            //    btnAddResource.Enabled = false;
            //    btnAddPhase.Enabled = false;
            //    btnAddTask.Enabled = false;
            //    lblNote.Visible = true;
            //    lblNote2.Visible = true;
            //    inputProjectCode.Enabled = true;
            //    inputProjectCode.ReadOnly = false;
            //}else{
            //    btnAddResource.Enabled = true;
            //    btnAddPhase.Enabled = true;
            //    btnAddTask.Enabled = true;
            //    lblNote.Visible = false;
            //    lblNote2.Visible = false;
            //    inputProjectCode.Enabled = false;
            //    inputProjectCode.ReadOnly = true;
            //}
        }
    }
    private void PopulateIndustry()
    {
        DataTable dt = ui.GetTerms("Industry");
        ddlIndustry.DataTextField = "DisplayLabel";
        ddlIndustry.DataValueField = "ID";
        ddlIndustry.DataSource = dt;
        ddlIndustry.DataBind();
    }
    private void PopulateTechnology()
    {
        DataTable dt = ui.GetTerms("Technology");
        inputTechnology.DataTextField = "DisplayLabel";
        inputTechnology.DataValueField = "ID";
        inputTechnology.DataSource = dt;
        inputTechnology.DataBind();
    }
    private void PopulateUserList()
    {

        DataTable dt = ui.GetUserList(LoggedInUserID.ToString());

        DataRow dr = dt.NewRow();
        dr["USER_ID"] = 0;
        dr["USERNAME"] = string.Empty;
        dt.Rows.InsertAt(dr, 0);


        //   populate the user list in the Account Manager dropdown list.
        inputAccountManager.DataValueField = "USER_ID";
        inputAccountManager.DataTextField = "USERNAME";
        inputAccountManager.DataSource = dt;
        inputAccountManager.DataBind();

        //   populate the user list in the Project Manager dropdown list.
        inputProjectManager.DataValueField = "USER_ID";
        inputProjectManager.DataTextField = "USERNAME";
        inputProjectManager.DataSource = dt;
        inputProjectManager.DataBind();

        //   populate the user list in the Name (resource) dropdown list.
        inputProjectUser.DataValueField = "USER_ID";
        inputProjectUser.DataTextField = "USERNAME";
        inputProjectUser.DataSource = dt;
        inputProjectUser.DataBind();
    }
    private void PopulateClientList()
    {

        DataTable dt = ui.GetClientList();
        inputClient.DataTextField = "COMPANY_NAME";
        inputClient.DataValueField = "CLIENT_ID";
        inputClient.DataSource = dt;
        inputClient.DataBind();
        //inputClient.SelectedValue = dt.Rows[0]["CLIENT_ID"].ToString();
    }
    private void PopulateRateList()
    {

        DataTable dt = ui.GetRates();
        inputRate.DataTextField = "RATE";
        inputRate.DataValueField = "RATE_ID";
        inputRate.DataSource = dt;
        inputRate.DataBind();
    }
    private void PopulateTaskDropDownList()
    {

        DataTable dt = ui.GetTaskListAvailable(SelectedProjectID);
        // populate the task dropdown list.
        inputTasks2.DataTextField = "NAME";
        inputTasks2.DataValueField = "TASK_ID";
        inputTasks2.DataSource = dt;
        inputTasks2.DataBind();
    }
    private void PopulatePhaseDropDownList()
    {

        DataTable dt = ui.GetPhaseListAvailable(SelectedProjectID);
        // populate the phase dropdown list.
        inputPhases2.DataTextField = "NAME";
        inputPhases2.DataValueField = "PHASE_ID";
        inputPhases2.DataSource = dt;
        inputPhases2.DataBind();
    }

    //private void sbSetMileStoneFlags(ByVal MileStone_Status_Flag As Integer)
    //    if( (MileStone_Status_Flag And MileStone_Flags.StatementOfWork) > 0 ){
    //        chkSOW.Checked = true;
    //    }else{
    //        chkSOW.Checked = false;
    //    }

    //    if( (MileStone_Status_Flag And MileStone_Flags.MasterServiceAgreement) > 0 ){
    //        chkMSA.Checked = true;
    //    }else{
    //        chkMSA.Checked = false;
    //    }

    //    if( (MileStone_Status_Flag And MileStone_Flags.ResourceAgreement) > 0 ){
    //        chkRA.Checked = true;
    //    }else{
    //        chkRA.Checked = false;
    //    }

    //    if( (MileStone_Status_Flag And MileStone_Flags.ResourceLoading) > 0 ){
    //        chkRL.Checked = true;
    //    }else{
    //        chkRL.Checked = false;
    //    }

    //}
    //private int 
    //    ()
    //{
    //    int intReturn = 0;

    //    //if( chkSOW.Checked ){
    //    //    intReturn = intReturn Or MileStone_Flags.StatementOfWork
    //    //}

    //    //if( chkMSA.Checked ){
    //    //    intReturn = intReturn Or MileStone_Flags.MasterServiceAgreement
    //    //}

    //    //if( chkRA.Checked ){
    //    //    intReturn = intReturn Or MileStone_Flags.ResourceAgreement
    //    //}

    //    //if( chkRL.Checked ){
    //    //    intReturn = intReturn Or MileStone_Flags.ResourceLoading
    //    //}

    //    return intReturn;
    //}
    protected void ddlBillingContact_SelectedIndexChanged(object sender, EventArgs e)
    {

        DataTable dtContactData = new DataTable();
        dtContactData = ui.GetContact(Convert.ToInt16(ddlBillingContact.SelectedValue));
        if (dtContactData.Rows.Count > 0)
        {
            inputPhone.Text = dtContactData.Rows[0]["PHONE"].ToString();
            inputEmail.Text = dtContactData.Rows[0]["EMAIL"].ToString();
            inputAddress.Text = dtContactData.Rows[0]["ADDRESS1"].ToString();
            inputAddress2.Text = dtContactData.Rows[0]["city"].ToString() + ", " + dtContactData.Rows[0]["STATE_NAME"].ToString() + " " + dtContactData.Rows[0]["ZIP"].ToString();
        }
    }
    protected void inputClient_SelectedIndexChanged(object sender, EventArgs e)
    {
        PopulateContacts();

        DataTable dtClientContacts = new DataTable();
        ddlBillingContact.Items.Clear();
        ddlSponsorContact.Items.Clear();
        dtClientContacts = ui.GetClientContacts(Convert.ToInt16(inputClient.SelectedValue));
        if (dtClientContacts.Rows.Count > 0)
        {
            ddlBillingContact.DataTextField = "FULL_NAME";
            ddlBillingContact.DataValueField = "CONTACT_ID";
            ddlBillingContact.DataSource = dtClientContacts;
            ddlBillingContact.DataBind();
            ddlBillingContact.SelectedValue = dtClientContacts.Rows[0]["CONTACT_ID"].ToString();

            ddlSponsorContact.DataTextField = "FULL_NAME";
            ddlSponsorContact.DataValueField = "CONTACT_ID";
            ddlSponsorContact.DataSource = dtClientContacts;
            ddlSponsorContact.DataBind();
            ddlSponsorContact.SelectedValue = dtClientContacts.Rows[0]["CONTACT_ID"].ToString();
        }
        //now populate company website
        DataTable dtClients = new DataTable();
        dtClients = ui.GetClientData(inputClient.SelectedValue);
        inputWebsite.Text = dtClients.Rows[0]["COMPANY_WEBSITE"].ToString();
    }
    //private void NotifyChangeMonitor(ByVal Message As String, ByVal Source As NotificationType)

    //    Dim oMessage As New XTGSendMail
    //    Dim oAuth As New AuthHeader
    //    Dim sFrom As String == String.Empty
    //    Dim sSendTo As String == String.Empty
    //    Dim sSubject As String == String.Empty
    //    Dim sBody As String == String.Empty
    //    Dim bisNew As Boolean = false
    //    Dim sProject As String = inputProjectCode.Text
    //    Dim bLeave As Boolean = false

    //    FUNCTION_NAME = "NotifyChangeMonitor"
    //    Try
    //        //Determine if the message should be send by verifying the webconfig value to the passed in source
    //        Select Case true
    //            Case (CType(AppSettings.GetValues("ProjectChangeNotify_ProjectEnabled")(0), Boolean) = false) And (Source = NotificationType.Project)
    //                bLeave = true
    //            Case (CType(AppSettings.GetValues("ProjectChangeNotify_ProjectEnabled")(0), Boolean) = false) And (Source = NotificationType.Resource)
    //                bLeave = true
    //            Case (CType(AppSettings.GetValues("ProjectChangeNotify_ProjectEnabled")(0), Boolean) = false) And (Source = NotificationType.Phase)
    //                bLeave = true
    //            Case (CType(AppSettings.GetValues("ProjectChangeNotify_ProjectEnabled")(0), Boolean) = false) And (Source = NotificationType.Task)
    //                bLeave = true
    //        End Select

    //        if( bLeave = false ){
    //            //Set the SOAP authorization header to the stored values in the web config file
    //            oAuth.PartnerID = AppSettings.GetValues("ProjectChangeNotify_ID")(0)
    //            oAuth.Password = AppSettings.GetValues("ProjectChangeNotify_PASSWORD")(0)

    //            //Eshtablish the sender name from the web config file
    //            sFrom = AppSettings.GetValues("ProjectChangeNotify_From")(0)
    //            //Retrieve the list of recipients semi-colon if multiple copies are to be sent
    //            sSendTo = AppSettings.GetValues("ProjectChangeNotify_SendTo")(0)

    //            //Build the subject string
    //            sSubject = "Project Charter Change (" & inputProjectCode.Text & ")"

    //            //Start building the body string
    //            if( inputProjectList.SelectedItem Is Nothing ){
    //                bisNew = true
    //            }

    //            sBody = "User " & Session["User") & " has " & IIf(bisNew, "added", "modified") & " the project " & inputProjectCode.Text
    //            if( Message.Length() > 0 ){
    //                sBody += "<P>" & Message & "</P>"
    //            }

    //            //Assign the SOAP header to the message object
    //            oMessage.Credentials = oAuth
    //            oMessage.Send(sFrom, sSendTo, sSubject, sBody)
    //        } //bLeave = false
    //    catch (Exception ex){
    //        Debug.Write(FUNCTION_NAME & " Error: " & ex.Message)
    //    }
    //}
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        //   clearing/resetting fields and session variables

        //        Session["CHARTER_ID"] == String.Empty;
        //        Session["PROJECT_ID"] == String.Empty;
        //PopulateProjectData();
        ////inputProjectList.SelectedIndex = -1;
        //inputClient.SelectedIndex = 0;
        //inputBusinessLine.SelectedIndex = 0;
        //inputStatus.SelectedIndex = 0;
        //inputProjectType.SelectedIndex = 0;
        //inputBillingTerms.SelectedIndex = 0;
        //inputPaymentTerms.SelectedIndex = 0;
        //inputAuthorization.SelectedIndex = 0;
        //inputRateNotes.Text = String.Empty;
        //inputPhases.Text = String.Empty;
        //inputTasks.Text = String.Empty;
        //inputTasks2.SelectedIndex = 0;
        //inputPhases2.SelectedIndex = 0;
        //inputAccountManager.SelectedIndex = 0;
        //inputProjectManager.SelectedIndex = 0;
        //dgUsers.Visible = false;
        //dgTasks.Visible = false;
        //dgPhases.Visible = false;
        //btnSave.Enabled = true;
        //btnAddResource.Enabled = false;
        //btnAddPhase.Enabled = false;
        //btnAddTask.Enabled = false;
        //lblNote.Visible = true;
        //lblNote2.Visible = true;
        //checkboxGlobal.Checked = false;
        //inputProjectCode.Enabled = true;
        //inputProjectCode.ReadOnly = false;

    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        // save project charter records to database

        if (!Page.IsValid)
            return;

        if (!ui.ValidateManager(Convert.ToInt16(inputProjectManager.SelectedValue)))
        {
            lblScriptMessage.Text = "<SCRIPT>alert('User " + inputProjectManager.SelectedItem.Text + " is not currently a valid project manager. Please pick another project manager . Charter was not saved.');</SCRIPT>";
            return;
        }

        Save();
        //if( dgPhases.Items.Count == 0 Or dgTasks.Items.Count = 0 Or dgPhases.Visible = false Or dgTasks.Visible = false ){
        //        lblScriptMessage.Text = "<SCRIPT>alert(//Charter Saved. You must add at least one task and at least one phase to the project before a resource can associate hours with the project.//);</SCRIPT>"
        //    }else{
        //        lblScriptMessage.Text = "<SCRIPT>alert(//Charter Saved.//);</SCRIPT>"
        //    }
        //    NotifyChangeMonitor("Area of interest: Base project infomation", NotificationType.Project)

    }
    private int GetMileStoneFlags()
    {
        return 0;
    }
    private void Save()
    {
        int CHARTER_ID=SelectedCharterID;
        int CLIENT_ID = Convert.ToInt16( inputClient.SelectedValue);
        string PROJECT_CODE = inputProjectCode.Text.Trim();
        int BUSINESS_LINE_ID = Convert.ToInt16(inputBusinessLine.SelectedValue);
        int CHARTER_STATUS_ID= Convert.ToInt16(inputStatus.SelectedValue);
        string SUB_PROJECT=inputSubproject.Text.Trim();
        int BILLING_CONTACT_ID = 0;
        if(ddlBillingContact.SelectedValue != string.Empty)
            BILLING_CONTACT_ID=Convert.ToInt16(ddlBillingContact.SelectedValue);
        int SPONSOR_CONTACT_ID = 0;
        if(ddlSponsorContact.SelectedValue != string.Empty)
            SPONSOR_CONTACT_ID=Convert.ToInt16(ddlSponsorContact.SelectedValue);
        string TELEPHONE= inputPhone.Text.Trim();
        string COMPANY_WEBSITE=inputWebsite.Text.Trim();
        int Industry= Convert.ToInt16(ddlIndustry.SelectedValue);
        string PO=inputPO.Text.Trim();
        int PROJECT_MANAGER_ID= Convert.ToInt16(inputProjectManager.SelectedValue);
        DateTime ESTIMATED_START_DATE = Convert.ToDateTime(inputStartDate.Text);
        DateTime ESTIMATED_COMPLETION_DATE=Convert.ToDateTime(inputCompletionDate.Text);
        string ESTIMATED_DURATION=inputDuration.Text.Trim();
        long ESTIMATED_BUDGET= Convert.ToInt32(inputBudget.Text);
        int TECHNOLOGY_ID= Convert.ToInt16(inputTechnology.SelectedValue);
        int ACCOUNT_MANAGER_ID= Convert.ToInt16(inputAccountManager.SelectedValue);
        int PROJECT_TYPE_ID= Convert.ToInt16(inputProjectType.SelectedValue);
        int BILLING_TERMS_ID= Convert.ToInt16(inputBillingTerms.SelectedValue);
        int PAYMENT_TERMS_ID= Convert.ToInt16(inputPaymentTerms.SelectedValue);
        string DESC = inputProjectDescription.Text.Trim();
        string TOTAL_ESTIMATED_HOURS = inputEstimatedHrs.Text.Trim();
        int AUTHORIZATION_ID= Convert.ToInt16(inputAuthorization.SelectedValue);
        string BILLING_NOTES = inputBillingNotes.Text.Trim();
        string PROJECT_NOTES = inputProjectNotes.Text.Trim();
        int IsGlobal = Convert.ToInt16( checkboxGlobal.Checked);
        int IsBillable = Convert.ToInt16(CheckboxBillable.Checked);
        int MileStoneFlags = GetMileStoneFlags();
        int UserId = LoggedInUserID;
        string TOTAL_ESTIMATED_COST = inputEstimatedHrs.Text.Trim();

        ui.SaveProject(CHARTER_ID,
         CLIENT_ID,
         PROJECT_CODE,
         BUSINESS_LINE_ID,
         CHARTER_STATUS_ID,
         SUB_PROJECT,
         BILLING_CONTACT_ID,
         SPONSOR_CONTACT_ID,
         TELEPHONE,
         COMPANY_WEBSITE,
         Industry,
         PO,
         PROJECT_MANAGER_ID,
         ESTIMATED_START_DATE,
         ESTIMATED_COMPLETION_DATE,
         ESTIMATED_DURATION,
         ESTIMATED_BUDGET,
         TECHNOLOGY_ID,
         ACCOUNT_MANAGER_ID,
         PROJECT_TYPE_ID,
         BILLING_TERMS_ID,
         PAYMENT_TERMS_ID,
         DESC,
         TOTAL_ESTIMATED_HOURS,
         AUTHORIZATION_ID,
         BILLING_NOTES,
         PROJECT_NOTES,
         IsGlobal,
         IsBillable,
         MileStoneFlags,
         UserId,
         TOTAL_ESTIMATED_COST,
         LoggedInUserID);
    }
    protected void btnAddPhase_Click(object sender, EventArgs e)
    {
        if (inputPhases2.SelectedIndex == 0)
        {
            return;
        }


        ui.AddListPhase(SelectedProjectID, Convert.ToInt16(inputPhases2.SelectedValue));
        PopulateProjectPhases();


        //   clearing the phase textbox and drop list
        inputPhases2.SelectedIndex = 0;
        PopulatePhaseDropDownList();
        //NotifyChangeMonitor("Area of interest: Phases", NotificationType.Phase)

    }
    protected void btnAddTask_Click(object sender, EventArgs e)
    {

        if (inputTasks2.SelectedIndex != 0)
        {
            ui.AddListTask(SelectedProjectID, Convert.ToInt16(inputTasks2.SelectedValue));
            PopulateProjectTasks();
        }

        inputTasks2.SelectedIndex = 0;
        PopulateTaskDropDownList();
        //NotifyChangeMonitor("Area of interest: Tasks", NotificationType.Task)
    }
    protected void btnAddResource_Click(object sender, EventArgs e)
    {
        //   add a resource to a project. A project charter must be created prior to adding
        //   resources, tasks and phases to a project.
        AddResource();
        PopulateProjectUsers();
        //NotifyChangeMonitor("Area of interest: Resources", NotificationType.Resource);
    }
    private void AddResource()
    {

        //DataTable dt = new DataTable();
        int userid = Convert.ToInt16(inputProjectUser.SelectedValue);
        int rateid = Convert.ToInt16(inputRate.SelectedValue);
        int taskid = Convert.ToInt16(inputTasks3.SelectedValue);

        string ratenotes = inputRateNotes.Text.Trim();
        ui.AddResource(SelectedProjectID, userid, rateid, ratenotes,taskid);
    }
    private void PopulateContacts()
    {
        //clear out fields from possible previous contacts
        inputPhone.Text = "";
        inputEmail.Text = "";
        inputAddress.Text = "";
        inputAddress2.Text = "";


        DataTable dt = new DataTable();
        dt = ui.GetClientContacts(Convert.ToInt16(inputClient.SelectedValue));

        // populate the contact dropdowns

        ddlBillingContact.Items.Clear();
        ddlBillingContact.DataTextField = "FULL_NAME";
        ddlBillingContact.DataValueField = "CONTACT_ID";
        ddlBillingContact.DataSource = dt;
        ddlBillingContact.DataBind();

        ddlSponsorContact.Items.Clear();
        ddlSponsorContact.DataTextField = "FULL_NAME";
        ddlSponsorContact.DataValueField = "CONTACT_ID";
        ddlSponsorContact.DataSource = dt;
        ddlSponsorContact.DataBind();
        //bugbug make sure to make it work if only 1 contact is defined
        //call the get address info proc here
        //If dt.Rows.Count = 1 Then
        if (dt.Rows.Count > 0)
        {
            DataTable dtContactData = new DataTable();
            dtContactData = ui.GetContact(Convert.ToInt16(ddlBillingContact.SelectedValue));
            if (dtContactData.Rows.Count > 0)
            {
                inputPhone.Text = dtContactData.Rows[0]["PHONE"].ToString();
                inputEmail.Text = dtContactData.Rows[0]["EMAIL"].ToString();
                inputAddress.Text = dtContactData.Rows[0]["ADDRESS1"].ToString();
                inputAddress2.Text = dtContactData.Rows[0]["city"].ToString() + ", " + dtContactData.Rows[0]["STATE_NAME"].ToString() + " " + dtContactData.Rows[0]["postalcode"].ToString();
            }
        }

    }
    private void PopulateProjectData()
    {
        //   Populate all Project Charter data based on the selected project code (strProjectID)

        try
        {

            //inputProjectCode.Text = string.empty;
            inputSubproject.Text = String.Empty;
            //inputContactName.Text == String.Empty
            inputPhone.Text = String.Empty;
            inputEmail.Text = String.Empty;
            inputAddress.Text = String.Empty;
            inputAddress2.Text = String.Empty;
            inputWebsite.Text = String.Empty;
            //inputIndustry.Text == String.Empty
            inputPO.Text = String.Empty;
            inputStartDate.Text = String.Empty;
            inputCompletionDate.Text = String.Empty;
            inputDuration.Text = String.Empty;
            inputBudget.Text = String.Empty;
            inputTechnology.Text = String.Empty;
            inputBudget.Text = String.Empty;
            inputProjectDescription.Text = String.Empty;
            inputEstimatedHrs.Text = String.Empty;
            inputRateNotes.Text = String.Empty;
            inputBillingNotes.Text = String.Empty;
            inputProjectNotes.Text = String.Empty;

            if (!SelectedProjectID.Equals(0))
            {
                int ItemIndex = 0;
                string ItemName = string.Empty;
                //get the contacts for the client that this project belongs to 

                DataTable dt = ui.GetProject(SelectedProjectID);


                if (dt.Rows.Count > 0)
                {
                    DataRow dr = dt.Rows[0];

                    //sbSetMileStoneFlags(CType(dr["MILESTONE_STATUS_FLAG"].ToString();, Integer))

                    Session["CHARTER_ID"] = dr["CHARTER_ID"];
                    SelectedCharterID = Convert.ToInt16(dr["CHARTER_ID"].ToString());

                    if (dr["CLIENT_ID"] is DBNull)
                    {
                    }
                    else
                    {
                        inputClient.DataValueField = "CLIENT_ID";
                        inputClient.SelectedValue = dr["CLIENT_ID"].ToString();
                        //jwh
                        PopulateContacts();
                    }
                    if (dr["PROJECT_ID"] is DBNull)
                    {
                    }
                    else
                    {
                        ItemIndex = Convert.ToInt16(dr["PROJECT_ID"].ToString());
                        ItemName = ui.GetProjectName(ItemIndex, LoggedInUserID.ToString());
                        inputProjectCode.Text = ItemName;
                    }
                    if (dr["BUSINESS_LINE_ID"] is DBNull)
                    {
                    }
                    else
                    {
                        inputBusinessLine.DataValueField = "BUSINESS_LINE_ID";
                        inputBusinessLine.SelectedValue = dr["BUSINESS_LINE_ID"].ToString();
                    }
                    if (dr["CHARTER_STATUS_ID"] is DBNull)
                    {
                    }
                    else
                    {
                        inputStatus.DataValueField = "CHARTER_STATUS_ID";
                        inputStatus.SelectedValue = dr["CHARTER_STATUS_ID"].ToString();
                    }
                    if (dr["SUB_PROJECT"] is DBNull)
                    {
                    }
                    else
                    {
                        inputSubproject.Text = dr["SUB_PROJECT"].ToString();
                    }

                    //if( (dr["BILLING_CONTACT_NAME")) is DBNull ){
                    //}else{
                    //    inputContactName.Text = dr["BILLING_CONTACT_NAME"].ToString();
                    //}
                    if ((dr["BILLING_CONTACT_ID"]) is DBNull)
                    {
                    }
                    else
                    {
                        //this should never happen but we need to check post data migration 
                        //if the contact drop down does not have any items then skip it
                        if (ddlBillingContact.Items.Count > 0)
                        {
                            if (dr["BILLING_CONTACT_ID"].ToString() == "1")
                            {
                                Response.Write("Contract table contains bad data. The BILLING_CONTRACT_ID is invalid.");
                            }
                            else
                            {
                                ddlBillingContact.SelectedValue = dr["BILLING_CONTACT_ID"].ToString();
                            }

                        }
                    }
                    if ((dr["SPONSOR_CONTACT_ID"]) is DBNull)
                    {
                    }
                    else
                    {
                        //this should never happen but we need to check post data migration 
                        //if the contact drop down does not have any items then skip it
                        if (ddlSponsorContact.Items.Count > 0)
                        {
                            ddlSponsorContact.SelectedValue = dr["SPONSOR_CONTACT_ID"].ToString();
                        }
                    }


                    if ((dr["TELEPHONE_ID"]) is DBNull)
                    {
                    }
                    else
                    {
                        inputPhone.Text = dr["TELEPHONE_ID"].ToString();
                    }
                    if ((dr["PO#"]) is DBNull)
                    {
                    }
                    else
                    {
                        inputPO.Text = dr["PO#"].ToString();
                    }
                    if ((dr["EXPECTED_START_DATE"]) is DBNull)
                    {
                    }
                    else
                    {
                        inputStartDate.Text = Convert.ToDateTime(dr["EXPECTED_START_DATE"].ToString()).ToShortDateString();
                    }
                    if ((dr["ESTIMATED_COMPLETION_DATE"]) is DBNull)
                    {
                    }
                    else
                    {
                        inputCompletionDate.Text = Convert.ToDateTime(dr["ESTIMATED_COMPLETION_DATE"].ToString()).ToShortDateString();
                    }
                    //SHOW BILLING CONTACT EMAIL ADDRESS
                    if ((dr["EMAIL"]) is DBNull)
                    {
                    }
                    else
                    {
                        inputEmail.Text = dr["EMAIL"].ToString();
                    }
                    //SHOW BILLING CONTACT ADDRESS INFO
                    if (dr["ADDRESS1"] is DBNull)
                    {
                    }
                    else
                    {
                        inputAddress.Text = dr["ADDRESS1"].ToString();
                    }
                    if (dr["CITYSTATEZIP"] is DBNull)
                    {
                    }
                    else
                    {
                        inputAddress2.Text = dr["CITYSTATEZIP"].ToString();
                    }

                    if (dr["COMPANY_WEBSITE"] is DBNull)
                    {
                    }
                    else
                    {
                        inputWebsite.Text = dr["COMPANY_WEBSITE"].ToString();
                    }
                    //if( (dr["INDUSTRY"]) is DBNull ){
                    //}else{
                    //    inputIndustry.Text = dr["INDUSTRY"].ToString();
                    //}
                    if ((dr["INDUSTRY_ID"]) is DBNull)
                    {
                    }
                    else
                    {
                        ddlIndustry.SelectedValue = dr["INDUSTRY_ID"].ToString();
                    }

                    if ((dr["ACCOUNT_MANAGER_ID"]) is DBNull)
                    {
                    }
                    else
                    {
                        inputAccountManager.DataValueField = "ACCOUNT_MANAGER_ID";
                        inputAccountManager.SelectedValue = dr["ACCOUNT_MANAGER_ID"].ToString();
                    }
                    if ((dr["PROJECT_MANAGER_ID"]) is DBNull)
                    {
                    }
                    else
                    {
                        inputProjectManager.DataValueField = "PROJECT_MANAGER_ID";
                        inputProjectManager.SelectedValue = dr["PROJECT_MANAGER_ID"].ToString();
                    }
                    //if ((dr["EXPECTED_START_DATE"]) is DBNull)
                    //{
                    //}
                    //else
                    //{
                    //    inputStartDate.Text = dr["EXPECTED_START_DATE"].ToString();
                    //}
                    //if ((dr["ESTIMATED_COMPLETION_DATE"]) is DBNull)
                    //{
                    //}
                    //else
                    //{
                    //    inputCompletionDate.Text = dr["ESTIMATED_COMPLETION_DATE"].ToString();
                    //}
                    if ((dr["ESTIMATED_DURATION"]) is DBNull)
                    {
                    }
                    else
                    {
                        inputDuration.Text = dr["ESTIMATED_DURATION"].ToString();
                    }
                    if ((dr["ESTIMATED_BUDGET"]) is DBNull)
                    {
                    }
                    else
                    {
                        inputBudget.Text = dr["ESTIMATED_BUDGET"].ToString();
                    }
                    if ((dr["TECHNOLOGY_ID"]) is DBNull)
                    {
                    }
                    else
                    {
                        inputTechnology.SelectedValue  = dr["TECHNOLOGY_ID"].ToString();
                    }
                    if ((dr["PROJECT_TYPE_ID"]) is DBNull)
                    {
                    }
                    else
                    {
                        inputProjectType.DataValueField = "PROJECT_TYPE_ID";
                        inputProjectType.SelectedValue = dr["PROJECT_TYPE_ID"].ToString();
                    }
                    if ((dr["BILLING_TERMS_ID"]) is DBNull)
                    {
                    }
                    else
                    {
                        inputBillingTerms.DataValueField = "BILLING_TERMS_ID";
                        inputBillingTerms.SelectedValue = dr["BILLING_TERMS_ID"].ToString();
                    }
                    if ((dr["PAYMENT_TERMS_ID"]) is DBNull)
                    {
                    }
                    else
                    {
                        inputPaymentTerms.DataValueField = "PAYMENT_TERMS_ID";
                        inputPaymentTerms.SelectedValue = dr["PAYMENT_TERMS_ID"].ToString();
                    }
                    if ((dr["AUTHORIZATION_ID"]) is DBNull)
                    {
                    }
                    else
                    {
                        inputAuthorization.DataValueField = "AUTHORIZATION_ID";
                        inputAuthorization.SelectedValue = dr["AUTHORIZATION_ID"].ToString();
                    }
                    if ((dr["DESC"]) is DBNull)
                    {
                    }
                    else
                    {
                        inputProjectDescription.Text = dr["DESC"].ToString();
                    }
                    if ((dr["TOTAL_ESTIMATED_HOURS"]) is DBNull)
                    {
                    }
                    else
                    {
                        inputEstimatedHrs.Text = dr["TOTAL_ESTIMATED_HOURS"].ToString();
                    }
                    if ((dr["BILLING_NOTES"]) is DBNull)
                    {
                    }
                    else
                    {
                        inputBillingNotes.Text = dr["BILLING_NOTES"].ToString();
                    }
                    if ((dr["PROJECT_NOTES"]) is DBNull)
                    {
                    }
                    else
                    {
                        inputProjectNotes.Text = dr["PROJECT_NOTES"].ToString();
                    }

                    checkboxGlobal.Checked = getBoolean(dr["GLOBAL"].ToString());
                    CheckboxBillable.Checked = getBoolean(dr["BILLABLE"].ToString());

                }

                PopulateProjectUsers();
                PopulateProjectTasks();
                PopulateProjectPhases();

                inputProjectCode.Enabled = false;
                inputProjectCode.ReadOnly = true;
                btnAddResource.Enabled = true;
                btnAddPhase.Enabled = true;
                btnAddTask.Enabled = true;
                lblNote.Visible = false;
                lblNote2.Visible = false;
                dgUsers.Visible = true;
                dgTasks.Visible = true;
                dgPhases.Visible = true;

            }
        }
        catch (Exception ex)
        {
            //Debug.Write(FUNCTION_NAME & " Error: " & ex.Message);
            //lblScriptMessage.Text = "<SCRIPT>alert(//Error loading Charter!  Following Error Occurred: \n\n" & ex.Message.Replace("//", """") & " Charter Data shown may not be valid.//);</SCRIPT>"
            throw ex;
        }

    }
    private Boolean getBoolean(string value)
    {
        switch (value)
        {
            case "":
                {
                    return false;
                }
            case "0":
                {
                    return false;
                }
            case "1":
                {
                    return true;
                }
        }

        return false;
    }
    private void PopulateProjectTasks()
    {
        //   display tasks that have been added to the respective project in the dgTasks datagrid.


        int intuser = 0;
        int intproject = 0;


        intuser = LoggedInUserID;

        try
        {
            intproject = SelectedProjectID;
        }
        catch
        {
            //If the selected value cannot be assigned to an integer, then leave it at zero
        }

        if (intproject < 1) return;

        DataTable dt = new DataTable();

        dt = ui.GetTaskList(intuser.ToString(), intproject);
        if (dt != null)
        {
            dgTasks.DataSource = dt;
            dgTasks.DataBind();

            inputTasks3.DataTextField = "Name";
            inputTasks3.DataValueField = "TASK_ID";
            inputTasks3.DataSource = dt;
            inputTasks3.DataBind();
        }

    }
    private void PopulateProjectPhases()
    {
        //   display phases that have been added to the respective project in the dgPhases datagrid.



        if (SelectedProjectID < 1) return;

        DataTable dt = new DataTable();

        dt = ui.GetPhaseList(SelectedProjectID);
        if (dt != null)
        {
            dgPhases.DataSource = dt;
            dgPhases.DataBind();
        }
    }

    private void PopulateProjectUsers()
    {
        //   display users that have been added to the respective project (along with 
        //   their rate, and rate descriptions), in the dgUser datagrid.
        //   The "Active Rate" should automatically be set to True.  If a user is added
        //   for a second time with a new rate, the new rate (active rate = true) over-
        //   rides the previous rate (active rate = false) 

        DataTable dt = ui.GetProjectUsers(SelectedProjectID);

        dgUsers.DataSource = dt;
        dgUsers.DataBind();

        inputProjectUser.SelectedIndex = 0;
        inputRateNotes.Text = "";
    }
}