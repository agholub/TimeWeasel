using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class manageClients : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            StoneTimeBusiness.TimeEntryFunctions ui = new StoneTimeBusiness.TimeEntryFunctions();
            DataTable dt = ui.GetClientList();
            gvClients.DataSource = dt;
            gvClients.DataBind();
        }
    }
    protected void btnCreateClient_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/manageClient.aspx");
    }
    protected void gvClients_OnRowCommand(object sender, GridViewCommandEventArgs e)
    {
        int index = Convert.ToInt32(e.CommandArgument);
        GridViewRow gvr = gvClients.Rows[index];
        HiddenField hid = (HiddenField)gvr.FindControl("hidClientId");
        string id = hid.Value;

        SelectedClientID = Convert.ToInt16(id);

        Response.Redirect("~/manageClient.aspx");
    }
}