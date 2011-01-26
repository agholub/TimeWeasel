<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="manageClient.aspx.cs" Inherits="manageClient" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <table id="Table1" border="0">
        <tr>
            <td align="right">
                <font class="subsubheads" size="2">
                    <asp:RequiredFieldValidator ID="rvClientName" runat="server" ErrorMessage="Company Name"
                        ControlToValidate="txtCompanyName" Display="Static">*</asp:RequiredFieldValidator>Company
                    Name:</font>
            </td>
            <td>
                <asp:TextBox ID="txtCompanyName"  runat="server" CssClass="small" MaxLength="100"
                     Enabled="False"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right">
                    <font class="subsubheads" size="2">Website:</font>
            </td>
            
            <td>
                <asp:TextBox ID="txtWebsite"  runat="server" CssClass="small" MaxLength="100"
                    ></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right">
                <p align="right">
                    <font class="subsubheads" size="2">
                        <asp:RequiredFieldValidator ID="rvClientAddress" runat="server" ErrorMessage="Address 1"
                            ControlToValidate="txtAddress1" Display="Static">*</asp:RequiredFieldValidator>Address
                        1:</font></p>
            </td>
            <td>
                <asp:TextBox ID="txtAddress1"  runat="server" CssClass="small" MaxLength="200"
                    ></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right">
                <p align="right">
                    <font class="subsubheads" size="2">Address 2:</font></p>
            </td>
            <td>
                <asp:TextBox ID="txtAddress2"  runat="server" CssClass="small" MaxLength="50"
                    ></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td  align="right">
                <p align="right">
                    <font class="subsubheads" size="2">
                        <asp:RequiredFieldValidator ID="rvClientCity" runat="server" ErrorMessage="City"
                            ControlToValidate="txtCity" Display="Static">*</asp:RequiredFieldValidator>City</font></p>
            </td>
            <td >
                <asp:TextBox ID="txtCity"  runat="server" CssClass="small" MaxLength="50"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right">
                <p align="right">
                    <font class="subsubheads" size="2">State:</font>
                </p>
            </td>
            <td>
                <asp:DropDownList ID="ddlClientState"  runat="server" CssClass="small">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td align="right">
                
                    <font class="subsubheads" size="2">
                        <asp:RequiredFieldValidator ID="rvClientZip" runat="server" ErrorMessage="Zip Code"
                            ControlToValidate="txtZip" Display="Static">*</asp:RequiredFieldValidator><asp:CompareValidator
                                ID="vClientZip" runat="server" CssClass="small" ErrorMessage="Zip must be an integer"
                                ControlToValidate="txtZip" Display="Dynamic" Type="Integer" Operator="DataTypeCheck"></asp:CompareValidator>Zip:</font>
            </td>
            <td>
                <asp:TextBox ID="txtZip"  runat="server" CssClass="small" MaxLength="10"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right">
                
                    <font class="subsubheads" size="2">Comment:</font>
            </td>
            <td>
                <asp:TextBox ID="InputClientComment" Width="169px" runat="server" CssClass="small"
                    MaxLength="500" Height="112px" TextMode="MultiLine"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right" colspan="2">
                
            <asp:LinkButton ID="btnSave" runat="server" OnClick="btnSave_Click">Save</asp:LinkButton>
        
            </td>
        </tr>
    </table>
                    
</asp:Content>
