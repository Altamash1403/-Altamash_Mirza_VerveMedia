<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegisterForm.aspx.cs" Inherits="VerveMedia_Task.RegisterForm" EnableEventValidation="false" %>

<!DOCTYPE html>



<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 42%;
            margin-left: 406px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" Height="162px" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowCommand="GridView1_RowCommand" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating"  ShowFooter="True" Width="586px">
                            <Columns>
                                <asp:TemplateField HeaderText="Email">
                                    <EditItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("EmailID") %>'></asp:Label>
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        <% %>
                                        <asp:TextBox ID="txtaddemail" runat="server"></asp:TextBox>
                                        <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please Enter EmailID" ControlToValidate="txtaddemail"></asp:RequiredFieldValidator>--%>
                                    </FooterTemplate>
                                    <HeaderTemplate>
                                        EmailID
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("EmailID") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Password">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtPassword" runat="server" Text='<%# Bind("Password") %>'></asp:TextBox>

                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        <asp:TextBox ID="txtPasswordf" runat="server"></asp:TextBox>
                                        <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please Enter Password" ControlToValidate="txtPasswordf" ForeColor="#FF3300"></asp:RequiredFieldValidator>--%>
                                    </FooterTemplate>
                                    <HeaderTemplate>
                                        Password
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("Password") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Action">
                                    <EditItemTemplate>
                                        <asp:Button ID="Button3" runat="server" CommandName="Update" Text="Update" />
                                        <asp:Button ID="Button4" runat="server" CommandName="Cancel" Text="Cancel" />
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        <asp:Button ID="Button5" runat="server" CommandName="Add" Text="Add" />
                                    </FooterTemplate>
                                    <HeaderTemplate>
                                        Action
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Button ID="Button1" runat="server" CommandName="Edit" Text="Edit" />
                                        <asp:Button ID="Button2" runat="server" CommandName="Delete" Text="Delete" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <FooterStyle BackColor="#CCCCCC" />
                            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                            <RowStyle BackColor="White" />
                            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#F1F1F1" />
                            <SortedAscendingHeaderStyle BackColor="#808080" />
                            <SortedDescendingCellStyle BackColor="#CAC9C9" />
                            <SortedDescendingHeaderStyle BackColor="#383838" />
                        </asp:GridView>
                    </td>
                </tr>
            </table>
            <div>
                <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" >Download Gridview data in Excel</asp:LinkButton>
            </div>
        </div>
    </form>
</body>
</html>
