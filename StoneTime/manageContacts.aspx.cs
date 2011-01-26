using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class manageContacts : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
        { }
        else
        {
            StoneTimeBusiness.TimeEntryFunctions ui = new StoneTimeBusiness.TimeEntryFunctions();
            DataTable dt = ui.GetContactList(0);
            gvContacts.DataSource = dt;
            gvContacts.DataBind();
        }
    }
    protected void btnCreateContact_Click(object sender, EventArgs e)
    {

    }
    protected void gvContacts_OnRowCommand(object sender, GridViewCommandEventArgs e)
    {
        int index = Convert.ToInt32(e.CommandArgument);
        GridViewRow gvr = gvContacts.Rows[index];
        HiddenField hid = (HiddenField)gvr.FindControl("hidContactId");
        string id = hid.Value;

        SelectedContactID = Convert.ToInt16(id);

        Response.Redirect("~/manageContact.aspx");
    }
}