<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="manageTask.aspx.cs" Inherits="manageTask" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<TABLE id="Table1" cellSpacing="1" cellPadding="1" width="100%" border="0">
		<TR>
			<TD style="WIDTH: 384px; HEIGHT: 16px">
				<P align="right"><STRONG><FONT size="2">Project:</FONT></STRONG></P>
			</TD>
			<TD style="HEIGHT: 16px">
				<asp:DropDownList id="inputProject" runat="server" Width="152px"></asp:DropDownList></TD>
		</TR>
		<TR>
			<TD style="WIDTH: 384px">
				<P align="right"><STRONG><FONT size="2">Task:</FONT></STRONG></P>
			</TD>
			<TD>
				<asp:TextBox id="inputTask" runat="server" Width="152px"></asp:TextBox></TD>
		</TR>
		<TR>
			<TD style="WIDTH: 384px">
				<P align="right">
					<asp:LinkButton id="lnkSave" runat="server">Save</asp:LinkButton></P>
			</TD>
			<TD>
				<P align="left">
					<asp:LinkButton id="lnkCancel"  runat="server">Cancel</asp:LinkButton></P>
			</TD>
		</TR>
	</TABLE>
</asp:Content>

