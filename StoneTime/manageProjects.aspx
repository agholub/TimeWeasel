<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="manageProjects.aspx.cs" Inherits="manageProjects" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<div><h1>Projects</h1>
        <hr style="clear:both;" />
    </div>
<div>
Show: <asp:DropDownList ID="ddlActiveInactive" runat="server" CssClass="dropdown" 
        AutoPostBack="True" 
        ViewStateMode="Enabled" OnSelectedIndexChanged="ddlActiveInactive_SelectedIndexChanged">
<asp:ListItem Text="Active Projects" Value="Active" Selected="True"></asp:ListItem>
<asp:ListItem Text="All Projects" Value="All"></asp:ListItem>
</asp:DropDownList>
&nbsp;&nbsp;
<asp:LinkButton ID="btnCreateProject" runat="server" Font-Size="X-Small" Font-Bold="True"
        CssClass="small" CausesValidation="False" ToolTip="Create a new Client" 
        onclick="btnCreateProject_Click">Create New Project</asp:LinkButton>
        <hr style="clear:both;" />
    <asp:GridView ID="gvProjects" runat="server" OnRowCommand="gvProjects_OnRowCommand">
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:HiddenField ID="hidProjectId" runat="server" Value='<%#DataBinder.Eval(Container.DataItem, "Project_Id")%>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:ButtonField DataTextField="Project_Code" ButtonType="Link"   />
        </Columns>
    </asp:GridView>
   
                 </div>
</asp:Content>


