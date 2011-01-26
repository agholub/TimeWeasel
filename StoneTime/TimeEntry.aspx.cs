using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;

public partial class TimeEntry : BasePage
{
    decimal MonTotal = 0; // running total for Monday
    decimal TueTotal = 0; // running total for Tuesday
    decimal WedTotal = 0; // running total for Wednesday
    decimal ThrTotal = 0; // running total for Thursday
    decimal FriTotal = 0; // running total for Friday
    decimal SatTotal = 0; // running total for Saturday
    decimal SunTotal = 0; // running total for Sunday
    decimal WeekTotal = 0; // running total for week
    decimal ForecastHoursTotal = 0; // forecast hours running total
    decimal ForecastActualHoursTotal = 0; // forecast Actual hours running total
    string DescriptionTotal = string.Empty;// description concat (added 10/27)

    
    //private int SelectedUserId
    //{
    //    get
    //    {
    //        return GetUserId(ddlUserList.SelectedItem.Text);
    //    }
    //}
    
    private DateTime GetStartDate()
    {
        DateTime d = DateTime.Today;
        DateTime r = DateTime.Today;
        for (int i = 0; !r.DayOfWeek.Equals(DayOfWeek.Monday); i++)
        {
            r = d.AddDays(i);
        }

        r = r.AddDays(-7);
        if (DateTime.Now.DayOfYear > r.DayOfYear)
        {
            return r;
        }
        if (DateTime.Now.DayOfYear.Equals(r.DayOfYear))
        {
            if (DateTime.Now.TimeOfDay.Hours < 12)
            {
                return r;
            }
            else
            {
                return r.AddDays(7);
            }
        }
        return r;
    }
    private void PopulateUserList()
    {
        DataTable dt = new DataTable();
        StoneTimeBusiness.TimeEntryFunctions ui = new StoneTimeBusiness.TimeEntryFunctions();
        dt = ui.GetUserList(LoggedInUserID.ToString());

        //    // populate the user list.
        ddlUserList.DataValueField = "USER_ID";
        ddlUserList.DataTextField = "USERNAME";
        ddlUserList.DataSource = dt;
        ddlUserList.DataBind();
        //    Dim SELECTEDUSERID As Integer = Session("SELECTEDUSERID")
        //    ddlUserList.SelectedValue = SELECTEDUSERID
    }
    private DataTable GetTimeTableSchema()
    {
        DataTable dt = new DataTable();

        // Put the data retrieved from database into our own 
        // "formatted" table so we can bind it directly to our datagrid
        // TimeRecord Entry DataTable definition
        //Dim FUNCTION_NAME As String = "GetTimeTableSchema"

        int x = 27;
        DataColumn[] dc = new DataColumn[x];
        //DataRow dr;

        dc[0] = new DataColumn();
        dc[0].ColumnName = "Project";
        dc[1] = new DataColumn();
        dc[1].ColumnName = "Date";
        dc[2] = new DataColumn();
        dc[2].ColumnName = "Billable";
        dc[3] = new DataColumn();
        dc[3].ColumnName = "Monday";
        dc[4] = new DataColumn();
        dc[4].ColumnName = "Tuesday";
        dc[5] = new DataColumn();
        dc[5].ColumnName = "Wednesday";
        dc[6] = new DataColumn();
        dc[6].ColumnName = "Thursday";
        dc[7] = new DataColumn();
        dc[7].ColumnName = "Friday";
        dc[8] = new DataColumn();
        dc[8].ColumnName = "Saturday";
        dc[9] = new DataColumn();
        dc[9].ColumnName = "Sunday";
        dc[10] = new DataColumn();
        dc[10].ColumnName = "Total";
        dc[11] = new DataColumn();
        dc[11].ColumnName = "Milestone";
        dc[12] = new DataColumn();
        dc[12].ColumnName = "Task";
        dc[13] = new DataColumn();
        dc[13].ColumnName = "Description";
        dc[14] = new DataColumn();
        dc[14].ColumnName = "ID";
        dc[15] = new DataColumn();
        dc[15].ColumnName = "Duration";
        dc[16] = new DataColumn();
        dc[16].ColumnName = "Person";
        dc[17] = new DataColumn();
        dc[17].ColumnName = "ProjectName";
        dc[18] = new DataColumn();
        dc[18].ColumnName = "TaskName";
        dc[19] = new DataColumn();
        dc[19].ColumnName = "PhaseName";
        dc[20] = new DataColumn();
        dc[20].ColumnName = "MonDescription";
        dc[21] = new DataColumn();
        dc[21].ColumnName = "TuesDescription";
        dc[22] = new DataColumn();
        dc[22].ColumnName = "WedDescription";
        dc[23] = new DataColumn();
        dc[23].ColumnName = "ThursDescription";
        dc[24] = new DataColumn();
        dc[24].ColumnName = "FriDescription";
        dc[25] = new DataColumn();
        dc[25].ColumnName = "SatDescription";
        dc[26] = new DataColumn();
        dc[26].ColumnName = "SunDescription";

        // add columns to datatable


        for (int i = 0; i < x; i++)
        {
            dt.Columns.Add(dc[i]);
        }

        dt.AcceptChanges();
        return dt;
    }
    private DataTable GetTimeEntryData()
    {
        DataTable dt = new DataTable();
        StoneTimeBusiness.TimeEntryFunctions ui = new StoneTimeBusiness.TimeEntryFunctions();
        dt = ui.GetTimeEntryData(MasterDate, base.SelectedUserId);
        return dt;
    }
    private void PopulateDataGrid()
    {
        // get the data from database
        DataTable dtData = new DataTable();

        dtData = GetTimeEntryData();

        DataTable dt = GetTimeTableSchema();

        Boolean bNew = false;

        StoneTimeBusiness.TimeEntryFunctions ui = new StoneTimeBusiness.TimeEntryFunctions();
        string strUser = SelectedUserId.ToString();
        int ItemIndex = 0; // to hold the project or task or phase id
        string ItemName = string.Empty; // item//s name
        foreach (DataRow drData in dtData.Rows)
        {
            DataRow dr;
            // Determine if there is a row already for the Key: Project+Phase+Task+Billable
            DataRow[] drA;
            string strKey = drData["PROJECT_ID"] + "," + drData["PHASE_ID"] + "," + drData["TASK_ID"] + "," + drData["BILLABLE"];
            // ok... the next select statement is not working... we are getting duplicate records coming thru
            Boolean billable = false;
            if (drData["BILLABLE"] == DBNull.Value)
            {
                billable = false;
            }
            else
            {
                billable = Convert.ToBoolean(drData["BILLABLE"]);
            }
            drA = dt.Select("PROJECT = " + drData["PROJECT_ID"] + " AND MILESTONE = " + drData["PHASE_ID"] + " AND TASK = " + drData["TASK_ID"] + " AND BILLABLE = " + billable.ToString());
            // I am adding code to loop through and check each one...

            dr = dt.NewRow();

            //Boolean exists = false;

            //DataRow[] drAdt;
            //drAdt=

            decimal oHours = Convert.ToDecimal(drData["HOURS"]);
            //decimal nhours = Convert.ToDecimal(dr["HOURS"]);

            //decimal oTotal = Convert.ToDecimal(drData["TOTAL"]);
            decimal nTotal = 0;// Convert.ToDecimal(dr["TOTAL"]);



            //decimal nMonday = 0;
            //if (drData["MONDAY"] != DBNull.Value) Convert.ToDecimal(drData["MONDAY"]);
            //decimal nTuesday = 0;
            //if (drData["TUESDAY"] != DBNull.Value) Convert.ToDecimal(drData["TUESDAY"]);
            //decimal nWednesday = 0;
            //if (drData["WEDNESDAY"] != DBNull.Value) Convert.ToDecimal(drData["WEDNESDAY"]);
            //decimal nThursday = 0;
            //if (drData["THURSDAY"] != DBNull.Value) Convert.ToDecimal(drData["THURSDAY"]);
            //decimal nFriday = 0;
            //if (drData["FRIDAY"] != DBNull.Value) Convert.ToDecimal(drData["FRIDAY"]);
            //decimal nSaturday = 0;
            //if (drData["SATURDAY"] != DBNull.Value) Convert.ToDecimal(drData["SATURDAY"]);
            //decimal nSunday = 0;
            //if (drData["SUNDAY"] != DBNull.Value) Convert.ToDecimal(drData["SUNDAY"]);


            if (drA.GetLength(0) > 0)
            {
                // the Key already exists in the table. Use this row.
                dr = drA[0];
                bNew = false;
            }
            else
            {
                // the Key was not found. Create a new row
                dr = dt.NewRow();
                dr["ID"] = strKey;
                if (drData["BILLABLE"] == DBNull.Value)
                {
                    dr["BILLABLE"] = false;
                }
                else
                {
                    dr["BILLABLE"] = Convert.ToBoolean(drData["BILLABLE"]);
                }
                dr["DURATION"] = oHours;
                ItemIndex = Convert.ToInt16(drData["TASK_ID"]);
                ItemName = ui.GetTaskName(ItemIndex, strUser);
                dr["TASK"] = drData["TASK_ID"];
                dr["TASKNAME"] = ItemName;

                ItemIndex = Convert.ToInt16(drData["PHASE_ID"]);
                ItemName = ui.GetPhaseName(ItemIndex, strUser);
                dr["MILESTONE"] = drData["PHASE_ID"];
                dr["PHASENAME"] = ItemName;

                ItemIndex = Convert.ToInt16(drData["PROJECT_ID"]);
                ItemName = ui.GetProjectName(ItemIndex, strUser);
                dr["PROJECT"] = ItemIndex;
                dr["PROJECTNAME"] = ItemName;

                dr["PERSON"] = drData["USER_ID"];
                dr["TOTAL"] = 0;
                bNew = true;
            }

            decimal oMonday = 0;
            if (dr["MONDAY"] != DBNull.Value) oMonday = Convert.ToDecimal(dr["MONDAY"]);
            decimal oTuesday = 0;
            if (dr["TUESDAY"] != DBNull.Value) oTuesday = Convert.ToDecimal(dr["TUESDAY"]);
            decimal oWednesday = 0;
            if (dr["WEDNESDAY"] != DBNull.Value) oWednesday = Convert.ToDecimal(dr["WEDNESDAY"]);
            decimal oThursday = 0;
            if (dr["THURSDAY"] != DBNull.Value) oThursday = Convert.ToDecimal(dr["THURSDAY"]);
            decimal oFriday = 0;
            if (dr["FRIDAY"] != DBNull.Value) oFriday = Convert.ToDecimal(dr["FRIDAY"]);
            decimal oSaturday = 0;
            if (dr["SATURDAY"] != DBNull.Value) oSaturday = Convert.ToDecimal(dr["SATURDAY"]);
            decimal oSunday = 0;
            if (dr["SUNDAY"] != DBNull.Value) oSunday = Convert.ToDecimal(dr["SUNDAY"]);

            DateTime dtDate = Convert.ToDateTime(drData["BILL_DATE"].ToString()); //strip time??
            int Difference = 0;
            DateTime dtA = MasterDate; //strip time??

            Difference = dtDate.Subtract(dtA).Days;

            if (oHours > 0)
            {
                switch (Difference)
                {
                    case 0:
                        {
                            if (oMonday == 0)
                            {
                                dr["Monday"] = oHours;
                                dr["MonDescription"] = drData["DESCRIPTION"];

                            }
                            else
                            {
                                dr["Monday"] = oMonday + oHours;
                                
                            }

                            nTotal = oMonday + nTotal;
                            MonTotal = MonTotal + oHours;
                            WeekTotal = WeekTotal + oHours;

                            break;
                        }
                    case 1:
                        {
                            if (oTuesday == 0)
                            {
                                dr["Tuesday"] = oHours;
                                dr["TuesDescription"] = drData["DESCRIPTION"];
                            }
                            else
                            {
                                dr["Tuesday"] = oTuesday + oHours;
                            }

                            nTotal = oTuesday + nTotal;
                            TueTotal = TueTotal + oHours;
                            WeekTotal = WeekTotal + oHours;

                            break;
                        }
                    case 2:
                        {
                            if (oWednesday == 0)
                            {
                                dr["Wednesday"] = oHours;
                                // 10/
                                dr["WedDescription"] = drData["DESCRIPTION"];
                            }
                            else
                            {
                                dr["Wednesday"] = oWednesday + oHours;
                            }

                            nTotal = oWednesday + nTotal;
                            WedTotal = WedTotal + oHours;
                            WeekTotal = WeekTotal + oHours;

                            break;
                        }
                    case 3:
                        {
                            if (oThursday == 0)
                            {
                                dr["Thursday"] = oHours;
                                dr["ThursDescription"] = drData["DESCRIPTION"];
                            }
                            else
                            {
                                dr["Thursday"] = oThursday + oHours;
                            }

                            nTotal = oThursday + nTotal;
                            ThrTotal = ThrTotal + oHours;
                            WeekTotal = WeekTotal + oHours;

                            break;
                        }
                    case 4:
                        {
                            if (oFriday == 0)
                            {
                                dr["Friday"] = oHours;
                                dr["FriDescription"] = drData["DESCRIPTION"];
                            }
                            else
                            {
                                dr["Friday"] = oFriday + oHours;
                            }

                            nTotal = oFriday + nTotal;
                            FriTotal = FriTotal + oHours;
                            WeekTotal = WeekTotal + oHours;

                            break;
                        }
                    case 5:
                        {
                            if (oSaturday == 0)
                            {
                                dr["Saturday"] = oHours;
                                dr["SatDescription"] = drData["DESCRIPTION"];
                            }
                            else
                            {
                                dr["Saturday"] = oSaturday + oHours;
                            }

                            dr["Total"] = oSaturday + nTotal;
                            SatTotal = SatTotal + oHours;
                            WeekTotal = WeekTotal + oHours;

                            break;
                        }
                    case 6:
                        {
                            if (oSunday == 0)
                            {
                                dr["Sunday"] = oHours;
                                dr["SunDescription"] = drData["DESCRIPTION"];
                            }
                            else
                            {
                                dr["Sunday"] = oSunday + oHours;
                            }

                            nTotal = oSunday + nTotal;
                            SunTotal = SunTotal + oHours;
                            WeekTotal = WeekTotal + oHours;

                            break;
                        }

                }
            }
            else
            {
                bNew = false;
            }


            if (bNew == true)
            {
                dt.Rows.Add(dr);
            }
        }


        dt.AcceptChanges();

        gvTime.DataSource = dt;
        gvTime.DataBind();

        if (Locked(MasterDate))
        {
            gvTime.Enabled = false;
        }
        else
        {
            gvTime.Enabled = true;
        }

        //ViewState["MonTotal"] = MonTotal;
        //VeiwState["TueTotal"] = TueTotal;
        //VeiwState["WedTotal"] = WedTotal;
        //VeiwState["ThrTotal"] = ThrTotal;
        //VeiwState["FriTotal"] = FriTotal;
        //VeiwState["SatTotal"] = SatTotal;
        //VeiwState["SunTotal"] = SunTotal;


    }
    private void PopulateDateRanges()
    {
        if (User.IsInRole("admin"))
        {
            PopulateDateRanges(-10, 50);
        }
        else
        {
            PopulateDateRanges(-4, 16);
        }
    }
    private void PopulateDateRanges(int weeksBefore, int weeksAfter)
    {
        ListItemCollection listItems = new ListItemCollection();
        int selectedIndex = 0;
        DateTime currentMonday = GetStartDate();

        if (MasterDate.Year < 1971)
        {
            MasterDate = currentMonday;
        }

        int index = 0;
        for (int i = weeksBefore; i < weeksAfter; i++)
        {
            DateTime lowDate = currentMonday.AddDays(i * 7);
            DateTime highDate = lowDate.AddDays(6);
            ListItem li = new ListItem(lowDate.ToShortDateString() + " to " + highDate.ToShortDateString());
            if (MasterDate.ToShortDateString().Equals(lowDate.ToShortDateString()))
                selectedIndex = index;
            listItems.Add(li);
            index += 1;
        }

        ddlWeekOf.DataSource = listItems;
        ddlWeekOf.DataBind();
        ddlWeekOf.SelectedIndex = selectedIndex;

        RefreshHeaders();
    }
    private void RefreshHeaders()
    {
        DateTime[] dtDay = new DateTime[7];
        string[] strDay = new string[7];

        for (int i = 0; i < 7; i++)
        {
            dtDay[i] = MasterDate.AddDays(i);
            strDay[i] = dtDay[i].Month.ToString() + "/" + dtDay[i].Day.ToString();
        }

        labelMon.Text = "Mon " + "<br/>" + strDay[0];
        labelTue.Text = "Tue " + "<br/>" + strDay[1];
        labelWed.Text = "Wed " + "<br/>" + strDay[2];
        labelThr.Text = "Thr " + "<br/>" + strDay[3];
        labelFri.Text = "Fri " + "<br/>" + strDay[4];
        labelSat.Text = "Sat " + "<br/>" + strDay[5];
        labelSun.Text = "Sun " + "<br/>" + strDay[6];
    }
    private void Populate()
    {
        if (SelectedUserId.Equals(0)) SelectedUserId = LoggedInUserID;
        PopulateDateRanges(); // Fill "Week of" dropdown listbox
        PopulateDataGrid(); // Fill Existing Timerecord datagrid
        
        int strUser = SelectedUserId;
        StoneTimeBusiness.TimeEntryFunctions ui = new StoneTimeBusiness.TimeEntryFunctions();

        DataTable  dtPto = ui.GetPTOAvailable(SelectedUserId);
        if (dtPto.Rows.Count > 0)
        {
            lblPTOAvailable.Text = dtPto.Rows[0][0].ToString();
        }
                
        DataTable dtProjects = new DataTable();

        dtProjects = ui.GetProjectListX(strUser);

        DataRow dr;
        dr = dtProjects.NewRow();
        dr["PROJECT_ID"] = 0;
        dr["PROJECT_NAME"] = "--SELECT--";
        dtProjects.Rows.InsertAt(dr, 0);
        inputProject1.DataSource = dtProjects;
        inputProject1.DataTextField = "PROJECT_NAME";
        inputProject1.DataValueField = "PROJECT_ID";
        inputProject1.DataBind();
        inputProject2.DataSource = dtProjects;
        inputProject2.DataTextField = "PROJECT_NAME";
        inputProject2.DataValueField = "PROJECT_ID";
        inputProject2.DataBind();
        inputProject3.DataSource = dtProjects;
        inputProject3.DataTextField = "PROJECT_NAME";
        inputProject3.DataValueField = "PROJECT_ID";
        inputProject3.DataBind();
        inputProject4.DataSource = dtProjects;
        inputProject4.DataTextField = "PROJECT_NAME";
        inputProject4.DataValueField = "PROJECT_ID";
        inputProject4.DataBind();
        inputProject5.DataSource = dtProjects;
        inputProject5.DataTextField = "PROJECT_NAME";
        inputProject5.DataValueField = "PROJECT_ID";
        inputProject5.DataBind();

        //// phases
        ////StoneTimeBusiness.TimeEntryFunctions  ui= new StoneTimeBusiness.TimeEntryFunctions();
        //DataTable dtPhases = new DataTable();
        //// insert blank row
        //dtPhases = ui.GetPhaseList(strUser);
        //if (dtPhases == null)
        //{ }
        //else
        //{
        //    dr = dtPhases.NewRow();
        //    dr["PHASE_ID"] = 0;
        //    dr["NAME"] = "--SELECT--";
        //    dtPhases.Rows.InsertAt(dr, 0);
        //    inputMilestone1.DataSource = dtPhases;
        //    inputMilestone1.DataTextField = "NAME";
        //    inputMilestone1.DataValueField = "PHASE_ID";
        //    inputMilestone1.DataBind();
        //    inputMilestone2.DataSource = dtPhases;
        //    inputMilestone2.DataTextField = "NAME";
        //    inputMilestone2.DataValueField = "PHASE_ID";
        //    inputMilestone2.DataBind();
        //    inputMilestone3.DataSource = dtPhases;
        //    inputMilestone3.DataTextField = "NAME";
        //    inputMilestone3.DataValueField = "PHASE_ID";
        //    inputMilestone3.DataBind();
        //    inputMilestone4.DataSource = dtPhases;
        //    inputMilestone4.DataTextField = "NAME";
        //    inputMilestone4.DataValueField = "PHASE_ID";
        //    inputMilestone4.DataBind();
        //    inputMilestone5.DataSource = dtPhases;
        //    inputMilestone5.DataTextField = "NAME";
        //    inputMilestone5.DataValueField = "PHASE_ID";
        //    inputMilestone5.DataBind();
        //}
        //// tasks
        //DataTable dtTasks = new DataTable();
        //// insert blank row
        //dtTasks = ui.GetTaskList(strUser.ToString());
        //if (dtTasks == null)
        //{ }
        //else
        //{
        //    dr = dtTasks.NewRow();
        //    dr["TASK_ID"] = 0;
        //    dr["NAME"] = "--SELECT--";
        //    dtTasks.Rows.InsertAt(dr, 0);
        //    inputTask1.DataSource = dtTasks;
        //    inputTask1.DataTextField = "NAME";
        //    inputTask1.DataValueField = "TASK_ID";
        //    inputTask1.DataBind();
        //    inputTask2.DataSource = dtTasks;
        //    inputTask2.DataTextField = "NAME";
        //    inputTask2.DataValueField = "TASK_ID";
        //    inputTask2.DataBind();
        //    inputTask3.DataSource = dtTasks;
        //    inputTask3.DataTextField = "NAME";
        //    inputTask3.DataValueField = "TASK_ID";
        //    inputTask3.DataBind();
        //    inputTask4.DataSource = dtTasks;
        //    inputTask4.DataTextField = "NAME";
        //    inputTask4.DataValueField = "TASK_ID";
        //    inputTask4.DataBind();
        //    inputTask5.DataSource = dtTasks;
        //    inputTask5.DataTextField = "NAME";
        //    inputTask5.DataValueField = "TASK_ID";
        //    inputTask5.DataBind();
        //}

        PreloadRecentProjects(SelectedUserId.ToString());

        // is the date range being displayed going to be "savable"? 
        // if not, disable the save button and time datagrid
        LockData();
    }
    private void LockData()
    {
        if (Locked(MasterDate))
        {
            btnSubmit.Enabled = false;
            //dgTime.Enabled = false;
        }
        else
        {
            btnSubmit.Enabled = true;
            //dgTime.Enabled = true;
        }
    }
    private void PreloadRecentProjects(string strUser)
    {
        // SET MOST RECENT PROJECTS AS DEFAULT
        DataTable dtSelected = new DataTable();
        StoneTimeBusiness.TimeEntryFunctions ui = new StoneTimeBusiness.TimeEntryFunctions();
        dtSelected = ui.GetMostRecentProjects(Convert.ToInt16(strUser));
        if (dtSelected != null)
        {
            if (dtSelected.Rows.Count > 0)
            {
                if (dtSelected.Rows[0][1] != null)
                {
                    inputProject1.SelectedValue = dtSelected.Rows[0][1].ToString();
                    GetPhasesAndTasks(1);
                    if (dtSelected.Rows.Count > 1)
                    {
                        if (dtSelected.Rows[1][1] != null)
                        {
                            inputProject2.SelectedValue = dtSelected.Rows[1][1].ToString();
                            GetPhasesAndTasks(2);
                            if (dtSelected.Rows.Count > 2)
                            {
                                if (dtSelected.Rows[1][1] != null)
                                {
                                    inputProject3.SelectedValue = dtSelected.Rows[2][1].ToString();
                                    GetPhasesAndTasks(3);
                                    if (dtSelected.Rows.Count > 3)
                                    {
                                        if (dtSelected.Rows[2][1] != null)
                                        {
                                            inputProject4.SelectedValue = dtSelected.Rows[3][1].ToString();
                                            GetPhasesAndTasks(4);
                                            if (dtSelected.Rows.Count > 4)
                                            {
                                                if (dtSelected.Rows[3][1] != null)
                                                {
                                                    inputProject5.SelectedValue = dtSelected.Rows[4][1].ToString();
                                                    GetPhasesAndTasks(5);
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    private void GetPhasesAndTasks(int ProjectIndex)
    {

        int intProject = 0;
        StoneTimeBusiness.TimeEntryFunctions ui = new StoneTimeBusiness.TimeEntryFunctions();

        DataTable dt = new DataTable();
        switch (ProjectIndex)
        {
            case 1:
                intProject = Convert.ToInt16(inputProject1.SelectedValue);

                if (intProject < 1) return;
                inputBillable1.Checked = Opposite(ui.IsGlobalProject(intProject));


                dt = ui.GetPhaseListX(SelectedUserId, intProject);

                if (dt != null)
                {
                    inputMilestone1.DataSource = dt;
                    inputMilestone1.DataTextField = "NAME";
                    inputMilestone1.DataValueField = "PHASE_ID";
                    inputMilestone1.DataBind();
                }

                dt = ui.GetTaskList(SelectedUserId.ToString(), intProject);

                if (dt != null)
                {
                    inputTask1.DataSource = dt;
                    inputTask1.DataTextField = "NAME";
                    inputTask1.DataValueField = "TASK_ID";
                    inputTask1.DataBind();
                }
                break;
            case 2:
                intProject = Convert.ToInt16(inputProject2.SelectedValue);

                if (intProject < 1) return;

                inputBillable2.Checked = Opposite(ui.IsGlobalProject(intProject));

                dt = ui.GetPhaseListX(SelectedUserId, intProject);

                if (dt != null)
                {
                    inputMilestone2.DataSource = dt;
                    inputMilestone2.DataTextField = "NAME";
                    inputMilestone2.DataValueField = "PHASE_ID";
                    inputMilestone2.DataBind();
                }

                dt = ui.GetTaskList(SelectedUserId.ToString(), intProject);

                if (dt != null)
                {
                    inputTask2.DataSource = dt;
                    inputTask2.DataTextField = "NAME";
                    inputTask2.DataValueField = "TASK_ID";
                    inputTask2.DataBind();
                }
                break;
            case 3:
                intProject = Convert.ToInt16(inputProject3.SelectedValue);

                if (intProject < 1) return;

                inputBillable3.Checked = Opposite(ui.IsGlobalProject(intProject));

                dt = ui.GetPhaseListX(SelectedUserId, intProject);

                if (dt != null)
                {
                    inputMilestone3.DataSource = dt;
                    inputMilestone3.DataTextField = "NAME";
                    inputMilestone3.DataValueField = "PHASE_ID";
                    inputMilestone3.DataBind();
                }

                dt = ui.GetTaskList(SelectedUserId.ToString(), intProject);

                if (dt != null)
                {
                    inputTask3.DataSource = dt;
                    inputTask3.DataTextField = "NAME";
                    inputTask3.DataValueField = "TASK_ID";
                    inputTask3.DataBind();
                }
                break;
            case 4:
                intProject = Convert.ToInt16(inputProject4.SelectedValue);

                if (intProject < 1) return;
                inputBillable4.Checked = Opposite(ui.IsGlobalProject(intProject));

                dt = ui.GetPhaseListX(SelectedUserId, intProject);
                if (dt != null)
                {
                    inputMilestone4.DataSource = dt;
                    inputMilestone4.DataTextField = "NAME";
                    inputMilestone4.DataValueField = "PHASE_ID";
                    inputMilestone4.DataBind();
                }

                dt = ui.GetTaskList(SelectedUserId.ToString(), intProject);
                if (dt != null)
                {
                    inputTask4.DataSource = dt;
                    inputTask4.DataTextField = "NAME";
                    inputTask4.DataValueField = "TASK_ID";
                    inputTask4.DataBind();
                }
                break;
            case 5:
                intProject = Convert.ToInt16(inputProject5.SelectedValue);

                if (intProject < 1) return;
                inputBillable5.Checked = Opposite(ui.IsGlobalProject(intProject));


                dt = ui.GetPhaseListX(SelectedUserId, intProject);
                if (dt != null)
                {
                    inputMilestone5.DataSource = dt;
                    inputMilestone5.DataTextField = "NAME";
                    inputMilestone5.DataValueField = "PHASE_ID";
                    inputMilestone5.DataBind();
                }

                dt = ui.GetTaskList(SelectedUserId.ToString(), intProject);
                if (dt != null)
                {
                    inputTask5.DataSource = dt;
                    inputTask5.DataTextField = "NAME";
                    inputTask5.DataValueField = "TASK_ID";
                    inputTask5.DataBind();
                }
                break;
        }

    }
    private Boolean Locked(DateTime date)
    {
        // never locked for admins
        if (User.IsInRole("admin"))
        {
            return false;
        }

        DateTime LockDate = GetLockDate();

        if (date.DayOfYear > LockDate.DayOfYear)
        {
            return false;
        }
        // monday lockout logic
        if (DateTime.Now.DayOfWeek.Equals(DayOfWeek.Monday))
        {
            if (DateTime.Now.Hour < 12)
            {
                //Debug.WriteLine("Not Locked");
                return false;
            }
            else
            {
                //Debug.WriteLine("Locked")
                return true;
            }
        }
        else
        {
            if (date.Date < LockDate.Date)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
    }
    private DateTime GetLockDate()
    {
        DateTime d = DateTime.Now;
        int i = 0;
        DateTime CurrentMonday = new DateTime();

        // find the Monday that represents the current week
        while (CurrentMonday.Year < 1971)
        {

            if (DateTime.Now.AddDays(i).DayOfWeek.Equals(DayOfWeek.Monday))
            {
                CurrentMonday = DateTime.Now.AddDays(i - 7); //-8?
            }
            i++;
        }

        string s = CurrentMonday.ToShortDateString(); // remove time
        CurrentMonday = Convert.ToDateTime(s);

        return CurrentMonday;
    }
    private Boolean Save(DataTable dt, Boolean replace)
    {
        StoneTimeBusiness.TimeEntryFunctions ui = new StoneTimeBusiness.TimeEntryFunctions();
        ui.SaveTime(dt, Convert.ToInt16(ddlUserList.SelectedValue), replace);
        return true;
    }
    private Boolean ValidateInputs()
    {
        return true;
    }
    private DataTable BuildTimeDataTable()
    {
        DataTable dt = new DataTable();

        // return a populated datatable containing all time records
        DataRow dr;
        int i = 0;
        int j = 0;

        string Person = string.Empty;
        string Milestone = string.Empty;
        string Task = string.Empty;
        string Project = string.Empty;
        int Billable = 0;
        string Description = string.Empty;

        string[] Day = new string[8];
        DataColumn[] dc = new DataColumn[9];

        // intialize the datacolums
        for (i = 0; i < 9; i++)
        {
            dc[i] = new DataColumn();
        }

        // define columns for table
        dc[0].ColumnName = "ID";
        dc[1].ColumnName = "Date";
        dc[2].ColumnName = "Project";
        dc[3].ColumnName = "Milestone";
        dc[4].ColumnName = "Task";
        dc[5].ColumnName = "Person";
        dc[6].ColumnName = "Duration";
        dc[7].ColumnName = "Billable";
        dc[8].ColumnName = "Description";

        // add columns to table
        for (i = 0; i < 9; i++)
        {
            dt.Columns.Add(dc[i]);
        }

        // finalize datatable structure
        dt.AcceptChanges();

        // loop through time entry field rows and get time entries
        // add rows and values to table
        for (i = 1; i < 6; i++)
        {
            switch (i)
            {
                case 1:
                    Project = inputProject1.SelectedValue;
                    Milestone = inputMilestone1.SelectedValue;
                    Task = inputTask1.SelectedValue;
                    if (inputBillable1.Checked == true)
                    {
                        Billable = 1;
                    }
                    else
                    {
                        Billable = 0;
                    }

                    Description = inputDescription1.Text;
                    Day[1] = Request.Form["inputMon1"];
                    Day[2] = Request.Form["inputTue1"];
                    Day[3] = Request.Form["inputWed1"];
                    Day[4] = Request.Form["inputThr1"];
                    Day[5] = Request.Form["inputFri1"];
                    Day[6] = Request.Form["inputSat1"];
                    Day[7] = Request.Form["inputSun1"];
                    break;
                case 2:
                    Project = inputProject2.SelectedValue;
                    Milestone = inputMilestone2.SelectedValue;
                    Task = inputTask2.SelectedValue;
                    Day[1] = Request.Form["inputMon2"];
                    Day[2] = Request.Form["inputTue2"];
                    Day[3] = Request.Form["inputWed2"];
                    Day[4] = Request.Form["inputThr2"];
                    Day[5] = Request.Form["inputFri2"];
                    Day[6] = Request.Form["inputSat2"];
                    Day[7] = Request.Form["inputSun2"];
                    break;
                    if (inputBillable2.Checked == true)
                    {
                        Billable = 1;
                    }
                    else
                    {
                        Billable = 0;
                    }
                    Description = inputDescription2.Text;
                    break;
                case 3:
                    Project = inputProject3.SelectedValue;
                    Milestone = inputMilestone3.SelectedValue;
                    Task = inputTask3.SelectedValue;
                    if (inputBillable3.Checked == true)
                    {
                        Billable = 1;
                    }
                    else
                    {
                        Billable = 0;
                    }
                    Description = inputDescription3.Text;
                    Day[1] = Request.Form["inputMon3"];
                    Day[2] = Request.Form["inputTue3"];
                    Day[3] = Request.Form["inputWed3"];
                    Day[4] = Request.Form["inputThr3"];
                    Day[5] = Request.Form["inputFri3"];
                    Day[6] = Request.Form["inputSat3"];
                    Day[7] = Request.Form["inputSun3"];
                    break;
                case 4:
                    Project = inputProject4.SelectedValue;
                    Milestone = inputMilestone4.SelectedValue;
                    Task = inputTask4.SelectedValue;
                    if (inputBillable4.Checked == true)
                    {
                        Billable = 1;
                    }
                    else
                    {
                        Billable = 0;
                    }
                    Description = inputDescription4.Text;
                    Day[1] = Request.Form["inputMon4"];
                    Day[2] = Request.Form["inputTue4"];
                    Day[3] = Request.Form["inputWed4"];
                    Day[4] = Request.Form["inputThr4"];
                    Day[5] = Request.Form["inputFri4"];
                    Day[6] = Request.Form["inputSat4"];
                    Day[7] = Request.Form["inputSun4"];
                    break;
                case 5:
                    Project = inputProject5.SelectedValue;
                    Milestone = inputMilestone5.SelectedValue;
                    Task = inputTask5.SelectedValue;
                    if (inputBillable5.Checked == true)
                    {
                        Billable = 1;
                    }
                    else
                    {
                        Billable = 0;
                    }
                    Description = inputDescription5.Text;
                    Day[1] = Request.Form["inputMon5"];
                    Day[2] = Request.Form["inputTue5"];
                    Day[3] = Request.Form["inputWed5"];
                    Day[4] = Request.Form["inputThr5"];
                    Day[5] = Request.Form["inputFri5"];
                    Day[6] = Request.Form["inputSat5"];
                    Day[7] = Request.Form["inputSun5"];
                    break;
            }

            for (j = 1; j < 8; j++)
                if (Convert.ToDecimal(Day[j]) > 0)
                {
                    dr = dt.NewRow();
                    dr["ID"] = 0;
                    dr["Date"] = MasterDate.AddDays(j - 1);
                    dr["Project"] = Project;
                    dr["Milestone"] = Milestone;
                    dr["Task"] = Task;
                    dr["Person"] = ddlUserList.SelectedValue;
                    dr["Duration"] = Convert.ToDecimal(Day[j]);
                    //Debug.WriteLine(dr["Duration"]);

                    if (Billable == 1)
                    {
                        dr["Billable"] = 1;
                    }
                    else
                    {
                        dr["Billable"] = 0;
                    }
                    dr["Description"] = Description;
                    //Debug.WriteLine("A Time Entry has been found: " & Day[j]) & " hours");
                    dt.Rows.Add(dr);
                    dt.AcceptChanges();
                }
        }


        string strValidateReturn = string.Empty;
        //strValidateReturn = Validate24HourDays(dt, MasterDate);
        //if( strValidateReturn.Length = 0 ){
        //    Return dt
        //}else{
        //    Throw New Exception("24Hour:" & strValidateReturn)
        //}

        return dt;
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        StoneTimeBusiness.TimeEntryFunctions ui = new StoneTimeBusiness.TimeEntryFunctions();

        //Response.Write(ui.GetUserInfo( User.Identity.Name.ToString()));

        if (!IsPostBack)
        {
            PopulateUserList(); // fill User List
            Populate();
        }
    }
    protected void gvTime_RowDataBound(Object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Response.Write( e.Row.Controls[9].ID); 
        }
        string strMonTotal = "0";
        string strTueTotal = "0";
        string strWedTotal = "0";
        string strThrTotal = "0";
        string strFriTotal = "0";
        string strSatTotal = "0";
        string strSunTotal = "0";
        string strWeekTotal = "0";



        if (e.Row.RowType == DataControlRowType.Footer)
        {
            // clear out running total zero values for cosmetic value
            if (Convert.ToDecimal(MonTotal) == 0)
            {
                strMonTotal = string.Empty;
            }
            else
            {
                strMonTotal =FormatHours( MonTotal.ToString());
            }
            if (Convert.ToDecimal(TueTotal) == 0)
            {
                strTueTotal = string.Empty;
            }
            else
            {
                strTueTotal = FormatHours(TueTotal.ToString());
            }
            if (Convert.ToDecimal(WedTotal) == 0)
            {
                strWedTotal = string.Empty;
            }
            else
            {
                strWedTotal = FormatHours(WedTotal.ToString());
            }
            if (Convert.ToDecimal(ThrTotal) == 0)
            {
                strThrTotal = string.Empty;
            }
            else
            {
                strThrTotal = FormatHours(ThrTotal.ToString());
            }
            if (Convert.ToDecimal(FriTotal) == 0)
            {
                strFriTotal = string.Empty;
            }
            else
            {
                strFriTotal = FormatHours(FriTotal.ToString());
            }
            if (Convert.ToDecimal(SatTotal) == 0)
            {
                strSatTotal = string.Empty;
            }
            else
            {
                strSatTotal = FormatHours(SatTotal.ToString());
            }
            if (Convert.ToDecimal(SunTotal) == 0)
            {
                strSunTotal = string.Empty;
            }
            else
            {
                strSunTotal = FormatHours(SunTotal.ToString());
            }
            if (Convert.ToDecimal(WeekTotal) == 0)
            {
                strWeekTotal = string.Empty;
            }
            else
            {
                strWeekTotal = FormatHours(WeekTotal.ToString());
            }
            e.Row.Cells[1].Text = "Totals:";
            e.Row.Cells[3].Text = strMonTotal; // Monday
            e.Row.Cells[4].Text = strTueTotal; // Tuesday
            e.Row.Cells[5].Text = strWedTotal; // Wednesday
            e.Row.Cells[6].Text = strThrTotal; // Thursday
            e.Row.Cells[7].Text = strFriTotal; // Friday
            e.Row.Cells[8].Text = strSatTotal; // Saturday
            e.Row.Cells[9].Text = strSunTotal; // Sunday
            e.Row.Cells[10].Text =FormatHours( strWeekTotal); // Week
        }
    }
    protected void gvTime_Delete(Object sender, GridViewDeleteEventArgs e)
    {
        int projectId = 0;
        int taskId = 0;
        int phaseId = 0;
        int billable = 0;

        if (e.Keys["Billable"].ToString().Equals("True"))
        {
            billable = 1;
        }
        taskId = Convert.ToInt16(e.Keys["Task"].ToString());
        projectId = Convert.ToInt16(e.Keys["Project"].ToString());
        phaseId = Convert.ToInt16(e.Keys["Milestone"].ToString());

        StoneTimeBusiness.TimeEntryFunctions ui = new StoneTimeBusiness.TimeEntryFunctions();
        ui.DeleteUserTime(projectId, taskId, phaseId, Convert.ToBoolean(billable), SelectedUserId);

        PopulateDataGrid();
    }
    protected void gvTime_Cancelling(Object sender, GridViewCancelEditEventArgs e)
    {

        //e.Cancel = true;
        gvTime.EditIndex = -1;

        PopulateDataGrid();
    }
    protected void gvTime_Updating(Object sender, GridViewUpdateEventArgs e)
    {
        int projectId = 0;
        int taskId = 0;
        int phaseId = 0;
        int billable = 0;

        if (e.Keys["Billable"].ToString().Equals("True"))
        {
            billable = 1;
        }
        taskId = Convert.ToInt16(e.Keys["Task"].ToString());
        projectId = Convert.ToInt16(e.Keys["Project"].ToString());
        phaseId = Convert.ToInt16(e.Keys["Milestone"].ToString());
        GridView gv = (GridView)sender;

        HiddenField omon = (HiddenField)gv.Rows[e.RowIndex].FindControl("hidMon");
        HiddenField omonDesc = (HiddenField)gv.Rows[e.RowIndex].FindControl("hidMonDesc");
        HiddenField otue = (HiddenField)gv.Rows[e.RowIndex].FindControl("hidTue");
        HiddenField otueDesc = (HiddenField)gv.Rows[e.RowIndex].FindControl("hidTueDesc");
        HiddenField owed = (HiddenField)gv.Rows[e.RowIndex].FindControl("hidWed");
        HiddenField owedDesc = (HiddenField)gv.Rows[e.RowIndex].FindControl("hidWedDesc");
        HiddenField othr = (HiddenField)gv.Rows[e.RowIndex].FindControl("hidThr");
        HiddenField othrDesc = (HiddenField)gv.Rows[e.RowIndex].FindControl("hidThrDesc");
        HiddenField ofri = (HiddenField)gv.Rows[e.RowIndex].FindControl("hidFri");
        HiddenField ofriDesc = (HiddenField)gv.Rows[e.RowIndex].FindControl("hidFriDesc");
        HiddenField osat = (HiddenField)gv.Rows[e.RowIndex].FindControl("hidSat");
        HiddenField osatDesc = (HiddenField)gv.Rows[e.RowIndex].FindControl("hidSatDesc");
        HiddenField osun = (HiddenField)gv.Rows[e.RowIndex].FindControl("hidSun");
        HiddenField osunDesc = (HiddenField)gv.Rows[e.RowIndex].FindControl("hidSunDesc");

        TextBox mon = (TextBox)gv.Rows[e.RowIndex].FindControl("Monday");
        TextBox monDesc = (TextBox)gv.Rows[e.RowIndex].FindControl("editMonDescription");
        TextBox tue = (TextBox)gv.Rows[e.RowIndex].FindControl("Tuesday");
        TextBox tueDesc = (TextBox)gv.Rows[e.RowIndex].FindControl("editTuesDescription");
        TextBox wed = (TextBox)gv.Rows[e.RowIndex].FindControl("Wednesday");
        TextBox wedDesc = (TextBox)gv.Rows[e.RowIndex].FindControl("editWedDescription");
        TextBox thr = (TextBox)gv.Rows[e.RowIndex].FindControl("Thursday");
        TextBox thrDesc = (TextBox)gv.Rows[e.RowIndex].FindControl("editThursDescription");
        TextBox fri = (TextBox)gv.Rows[e.RowIndex].FindControl("Friday");
        TextBox friDesc = (TextBox)gv.Rows[e.RowIndex].FindControl("editFriDescription");
        TextBox sat = (TextBox)gv.Rows[e.RowIndex].FindControl("Saturday");
        TextBox satDesc = (TextBox)gv.Rows[e.RowIndex].FindControl("editSatDescription");
        TextBox sun = (TextBox)gv.Rows[e.RowIndex].FindControl("Sunday");
        TextBox sunDesc = (TextBox)gv.Rows[e.RowIndex].FindControl("editSunDescription");

        StoneTimeBusiness.TimeEntryFunctions ui = new StoneTimeBusiness.TimeEntryFunctions();
        //ui.DeleteUserTime(projectId, taskId, phaseId, Convert.ToBoolean(billable), SelectedUserId);

        DataTable dt = GetTimeTableSchema();
        // if the hours change or the hours are greater than zero and the description changes then update.
        if ((!GetNumericValue(mon.Text).Equals(GetNumericValue(omon.Value))) || (GetNumericValue(mon.Text)>0 && !monDesc.Text.Equals(omonDesc.Value)))
        {
            DataRow dr = dt.NewRow();

            dr["ID"] = 0;
            dr["Date"] = MasterDate;
            dr["Project"] = projectId;
            dr["Milestone"] = phaseId;
            dr["Task"] = taskId;
            dr["Person"] = ddlUserList.SelectedValue;
            dr["Duration"] = mon.Text;
            dr["Billable"] = billable;
            dr["Description"] = monDesc.Text;

            dt.Rows.Add(dr);
        }
        if ((!GetNumericValue(tue.Text).Equals(GetNumericValue(otue.Value))) || (GetNumericValue(tue.Text)>0 && !tueDesc.Text.Equals(otueDesc.Value)))
        {
            DataRow dr = dt.NewRow();

            dr["ID"] = 0;
            dr["Date"] = MasterDate.AddDays(1);
            dr["Project"] = projectId;
            dr["Milestone"] = phaseId;
            dr["Task"] = taskId;
            dr["Person"] = ddlUserList.SelectedValue;
            dr["Duration"] = tue.Text;
            dr["Billable"] = billable;
            dr["Description"] = tueDesc.Text;

            dt.Rows.Add(dr);
        }
        if ((!GetNumericValue(wed.Text).Equals(GetNumericValue(owed.Value))) || (GetNumericValue(wed.Text) > 0 && !wedDesc.Text.Equals(owedDesc.Value)))
        {
            DataRow dr = dt.NewRow();

            dr["ID"] = 0;
            dr["Date"] = MasterDate.AddDays(2);
            dr["Project"] = projectId;
            dr["Milestone"] = phaseId;
            dr["Task"] = taskId;
            dr["Person"] = ddlUserList.SelectedValue;
            dr["Duration"] = wed.Text;
            dr["Billable"] = billable;
            dr["Description"] = wedDesc.Text;

            dt.Rows.Add(dr);
        }
        if ((!GetNumericValue(thr.Text).Equals(GetNumericValue(othr.Value))) || (GetNumericValue(thr.Text) > 0 && !thrDesc.Text.Equals(othrDesc.Value)))
        {
            DataRow dr = dt.NewRow();

            dr["ID"] = 0;
            dr["Date"] = MasterDate.AddDays(3);
            dr["Project"] = projectId;
            dr["Milestone"] = phaseId;
            dr["Task"] = taskId;
            dr["Person"] = ddlUserList.SelectedValue;
            dr["Duration"] = thr.Text;
            dr["Billable"] = billable;
            dr["Description"] = thrDesc.Text;

            dt.Rows.Add(dr);
        }
        if ((!GetNumericValue(fri.Text).Equals(GetNumericValue(ofri.Value))) || (GetNumericValue(fri.Text) > 0 && !friDesc.Text.Equals(ofriDesc.Value)))
        {
            DataRow dr = dt.NewRow();

            dr["ID"] = 0;
            dr["Date"] = MasterDate.AddDays(4);
            dr["Project"] = projectId;
            dr["Milestone"] = phaseId;
            dr["Task"] = taskId;
            dr["Person"] = ddlUserList.SelectedValue;
            dr["Duration"] = fri.Text;
            dr["Billable"] = billable;
            dr["Description"] = friDesc.Text;

            dt.Rows.Add(dr);
        }
        if ((!GetNumericValue(sat.Text).Equals(GetNumericValue(osat.Value))) || (GetNumericValue(sat.Text)>0 && !satDesc.Text.Equals(osatDesc.Value)))
        {
            DataRow dr = dt.NewRow();

            dr["ID"] = 0;
            dr["Date"] = MasterDate.AddDays(5);
            dr["Project"] = projectId;
            dr["Milestone"] = phaseId;
            dr["Task"] = taskId;
            dr["Person"] = ddlUserList.SelectedValue;
            dr["Duration"] = sat.Text;
            dr["Billable"] = billable;
            dr["Description"] = satDesc.Text;

            dt.Rows.Add(dr);
        }
        if ((!GetNumericValue(sun.Text).Equals(GetNumericValue(osun.Value))) || (GetNumericValue(sun.Text) > 0 && !sunDesc.Text.Equals(osunDesc.Value)))
        {
            DataRow dr = dt.NewRow();

            dr["ID"] = 0;
            dr["Date"] = MasterDate.AddDays(6);
            dr["Project"] = projectId;
            dr["Milestone"] = phaseId;
            dr["Task"] = taskId;
            dr["Person"] = ddlUserList.SelectedValue;
            dr["Duration"] = sun.Text;
            dr["Billable"] = billable;
            dr["Description"] = sunDesc.Text;

            dt.Rows.Add(dr);
        }

        Save(dt,true);

        gvTime.EditIndex = -1;

        PopulateDataGrid();
    }
    private decimal GetNumericValue(string value)
    {
        decimal d = 0;

        if (value.Trim().Length.Equals(0)) return d;

        try
        {
            d = Convert.ToDecimal(value);
        }
        catch (Exception ex)
        {
        
        }
        return d;
    }
    protected void gvTime_Edit(Object sender, GridViewEditEventArgs e)
    {
        // is the date range being displayed "savable"? 
        // if not, GET OUT OF THIS SUB 
        if (Locked(MasterDate)) return;


        gvTime.EditIndex = e.NewEditIndex;

        //// get the current values for time entries so we can compare to see what has changed lately.
        //DataBoundLiteralControl Monday = (DataBoundLiteralControl) e.Row.Cells[3].Controls[0];
        //DataBoundLiteralControl Tuesday = (DataBoundLiteralControl) e.Row.Cells[4].Controls[0];
        //DataBoundLiteralControl Wednesday  = (DataBoundLiteralControl) e.Row.Cells[5].Controls[0];
        //DataBoundLiteralControl Thursday  = (DataBoundLiteralControl) e.Row.Cells[6].Controls[0];
        //DataBoundLiteralControl Friday  = (DataBoundLiteralControl) e.Row.Cells[7].Controls[0];
        //DataBoundLiteralControl Saturday  = (DataBoundLiteralControl) e.Row.Cells[8].Controls[0];
        //DataBoundLiteralControl Sunday  = (DataBoundLiteralControl) e.Row.Cells[9].Controls[0];

        //string strMonday = Monday.Text.Trim();
        //string strTuesday = Tuesday.Text.Trim();
        //string strWednesday = Wednesday.Text.Trim();
        //string strThursday = Thursday.Text.Trim();
        //string strFriday = Friday.Text.Trim();
        //string strSaturday = Saturday.Text.Trim();
        //string strSunday = Sunday.Text.Trim();

        //colEdit.Add(strMonday, "Monday")
        //colEdit.Add(strTuesday, "Tuesday")
        //colEdit.Add(strWednesday, "Wednesday")
        //colEdit.Add(strThursday, "Thursday")
        //colEdit.Add(strFriday, "Friday")
        //colEdit.Add(strSaturday, "Saturday")
        //colEdit.Add(strSunday, "Sunday")

        //Session("EditCollection") = colEdit

        PopulateDataGrid();

    }
    protected void ddlWeekOf_SelectedIndexChanged(object sender, EventArgs e)
    {
        String str = ddlWeekOf.SelectedItem.Text;
        int i = str.IndexOf("to");

        MasterDate = Convert.ToDateTime(str.Substring(0, i - 1));
        gvTime.EditIndex = -1;
        Populate();
    }
    protected void ddlUserList_SelectedIndexChanged(object sender, EventArgs e)
    {
        gvTime.EditIndex = -1;
        if (ddlUserList.SelectedValue != "")
        {
            SelectedUserId = Convert.ToInt16(ddlUserList.SelectedValue);
            Populate();
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        //try
        //{
        Boolean bValid = true;
        int i = 0;
        bValid = ValidateInputs();

        string day1 = string.Empty;
        string day2 = string.Empty;
        string day3 = string.Empty;
        string day4 = string.Empty;
        string day5 = string.Empty;
        string day6 = string.Empty;
        string day7 = string.Empty; //Request.Form["inputSun" + i.ToString()];

        for (i = 1; i < 6; i++)
        {
            // validation section - if hours are entered, a project must be specified.
            day1 = Request.Form["inputMon" + i.ToString()];
            day2 = Request.Form["inputTue" + i.ToString()];
            day3 = Request.Form["inputWed" + i.ToString()];
            day4 = Request.Form["inputThr" + i.ToString()];
            day5 = Request.Form["inputFri" + i.ToString()];
            day6 = Request.Form["inputSat" + i.ToString()];
            day7 = Request.Form["inputSun" + i.ToString()];

            if (Convert.ToDecimal(day1) > 0 || Convert.ToDecimal(day2) > 0 || Convert.ToDecimal(day3) > 0 || Convert.ToDecimal(day4) > 0 || Convert.ToDecimal(day5) > 0 || Convert.ToDecimal(day6) > 0 || Convert.ToDecimal(day7) > 0)
            {
                switch (i)
                {
                    case 1:
                        if (Convert.ToInt16(inputProject1.SelectedValue) < 1)
                        {
                            inputProject1.ForeColor = Color.Red;
                            bValid = false;
                        }
                        else
                        {
                            inputProject1.ForeColor = Color.Black;
                        }
                        break;
                    case 2:
                        if (Convert.ToInt16(inputProject2.SelectedValue) < 1)
                        {
                            inputProject2.ForeColor = Color.Red;
                            bValid = false;
                        }
                        else
                        {
                            inputProject2.ForeColor = Color.Black;
                        }
                        break;
                    case 3:
                        if (Convert.ToInt16(inputProject3.SelectedValue) < 1)
                        {
                            inputProject3.ForeColor = Color.Red;
                            bValid = false;
                        }
                        else
                        {
                            inputProject3.ForeColor = Color.Black;
                        }
                        break;
                    case 4:
                        if (Convert.ToInt16(inputProject4.SelectedValue) < 1)
                        {
                            inputProject4.ForeColor = Color.Red;
                            bValid = false;
                        }
                        else
                        {
                            inputProject4.ForeColor = Color.Black;
                        }
                        break;
                    case 5:
                        if (Convert.ToInt16(inputProject5.SelectedValue) < 1)
                        {
                            inputProject5.ForeColor = Color.Red;
                            bValid = false;
                        }
                        else
                        {
                            inputProject5.ForeColor = Color.Black;
                        }
                        break;
                }
            }
            else
            {
                switch (i)
                {
                    case 1:
                        inputProject1.ForeColor = Color.Black;
                        break;
                    case 2:
                        inputProject2.ForeColor = Color.Black;
                        break;
                    case 3:
                        inputProject3.ForeColor = Color.Black;
                        break;
                    case 4:
                        inputProject4.ForeColor = Color.Black;
                        break;
                    case 5:
                        inputProject5.ForeColor = Color.Black;
                        break;
                }
            }
        }
        // end validation section

        int l = Request.Form["labelMessage"].ToString().Length;

        if (l == 0 && bValid == true)
        {
            // save time records
            // get all the time entry data from the form and puts it in the bucket
            DataTable dt = new DataTable();

            //** Wrap in try catch to catch 24 hour exception
            try
            {
                dt = BuildTimeDataTable();
            }
            catch (Exception ex)
            {
                //if( ex.Message.IndexOf("24Hour:") = 0 ){
                //    //*** this is 24 hour error
                //    labelSaveMessage.Text = ex.Message.Replace("24Hour:", "")
                //    labelSaveMessage.Visible = true
                //    Exit Sub
                //}else{
                //    //**** Rethrow error not ours.
                throw ex;
                //}
            }
            // Debug.WriteLine(dt.Rows.Count)
            // save the data to Yoda
            Save(dt,false);

            // all done. enable save button
            btnSubmit.Enabled = true;
            //Server.Transfer("Default.aspx")

        }
        else
        {
            // there are problems
            labelSaveMessage.Visible = true;
            labelSaveMessage.Text = "Entries cannot be saved. Errors are present.";

            //Response.End()
        }

        PopulateDataGrid();
    }
    protected void inputProject1_SelectedIndexChanged(object sender, EventArgs e)
    {
        StoneTimeBusiness.TimeEntryFunctions ui = new StoneTimeBusiness.TimeEntryFunctions();

        int intProject = 0;

        intProject = Convert.ToInt16(inputProject1.SelectedValue);

        if (intProject < 1) return;

        inputBillable1.Checked = Opposite(ui.IsGlobalProject(intProject));

        DataTable dt = new DataTable();

        dt = ui.GetPhaseListX(SelectedUserId, intProject);
        if (dt != null)
        {
            inputMilestone1.DataSource = dt;
            inputMilestone1.DataTextField = "NAME";
            inputMilestone1.DataValueField = "PHASE_ID";
            inputMilestone1.DataBind();
            //inputMilestone1.SelectedValue = 0
        }

        dt = ui.GetTaskList(SelectedUserId.ToString(), intProject);
        if (dt != null)
        {
            inputTask1.DataSource = dt;
            inputTask1.DataTextField = "NAME";
            inputTask1.DataValueField = "TASK_ID";
            inputTask1.DataBind();
            //inputTask1.SelectedValue = 0;
        }
    }
    protected void inputProject2_SelectedIndexChanged(object sender, EventArgs e)
    {
        StoneTimeBusiness.TimeEntryFunctions ui = new StoneTimeBusiness.TimeEntryFunctions();

        int intProject = 0;

        intProject = Convert.ToInt16(inputProject2.SelectedValue);

        if (intProject < 1) return;

        inputBillable2.Checked = Opposite(ui.IsGlobalProject(intProject));

        DataTable dt = new DataTable();

        dt = ui.GetPhaseListX(SelectedUserId, intProject);
        if (dt != null)
        {
            inputMilestone2.DataSource = dt;
            inputMilestone2.DataTextField = "NAME";
            inputMilestone2.DataValueField = "PHASE_ID";
            inputMilestone2.DataBind();
            //inputMilestone2.SelectedValue = 0
        }

        dt = ui.GetTaskList(SelectedUserId.ToString(), intProject);
        if (dt != null)
        {
            inputTask2.DataSource = dt;
            inputTask2.DataTextField = "NAME";
            inputTask2.DataValueField = "TASK_ID";
            inputTask2.DataBind();
            //inputTask2.SelectedValue = 0;
        }
    }
    protected void inputProject3_SelectedIndexChanged(object sender, EventArgs e)
    {
        StoneTimeBusiness.TimeEntryFunctions ui = new StoneTimeBusiness.TimeEntryFunctions();

        int intProject = 0;

        intProject = Convert.ToInt16(inputProject3.SelectedValue);

        if (intProject < 1) return;

        inputBillable3.Checked = Opposite(ui.IsGlobalProject(intProject));

        DataTable dt = new DataTable();

        dt = ui.GetPhaseListX(SelectedUserId, intProject);
        if (dt != null)
        {
            inputMilestone3.DataSource = dt;
            inputMilestone3.DataTextField = "NAME";
            inputMilestone3.DataValueField = "PHASE_ID";
            inputMilestone3.DataBind();
            //inputMilestone3.SelectedValue = 0
        }

        dt = ui.GetTaskList(SelectedUserId.ToString(), intProject);
        if (dt != null)
        {
            inputTask3.DataSource = dt;
            inputTask3.DataTextField = "NAME";
            inputTask3.DataValueField = "TASK_ID";
            inputTask3.DataBind();
            //inputTask3.SelectedValue = 0;
        }
    }
    protected void inputProject4_SelectedIndexChanged(object sender, EventArgs e)
    {
        StoneTimeBusiness.TimeEntryFunctions ui = new StoneTimeBusiness.TimeEntryFunctions();

        int intProject = 0;

        intProject = Convert.ToInt16(inputProject4.SelectedValue);

        if (intProject < 1) return;

        inputBillable4.Checked = Opposite(ui.IsGlobalProject(intProject));

        DataTable dt = new DataTable();

        dt = ui.GetPhaseListX(SelectedUserId, intProject);
        if (dt != null)
        {
            inputMilestone4.DataSource = dt;
            inputMilestone4.DataTextField = "NAME";
            inputMilestone4.DataValueField = "PHASE_ID";
            inputMilestone4.DataBind();
            //inputMilestone4.SelectedValue = 0
        }

        dt = ui.GetTaskList(SelectedUserId.ToString(), intProject);
        if (dt != null)
        {
            inputTask4.DataSource = dt;
            inputTask4.DataTextField = "NAME";
            inputTask4.DataValueField = "TASK_ID";
            inputTask4.DataBind();
            //inputTask4.SelectedValue = 0;
        }
    }
    protected void inputProject5_SelectedIndexChanged(object sender, EventArgs e)
    {
        StoneTimeBusiness.TimeEntryFunctions ui = new StoneTimeBusiness.TimeEntryFunctions();

        int intProject = 0;

        intProject = Convert.ToInt16(inputProject5.SelectedValue);

        if (intProject < 1) return;

        inputBillable5.Checked = Opposite(ui.IsGlobalProject(intProject));

        DataTable dt = new DataTable();

        dt = ui.GetPhaseListX(SelectedUserId, intProject);
        if (dt != null)
        {
            inputMilestone5.DataSource = dt;
            inputMilestone5.DataTextField = "NAME";
            inputMilestone5.DataValueField = "PHASE_ID";
            inputMilestone5.DataBind();
            //inputMilestone5.SelectedValue = 0
        }

        dt = ui.GetTaskList(SelectedUserId.ToString(), intProject);
        if (dt != null)
        {
            inputTask5.DataSource = dt;
            inputTask5.DataTextField = "NAME";
            inputTask5.DataValueField = "TASK_ID";
            inputTask5.DataBind();
            //inputTask5.SelectedValue = 0;
        }
    }
    protected void gvTime_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}