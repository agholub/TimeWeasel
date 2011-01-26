<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="manageClients.aspx.cs" Inherits="manageClients" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
<div>
    <h1>Clients</h1>

</div>
 <hr style="clear:both;" />
    <asp:LinkButton ID="btnCreateClient" runat="server" Font-Size="X-Small" Font-Bold="True"
        CssClass="small" CausesValidation="False" ToolTip="Create a new Client" OnClick="btnCreateClient_Click">Create New Client</asp:LinkButton>
         <hr style="clear:both;" />
    <asp:GridView ID="gvClients" runat="server" OnRowCommand="gvClients_OnRowCommand">
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:HiddenField ID="hidClientId" runat="server" Value='<%#DataBinder.Eval(Container.DataItem, "Client_Id")%>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:ButtonField DataTextField="Company_Name" ButtonType="Link"   />
        </Columns>
    </asp:GridView>
</asp:Content>
