<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="manageContacts.aspx.cs" Inherits="manageContacts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<div>
     <h1>Contacts</h1>
        <hr style="clear:both;" />
    <asp:LinkButton ID="btnCreateContact" runat="server" Font-Size="X-Small" Font-Bold="True"
        CssClass="small" CausesValidation="False" ToolTip="Create a new Client" OnClick="btnCreateContact_Click">Create New Contact</asp:LinkButton>
        <hr style="clear:both;" />
</div>
   <asp:GridView ID="gvContacts" runat="server" OnRowCommand="gvContacts_OnRowCommand">
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:HiddenField ID="hidContactId" runat="server" Value='<%#DataBinder.Eval(Container.DataItem, "Contact_Id")%>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:ButtonField DataTextField="Full_Name" ButtonType="Link"   />
        </Columns>
    </asp:GridView>
</asp:Content>
