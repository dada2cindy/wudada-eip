using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using com.wudada.web.page;
using com.wudada.console.service.auth.vo;
using com.wudada.web.util.page;

public partial class test : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        base.Page_Load(sender, e);
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //LoginUser loginUserVO = new LoginUser();
        //UIHelper.FillVO2(pnlUI, loginUserVO);

        //txtLoginUserUserId.Text = "測試" + loginUserVO.UserId;

        LoginUser loginUserVO = myService.DaoGetVOById<LoginUser>(1);
        UIHelper.FillUI2(pnlUI, loginUserVO);
    }
}
