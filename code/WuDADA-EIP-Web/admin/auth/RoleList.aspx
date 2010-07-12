<%@ Page Title="" Language="C#" MasterPageFile="~/admin/masterpage/MasterPage.master"
    AutoEventWireup="true" CodeFile="RoleList.aspx.cs" Inherits="admin_auth_RoleList" %>

<%@ Register TagName="Loading" TagPrefix="ajax" Src="~/admin/common/AjaxLoading.ascx" %>
<%@ Register TagPrefix="Webdiyer" Namespace="Wuqi.Webdiyer" Assembly="aspnetpager" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
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
                                <td colspan="4" class="searchConHeader">
                                    查詢相關連結
                                </td>
                            </tr>
                            <tr>
                                <td class="searchConContent" align="right" width="70px" height="30px">
                                    群組名稱
                                </td>
                                <td class="searchConContent" width="200px">
                                    <asp:TextBox ID="txtSearchTitle" Width="190px" runat="server"></asp:TextBox>
                                </td>
                                <td class="searchConContent">
                                    <asp:Button ID="btnSearch" runat="server" Text="查詢" Width="60px" OnClick="btnSearch_Click"
                                        Height="20px" />&nbsp;
                                </td>
                                <td>
                                <asp:Button ID="btnAdd" runat="server" OnClick="btnAdd_Click"
                                            Text="新增群組" Height="20px" />
                                </td>
                            </tr>
                        </table>
                        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="searchResultTable">
                            <tr>
                                <td class="searchResultHeader">
                                    查詢結果<asp:Label ID="lblMsg" runat="server" CssClass="labelMsg" EnableViewState="False"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="center">
                                    <asp:GridView runat="server" AutoGenerateColumns="False" Width="100%" ID="GridView1"
                                        EmptyDataText="無符合資料" OnRowCommand="GridView1_RowCommand" OnRowDataBound="GridView1_RowDataBound">
                                        <RowStyle CssClass="gvRow" />
                                        <EmptyDataRowStyle CssClass="labelMsg" />
                                        <Columns>
                                            <asp:BoundField DataField="RoleName" HeaderText="群組">
                                                <ItemStyle HorizontalAlign="Left" />
                                            </asp:BoundField>
                                            <asp:TemplateField HeaderText="" ShowHeader="False">
                                                <ItemTemplate>
                                                    <asp:Button ID="Button1" runat="server" Text="修改" CausesValidation="false" CommandName="MyEdit"
                                                        CommandArgument='<%# Eval("RoleId") %>' Height="20px" />
                                                                                                
                                                
                                                    </ItemTemplate>
                                                <HeaderStyle Width="50px" />
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="">
                                                <ItemTemplate>
                                                    <asp:Button ID="Button2" runat="server" Text="刪除" OnClientClick="return confirm('確定刪除?')"
                                                        CommandArgument='<%# Eval("RoleId") %>' CommandName="MyDel" Height="20px" />
                                            
                                                </itemtemplate>
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
                                    <Webdiyer:AspNetPager ID="AspNetPager1" runat="server" PageIndexOutOfRangeErrorMessage="頁索引超出範圍！"
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
