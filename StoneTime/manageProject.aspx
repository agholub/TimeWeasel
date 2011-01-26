<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="manageProject.aspx.cs" Inherits="manageProject" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <style type="text/css">
        #main
        {
            text-align: left;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div><h1>Project Administration</h1></div>
    <asp:Literal ID="lblScriptMessage" runat="server"></asp:Literal>
    <br />
    <div>
    <table>
        <tr>
            <td>
                <table id="Table2">
                    <tr>
                        <td>
                            <font class="subsubheads" size="2">
                                <asp:Label ID="Label1" ToolTip="If the client you are looking for does not appear in the client drop list, please inform an administrator."
                                    runat="server">Client:</asp:Label></font>
                        </td>
                        <td>
                            <asp:DropDownList ID="inputClient" CssClass="dropdown" runat="server" Width="164px"
                                AutoPostBack="True" 
                                onselectedindexchanged="inputClient_SelectedIndexChanged">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <font class="subsubheads" size="2">
                                <asp:RequiredFieldValidator ID="reqFieldProjectCode" runat="server" ErrorMessage="Project Code"
                                    Display="Static" ControlToValidate="inputProjectCode">*</asp:RequiredFieldValidator><asp:Label
                                        ID="Label2" runat="server" ForeColor="Red">*</asp:Label>Project Code:</font>
                        </td>
                        <td>
                            <asp:TextBox ID="inputProjectCode" CssClass="small" runat="server" Width="164px"
                                ToolTip='Please enter project codes in the format: "XXX-XXX-99"' MaxLength="10"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <font class="subsubheads" size="2">Business Line:</font>
                        </td>
                        <td>
                            <asp:DropDownList ID="inputBusinessLine" CssClass="dropdown" runat="server" 
                                Width="164px">
                                <asp:ListItem Value="1" Selected="True">Project</asp:ListItem>
                                <asp:ListItem Value="2">Staff Supplemental</asp:ListItem>
                                <asp:ListItem Value="3">Strategic</asp:ListItem>
                                <asp:ListItem Value="4">HMS</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <font class="subsubheads" size="2">Status:</font>
                        </td>
                        <td>
                            <asp:DropDownList ID="inputStatus" CssClass="dropdown" runat="server" 
                                Width="164px">
                                <asp:ListItem Value="1" Selected="True">Active Project</asp:ListItem>
                                <asp:ListItem Value="2">Inactive Project</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
        
                </table>
            </td>
            <td>
                <table>
                    <tr>
                        <td>
                            <font class="subsubheads" size="2">Mile Stones:</font>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBox ID="chkSOW" runat="server" CssClass="subsubheads" Text="Statement Of Work">
                            </asp:CheckBox><br>
                            <asp:CheckBox ID="chkMSA" runat="server" CssClass="subsubheads" Text="Master Service Agreement">
                            </asp:CheckBox><br>
                            <asp:CheckBox ID="chkRA" runat="server" CssClass="subsubheads" Text="Resource Agreement">
                            </asp:CheckBox><br>
                            <asp:CheckBox ID="chkRL" runat="server" CssClass="subsubheads" Text="Resource Loading">
                            </asp:CheckBox>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>

    
        </div>
<div id="main" nowrap="nowrap">
<div style="width: 400px;" >
    
    </div>
    <table>
        <tr>
            <td colspan="2">
                <asp:Label ID="lblNote2" Font-Bold="True" Font-Size="Smaller" runat="server" Width="294px"
                    ForeColor="Red" Font-Italic="True">NOTE:  Red asterisks indicate required fields.</asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <table id="Table3" bordercolor="#999999" cellspacing="1" cellpadding="1" width="390"
                    align="left">
                    <tr>
                        <td align="right">
                            
                                <font class="subsubheads" size="2">
                                    <asp:RequiredFieldValidator ID="reqFieldSubproject" runat="server" ErrorMessage="Subproject"
                                        Display="Dynamic" ControlToValidate="inputSubproject">*</asp:RequiredFieldValidator><asp:Label
                                            ID="Label3" runat="server" ForeColor="Red">*</asp:Label>Subproject:</font>
                        </td>
                        <td>
                            <asp:TextBox ID="inputSubproject" CssClass="small" runat="server" Width="164px" Height="21px"
                                MaxLength="30"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            
                                <font class="subsubheads" size="2">Billing Contact Name:</font>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlBillingContact" CssClass="dropdown" runat="server" Width="164px"
                                Height="21px" AutoPostBack="True" 
                                onselectedindexchanged="ddlBillingContact_SelectedIndexChanged">
                            </asp:DropDownList>
                            <asp:LinkButton ID="lnkNewBillingContact" runat="server" 
                                CausesValidation="False" ToolTip="Create a new Contact" 
                                onclientclick="javascript:w = window.showModalDialog('manageContact.aspx','Time Weasel - Contact','height:450px;width:300px;');">New</asp:LinkButton>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                                <font class="subsubheads" size="2">Project Sponsor Name:</font>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlSponsorContact" CssClass="dropdown" runat="server" Width="164px"
                                >
                            </asp:DropDownList>
                            <asp:LinkButton ID="lnkNewSponsorContact" runat="server" 
                                CausesValidation="False" ToolTip="Create a new Contact" 
                                onclientclick="javascript:w = window.showModalDialog('manageContact.aspx','Time Weasel - Contact','height:450px;width:300px;');">New</asp:LinkButton>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <font class="subsubheads" size="2">Phone Number:</font>
                        </td>
                        <td>
                            <asp:TextBox ID="inputPhone" CssClass="small" runat="server" Width="164px" Height="21px"
                                MaxLength="30" Enabled="False"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <font class="subsubheads" size="2">E-Mail:</font>
                        </td>
                        <td>
                            <asp:TextBox ID="inputEmail" CssClass="small" runat="server" Width="164px" Height="21px"
                                MaxLength="30" Enabled="False"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            
                                <font class="subsubheads" size="2">
                                    <asp:RequiredFieldValidator ID="reqFieldAddress" runat="server" ErrorMessage="Address"
                                        Display="Static" ControlToValidate="inputAddress" Enabled="False">*</asp:RequiredFieldValidator><asp:Label
                                            ID="Label5" runat="server" ForeColor="Red">*</asp:Label>Address:</font>
                        </td>
                        <td>
                            <asp:TextBox ID="inputAddress" CssClass="small" runat="server" Width="164px" Height="21px"
                                MaxLength="50" Enabled="False"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <font class="subsubheads" size="2">
                                <asp:RequiredFieldValidator ID="reqFieldAddress2" runat="server" ErrorMessage="City, State Zip"
                                    Display="Static" ControlToValidate="inputAddress2">*</asp:RequiredFieldValidator><asp:Label
                                        ID="Label6" runat="server" ForeColor="Red">*</asp:Label>City, State&nbsp;
                                Zip:</font>
                        </td>
                        <td>
                            <asp:TextBox ID="inputAddress2" CssClass="small" runat="server" Width="164px" Height="21px"
                                MaxLength="50" Enabled="False"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <font class="subsubheads" size="2">Company Website:</font>
                        </td>
                        <td>
                            <asp:TextBox ID="inputWebsite" CssClass="small" runat="server" Width="164px" Height="21px"
                                MaxLength="50" Enabled="False"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <font class="subsubheads" size="2">Industry:</font>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlIndustry" CssClass="dropdown" runat="server" Width="164px"
                                Height="21px">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <font class="subsubheads" size="2">Actual First Date Billed:</font>
                        </td>
                        <td>
                            <asp:TextBox ID="inputFirstBilled" CssClass="small" runat="server" Width="164px"
                                Height="21px" MaxLength="12" Enabled="False" ReadOnly="True" EnableViewState="False"
                                BackColor="#E0E0E0"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <font class="subsubheads" size="2">Actual Last Date Billed:</font>
                        </td>
                        <td>
                            <asp:TextBox ID="inputLastBilled" CssClass="small" runat="server" Width="164px" Height="21px"
                                MaxLength="12" Enabled="False" ReadOnly="True" EnableViewState="False" BackColor="#E0E0E0"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <font class="subsubheads" size="2">PO # / Contract #:</font>
                        </td>
                        <td>
                            <asp:TextBox ID="inputPO" CssClass="small" runat="server" Width="164px" Height="21px"
                                MaxLength="30"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </td>
            <td style="height: 348px" valign="top" align="right">
                <table id="Table4" bordercolor="#999999" cellspacing="1" cellpadding="1" width="390"
                    align="right">
                    <tbody>
                        <tr>
                            <td>
                                <font class="subsubheads" size="2">
                                    <asp:RequiredFieldValidator ID="reqFieldAccountManager" runat="server" ErrorMessage="Account Manager"
                                        Display="Static" ControlToValidate="inputAccountManager" InitialValue="0">*</asp:RequiredFieldValidator><asp:Label
                                            ID="Label7" runat="server" ForeColor="Red">*</asp:Label>Account Manager:</font>
                            </td>
                            <td>
                                <asp:DropDownList ID="inputAccountManager" CssClass="dropdown" runat="server" Width="164px"
                                    Height="21px">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <font class="subsubheads" size="2">
                                    <asp:RequiredFieldValidator ID="reqFieldProjectManager" runat="server" ErrorMessage="Project Manager"
                                        Display="Static" ControlToValidate="inputProjectManager" InitialValue="0">*</asp:RequiredFieldValidator><asp:Label
                                            ID="Label8" runat="server" ForeColor="Red">*</asp:Label>Project Manager:</font>
                            <td>
                                <asp:DropDownList ID="inputProjectManager" CssClass="dropdown" runat="server" Width="164px"
                                    Height="21px">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <font class="subsubheads" size="2">
                                    <asp:RequiredFieldValidator ID="reqFieldStartDate" runat="server" ErrorMessage="Expected Start Date"
                                        Display="Static" ControlToValidate="inputStartDate">*</asp:RequiredFieldValidator><asp:CompareValidator
                                            ID="CompareValidator2" ToolTip="You have entered an invalid date, please use the format 1/1/00"
                                            runat="server" ErrorMessage="Invalid Start Date" ControlToValidate="inputStartDate"
                                            Operator="DataTypeCheck" Type="Date">*</asp:CompareValidator><asp:Label ID="Label9"
                                                runat="server" ForeColor="Red">*</asp:Label>Expected Start Date:</font>
                            </td>
                            <td>
                                <asp:TextBox ID="inputStartDate" CssClass="small" ToolTip='Please use the date format: "1/1/00"'
                                    runat="server" Width="164px" Height="21px" MaxLength="12"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="height: 28px" width="190" height="28">
                                <font class="subsubheads" size="2">
                                    <asp:RequiredFieldValidator ID="reqFieldCompletionDate" runat="server" ErrorMessage="Estimated Completion Date"
                                        Display="Static" ControlToValidate="inputCompletionDate">*</asp:RequiredFieldValidator><asp:CompareValidator
                                            ID="CompareValidator1" ToolTip="You have entered an invalid date, please use the format 1/1/00"
                                            runat="server" ErrorMessage="Invalid Completion Date" ControlToValidate="inputCompletionDate"
                                            Operator="DataTypeCheck" Type="Date">*</asp:CompareValidator><asp:Label ID="Label10"
                                                runat="server" ForeColor="Red">*</asp:Label>Estimated Completion Date:</font>
                            </td>
                            <td style="height: 28px" width="190" height="28">
                                <asp:TextBox ID="inputCompletionDate" CssClass="small" ToolTip='Please use the date format: "1/1/00"'
                                    runat="server" Width="164px" MaxLength="12"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <font class="subsubheads" size="2">
                                    <asp:RequiredFieldValidator ID="reqFieldDuration" runat="server" ErrorMessage="Estimated Project Duration"
                                        Display="Static" ControlToValidate="inputDuration">*</asp:RequiredFieldValidator><asp:Label
                                            ID="Label11" runat="server" ForeColor="Red">*</asp:Label>Estimated Project
                                    Duration:</font>
                            </td>
                            <td>
                                <asp:TextBox ID="inputDuration" CssClass="small" runat="server" Width="164px" MaxLength="30"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <font class="subsubheads" size="2">
                                    <asp:RangeValidator ID="rvBudget" runat="server" ErrorMessage="Estimated Budget Must Be Greater Than 0 And In Currency Format"
                                        ControlToValidate="inputBudget" Type="Currency" MinimumValue="1" MaximumValue="10000000000">*</asp:RangeValidator><asp:RequiredFieldValidator
                                            ID="reqFieldBudget" runat="server" ErrorMessage="Estimated Budget" Display="Static"
                                            ControlToValidate="inputBudget">*</asp:RequiredFieldValidator><asp:Label ID="Label16"
                                                runat="server" ForeColor="Red">*</asp:Label>Estimated Budget:</font>
                            </td>
                            <td>
                                <asp:TextBox ID="inputBudget" CssClass="small" ToolTip='Please enter a valid number: dollar signs ("$"), commas (","), and decimals (".") are optional.'
                                    runat="server" Width="164px" MaxLength="30"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <font class="subsubheads" size="2">
                                    <asp:RequiredFieldValidator ID="reqFieldTechnology" runat="server" ErrorMessage="Technology Used"
                                        Display="Static" ControlToValidate="inputTechnology">*</asp:RequiredFieldValidator><asp:Label
                                            ID="Label13" runat="server" ForeColor="Red">*</asp:Label>Technology Used:</font>
                            </td>
                            <td>
                                <asp:DropDownList ID="inputTechnology" CssClass="dropdown" runat="server" 
                                    Width="164px" MaxLength="30"></asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <font class="subsubheads" size="2">Project Type:</font>
                            </td>
                            <td>
                                <asp:DropDownList ID="inputProjectType" CssClass="dropdown" runat="server" 
                                    Width="164px">
                                    <asp:ListItem Value="1" Selected="True">Time &amp; Materials</asp:ListItem>
                                    <asp:ListItem Value="2">Fixed Fee</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <font class="subsubheads" size="2">Contract Billing Terms:</font>
                            </td>
                            <td>
                                <asp:DropDownList ID="inputBillingTerms" CssClass="dropdown" runat="server" 
                                    Width="164px">
                                    <asp:ListItem Value="1" Selected="True">Every Two Weeks</asp:ListItem>
                                    <asp:ListItem Value="2">Bimonthly</asp:ListItem>
                                    <asp:ListItem Value="3">Monthly</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <font class="subsubheads" size="2">Contract Payment Terms:</font>
                            </td>
                            <td>
                                <asp:DropDownList ID="inputPaymentTerms" CssClass="dropdown" runat="server" 
                                    Width="164px">
                                    <asp:ListItem Value="1">Net 15</asp:ListItem>
                                    <asp:ListItem Value="2" Selected="True">Net 30</asp:ListItem>
                                    <asp:ListItem Value="3">Net 60</asp:ListItem>
                                    <asp:ListItem Value="4">Net 90</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <font class="subsubheads" size="2">Authorization of Work:</font>
                            </td>
                            <td>
                                <asp:DropDownList ID="inputAuthorization" CssClass="dropdown" runat="server" 
                                    Width="164px">
                                    <asp:ListItem Value="1" Selected="True">Stuart Taylor</asp:ListItem>
                                    <asp:ListItem Value="2">John Vojtush</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
    </table>
    <hr />
    <table id="Table5" bordercolor="#999999" width="800">
        <tr>
            <td align="left">
                <font size="2"><b>Description of Project:</b></font>
                <asp:Label ID="Label14" runat="server" ForeColor="Red">*</asp:Label><asp:RequiredFieldValidator
                    ID="reqFieldProjectDescription" runat="server" ErrorMessage="Description of Project"
                    Display="Static" ControlToValidate="inputProjectDescription">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:TextBox ID="inputProjectDescription" CssClass="small" runat="server" Width="100%"
                    Height="64px" MaxLength="1000" TextMode="MultiLine"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="left">
                <font size="2"><b>Billing Notes:</b></font>
            </td>
        </tr>
        <tr>
            <td>
                
                    <asp:TextBox ID="inputBillingNotes" CssClass="small" runat="server" Width="100%"
                        Height="64px" MaxLength="1000" TextMode="MultiLine"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="left">
                <font size="2"><b>Project Notes:</b></font>
            </td>
        </tr>
        <tr>
            <td>
                
                    <asp:TextBox ID="inputProjectNotes" CssClass="small" runat="server" Width="100%"
                        Height="64px" MaxLength="1000" TextMode="MultiLine"></asp:TextBox>
            </td>
        </tr>
    </table>
    <TABLE id="Table10" cellSpacing="0" cellPadding="4"
				width="520" align="left" border="0">
				<TR>
					<TD vAlign="middle" align="right" width="400">
						<asp:label id="Label15" ToolTip="Is this a company-wide internal project?" runat="server" Width="219px"
							 CssClass="subsubheads">IS THIS A GLOBAL PROJECT?</asp:label>
					</TD>
					<TD vAlign="middle" align="right" width="400">
						<asp:checkbox id="checkboxGlobal" ToolTip="Is this a company-wide internal project?" runat="server"
								 CssClass="small"></asp:checkbox>
					</TD>
				</TR>
				<TR>
					<TD vAlign="middle" align="right" width="400">
						<asp:label id="Label4" Width="219px" runat="server" ToolTip="This sets the default value of the billable checkbox on the TimeEntry screen"
							 CssClass="subsubheads">IS THIS A BILLABLE PROJECT?</asp:label></TD>
					<TD vAlign="bottom" align="right" width="400">
						
							<asp:checkbox id="CheckboxBillable" runat="server" ToolTip="Is this a company-wide internal (non-billable) project?"
								CssClass="small"></asp:checkbox>
					</TD>
				</TR>
			</TABLE>
    <br />
    <br />
    <br />
    <hr />
    <div style="text-align:center;">
    <asp:Button ID="btnCancel" ToolTip="Cancel Project Charter creation." runat="server"
        Text="Cancel" CausesValidation="False" onclick="btnCancel_Click"></asp:Button>
        <asp:Button ID="btnSave" ToolTip="Save Charter.  After you save the Project Charter, select it from the listbox to add Resources, Tasks, and Phases to the Project."
            runat="server" Text="Save" onclick="btnSave_Click"></asp:Button></div>
    <br />
    <asp:Label ID="lblNote" Font-Size="Smaller" runat="server" Width="577px" ForeColor="Red"
        Font-Italic="True"> NOTE: You must first save a Charter before you can add Resources, Tasks, or Phases to a Project.</asp:Label>
    <hr />
    <table id="Table9" bordercolor="#999999" cellspacing="1" cellpadding="1" width="773"
        align="left" border="0">
        <tr>
            <td width="220">
                
                    Available
                
                    Tasks</td>
            <td width="220">
                
                    Available
                
                    Milestones
            </td>
        </tr>
        <tr>
            <td >
                <asp:DropDownList ID="inputTasks2" runat="server" Width="220px" 
                    CssClass="dropdown">
                </asp:DropDownList>
                <asp:Button ID="btnAddTask" ToolTip="Add Tasks to the Project. You may select previously used Tasks from the drop list, or create a new one."
                    Font-Size="XX-Small" runat="server" Text="Add Task"
                    CausesValidation="False" onclick="btnAddTask_Click"></asp:Button>
            </td>
            <td>
                <asp:DropDownList ID="inputPhases2" runat="server" Width="220px" 
                    CssClass="dropdown">
                </asp:DropDownList>
                <asp:Button ID="btnAddPhase" ToolTip="Add Milestones to the Project. You may select previously used Milestone from the drop list, or create a new one."
                    Font-Size="XX-Small" runat="server" Text="Add Milestone"
                    CausesValidation="False" onclick="btnAddPhase_Click"></asp:Button>
            </td>
        </tr>
        <tr>
            <td valign="top" width="220">
                <asp:DataGrid ID="dgTasks" CssClass="small" ToolTip="Tasks on the Project." Font-Size="Small"
                    runat="server" Width="220px" AutoGenerateColumns="False">
                    <ItemStyle Font-Size="Smaller"></ItemStyle>
                    <HeaderStyle Font-Size="Smaller" Font-Bold="True" HorizontalAlign="Left"></HeaderStyle>
                    <Columns>
                        <asp:BoundColumn DataField="NAME" HeaderText="Project Tasks"></asp:BoundColumn>
                    </Columns>
                </asp:DataGrid>
            </td>
            <td valign="top" width="220">
                <asp:DataGrid ID="dgPhases" CssClass="small" ToolTip="Milestones on the Project." Font-Size="Small"
                    runat="server" Width="220px" AutoGenerateColumns="False">
                    <ItemStyle Font-Size="Smaller"></ItemStyle>
                    <HeaderStyle Font-Size="Smaller" Font-Bold="True" HorizontalAlign="Left" VerticalAlign="Top">
                    </HeaderStyle>
                    <Columns>
                        <asp:BoundColumn DataField="NAME" HeaderText="Project Milestones"></asp:BoundColumn>
                    </Columns>
                </asp:DataGrid>
            </td>
        </tr>
    </table>
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <hr />
    <table id="Table6" bordercolor="#999999" cellspacing="1" cellpadding="1" width="800"
        align="left" border="2">
        <tr>
            <td bgcolor="white" colspan="1">
                <asp:Button ID="btnUpdateHrs" CssClass="XX-Small" Font-Size="XX-Small" runat="server"
                    Width="100px" Text="Update Hrs" CausesValidation="False" Enabled="False">
                </asp:Button>
            </td>
        </tr>
        <tr>
            <td class="small" style="width:166px;   align="center" colspan="1"
                >
                
                    <font size="2"><strong class="small" style="text-align: center">name</strong></font>
            </td>
            <td class="small" style="width: 50px;    align="center" >
                
                    <font size="2"><strong class="small" style="text-align: center">total est. hrs</strong></font>
            </td>
            <td class="small" style="width: 65px;    align="center" >
                
                    <font size="2"><strong class="small" style="text-align: center">rate/hr</strong></font>
            </td>
            <td class="small" style="width: 50px;" align="center" >
                
                    <font size="2"><strong class="small" style="text-align: center">total est. cost</strong></font>
            </td>
            <td class="small" style="width: 42px;    align="center" >
                
                    <font size="2"><strong class="small" style="text-align: center">actual proj. hrs</strong></font>
            </td>
            <td class="small" style="width: 42px;    align="center" >
                
                    <font size="2"><strong class="small" style="text-align: center">actual cost</strong></font>
            </td>
            <td class="small" style="width: 42px;    align="center" >
                
                    <font size="2"><strong class="small" style="text-align: center">actual nonbill hrs</strong></font>
            </td>
            <td class="small" style="width: 42px;    align="center" >
                
                    <font size="2"><strong class="small">overall proj. burned</strong></font>
            </td>
            <td class="small" style="width: 42px;    align="center" >
                
                    <font size="2"><strong class="small" style="text-align: center">active rate</strong></font>
            </td>
            <td class="small" style="height: 47px"   align="center" >
                
                    <font size="2"><strong class="small" style="text-align: center">rate notes</strong></font>
            </td>
        </tr>
        <tr>
            <td style="width: 166px" valign="top" width="166" colspan="1" height="15">
                <asp:Button ID="btnAddResource" ToolTip="Add a resource, their rate and rate notes to the Project"
                    Font-Size="XX-Small" runat="server"  Text="Add" 
                    CausesValidation="False" onclick="btnAddResource_Click">
                </asp:Button>
                <asp:DropDownList ID="inputProjectUser" CssClass="dropdown" runat="server"
                    Width="100px">
                </asp:DropDownList>
                Task:<asp:DropDownList ID="inputTasks3" runat="server" Width="220px" 
                    CssClass="dropdown">
                </asp:DropDownList>
            </td>
            <td valign="top" height="15">
                
                    <asp:TextBox ID="inputEstimatedHrs" CssClass="small" runat="server" Width="40px"
                        ForeColor="White" Enabled="False" ReadOnly="True" EnableViewState="False" BackColor="#E0E0E0"
                        Columns="6"></asp:TextBox>
            </td>
            <td height="15">
                <asp:DropDownList ID="inputRate" CssClass="dropdown" runat="server" 
                    Width="64px">
                </asp:DropDownList>
            </td>
            <td valign="top" height="15">
                
                    <asp:TextBox ID="inputEstimatedCost" CssClass="small" runat="server" Width="40px"
                        ForeColor="White" Enabled="False" EnableViewState="False" BackColor="#E0E0E0"></asp:TextBox>
            </td>
            <td valign="top" height="15">
                
                    <asp:TextBox ID="inputActualHrs" CssClass="small" runat="server" Width="40px" Enabled="False"
                        ReadOnly="True" EnableViewState="False" BackColor="#E0E0E0"></asp:TextBox>
            </td>
            <td valign="top" height="15">
                
                    <asp:TextBox ID="inputActualCost" CssClass="small" runat="server" Width="40px" Enabled="False"
                        ReadOnly="True" EnableViewState="False" BackColor="#E0E0E0"></asp:TextBox>
            </td>
            <td valign="top" height="15">
                
                    <asp:TextBox ID="inputActualNonbillableHrs" CssClass="small" runat="server" Width="40px"
                        Enabled="False" ReadOnly="True" EnableViewState="False" BackColor="#E0E0E0"></asp:TextBox>
            </td>
            <td valign="top" height="15">
                
                    <asp:TextBox ID="inputProjectBurned" CssClass="small" runat="server" Width="40px"
                        Enabled="False" ReadOnly="True" EnableViewState="False" BackColor="#E0E0E0"></asp:TextBox>
            </td>
            <td valign="top" height="15">
                
                    <asp:CheckBox ID="checkboxRate" CssClass="small" runat="server" Enabled="False" Checked="True">
                    </asp:CheckBox>
            </td>
            <td height="15">
                <asp:TextBox ID="inputRateNotes" CssClass="small" runat="server" Width="100px" MaxLength="100"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 166px" valign="top" width="166" colspan="15" height="15">
                <strong><font size="2">
                    <asp:DataGrid ID="dgUsers" CssClass="small" ToolTip="Resources on the Project." Font-Size="Small"
                        runat="server" Width="500px" AutoGenerateColumns="False" CellPadding="1" CellSpacing="1">
                        <ItemStyle Font-Size="Smaller"></ItemStyle>
                        <HeaderStyle Font-Size="Smaller" Font-Bold="True" HorizontalAlign="Center"></HeaderStyle>
                        <Columns>
                            <asp:BoundColumn DataField="FULL_NAME" HeaderText="Resource on Project">
                                <HeaderStyle Width="150px"></HeaderStyle>
                            </asp:BoundColumn>
                            <asp:BoundColumn DataField="NAME" HeaderText="Task">
                                <HeaderStyle Width="150px"></HeaderStyle>
                            </asp:BoundColumn>
                            <asp:BoundColumn DataField="RATE" HeaderText="Rate/Hr">
                                <HeaderStyle Width="75px"></HeaderStyle>
                            </asp:BoundColumn>

                            <asp:BoundColumn DataField="ACTIVE_FLAG" HeaderText="Active Rate">
                                <HeaderStyle Width="75px"></HeaderStyle>
                            </asp:BoundColumn>
                            <asp:BoundColumn DataField="DESCRIPTION" HeaderText="Rate Notes">
                                <HeaderStyle Width="200px"></HeaderStyle>
                            </asp:BoundColumn>
                        </Columns>
                    </asp:DataGrid></font></strong>
            </td>
        </tr>
    </table>
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <hr />
    <asp:ValidationSummary ID="ValSum" runat="server" DisplayMode="BulletList" HeaderText="The following fields are required: "
        ShowMessageBox="True" ShowSummary="False"></asp:ValidationSummary>

        </div>
</asp:Content>
