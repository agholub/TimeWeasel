using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class manageClient : BasePage 
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //StoneTimeBusiness.TimeEntryFunctions ui = new StoneTimeBusiness.TimeEntryFunctions();
            //DataTable dt = ui.GetClientData(SelectedClientID.ToString());
            PopulateStates();
            PopulateClient();
            
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {

    }
    private void PopulateClient()
    { 
        StoneTimeBusiness.TimeEntryFunctions ui = new StoneTimeBusiness.TimeEntryFunctions();
        if (SelectedClientID > 0)
        {
            DataTable dt = ui.GetClientData(SelectedClientID.ToString());
            txtCompanyName.Text = dt.Rows[0]["COMPANY_NAME"].ToString();
            txtWebsite.Text = dt.Rows[0]["company_website"].ToString();
            InputClientComment.Text = dt.Rows[0]["comment"].ToString();
            PopulateClientAddress();
        }
    }
    private void PopulateStates()
    {
        StoneTimeBusiness.TimeEntryFunctions ui = new StoneTimeBusiness.TimeEntryFunctions();
        DataTable dt = ui.GetStates();
        ddlClientState.DataTextField = "ABBREVIATION";
        ddlClientState.DataValueField = "STATE_ID";
        ddlClientState.DataSource = dt;
        ddlClientState.DataBind();
    }
    private void PopulateClientAddress()
    {
        StoneTimeBusiness.TimeEntryFunctions ui = new StoneTimeBusiness.TimeEntryFunctions();
        DataTable dt = ui.GetClientAddress(SelectedClientID.ToString());

        // populate the address data
        if( dt.Rows.Count > 0 )
        {
            txtAddress1.Text = dt.Rows[0]["address1"].ToString();
            txtAddress2.Text = dt.Rows[0]["address2"].ToString();
            txtCity.Text = dt.Rows[0]["CITY"].ToString();
            txtZip.Text = dt.Rows[0]["zip"].ToString();
            // set the state drop down list
            ddlClientState.SelectedValue = dt.Rows[0]["state_id"].ToString();
        }
        else
        {
            txtAddress1.Text = "";
            txtAddress2.Text = "";
            txtCity.Text = "";
            txtZip.Text = "";
            // set the state drop down list
            ddlClientState.SelectedValue = "1";
        }
        
    }
}