<%@ Page Title="" Language="C#" MasterPageFile="~/admin/masterpage/MasterPage.master"
    AutoEventWireup="true" CodeFile="UserList.aspx.cs" Inherits="admin_auth_UserList" %>

<%@ Register TagName="Loading" TagPrefix="ajax" Src="~/admin/common/AjaxLoading.ascx" %>
<%@ Register TagPrefix="Webdiyer" Namespace="Wuqi.Webdiyer" Assembly="aspnetpager" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style1
        {
            font-size: 13px;
            background-color: #cccccc;
            color: #343434;
            height: 25px;
            padding-left: 5px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ajax:Loading ID="Loading" runat="server" />
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table border="0" cellpadding="0" cellspacing="0" width="96%">
                <tr>
                    <td>
                        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="searchConTable">
                            <tr>
                                <td colspan="4" class="style1">
                                    �d��
                                </td>
                            </tr>
                            <tr>
                                <td class="searchConContent" align="right" width="70px" height="30px">
                                    �b���G
                                </td>
                                <td class="searchConContent" width="200px">
                                    <asp:TextBox ID="txtSearchTitle" Width="190px" runat="server"></asp:TextBox>
                                </td>
                                <td class="searchConContent">
                                    <asp:Button ID="btnSearch" runat="server" Text="�d��" Width="60px" OnClick="btnSearch_Click"
                                        Height="20px" />&nbsp;
                                </td>
                                <td>
                                    <asp:Button ID="btnAdd" runat="server" OnClick="btnAdd_Click" Text="�s�W�b��" Height="20px" />
                                </td>
                            </tr>
                        </table>
                        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="searchResultTable">
                            <tr>
                                <td class="searchResultHeader">
                                    �d�ߵ��G<asp:Label ID="lblMsg" runat="server" CssClass="labelMsg" EnableViewState="False"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="center">
                                    <asp:GridView runat="server" AutoGenerateColumns="False" Width="100%" ID="GridView1"
                                        EmptyDataText="�L�ŦX���" OnRowCommand="GridView1_RowCommand" OnRowDataBound="GridView1_RowDataBound">
                                        <RowStyle CssClass="gvRow" />
                                        <EmptyDataRowStyle CssClass="labelMsg" />
                                        <Columns>
                                            <asp:BoundField DataField="UserId" HeaderText="�b��">
                                                <ItemStyle HorizontalAlign="Left" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="Name" HeaderText="�m�W">
                                                <ItemStyle HorizontalAlign="Left" />
                                            </asp:BoundField>                                            
                                            
                                            <asp:TemplateField HeaderText="" ShowHeader="False">
                                                <ItemTemplate>
                                                    <asp:Button ID="Button1" runat="server" Text="�ק�" CausesValidation="false" CommandName="MyEdit"
                                                        CommandArgument='<%# Eval("UserId") %>' Height="20px" />
                                                </ItemTemplate>
                                                <HeaderStyle Width="50px" />
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="">
                                                <ItemTemplate>
                                                    <asp:Button ID="Button2" runat="server" Text="�R��" OnClientClick="return confirm('�T�w�R��?')"
                                                        CommandArgument='<%# Eval("UserId") %>' CommandName="MyDel" Height="20px" />
                                                </ItemTemplate>
                                                <HeaderStyle Width="50px" />
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                        </Columns>
                                        <HeaderStyle CssClass="gvHeader" />
                                    </asp:GridView>
                                </td>
                            </tr>
                            <tr>
                                <td height="30px">
                                    <Webdiyer:AspNetPager ID="AspNetPager1" runat="server" PageIndexOutOfRangeErrorMessage="�����޶W�X�d��I"
                                        Width="100%" OnPageChanged="AspNetPager1_PageChanged" PageSize="15" CssClass="gvPage">
                                    </Webdiyer:AspNetPager>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
