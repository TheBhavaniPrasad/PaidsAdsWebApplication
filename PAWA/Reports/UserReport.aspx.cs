using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PAWA.Reports
{
    public partial class UserReport : System.Web.UI.Page
    {
        string Connstr = WebConfigurationManager.ConnectionStrings["Conn"].ToString();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                fillUserslist();
            }
        }
        protected void fillUserslist()
        {
            using (SqlConnection con = new SqlConnection(Connstr))
            {
                string sqlstr = "select UserId,UName,Password,MNumber,EmailId,r.Role,u.IsActive from Register u inner join Roleform r on r.RoleId=u.Role where u.IsActive=1";
                SqlDataAdapter da = new SqlDataAdapter(sqlstr, con);
                DataTable dtuser = new DataTable();
                da.Fill(dtuser);
                GvUser.DataSource = dtuser;
                GvUser.DataBind();
            }
        }
        protected void BtnGenerate_Click(object sender, EventArgs e)
        {
            exportExcel();
        }
        private void exportExcel()
        {
            Response.Clear();
            Response.Buffer = true;
            Response.ClearContent();
            Response.ClearHeaders();
            Response.Charset = "";
            string FileName = "Register" + DateTime.Now + ".xls";
            StringWriter strwritter = new StringWriter();
            HtmlTextWriter htmltextwrtter = new HtmlTextWriter(strwritter);
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.ContentType = "application/vnd.ms-excel";
            Response.AddHeader("Content-Disposition", "attachment;filename=" + FileName);
            GvUser.GridLines = GridLines.Both;
            GvUser.HeaderStyle.Font.Bold = true;
            GvUser.RenderControl(htmltextwrtter);
            Response.Write(strwritter.ToString());
            Response.End();
        }
        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Verifies that the control is rendered */
        }

        protected void txtUserId_TextChanged(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(Connstr))
            {

                string sqlstr = "select UserId,UName,Password,MNumber,EmailId,r.Role,u.IsActive from Register u inner join Roleform r on r.RoleId=u.Role where UName like '" + txtUserId.Text + "%" + "'";
                SqlDataAdapter da = new SqlDataAdapter(sqlstr, con);
                DataTable dtuser = new DataTable();
                da.Fill(dtuser);
                GvUser.DataSource = dtuser;
                GvUser.DataBind();
            }

        }
    }
}