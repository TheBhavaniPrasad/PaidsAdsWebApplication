using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;

namespace PAWA.Reports
{
    public partial class CustomerReport : System.Web.UI.Page
    {
        string Connstr = WebConfigurationManager.ConnectionStrings["Conn"].ToString();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                fillCustomerlist();
            }

        }
        protected void fillCustomerlist()
        {
            using (SqlConnection con = new SqlConnection(Connstr))
            {
                string sqlstr = "select * from CustomerDetails";
                SqlDataAdapter da = new SqlDataAdapter(sqlstr, con);
                DataTable dtcustomer = new DataTable();
                da.Fill(dtcustomer);
                GvCustomer.DataSource = dtcustomer;
                GvCustomer.DataBind();

            }
        }

        protected void txtCustomerId_TextChanged(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(Connstr))
            {

                string sqlstr = "select * from CustomerDetails where CustomerId like '" + txtCustomerId.Text + "%" + "'";
                SqlDataAdapter da = new SqlDataAdapter(sqlstr, con);
                DataTable dtcustomer = new DataTable();
                da.Fill(dtcustomer);
                GvCustomer.DataSource = dtcustomer;
                GvCustomer.DataBind();
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
            string FileName = "CustomerDetails" + DateTime.Now + ".xls";
            StringWriter strwritter = new StringWriter();
            HtmlTextWriter htmltextwrtter = new HtmlTextWriter(strwritter);
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.ContentType = "application/vnd.ms-excel";
            Response.AddHeader("Content-Disposition", "attachment;filename=" + FileName);
            GvCustomer.GridLines = GridLines.Both;
            GvCustomer.HeaderStyle.Font.Bold = true;
            GvCustomer.RenderControl(htmltextwrtter);
            Response.Write(strwritter.ToString());
            Response.End();
        }
        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Verifies that the control is rendered */
        }
    }
}