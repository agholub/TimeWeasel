<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="managePto.aspx.cs" Inherits="managePto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<div><h1>PTO Administration</h1></div><br />
	<TABLE id="Table1" cellSpacing="1" cellPadding="1" border="0">
		<TR>
			<TD class="subheads" colSpan="2">Adjust PTO Hours</TD>
		</TR>
		<TR>
			<TD class="subheads" colSpan="2">
				<P align="center"><asp:label id="Message" runat="server"></asp:label></P>
			</TD>
		</TR>
		<TR>
			<TD class="subsubheads" style="WIDTH: 95px">
				<P class="subsubheads" align="right">User</P>
			</TD>
			<TD class="subsubheads"><asp:dropdownlist id="ddlUser" runat="server" CssClass="small" AutoPostBack="True"></asp:dropdownlist>&nbsp;Available 
				Hours:
				<asp:label id="AvailableHours" runat="server"></asp:label></TD>
		</TR>
		<TR>
			<TD class="subsubheads" style="WIDTH: 95px">
				<P class="subsubheads" align="right">Hours</P>
			</TD>
			<TD><asp:textbox id="txtHours" runat="server" Width="50px" CssClass="small"></asp:textbox></TD>
		</TR>
		<TR>
			<TD class="subsubheads" style="WIDTH: 95px">
				<P class="subsubheads" align="right">Reason</P>
			</TD>
			<TD><asp:textbox id="txtNote" runat="server" Width="250px" CssClass="small" MaxLength="255" Height="40px"></asp:textbox></TD>
		</TR>
		<TR>
			<TD class="subsubheads" style="WIDTH: 95px">
				<P align="right">&nbsp;</P>
			</TD>
			<TD>
				<P align="left"><asp:linkbutton id="lnkSave" runat="server">Save</asp:linkbutton></P>
			</TD>
		</TR>
	</TABLE>
</P>
<P class="SubHeads">PTO Request History</P>
<P class="SubHeads">
	<asp:datagrid id="dgHistory" runat="server" Width="745px" AutoGenerateColumns="False" EditItemStyle-BackColor="#ffffcc"
		EditItemStyle-Width="1" DataKeyField="ID" ShowFooter="True" >
		<EditItemStyle Width="1px" BackColor="#FFFFCC"></EditItemStyle>
		<ItemStyle HorizontalAlign="Right" CssClass="small"></ItemStyle>
		<HeaderStyle HorizontalAlign="Right" CssClass="subsubheads"></HeaderStyle>
		<FooterStyle HorizontalAlign="Right" CssClass="small"></FooterStyle>
		<Columns>
			<asp:BoundColumn Visible="False" DataField="ID" HeaderText="HistoryID"></asp:BoundColumn>
			<asp:TemplateColumn HeaderText="Start Date">
				<ItemTemplate>
					<%#DataBinder.Eval(Container.DataItem, "Start_Date")%>
				</ItemTemplate>
			</asp:TemplateColumn>
			<asp:TemplateColumn HeaderText="End Date">
				<ItemTemplate>
					<%#DataBinder.Eval(Container.DataItem, "End_Date")%>
				</ItemTemplate>
			</asp:TemplateColumn>
			<asp:TemplateColumn HeaderText="Hours">
				<ItemTemplate>
					<%#DataBinder.Eval(Container.DataItem, "Hours")%>
				</ItemTemplate>
			</asp:TemplateColumn>
			<asp:TemplateColumn HeaderText="Notes">
				<ItemTemplate>
					<%#DataBinder.Eval(Container.DataItem, "Notes")%>
				</ItemTemplate>
			</asp:TemplateColumn>
			<asp:TemplateColumn HeaderText="Status" ItemStyle-horizontalalign="Left" HeaderStyle-HorizontalAlign="Left">
				<ItemTemplate>
					<asp:DropDownList runat="server" ID="ddlStatus" Enabled="False" CssClass="small">
						<asp:ListItem Value="0">Undecided</asp:ListItem>
						<asp:ListItem Value="1">Approved</asp:ListItem>
						<asp:ListItem Value="2">Denied</asp:ListItem>
					</asp:DropDownList>
				</ItemTemplate>
			</asp:TemplateColumn>
			<asp:EditCommandColumn ButtonType="LinkButton" UpdateText="Save" CancelText="Cancel" EditText="Delete"></asp:EditCommandColumn>
			<asp:TemplateColumn HeaderText="Paid">
				<ItemTemplate>
					<%#DataBinder.Eval(Container.DataItem, "Paid")%>
				</ItemTemplate>
			</asp:TemplateColumn>
		</Columns>
	</asp:datagrid>
<P class="subheads">PTO Earned History
</P>
<asp:datagrid id="dgEarnedHistory" runat="server" Width="745px" DataKeyField="ID" EditItemStyle-Width="1"
	EditItemStyle-BackColor="#ffffcc" AutoGenerateColumns="False" ShowFooter="True">
	<EditItemStyle Width="1px" BackColor="#FFFFCC"></EditItemStyle>
	<ItemStyle HorizontalAlign="Right" CssClass="small"></ItemStyle>
	<HeaderStyle HorizontalAlign="Right" CssClass="subsubheads"></HeaderStyle>
	<FooterStyle HorizontalAlign="Right" CssClass="small"></FooterStyle>
	<Columns>
		<asp:BoundColumn Visible="False" DataField="ID" HeaderText="HistoryID"></asp:BoundColumn>
		<asp:TemplateColumn HeaderText="Earned">
			<ItemTemplate>
				<%#DataBinder.Eval(Container.DataItem, "Date_Earned")%>
			</ItemTemplate>
		</asp:TemplateColumn>
		<asp:TemplateColumn HeaderText="Hours">
			<ItemTemplate>
				<%#DataBinder.Eval(Container.DataItem, "Hours")%>
			</ItemTemplate>
		</asp:TemplateColumn>
		<asp:TemplateColumn HeaderText="Used">
			<ItemTemplate>
				<%#DataBinder.Eval(Container.DataItem, "Date_Used")%>
			</ItemTemplate>
		</asp:TemplateColumn>
		<asp:TemplateColumn HeaderText="Hours Used">
			<ItemTemplate>
				<%#DataBinder.Eval(Container.DataItem, "Hours_Used")%>
			</ItemTemplate>
		</asp:TemplateColumn>
	</Columns>
</asp:datagrid>
<P>&nbsp;</P>
<P class="subheads">All Current PTO Requests (1 week past to 4 weeks ahead)</P>
<P class="subheads">
	<asp:DataGrid id="dgAllCurrentRequests" runat="server" CssClass="small" Width="745px"></asp:DataGrid></P>
<P class="subheads">
	&nbsp;</P>

</asp:Content>

