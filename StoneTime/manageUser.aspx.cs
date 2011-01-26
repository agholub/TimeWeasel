using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Security;

public partial class manageUser : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            PopulateUserData(SelectedUserId.ToString());

            if (IsAdmin())
            {
                btnResetPassword.Visible = true;
                inputPW.Enabled = false;
                inputConfirmPW.Enabled = false;
                txtStartDate.Enabled = true;
                txtTermDate.Enabled = true;
                ddlTitle.Enabled = true;
                ddlEmpStatus.Enabled = true;
                inputEmployeeType.Enabled = true;
                inputPTOGroup.Enabled = true;
                inputRole.Enabled = true;
            }
            else
            {
                btnResetPassword.Visible = false;
                inputPW.Enabled = false;
                inputConfirmPW.Enabled = false;
                txtStartDate.Enabled = false;
                txtTermDate.Enabled = false;
                ddlTitle.Enabled = false;
                ddlEmpStatus.Enabled = false;
                inputEmployeeType.Enabled = false;
                inputPTOGroup.Enabled = false;
                inputRole.Enabled = false;
            }
            if (LoggedInUserID == SelectedUserId)
            {
                inputPW.Enabled = true;
                inputConfirmPW.Enabled = true;
                btnResetPassword.Visible = false;
            }
        }
    }
    private void PopulateRoles()
    {
        StoneTimeBusiness.TimeEntryFunctions ui = new StoneTimeBusiness.TimeEntryFunctions();
        DataTable dt = ui.GetRoles();
        // populate the role dropdown list.
        inputRole.DataTextField = "Name";
        inputRole.DataValueField = "USER_TYPE_ID";
        inputRole.DataSource = dt;
        inputRole.DataBind();
    }
    private void PopulateUserTitleList()
    {
        StoneTimeBusiness.TimeEntryFunctions ui = new StoneTimeBusiness.TimeEntryFunctions();
        DataTable dt = ui.GetTerms("Title");
        // populate the EmployeeType dropdown list.
        ddlTitle.DataTextField = "DisplayLabel";
        ddlTitle.DataValueField = "ID";
        ddlTitle.DataSource = dt;
        ddlTitle.DataBind();
    }
    private void PopulateUserTypeList()
    { 
        StoneTimeBusiness.TimeEntryFunctions ui = new StoneTimeBusiness.TimeEntryFunctions();
        DataTable dt = ui.GetTerms("EmployeeType");
        // populate the EmployeeType dropdown list.
        inputEmployeeType.DataTextField = "DisplayLabel";
        inputEmployeeType.DataValueField = "ID";
        inputEmployeeType.DataSource = dt;
        inputEmployeeType.DataBind();
    }
    private void GetPTOGroupTypes()
    {
        StoneTimeBusiness.TimeEntryFunctions ui = new StoneTimeBusiness.TimeEntryFunctions();
        DataTable dt = ui.GetPTOGroupTypes();
        // populate the EmployeeType dropdown list.
        inputPTOGroup.DataTextField = "PTO_GROUP_NAME";
        inputPTOGroup.DataValueField = "PTO_GROUP_ID";
        inputPTOGroup.DataSource = dt;
        inputPTOGroup.DataBind();
    }
    private void PopulateUserData(string userId)
    {
        
        StoneTimeBusiness.TimeEntryFunctions ui = new StoneTimeBusiness.TimeEntryFunctions();
        DataTable dt = ui.GetUserData(userId);

        MembershipUser user = Membership.GetUser(dt.Rows[0]["UserName"].ToString());
        if (Roles.IsUserInRole(user.UserName, "ADMIN"))
            chkAdmin.Checked = true;
        else
            chkAdmin.Checked = false;

        if (Roles.IsUserInRole(user.UserName, "PM"))
            chkProjectManager.Checked = true;
        else
            chkProjectManager.Checked = false;

        if (user.IsLockedOut)
        {
            chkLocked.Visible = true;
            chkLocked.Checked = true;
        }else{
            chkLocked.Visible = false;
            chkLocked.Checked = false;
        }

        PopulateUserTitleList();
        PopulateEmployeeStatus();
        PopulateUserTypeList();
        GetPTOGroupTypes();
        PopulateRoles();

        //PopulateEmployeeTypeList();

        inputFirstName.Text = "";
        inputMiddleName.Text = "";
        inputLastName.Text = "";
        //inputName.Text = dt.Rows[0]["User_Type_ID][
        inputUserName.Text = "";
        inputPW.Text = "";
        inputConfirmPW.Text = "";

        if (!userId.Equals("0"))
        {
            if(dt.Rows[0]["Email"] != null)
            inputUserEmail.Text = dt.Rows[0]["Email"].ToString();
            //inputFirstName.Text = dt.Rows[0]["First"].ToString()
            inputFirstName.Text = dt.Rows[0]["First"].ToString();
            if (dt.Rows[0]["Middle"] != null)
            {
                inputMiddleName.Text = dt.Rows[0]["Middle"].ToString();
            }

            inputLastName.Text = dt.Rows[0]["Last"].ToString();
            //inputName.Text = dt.Rows[0]["User_Type_ID"].ToString()
            inputUserName.Text = dt.Rows[0]["UserName"].ToString();
            inputPW.Text = dt.Rows[0]["Password"].ToString();
            inputConfirmPW.Text = dt.Rows[0]["Password"].ToString();
            inputRole.DataValueField = "USER_TYPE_ID";
            inputRole.SelectedValue = dt.Rows[0]["USER_TYPE_ID"].ToString();
            inputPTOGroup.DataValueField = "PTO_GROUP_ID";
            inputPTOGroup.SelectedValue = dt.Rows[0]["PTO_GROUP_ID"].ToString();
            ddlEmpStatus.SelectedValue = dt.Rows[0]["STATUS"].ToString();
            if (dt.Rows[0]["TITLE_ID"] != null)
            {
                ddlTitle.SelectedValue = dt.Rows[0]["TITLE_ID"].ToString();
            }
            else
            {
                ddlTitle.SelectedIndex = 0;
            }
            txtTermDate.Text = dt.Rows[0]["TERMINATION_DATE"].ToString();
            txtStartDate.Text = Convert.ToDateTime( dt.Rows[0]["START_DATE"].ToString()).ToShortDateString();

            if (dt.Rows[0]["EMPLOYEE_TYPE_ID"] == null)
            {
            }
            else
            {
                inputEmployeeType.DataValueField = "EMPLOYEE_TYPE_ID";
                inputEmployeeType.SelectedValue = dt.Rows[0]["EMPLOYEE_TYPE_ID"].ToString();
            }
        }
        else
        {
            inputFirstName.Text = "";
            inputMiddleName.Text = "";
            inputLastName.Text = "";
            //inputName.Text = ""
            inputUserName.Text = "";
            inputPW.Text = "";
            inputConfirmPW.Text = "";
           
        }
    }
    private void Save()
    {
        string userid = SelectedUserId.ToString();
        string userName = inputUserName.Text.Trim();
        if (userid.Equals("0"))
        {
            userid = string.Empty;
            MembershipUser user = Membership.CreateUser(inputUserName.Text, inputPW.Text, inputUserEmail.Text);
            RoleManagerModule roleManager = new RoleManagerModule();
            Roles.AddUserToRole(userName, "USER");

            if(chkAdmin.Checked==true)
                Roles.AddUserToRole(userName, "ADMIN");

            if(chkProjectManager.Checked==true)
                Roles.AddUserToRole(userName, "PM");
            inputUserName.Enabled = true;
        }
        else
        {
            MembershipUser user = Membership.GetUser(userName);
            
            if (chkAdmin.Checked == true)
            {
                if (!Roles.IsUserInRole(userName, "ADMIN"))
                    Roles.AddUserToRole(userName, "ADMIN");
            }
            else
            {
                if (Roles.IsUserInRole(userName, "ADMIN"))
                    Roles.RemoveUserFromRole(userName, "ADMIN");
            }

            if (chkProjectManager.Checked == true)
            {
                if (!Roles.IsUserInRole(userName, "PM"))
                    Roles.AddUserToRole(userName, "PM");
            }
            else
            {
                if (Roles.IsUserInRole(userName, "PM"))
                    Roles.RemoveUserFromRole(userName, "PM");
            }

            inputUserName.Enabled = false;
        }

        StoneTimeBusiness.TimeEntryFunctions ui = new StoneTimeBusiness.TimeEntryFunctions();

        ui.SaveUser(userid, inputFirstName.Text, inputLastName.Text, inputMiddleName.Text,
                inputRole.SelectedValue, inputEmployeeType.SelectedValue, ddlEmpStatus.SelectedValue, 
                inputPW.Text, inputUserName.Text,
                txtStartDate.Text, txtTermDate.Text, 
                ddlTitle.SelectedValue,inputPTOGroup.SelectedValue,inputUserEmail.Text  );
    }

    private void PopulateEmployeeStatus()
    {
        ddlEmpStatus.Items.Add(new ListItem("Active", "1"));
        ddlEmpStatus.Items.Add(new ListItem("InActive", "0"));
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        if(Page.IsValid)
        Save();
    }
}