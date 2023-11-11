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
    public partial class ItemReport : System.Web.UI.Page
    {
        string Connstr = WebConfigurationManager.ConnectionStrings["Conn"].ToString();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FillItemlist();
            }

        }
        protected void FillItemlist()
        {
            using (SqlConnection con = new SqlConnection(Connstr))
            {
                string sqlstr = "select ItemNo,tc.CategoryName,s.SubCategoryName,ItemName,ItemPrice,FileName,a.IsActive from AdItem a inner join tblCategory tc on tc.CategoryId=a.CategoryId inner join SubCategory s on s.SubCategoryId=a.SubCategoryId where a.IsActive=1";
                SqlDataAdapter da = new SqlDataAdapter(sqlstr, con);
                DataTable dtitem = new DataTable();
                da.Fill(dtitem);
                GvItem.DataSource = dtitem;
                GvItem.DataBind();

            }
        }
        protected void TxtItemId_TextChanged(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(Connstr))
            {

                string sqlstr = "select ItemNo,tc.CategoryName,s.SubCategoryName,ItemName,ItemPrice,FileName,a.IsActive from AdItem a inner join tblCategory tc on tc.CategoryId=a.CategoryId inner join SubCategory s on s.SubCategoryId=a.SubCategoryId where a.IsActive=1 and ItemNo like '" + TxtItemId.Text + "%" + "'";
                SqlDataAdapter da = new SqlDataAdapter(sqlstr, con);
                DataTable dtitem = new DataTable();
                da.Fill(dtitem);
                GvItem.DataSource = dtitem;
                GvItem.DataBind();
            }
        }
        protected void BtnGenerate_Click(object sender, EventArgs e)
        {
            ExportExcel();
        }
        private void ExportExcel()
        {
            Response.Clear();
            Response.Buffer = true;
            Response.ClearContent();
            Response.ClearHeaders();
            Response.Charset = "";
            string FileName = "AdItem" + DateTime.Now + ".xls";
            StringWriter strwritter = new StringWriter();
            HtmlTextWriter htmltextwrtter = new HtmlTextWriter(strwritter);
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.ContentType = "application/vnd.ms-excel";
            Response.AddHeader("Content-Disposition", "attachment;filename=" + FileName);
            GvItem.GridLines = GridLines.Both;
            GvItem.HeaderStyle.Font.Bold = true;
            GvItem.RenderControl(htmltextwrtter);
            Response.Write(strwritter.ToString());
            Response.End();
        }
        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Verifies that the control is rendered */
        }
    }
   
}
