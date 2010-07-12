using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using com.wudada.web.page;
using com.wudada.console.service.auth.vo;
using com.wudada.web.util.page;
using com.wudada.web.auth;
using com.wudada.web.mail;

public partial class admin_login_forgetPass : BasePage
{
    WuDADAMailService wudadaMailService = new WuDADAMailService();

    protected new void Page_Load(object sender, EventArgs e)
    {
        base.Page_Load(sender, e);

    }

    protected void imgbtnForgetPass_Click(object sender, ImageClickEventArgs e)
    {
        string msg = "帳號或E-mail錯誤";

        if (!string.IsNullOrEmpty(txtId.Text.Trim()) && !string.IsNullOrEmpty(txtEmail.Text.Trim()))
        {
            LoginUser user = myService.DaoGetVOById<LoginUser>(txtId.Text.Trim());
            if (user != null)
            {
                if (user.Email.Equals(txtEmail.Text.Trim()))
                {
                    wudadaMailService.SendMail_ToLoginUser_ResetPass(user.UserId);
                    msg = "已寄發新密碼給您，請於收信後登入系統更改密碼";
                }
            }
        }

        string JsStr = JavascriptUtil.AlertJS(msg);
        ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), "data", JsStr, false);
    }
}
