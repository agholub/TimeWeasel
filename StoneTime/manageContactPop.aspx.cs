using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class manageContact : BasePage
{
    StoneTimeBusiness.TimeEntryFunctions ui = new StoneTimeBusiness.TimeEntryFunctions();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
        { 
            
        }
        else
        {
            PopulateClients();
            PopulateStates();
            PopulateContact();
        }
    }

    private void PopulateStates()
    {
        DataTable dt = ui.GetStates();
        ddlStates.DataTextField = "ABBREVIATION";
        ddlStates.DataValueField = "STATE_ID";
        ddlStates.DataSource = dt;
        ddlStates.DataBind();
    }

    private void PopulateClients()
    {
        DataTable dt = ui.GetClientList();
        ddlContactClient.DataTextField = "COMPANY_NAME";
        ddlContactClient.DataValueField = "CLIENT_ID";
        ddlContactClient.DataSource = dt;
        ddlContactClient.DataBind();
    }

    private void PopulateContact()
    {
        if (!SelectedContactID.Equals(0))
        {
            DataTable dt = new DataTable();
            dt = ui.GetContact(SelectedContactID);
            txtFirstName.Text = dt.Rows[0]["FIRST"].ToString();
            txtMiddleName.Text = dt.Rows[0]["MIDDLE"].ToString();
            txtLastName.Text = dt.Rows[0]["LAST"].ToString();
            txtEmail.Text = dt.Rows[0]["EMAIL"].ToString();
            txtPhone.Text = dt.Rows[0]["PHONE"].ToString();
            txtFax.Text = dt.Rows[0]["FAX"].ToString();
            txtAddress1.Text = dt.Rows[0]["ADDRESS1"].ToString();
            txtAddress2.Text = dt.Rows[0]["ADDRESS2"].ToString();
            txtCity.Text = dt.Rows[0]["CITY"].ToString();
            ddlStates.SelectedValue = dt.Rows[0]["state_id"].ToString();
            txtZip.Text = dt.Rows[0]["POSTALCODE"].ToString();
        }
    }
    private void SaveContact()
    {
        DataTable dt = ui.SaveContact(SelectedContactID, Convert.ToInt16(ddlContactClient.SelectedValue), txtFirstName.Text.Trim(), txtMiddleName.Text.Trim(), txtLastName.Text.Trim(), txtEmail.Text.Trim(), txtPhone.Text.Trim(), txtFax.Text.Trim(), txtAddress1.Text.Trim(), txtAddress2.Text.Trim(), txtCity.Text.Trim(), ddlStates.SelectedValue, txtZip.Text.Trim());
        SelectedContactID = Convert.ToInt16( dt.Rows[0]["CONTACT_ID"].ToString());
        string fullName = dt.Rows[0]["FULLNAME"].ToString();

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        SaveContact();
        RegisterStartupScript("submit", "<script>javascript:var x = document.getElementById('btnHidSave').Click;</script>");
    }
}