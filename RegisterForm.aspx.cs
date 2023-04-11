using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VerveMedia_Task
{
    public partial class RegisterForm : System.Web.UI.Page
    {

        string strcon = ConfigurationManager.ConnectionStrings["Gridview"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                pageload();
            }
        }

        public void pageload()
        {
            SqlConnection con = new SqlConnection(strcon);
            SqlDataAdapter da = new SqlDataAdapter("select * from register", con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();

        }


        //Delete the gridview rows
        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

            Label Label1 = (Label)GridView1.Rows[e.RowIndex].FindControl("Label1");

            SqlConnection con = new SqlConnection(strcon);
            con.Open();
            string str = "Delete register where EmailId ='" + Label1.Text + "'";
            SqlCommand cmd = new SqlCommand(str, con);
            cmd.ExecuteNonQuery();
            con.Close();

            pageload();

        }


        //cancelling 
        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {



            GridView1.EditIndex = -1;
            pageload();


        }


        //Edit Gridview
        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            pageload();

        }


        //Update Row in Gridview
        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            Label Lable1 = (Label)GridView1.Rows[e.RowIndex].FindControl("Lable2");
            TextBox TextBox2 = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtPasswordf");

            SqlConnection con = new SqlConnection(strcon);
            con.Open();
            string str = "update register set Password = '" + TextBox2.Text + "' where EmailId = '" + Lable1.Text + "'";
            SqlCommand cmd = new SqlCommand(str, con);
            cmd.ExecuteNonQuery();
            con.Close();

            GridView1.EditIndex = -1;
            pageload();
        }


        //Add  in Gridview
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("Add"))
            {

                TextBox textBox1 = (TextBox)GridView1.FooterRow.FindControl("txtaddemail");
                TextBox textBox2 = (TextBox)GridView1.FooterRow.FindControl("txtPasswordf");

                SqlConnection con = new SqlConnection(strcon);
                con.Open();
                string str = "insert into register values('" + textBox1.Text + " ', '" + textBox2.Text + " ')";
                SqlCommand cmd = new SqlCommand(str, con);
                cmd.ExecuteNonQuery();
                con.Close();
                pageload();

            }
        }
        public override void VerifyRenderingInServerForm(Control control)
        {

        }






        //Button for Excel File Downloaded.....................!
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Clear();
            Response.Buffer = true;
            Response.ClearContent();
            Response.ClearHeaders();
            Response.Charset = "";
            string FileName = "RegisterForm" + DateTime.Now + ".xls";
            StringWriter strwritter = new StringWriter();
            HtmlTextWriter htmltextwrtter = new HtmlTextWriter(strwritter);
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.ContentType = "application/vnd.ms-excel";
            Response.AddHeader("Content-Disposition", "attachment;filename=" + FileName);
            GridView1.GridLines = GridLines.Both;
            GridView1.HeaderStyle.Font.Bold = true;
            GridView1.RenderControl(htmltextwrtter);
            Response.Write(strwritter.ToString());
            Response.End();
        }
    }
}