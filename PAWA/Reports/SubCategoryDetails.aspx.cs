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
    public partial class SubCategoryDetails : System.Web.UI.Page
    {
        string Connstr = WebConfigurationManager.ConnectionStrings["Conn"].ToString();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
              fillSubCategorylist();
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
            string FileName = "SubCategory" + DateTime.Now + ".xls";
            StringWriter strwritter = new StringWriter();
            HtmlTextWriter htmltextwrtter = new HtmlTextWriter(strwritter);
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.ContentType = "application/vnd.ms-excel";
            Response.AddHeader("Content-Disposition", "attachment;filename=" + FileName);
            GvSubCategory.GridLines = GridLines.Both;
            GvSubCategory.HeaderStyle.Font.Bold = true;
            GvSubCategory.RenderControl(htmltextwrtter);
            Response.Write(strwritter.ToString());
            Response.End();
        }
        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Verifies that the control is rendered */
        }
        protected void fillSubCategorylist()
        {
            using (SqlConnection con = new SqlConnection(Connstr))
            {
                string sqlstr = "select tc.CategoryName,SubCategoryId,SubCategoryName,s.IsActive from SubCategory s inner join tblCategory tc on tc.CategoryId=s.CategoryId where s.IsActive=1";
                SqlDataAdapter da = new SqlDataAdapter(sqlstr, con);
                DataTable dtSubcategory = new DataTable();
                da.Fill(dtSubcategory);
                GvSubCategory.DataSource = dtSubcategory;
                GvSubCategory.DataBind();
            }
        }
        protected void txtSubCategoryId_TextChanged(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(Connstr))
            {

                string sqlstr = "select tc.CategoryName,SubCategoryId,SubCategoryName,s.IsActive from SubCategory s inner join tblCategory tc on tc.CategoryId=s.CategoryId where SubCategoryName like '" + txtSubCategoryId.Text + "%" + "'";
                SqlDataAdapter da = new SqlDataAdapter(sqlstr, con);
                DataTable dtcategory = new DataTable();
                da.Fill(dtcategory);
                GvSubCategory.DataSource = dtcategory;
                GvSubCategory.DataBind();
            }
        }
    }
}