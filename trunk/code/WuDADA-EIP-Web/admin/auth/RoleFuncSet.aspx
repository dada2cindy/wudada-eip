<%@ Page Title="" Language="C#" MasterPageFile="~/admin/masterpage/MasterPage.master"
    AutoEventWireup="true" CodeFile="RoleFuncSet.aspx.cs" Inherits="admin_auth_RoleFuncSet" %>

<%@ Register TagName="Loading" TagPrefix="ajax" Src="~/admin/common/AjaxLoading.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:Panel ID="Panel1" runat="server" DefaultButton="btnUpdate">
     <ajax:Loading ID="Loading" runat="server" />
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <table style="border: 1px solid #58a960; width: 100%">
                    <tr>
                        <td height="30px" class="labelHeader">
                            <div align="center" id="title">
                                群組權限設定</div>
                            <hr border="1" />
                        </td>
                    </tr>
                    <tr>
                        <td height="30px" class="labelHeader">
                            <div align="center">
                                群組名稱：
                                <asp:DropDownList ID="ddlRole" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlRole_SelectedIndexChanged">
                                </asp:DropDownList>
                                &nbsp;&nbsp; 功能群組
                                <asp:DropDownList ID="ddlMenuFunc" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlMenuFunc_SelectedIndexChanged">
                                </asp:DropDownList>
                                &nbsp;
                            </div>
                        </td>
                    </tr>
                    <tr class="labelHeader">
                        <td height="30px" align="center">
                            <br />
                            設定權限
                            <hr border="1" />
                            <br />
                            <asp:GridView ID="gvAuth" runat="server" AutoGenerateColumns="False" Width="500px">
                                <RowStyle CssClass="gvRow" />
                                <Columns>
                                    <asp:BoundField HeaderText="名稱" DataField="Name" ItemStyle-HorizontalAlign="Left">
                                        <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                    </asp:BoundField>
                                        <asp:TemplateField HeaderText="權限">
                                            <HeaderTemplate>
                                                <div align="center">
                                                    選單權限
                                                    <br />
                                                    <asp:CheckBox ID="ckAll" runat="server" AutoPostBack="true" OnCheckedChanged="ckAll_CheckedChanged" />
                                                </div>
                                            </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="ckIsAuth" runat="server" Checked='<%# Bind("IsAuth") %>' />
                                            &nbsp;<asp:HiddenField ID="hdnId" runat="server" Value='<%# Bind("Id") %>' />
                                        </ItemTemplate>
                                        <HeaderStyle Width="250px" />
                                    </asp:TemplateField>                    
                                
                                </Columns>
                                <HeaderStyle CssClass="gvHeader" />
                            </asp:GridView>
                        </td>
                    </tr>
                    <tr class="labelHeader">
                        <td width="34%" align="center">
                            <asp:ImageButton ID="btnUpdate" runat="server" ImageUrl="~/admin/auth/images/btn_save.jpg"
                                OnClick="btnUpdate_Click" />
                        </td>
                    </tr>
                    <tr class="labelHeader">
                        <td width="34%" align="center" class="style1">
                            <asp:Label ID="lblMsg" runat="server" ForeColor="Red"></asp:Label>
                        </td>
                    </tr>
                </table>
            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>
</asp:Content>
