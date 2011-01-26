using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class manageUsers : BasePage 
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            PopulateUserList();
        }
    }
    protected void lnkCreateNewUser_Click(object sender, EventArgs e)
    {
        SelectedUserId = 0;
        Response.Redirect("~/manageUser.aspx");
    }
    private void PopulateUserList()
    {
        DataTable dt = new DataTable();
        StoneTimeBusiness.TimeEntryFunctions ui = new StoneTimeBusiness.TimeEntryFunctions();
        dt = ui.GetUserList(LoggedInUserID.ToString());
        gvUsers.DataSource = dt;
        gvUsers.DataBind();
    }
    protected void gvUsers_OnRowCommand(object sender, GridViewCommandEventArgs e)
    {
        int index = Convert.ToInt32(e.CommandArgument);
        GridViewRow gvr = gvUsers.Rows[index];
        HiddenField hid = (HiddenField) gvr.FindControl("hidUserId");
        string id = hid.Value;

        SelectedUserId=Convert.ToInt16(id);

        Response.Redirect("~/manageUser.aspx");
    }
}