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
    public partial class PaymentReport : System.Web.UI.Page
    {
        string Connstr = WebConfigurationManager.ConnectionStrings["Conn"].ToString();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FillPaymentlist();
            }
        }
        protected void FillPaymentlist()
        {
            using (SqlConnection con = new SqlConnection(Connstr))
            {
                string sqlstr = "select PaymentId,a.Adtype,a.Amount,TotalAmount,Balance,Reason,Pd.IsActive from PaymentDetails Pd inner join AdBooking a on a.BookingId = Pd.RecievedPrice where Pd.IsActive = 1";
                SqlDataAdapter da = new SqlDataAdapter(sqlstr, con);
                DataTable dtpayment = new DataTable();
                da.Fill(dtpayment);
                GvPayment.DataSource = dtpayment;
                GvPayment.DataBind();

            }
        }
        protected void TxtPaymentId_TextChanged(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(Connstr))
            {
                string sqlstr = "select PaymentId,a.Adtype,a.Amount,TotalAmount,Balance,Reason,Pd.IsActive from PaymentDetails Pd inner join AdBooking a on a.BookingId = Pd.RecievedPrice where Pd.IsActive = 1 and PaymentId like '" + TxtPaymentId.Text + "%" + "'";
                SqlDataAdapter da = new SqlDataAdapter(sqlstr, con);
                DataTable dtpayment = new DataTable();
                da.Fill(dtpayment);
                GvPayment.DataSource = dtpayment;
                GvPayment.DataBind();
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
            string FileName = "PaymentDetails" + DateTime.Now + ".xls";
            StringWriter strwritter = new StringWriter();
            HtmlTextWriter htmltextwrtter = new HtmlTextWriter(strwritter);
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.ContentType = "application/vnd.ms-excel";
            Response.AddHeader("Content-Disposition", "attachment;filename=" + FileName);
            GvPayment.GridLines = GridLines.Both;
            GvPayment.HeaderStyle.Font.Bold = true;
            GvPayment.RenderControl(htmltextwrtter);
            Response.Write(strwritter.ToString());
            Response.End();
        }
        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Verifies that the control is rendered */
        }
    }
}