using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

/// <summary>
/// Summary description for BasePage
/// </summary>
public class BasePage : System.Web.UI.Page
{
    public enum NotificationType
    {
        Project,
        Resource,
        Phase,
        Task
    }
    public enum MileStone_Flags
    {
        StatementOfWork = 1,
        MasterServiceAgreement = 2,
        ResourceAgreement = 4,
        ResourceLoading = 8
    }
	public BasePage()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public Boolean Opposite(Boolean value)
    {
        if (value == true)
        {
            return false;
        }
        else
        {
            return true;
        }
    }
    public int LoggedInUserID
    {
        get
        {
            return GetUserId(User.Identity.Name);
        }
    }
    public string FormatHours(string hours)
    {
        string value = hours.ToString();

        value = value.Replace(".0000", "");
        value = value.Replace("000", "");
        value = value.Replace("00", "");

        return value;
    }
    public int GetUserId(string username)
    {
        StoneTimeBusiness.TimeEntryFunctions ui = new StoneTimeBusiness.TimeEntryFunctions();
        DataTable dt = ui.GetUserInfo(username);
        DataRow dr = dt.Rows[0];
        int userid = Convert.ToInt16(dr["USER_ID"].ToString());
        return userid;
    }
    public Boolean IsAdmin()
    {
        if (User.IsInRole("ADMIN"))
            return true;
        else
            return false;
    }
    public Boolean IsProjectManager()
    {
        if (User.IsInRole("PM"))
            return true;
        else
            return false;
    }

    public DateTime MasterDate
    {
        get
        {
            DateTime d = Convert.ToDateTime(Session["MasterDate"]);
            return d;
        }
        set
        {
            Session["MasterDate"] = value;
        }
    }
    public int SelectedUserId
    { 
        get
        {
            int  userId = Convert.ToInt16( Session["SelectedUserID"]);
            return userId;
        }
        set
        {
            Session["SelectedUserID"] = value;
        }
    }
    public int SelectedClientID
    {
        get
        {
            if (Session["SelectedClientID"] != null)
            {
                return Convert.ToInt16(Session["SelectedClientID"].ToString());
            }
            else
            {
                return 0;
            }
        }
        set
        {
            Session["SelectedClientID"] = value;
        }
    }
    public int SelectedContactID
    {
        get
        {
            if (Session["SelectedContactID"] != null)
            {
                return Convert.ToInt16(Session["SelectedContactID"].ToString());
            }
            else
            {
                return 0;
            }
        }
        set
        {
            Session["SelectedContactID"] = value;
        }
    }
    public int SelectedCharterID
    {
        get
        {
            if (Session["SelectedCharterID"] != null)
            {
                return Convert.ToInt16(Session["SelectedCharterID"].ToString());
            }
            else
            {
                return 0;
            }
        }
        set
        {
            Session["SelectedCharterID"] = value;
        }
    }
    public int SelectedProjectID
    {
        get
        {
            if (Session["SelectedProjectID"] != null)
            {
                return Convert.ToInt16(Session["SelectedProjectID"].ToString());
            }
            else
            {
                return 0;
            }
        }
        set
        {
            Session["SelectedProjectID"] = value;
        }
    }
}