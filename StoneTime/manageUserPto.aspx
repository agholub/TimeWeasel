<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="manageUserPto.aspx.cs" Inherits="manageUserPto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<div><h1>PTO Overview</h1></div><br />
    <TABLE id="Table1" cellSpacing="1" cellPadding="1" width="755" border="0">
				<TR>
					<TD style="WIDTH: 366px">
						<P><FONT class="subheads">Request PTO</FONT>
						</P>
						<P>&nbsp;</P>
					</TD>
					<TD>
						<P class="subsubheads" align="right">&nbsp;</P>
					</TD>
				</TR>
				<TR>
					<TD class="subsubheads" style="WIDTH: 366px">
						<P class="subsubheads" align="right">Requested Hours:</P>
					</TD>
					<TD><asp:listbox id="ListBox1" runat="server" CssClass="small" Rows="1">
							<asp:ListItem Value="4">4</asp:ListItem>
							<asp:ListItem Value="8">8</asp:ListItem>
							<asp:ListItem Value="12">12</asp:ListItem>
							<asp:ListItem Value="16">16</asp:ListItem>
							<asp:ListItem Value="20">20</asp:ListItem>
							<asp:ListItem Value="24">24</asp:ListItem>
							<asp:ListItem Value="28">28</asp:ListItem>
							<asp:ListItem Value="32">32</asp:ListItem>
							<asp:ListItem Value="36">36</asp:ListItem>
							<asp:ListItem Value="40">40</asp:ListItem>
							<asp:ListItem></asp:ListItem>
						</asp:listbox></TD>
				</TR>
				<TR>
					<TD class="subsubheads" style="WIDTH: 366px" vAlign="middle">
						<P class="subsubheads" align="right">Start Date:</P>
					</TD>
					<TD vAlign="middle"><asp:textbox id="TextBox1" runat="server" Width="75px" CssClass="small"></asp:textbox><asp:imagebutton id="ImageButton1" runat="server" Height="25px" ImageUrl="images\calendar.gif"></asp:imagebutton><A href="calendar.aspx&#9;&#9;"></A></TD>
				</TR>
				<TR>
					<TD class="subsubheads" style="WIDTH: 366px">
						<P class="subsubheads" align="right">End Date:</P>
					</TD>
					<TD><asp:textbox id="TextBox2" runat="server" Width="75px" CssClass="small"></asp:textbox><asp:imagebutton id="ImageButton2" runat="server" Height="25px" ImageUrl="images\calendar.gif"></asp:imagebutton></TD>
				</TR>
				<TR>
					<TD class="subsubheads" style="WIDTH: 366px">
						<P class="subsubheads" align="right">Notes:</P>
					</TD>
					<TD><asp:textbox id="TextBox3" runat="server" CssClass="small" MaxLength="1000" TextMode="MultiLine"></asp:textbox></TD>
				</TR>
			</TABLE>
			<P>
				<TABLE id="Table3" style="WIDTH: 755px; HEIGHT: 48px" cellSpacing="1" cellPadding="1" width="755"
					border="0" DESIGNTIMEDRAGDROP="533">
					<TR>
						<TD>
							<P align="center">
								<asp:linkbutton id="lnkClose" runat="server">Close</asp:linkbutton>&nbsp;|
								<asp:linkbutton id="lnkSave" runat="server">Save</asp:linkbutton></P>
						</TD>
					</TR>
					<TR>
						<TD class="small">* Requesting PTO Time will send a notification to each of the 
							Xteric project managers and administrators. You will be notified of any issues 
							regarding your PTO request. Please request PTO Time 2 weeks or more in advance. 
							When PTO time is taken, you must still enter this time as project code 
							XTG-PTO-01 in Time Weasel.</TD>
					</TR>
				</TABLE>
			</P>
			<P>&nbsp;</P>
			<P>
				<TABLE id="Table2" cellSpacing="1" cellPadding="1" width="755" border="0">
					<TR>
						<TD><FONT class="subheads">PTO History</FONT></TD>
					</TR>
					<TR>
						<TD>
							<asp:datagrid id="dgHistory" runat="server" Width="745px" DataKeyField="ID" EditItemStyle-Width="1"
								EditItemStyle-BackColor="#ffffcc" AutoGenerateColumns="False"  ShowFooter="True">
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
							</asp:datagrid></TD>
					</TR>
					<TR>
						<TD></TD>
					</TR>
				</TABLE>
			</P>
			<P>&nbsp;</P>
			<P class="subheads">PTO Earned History</P>
			<P><asp:datagrid id="dgEarnedHistory" runat="server" Width="745px" DataKeyField="ID" EditItemStyle-Width="1"
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
				</asp:datagrid></P>
</asp:Content>

