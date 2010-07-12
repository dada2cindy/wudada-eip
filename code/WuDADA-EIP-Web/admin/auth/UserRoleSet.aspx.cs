using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using com.wudada.console.service.auth;
using Common.Logging;
using Spring.Context;
using Spring.Context.Support;
using com.wudada.console.service.auth.vo;
using com.wudada.console.generic.util;
using com.wudada.web.page;

public partial class admin_auth_UserRoleSet : BasePage
{
    IAuthService authService;
    Hashtable toBeApplyRole = new Hashtable();

    protected void Page_Load(object sender, EventArgs e)
    {
        base.Page_Load(sender, e);
        authService = (IAuthService)ctx.GetObject("AuthService");

        string userId = Request.QueryString["UserId"];
        if (!Page.IsPostBack)
        {
            initData(userId);
        }
    }


    protected void ddlUser_SelectedIndexChanged(object sender, EventArgs e)
    {
        string userId = ddlUser.SelectedValue;
        initData(userId);
    }

    protected void btnRemove_Click(object sender, EventArgs e)
    {
        lblMsg.Text = "";
        int selectedIndex = lbxHadRole.SelectedIndex;
        log.Debug("selected user = " + selectedIndex.ToString());

        if (selectedIndex != -1)
        {
            ListItem selectedItem = lbxHadRole.SelectedItem;
            lbxHadRole.Items.Remove(selectedItem);
            lblxToBeRole.Items.Add(selectedItem);
        }
        lbxHadRole.DataBind();
        lblxToBeRole.DataBind();

    }

    private void initData(string userId)
    {
        lblMsg.Text = "";
        ddlUser.Items.Clear();
        lblxToBeRole.Items.Clear();
        lbxHadRole.Items.Clear();

        initDDlUser(userId);

        string selectedUserId = ddlUser.SelectedValue;
        initRight(selectedUserId);
        initLeft(selectedUserId);

    }

    /// <summary>
    /// 初始化右邊視窗
    /// </summary>
    /// <param name="selectedUserId"></param>
    private void initLeft(string selectedUserId)
    {
        IList<LoginRole> allRoleList = myService.DaoGetAllVO<LoginRole>();

        LoginUser loginUser = authService.Get_LoginUser_ByUserId(selectedUserId);

        foreach (LoginRole role in allRoleList)
        {
            if (loginUser.BelongRoles == null || !CollectionUtil.ContainValue<LoginRole>(loginUser.BelongRoles, "RoleId", role.RoleId.ToString()))
            {
                ListItem item = new ListItem(role.RoleName, role.RoleId.ToString());
                lblxToBeRole.Items.Add(item);
            }
        }

        lblxToBeRole.DataBind();
    }

    /// <summary>
    /// 初始化左邊視窗
    /// </summary>
    /// <param name="selectedUserId"></param>
    private void initRight(string selectedUserId)
    {
        if (!string.IsNullOrEmpty(selectedUserId))
        {
            LoginUser loginUser = authService.Get_LoginUser_ByUserId(selectedUserId);
            IList<LoginRole> roleList = loginUser.BelongRoles;

            if (roleList != null)
            {
                foreach (LoginRole role in roleList)
                {
                    ListItem item = new ListItem(role.RoleName, role.RoleId.ToString());
                    lbxHadRole.Items.Add(item);
                }
            }

            lbxHadRole.DataBind();
        }
    }

    /// <summary>
    /// 初始化User下拉
    /// </summary>
    /// <param name="userId"></param>
    private void initDDlUser(string userId)
    {

        IList<LoginUser> users = myService.DaoGetAllVO<LoginUser>();
        foreach (LoginUser user in users)
        {
            ListItem item = new ListItem(user.UserId, user.UserId);
            ddlUser.Items.Add(item);

        }

        if (string.IsNullOrEmpty(userId))
        {
            ddlUser.SelectedIndex = 0;
        }
        else
        {
            ddlUser.SelectedValue = userId;
        }

        ddlUser.DataBind();
    }

    protected void lblxToBeRole_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void lbxHadRole_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        lblMsg.Text = "";
        int selectedIndex = lblxToBeRole.SelectedIndex;
        log.Debug("selected user = " + selectedIndex.ToString());

        if (selectedIndex != -1)
        {

            ListItem selectedItem = lblxToBeRole.SelectedItem;
            lblxToBeRole.Items.Remove(selectedItem);
            lbxHadRole.Items.Add(selectedItem);
        }
        lbxHadRole.DataBind();
        lblxToBeRole.DataBind();
    }
    protected void Button3_Click(object sender, ImageClickEventArgs e)
    {
        string userId = ddlUser.SelectedValue;
        LoginUser user = authService.Get_LoginUser_ByUserId(userId);
        List<LoginRole> loginRoleList = new List<LoginRole>();

        foreach (ListItem item in lbxHadRole.Items)
        {
            loginRoleList.Add(myService.DaoGetVOById<LoginRole>(int.Parse(item.Value)));
        }

        user.BelongRoles = loginRoleList;

        myService.DaoUpdate(user);

        //更新快取
        UserMenuFuncContainer.GetInstance().ResetAll();

        lblMsg.Text = "更新成功";
    }
}
