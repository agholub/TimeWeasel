<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="manageUser.aspx.cs" Inherits="manageUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div><h1>User Maintenance</h1></div>
     <hr style="clear:both;" />
    <table id="Table2" cellSpacing="1" cellPadding="1" border="0">
			<tr>
				<td  align="right" >
					<FONT size="2"><STRONG>
								<asp:RequiredFieldValidator id="reqFieldFirstName" ErrorMessage="First Name Is Required Field" ControlToValidate="inputFirstName"
									Display="Static" Runat="server">*</asp:RequiredFieldValidator>First Name</STRONG></FONT>:
				</td>
				<td align="left"></td>
				<td align="left"  colSpan="1" rowSpan="1">
					<asp:textbox id="inputFirstName" runat="server"  MaxLength="30"></asp:textbox></td>
                    <td>
                        <asp:CheckBox ID="chkLocked" runat="server" Text="Account Locked" />
                </td>
			</tr>
			<tr>
				<td  align="right" >
					<STRONG><FONT size="2">Middle Initial:</FONT></STRONG>
				</td>
				<td ></td>
				<td >
					<asp:textbox id="inputMiddleName" runat="server"  MaxLength="1" Width="30px"></asp:textbox></td>
				<td align="left" width="300"></td>
			</tr>
			<tr>
				<td  align="right" >
					<STRONG><FONT size="2">
								<asp:requiredfieldvalidator id="reqFieldLastName" runat="server" Font-Size="Smaller" ErrorMessage="Last Name Is Required Field"
									ControlToValidate="inputLastName">*</asp:requiredfieldvalidator>Last Name: </FONT>
						</STRONG>
					
				</td>
				<td ></td>
				<td >
					<asp:textbox id="inputLastName" runat="server"  MaxLength="30"></asp:textbox></td>
				<td align="left" width="300"></td>
			</tr>
			<tr>
				<td style="WIDTH: 207px; HEIGHT: 17px" align="right" >
					<STRONG><FONT size="2">
								<asp:requiredfieldvalidator id="reqFieldUserName" runat="server" Font-Size="Smaller" ErrorMessage="User Name Is Required Field"
									ControlToValidate="inputUserName">*</asp:requiredfieldvalidator>User Name:</FONT></STRONG>
				</td>
				<td  ></td>
				<td  >
					<asp:textbox id="inputUserName" runat="server"  MaxLength="40"></asp:textbox>&nbsp;
				</td>
				<td  align="left" width="300"></td>
			</tr>
			<tr>
				<td  align="right" >
                <strong>
					*Email:</strong></td>
				<td >&nbsp;</td>
				<td >
					<asp:textbox id="inputUserEmail" runat="server"  MaxLength="40"></asp:textbox>
				</td>
				<td align="left" width="300">
					&nbsp;</td>
			</tr>
			<tr>
				<td  align="right" >
					<STRONG><FONT size="2">
								<asp:requiredfieldvalidator id="rfPassword" runat="server" Font-Size="Smaller" ErrorMessage="Password Is Required Field"
									ControlToValidate="inputPW" Enabled="False">*</asp:requiredfieldvalidator>Password:</FONT></STRONG>
				</td>
				<td ></td>
				<td >
					<asp:textbox id="inputPW" runat="server"  MaxLength="20" TextMode="Password"></asp:textbox>&nbsp;
				</td>
				<td align="left" width="300">
					<asp:RegularExpressionValidator id="rePasswordLength" runat="server" Font-Size="Smaller" ErrorMessage="Password must be at least 4 characters"
						ControlToValidate="inputPW" Display="Dynamic" ValidationExpression="\w{4,}"></asp:RegularExpressionValidator>
                        <asp:LinkButton ID="btnResetPassword" runat="server" Text="Reset Password" ToolTip="Reset the user's password. A new password will be emailed to the user."></asp:LinkButton></td>
			</tr>
			<tr>
				<td style="WIDTH: 207px; HEIGHT: 26px" align="right" >
					<STRONG><FONT size="2">
								<asp:requiredfieldvalidator id="rfConfirmPassword" runat="server" Font-Size="Smaller" ErrorMessage="Password Is Required Field"
									ControlToValidate="inputConfirmPW" Enabled="False">*</asp:requiredfieldvalidator>Confirm 
								Password:</FONT></STRONG>
				</td>
				<td ></td>
				<td >
					<asp:textbox id="inputConfirmPW" runat="server"  MaxLength="20" TextMode="Password"></asp:textbox>&nbsp;
				</td>
				<td align="left" width="300">
					<asp:comparevalidator id="CompareValidator1" runat="server" Font-Size="Smaller" ErrorMessage="Password fields do not match."
						ControlToValidate="inputConfirmPW" Display="Dynamic" ControlToCompare="inputPW"></asp:comparevalidator></td>
			</tr>
			<tr>
				<td  align="right" >
					<FONT size="2"><STRONG>Start Date</STRONG></FONT>:
				</td>
				<td align="left" ></td>
				<td align="left"  colSpan="1" rowSpan="1">
					<asp:textbox id="txtStartDate" runat="server"  MaxLength="30"></asp:textbox></td>
			</tr>
			<tr>
				<td  align="right" >
					<FONT size="2"><STRONG>Termination Date</STRONG></FONT>:
				</td>
				<td align="left" ></td>
				<td align="left"  colSpan="1" rowSpan="1">
					<asp:textbox id="txtTermDate" runat="server"  MaxLength="30"></asp:textbox></td>
			</tr>
			<tr>
				<td style="WIDTH: 207px; HEIGHT: 23px" align="right" >
					<STRONG><FONT size="2">Title:</FONT></STRONG>
				</td>
				<td  ></td>
				<td  >
					<asp:DropDownList id="ddlTitle" runat="server" ></asp:DropDownList></td>
				<td  align="left" width="300"></td>
			</tr>
			<tr>
				<td  align="right" >
					<STRONG><FONT size="2">Employee Type:</FONT></STRONG>
				</td>
				<td  ></td>
				<td  >
					<asp:DropDownList id="inputEmployeeType" runat="server" ></asp:DropDownList></td>
				<td  align="left" width="300"></td>
			</tr>
			<tr>
				<td  align="right" >
					<STRONG><FONT size="2">PTO Group Type:</FONT></STRONG>
				</td>
				<td  ><FONT size="2"></FONT></td>
				<td  >
					<asp:DropDownList id="inputPTOGroup" runat="server" ></asp:DropDownList></td>
				<td  align="left" width="300"></td>
			</tr>
			<tr>
				<td  align="right" ><STRONG><FONT size="2">
							<STRONG><FONT size="2">Role:</FONT></STRONG>
						</FONT></STRONG>
				</td>
				<td  ></td>
				<td  >
					<asp:dropdownlist id="inputRole" runat="server" ></asp:dropdownlist></td>
				<td  align="left" width="300">
                    <asp:CheckBox ID="chkAdmin" runat="server" Text="Admin" />
                    <asp:CheckBox ID="chkProjectManager" runat="server" Text="Project Manager" />
                </td>
			</tr>
			<tr>
				<td style="WIDTH: 207px; HEIGHT: 17px" align="right" ><STRONG><FONT size="2">
							<STRONG><FONT size="2">Status:</FONT></STRONG>
						</FONT></STRONG>
				</td>
				<td  ></td>
				<td  >
					<asp:dropdownlist id="ddlEmpStatus" runat="server" ></asp:dropdownlist></td>
				<td  align="left" width="300"></td>
			</tr>
			<tr>
				<td style="WIDTH: 207px; HEIGHT: 21px" align="right" ><STRONG><FONT size="2"></FONT></STRONG></td>
				<td style="HEIGHT: 21px" ></td>
				<td style="HEIGHT: 21px" ></td>
				<td style="HEIGHT: 21px" align="left" width="300"></td>
			</tr>
			<tr>
				<td  align="right" >
					
						&nbsp;</td>
				<td ></td>
				<td >
					
						<asp:linkbutton id="btnSave" runat="server" onclick="btnSave_Click">Save</asp:linkbutton>
				</td>
				<td align="left" width="300"></td>
			</tr>
		</table>
</asp:Content>

