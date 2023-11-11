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
    public partial class ClientReports : System.Web.UI.Page
    {
        string Connstr = WebConfigurationManager.ConnectionStrings["Conn"].ToString();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FillRoleslist();
            }
        }
        protected void FillRoleslist()
        {
            using (SqlConnection con = new SqlConnection(Connstr))
            {
                string sqlstr = "select RoleId,Role from Roleform where IsActive=1";
                SqlDataAdapter da = new SqlDataAdapter(sqlstr, con);
                DataTable dtroles = new DataTable();
                da.Fill(dtroles);
                GvReport.DataSource = dtroles;
                GvReport.DataBind();

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
            string FileName = "Roleform" + DateTime.Now + ".xls";
            StringWriter strwritter = new StringWriter();
            HtmlTextWriter htmltextwrtter = new HtmlTextWriter(strwritter);
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.ContentType = "application/vnd.ms-excel";
            Response.AddHeader("Content-Disposition", "attachment;filename=" + FileName);
            GvReport.GridLines = GridLines.Both;
            GvReport.HeaderStyle.Font.Bold = true;
            GvReport.RenderControl(htmltextwrtter);
            Response.Write(strwritter.ToString());
            Response.End();
        }
        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Verifies that the control is rendered */
        }
        protected void txtRoleId_TextChanged(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(Connstr))
            {

                string sqlstr = "select * from Roleform where RoleId like '" + txtRoleId.Text + "%" + "'";
                SqlDataAdapter da = new SqlDataAdapter(sqlstr, con);
                DataTable dtroles = new DataTable();
                da.Fill(dtroles);
                GvReport.DataSource = dtroles;
                GvReport.DataBind();
            }
        }
    }
}
