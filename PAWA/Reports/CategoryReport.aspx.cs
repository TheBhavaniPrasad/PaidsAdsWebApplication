using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;

namespace PAWA.Reports
{
    public partial class CategoryReport : System.Web.UI.Page
    {
        string Connstr = WebConfigurationManager.ConnectionStrings["Conn"].ToString();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                fillCategorylist();
            }
        }
        protected void txtCategoryId_TextChanged(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(Connstr))
            {

                string sqlstr = "select * from tblCategory where CategoryName like '" + txtCategoryId.Text + "%" + "'";
                SqlDataAdapter da = new SqlDataAdapter(sqlstr, con);
                DataTable dtcategory = new DataTable();
                da.Fill(dtcategory);
                GvCategory.DataSource = dtcategory;
                GvCategory.DataBind();
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
            string FileName = "tblCategory" + DateTime.Now + ".xls";
            StringWriter strwritter = new StringWriter();
            HtmlTextWriter htmltextwrtter = new HtmlTextWriter(strwritter);
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.ContentType = "application/vnd.ms-excel";
            Response.AddHeader("Content-Disposition", "attachment;filename=" + FileName);
            GvCategory.GridLines = GridLines.Both;
            GvCategory.HeaderStyle.Font.Bold = true;
            GvCategory.RenderControl(htmltextwrtter);
            Response.Write(strwritter.ToString());
            Response.End();
        }
        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Verifies that the control is rendered */
        }

        protected void fillCategorylist()
        {
            using (SqlConnection con = new SqlConnection(Connstr))
            {
                string sqlstr = "select * from tblCategory";
                SqlDataAdapter da = new SqlDataAdapter(sqlstr, con);
                DataTable dtcategory = new DataTable();
                da.Fill(dtcategory);
                GvCategory.DataSource = dtcategory;
                GvCategory.DataBind();
            }
        }


    }
}