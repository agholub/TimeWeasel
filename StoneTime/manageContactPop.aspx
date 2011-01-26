<%@ Page Language="C#" AutoEventWireup="true" CodeFile="manageContactPop.aspx.cs" Inherits="manageContact" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Contact</title>
    <link href="~/Styles/Site.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style1
        {
            text-align: right;
        }
        .style2
        {
            width: 164px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <script type="text/javascript">
        function SubmitForm() { 
        
        }
    </script>
    <div>
        <div class="title"><h1>&nbsp; Contact Maintenance</h1></div>
        <br />
        <br />
        <br />
        <div>
        <table style="border-width: 5px">
            <tr>
                <td class="style1">
                    Client:
                </td>
                <td class="style2">
                    <asp:dropdownlist id="ddlContactClient" Width="164px" runat="server" CssClass="small"></asp:dropdownlist>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    <asp:requiredfieldvalidator id="Requiredfieldvalidator5" Display="Static" ControlToValidate="txtFirstName" ErrorMessage="First Name"
											Runat="server">*</asp:requiredfieldvalidator>First Name:
                </td>
                <td class="style2">
                    <asp:textbox id="txtFirstName" Width="164px" runat="server" CssClass="small" Height="21px" MaxLength="50"></asp:textbox>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    Middle Initial:
                </td>
                <td class="style2">
                    <asp:textbox id="txtMiddleName" Width="164px" runat="server" CssClass="small" Height="21px" MaxLength="1"></asp:textbox>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    <asp:requiredfieldvalidator id="Requiredfieldvalidator4" Display="Static" ControlToValidate="txtLastName" ErrorMessage="Last Name"
						Runat="server">*</asp:requiredfieldvalidator>Last Name:
                </td>
                <td class="style2">
                    <asp:textbox id="txtLastName" Width="164px" runat="server" CssClass="small" Height="21px" MaxLength="50"></asp:textbox>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    Email:
                </td>
                <td class="style2">
                    <asp:textbox id="txtEmail" Width="164px" runat="server" CssClass="small" MaxLength="100"></asp:textbox>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    <asp:comparevalidator id="Comparevalidator2" runat="server" CssClass="small" Display="Dynamic" ControlToValidate="txtPhone"
						ErrorMessage="Phone must be numeric" Operator="DataTypeCheck" Type="Double"></asp:comparevalidator>Phone:
                </td>
                <td class="style2">
                    <asp:textbox id="txtPhone" Width="164px" runat="server" CssClass="small" MaxLength="12"></asp:textbox>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    Fax:
                </td>
                <td class="style2">
                    <asp:textbox id="txtFax" Width="164px" runat="server" CssClass="small" MaxLength="12"></asp:textbox>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    <asp:requiredfieldvalidator id="Requiredfieldvalidator3" Display="Static" ControlToValidate="txtAddress1" ErrorMessage="Address"
						Runat="server">*</asp:requiredfieldvalidator>Address1:
                </td>
                <td class="style2">
                    <asp:textbox id="txtAddress1" Width="164px" runat="server" CssClass="small" MaxLength="200"></asp:textbox>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    Address2:
                </td>
                <td class="style2">
                    <asp:textbox id="txtAddress2" Width="164px" runat="server" CssClass="small" MaxLength="50"></asp:textbox>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    <asp:requiredfieldvalidator id="Requiredfieldvalidator2" Display="Static" ControlToValidate="txtCity" ErrorMessage="City"
						Runat="server">*</asp:requiredfieldvalidator>City:
                </td>
                <td class="style2">
                    <asp:textbox id="txtCity" Width="164px" runat="server" CssClass="small" MaxLength="50"></asp:textbox>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    State:
                </td>
                <td class="style2">
                    <asp:dropdownlist id="ddlStates" Width="164px" runat="server" CssClass="small"></asp:dropdownlist>
                </td>
            </tr>
            <tr>
                <td class="style1">
                <asp:comparevalidator id="Comparevalidator1" runat="server" CssClass="small" Display="Dynamic" ControlToValidate="txtZip"
							ErrorMessage="Zip must be an integer" Operator="DataTypeCheck" Type="Integer"></asp:comparevalidator>
                            <asp:requiredfieldvalidator id="Requiredfieldvalidator1" Display="Static" ControlToValidate="txtZip" ErrorMessage="Zip Code"
						Runat="server">*</asp:requiredfieldvalidator>Zip:
                </td>
                <td class="style2">
                    <asp:textbox id="txtZip" Width="164px" runat="server" CssClass="small" MaxLength="10"></asp:textbox>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    <input type="button" id="btnCancel" value="Cancel" onclick="javascript:window.returnValue='';window.close();" />
                    
                </td>
                <td class="style2">
                    <input type="button" id="btnHidSave" value="Save" 
                        onclick="javascript:if(Page_IsValid){SubmitForm();}else{return false;}" 
                        style="display: none" />
                    <asp:Button ID="btnSave" runat="server" onclick="Button1_Click" Text="Save" />
        
                </td>
            </tr>
        </table>
       
		</div>
		<asp:validationsummary id="ValSum" Runat="server" ShowSummary="False" ShowMessageBox="True" HeaderText="The following fields are required: "
	DisplayMode="BulletList"></asp:validationsummary>

    </div>
    </form>
</body>
</html>
