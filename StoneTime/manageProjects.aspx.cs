using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class manageProjects : BasePage
{
    StoneTimeBusiness.TimeEntryFunctions ui = new StoneTimeBusiness.TimeEntryFunctions();
            
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DataTable dt = ui.GetProjectList(LoggedInUserID);
            gvProjects.DataSource = dt;
            gvProjects.DataBind();
        }
    }
    protected void gvProjects_OnRowCommand(object sender, GridViewCommandEventArgs e)
    {
        int index = Convert.ToInt32(e.CommandArgument);
        GridViewRow gvr = gvProjects.Rows[index];
        HiddenField hid = (HiddenField)gvr.FindControl("hidProjectId");
        string id = hid.Value;

        SelectedProjectID = Convert.ToInt16(id);

        Response.Redirect("~/manageProject.aspx");
    }
    protected void btnCreateProject_Click(object sender, EventArgs e)
    {
        SelectedProjectID = 0;
        Response.Redirect("~/manageProject.aspx");
    }
    protected void btnShowActiveProjects_Click(object sender, EventArgs e)
    {

    }
    protected void ddlActiveInactive_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlActiveInactive.SelectedValue == "Active")
        {
            // active
            DataTable dt = ui.GetActiveProjectList(LoggedInUserID);
            gvProjects.DataSource = dt;
            gvProjects.DataBind();
            //ddlActiveInactive.SelectedValue = "Active";
        }
        else
        { 
            // all
            DataTable dt = ui.GetProjectList(LoggedInUserID);
            gvProjects.DataSource = dt;
            gvProjects.DataBind();
        }
    }
}