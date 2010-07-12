using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using com.wudada.console.service.auth;
using com.wudada.console.service.auth.vo;
using com.wudada.web.util.page;
using Common.Logging;
using com.wudada.web.page;
using com.wudada.console.service.common.vo;

public partial class admin_auth_FunctionPathSet : BasePage
{
    IAuthService authService;
 
    protected new void Page_Load(object sender, EventArgs e)
    {
        base.Page_Load(sender, e);
        authService = (IAuthService)ctx.GetObject("AuthService");

        if (!Page.IsPostBack)
        {
            InitData();
        }
    }

    private void InitData()
    {
        IList<MenuFunc> topMenu = authService.GetTopMenuFunc();

        UIHelper.AddDropDowListItem(ddlTopMenu, topMenu.GetEnumerator(), "MenuFuncName", "Id");

        if (topMenu != null && topMenu.Count > 0)
        {
            UIHelper.AddDropDowListItem(ddlSubMenu, topMenu[0].SubFuncs.GetEnumerator(), "MenuFuncName", "Id");

            fillData();
        }
    }

    private void fillData()
    {
        string selectedId = ddlSubMenu.SelectedValue;

        if (!string.IsNullOrEmpty(selectedId))
        {
            MenuFunc menufunc = myService.DaoGetVOById<MenuFunc>(int.Parse(selectedId));

            txtMainPath.Text = menufunc.MainPath;

            log.Debug("total count:" + menufunc.FuncionPaths.Count);

            gvPath.DataSource = menufunc.FuncionPaths;

            
            gvPath.DataBind();
        }
    }

    protected void gvAuth_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        string cmdName = e.CommandName;
        string cmdArg = e.CommandArgument.ToString();

        Control ctrl = ((Control)e.CommandSource);
        FunctionPath fp = myService.DaoGetVOById<FunctionPath>(int.Parse(cmdArg));

        switch (cmdName)
        {
            case "MyUpdate":
                fp.Path = UIHelper.FindTextBoxText(ctrl, "txtFPath");
                myService.DaoUpdate(fp);
                lblMsg.Text = MsgVO.UPDATE_OK;
                fillData();
                break;

            case "MyDel":
                fp.BelongMenuFunc.FuncionPaths.Remove(fp);
                myService.DaoDelete(fp);
                lblMsg.Text = MsgVO.DELETE_OK;
                fillData();
                break;
        }

    }
    protected void btnUpdate_Click(object sender, ImageClickEventArgs e)
    {
        MenuFunc menufunc = myService.DaoGetVOById<MenuFunc>(int.Parse(ddlSubMenu.SelectedValue));

        menufunc.MainPath = txtMainPath.Text.Trim();

        myService.DaoUpdate(menufunc);

        lblMsg.Text = MsgVO.UPDATE_OK;
    }
    protected void btnAdd_Click(object sender, ImageClickEventArgs e)
    {
        MenuFunc subMenu = myService.DaoGetVOById<MenuFunc>(int.Parse(ddlSubMenu.SelectedValue));

        if (subMenu.FuncionPaths == null)
        {
            subMenu.FuncionPaths = new List<FunctionPath>();
        }

        FunctionPath fph = new FunctionPath();
        fph.BelongMenuFunc = subMenu;
        fph.Path = txtPath.Text;
        myService.DaoInsert(fph);
        subMenu.FuncionPaths.Add(fph);
        myService.DaoUpdate(subMenu);

        lblMsg.Text = MsgVO.INSERT_OK;
        txtPath.Text = "";
        fillData();
    }
    protected void dllTopMenu_SelectedIndexChanged(object sender, EventArgs e)
    {
        MenuFunc topMenu = myService.DaoGetVOById<MenuFunc>(int.Parse(ddlTopMenu.SelectedValue));
        ddlSubMenu.Items.Clear();
        UIHelper.AddDropDowListItem(ddlSubMenu, topMenu.SubFuncs.GetEnumerator(), "MenuFuncName", "Id");
        fillData();
    }
    protected void ddlSubMenu_SelectedIndexChanged(object sender, EventArgs e)
    {
        fillData();
    }
}
