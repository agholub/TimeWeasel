<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="manageUsers.aspx.cs" Inherits="manageUsers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div>
        <h1>
            Users</h1>
    </div>
    <hr style="clear: both;" />
    <asp:LinkButton ID="lnkCreateNewUser" OnClick="lnkCreateNewUser_Click" runat="server"
        Font-Size="Smaller" CausesValidation="False">Create New User</asp:LinkButton>
    <hr style="clear: both;" />
    <asp:GridView ID="gvUsers" runat="server" AutoGenerateColumns="false" DataKeyNames="User_ID,Username"
        OnRowCommand="gvUsers_OnRowCommand">
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:HiddenField ID="hidUserId" runat="server" Value='<%#DataBinder.Eval(Container.DataItem, "User_Id")%>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField Visible="false" DataField="User_ID" />
            <asp:ButtonField HeaderText="Username" DataTextField="Username" ButtonType="Link" />
            <asp:BoundField HeaderText="First" DataField="First" />
            <asp:BoundField HeaderText="Last" DataField="Last" />
        </Columns>
        <EmptyDataTemplate>
            No Records</EmptyDataTemplate>
    </asp:GridView>
</asp:Content>
