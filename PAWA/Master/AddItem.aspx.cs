using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Configuration;
using System.IO;
using System.Data.SqlClient;
using System.Configuration;

namespace PAWA.Master
{
    public partial class AddItem : System.Web.UI.Page
    {
        string Connstr = WebConfigurationManager.ConnectionStrings["Conn"].ToString();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ClearControls();
                GridDisplayFiles();
                FillCategory();
            }
        }
        protected void FillCategory()
        {
            using (SqlConnection con = new SqlConnection(Connstr))
            {
                con.Open();
                string sqlstr = "select CategoryId,CategoryName from tblCategory Where Isactive=1";
                DataTable dtCategory = new DataTable();
                SqlDataAdapter ds = new SqlDataAdapter(sqlstr, con);
                ds.Fill(dtCategory);
                DdlCategoryId.DataSource = dtCategory;
                DdlCategoryId.DataBind();
                DdlCategoryId.DataValueField = "CategoryId";
                DdlCategoryId.DataTextField = "CategoryName";
                DdlCategoryId.DataBind();

            }
        }
        protected void FillSubCategory()
        {
            using (SqlConnection con = new SqlConnection(Connstr))
            {
                con.Open();
                string sqlstr = "Select  SubCategoryId,SubCategoryName,CategoryId from SubCategory where CategoryId = '" +DdlCategoryId.SelectedValue+ "'and IsActive=1 ";
                DataTable dtSubCategory = new DataTable();
                SqlDataAdapter ds = new SqlDataAdapter(sqlstr, con);
                ds.Fill(dtSubCategory);
                DdlSubCategoryId.DataSource = dtSubCategory;
                DdlSubCategoryId.DataBind();
                DdlSubCategoryId.DataValueField ="SubCategoryId";
                DdlSubCategoryId.DataTextField = "SubCategoryName";
                DdlSubCategoryId.DataBind();

            }

        }
        protected void BtnNew_Click(object sender, EventArgs e)
        {
            ClearControls();
        }
        protected void ClearControls()
        {
            txtItemNo.Text = string.Empty;
            DdlCategoryId.SelectedIndex = -1;
            DdlSubCategoryId.SelectedIndex = -1;
            txtItemName.Text = string.Empty;
            txtItemPrice.Text = string.Empty;
            LblMessage.Text= string.Empty;
            ChkIsactive.Checked = false;
        }
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ConnectionString);
        SqlCommand cmd = null;
        SqlDataReader dr = null;
        protected void BtnSave_Click(object sender, EventArgs e)
        {
            int active=0;
            if(ChkIsactive.Checked==true)
            {
                active = 1;
            }
            else
            {
                active = 0;
            }
            if (FileUpload1.HasFile)
            {
                string fname = FileUpload1.PostedFile.FileName;
                string extension = Path.GetExtension(fname);
                int fsize = FileUpload1.PostedFile.ContentLength;
                int flag = 0;
                switch (extension.ToLower())
                {
                    case ".jpg":
                    case ".png":
                        flag = 1;
                        break;
                    default:
                        break;

                }
                if (flag == 1)
                {
                    FileUpload1.SaveAs(Server.MapPath("~/Files/" + fname));
                    cmd = new SqlCommand("insert into AdItem(CategoryId,SubCategoryId,ItemName,ItemPrice,FileName,IsActive)values('" + DdlCategoryId.Text+ "','" + DdlSubCategoryId.Text + "','" + txtItemName.Text + "','" + txtItemPrice.Text + "','" + fname + "'," +active+  ")", con);
                    con.Open();
                    if (cmd.ExecuteNonQuery() != 0)
                    {
                        LblMessage.Text = "File Uploaded Successfully";
                        con.Close();
                        GridDisplayFiles();
                    }
                    else
                    {
                        LblMessage.Text = "File Failed to Uploaded";
                    }
                }
                else
                {
                    LblMessage.Text = "only allow JPEG or PNG files.";
                }
            }
            else
            {
                LblMessage.Text = "Please upload a file.";
            }
        }

        private void GridDisplayFiles()
        {
            con.Open();
            cmd = new SqlCommand("select ItemNo,tc.CategoryName,s.SubCategoryName,ItemName,ItemPrice,FileName,a.IsActive from AdItem a inner join tblCategory tc on tc.CategoryId=a.CategoryId inner join SubCategory s on s.SubCategoryId=a.SubCategoryId where a.IsActive=1", con);
            dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                GridView1.DataSource = dr;
                GridView1.DataBind();
            }
            else
            {
                LblMessage.Text = "Nothing is available";
            }
        }

        protected void BtnUpdate_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {
                string fname = FileUpload1.PostedFile.FileName;
                string extension = Path.GetExtension(fname);
                int fsize = FileUpload1.PostedFile.ContentLength;
                int flag = 0;
                switch (extension.ToLower())
                {
                    case ".jpg":
                    case ".png":
                        flag = 1;
                        break;
                    default:
                        flag = 0;
                        break;

                }
                if (flag == 1)
                {
                    FileUpload1.SaveAs(Server.MapPath("~/Files/" + fname));
                    cmd = new SqlCommand("update AdItem set ItemName='" + txtItemName.Text + "'" +
                        ",ItemPrice='" + txtItemPrice.Text + "'" +
                        ",FileName='" + fname + "' where ItemNo='" + txtItemNo.Text+"'", con);
                    con.Open();
                    if (cmd.ExecuteNonQuery() != 0)
                    {
                        LblMessage.Text = "File Updated Successfully";
                        con.Close();
                        GridDisplayFiles();
                    }
                    else
                    {
                        LblMessage.Text = "File Failed to be Updated";
                    }
                }
                else
                {
                    LblMessage.Text = "only allow JPEG or PNG files.";
                }
            }
            else
            {
                LblMessage.Text = "Please upload a file.";
            }
        }
        protected void BtnDelete_Click(object sender, EventArgs e)
        {
            con.Open();
            cmd = new SqlCommand("delete AdItem  where ItemNo='" + txtItemNo.Text + "'", con);
            cmd.ExecuteScalar();
            con.Close();
            GridDisplayFiles();
        }
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            DdlCategoryId.SelectedItem.Text = GridView1.SelectedRow.Cells[3].Text;
            txtItemNo.Text = GridView1.SelectedRow.Cells[2].Text;
            txtItemName.Text = GridView1.SelectedRow.Cells[5].Text;
            txtItemPrice.Text = GridView1.SelectedRow.Cells[6].Text;
        }

        protected void DdlCategoryId_SelectedIndexChanged(object sender, EventArgs e)
        {
            FillSubCategory();
        }
    }
}