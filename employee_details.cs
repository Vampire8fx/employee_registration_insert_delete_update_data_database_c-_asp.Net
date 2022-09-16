using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;

namespace WebApplication4
{
    public partial class index : System.Web.UI.Page
    {
        string connectionString = @"Data Source=DESKTOP-GKAS3BE;Initial Catalog=employee;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void Unnamed8_Click(object sender, EventArgs e)
        {
            if(txt1.Text=="" || txt2.Text == "" || txt3.Text == "" || txt4.Text == "" || txt5.Text == "" || txt6.Text == "" || txt7.Text == "")
            {
                Response.Write("<script>alert('please enter details first')</script>");
            }
           
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                bool exists = false;
                using (SqlCommand cmd1 = new SqlCommand("select count(*) from [employee_details] where email = @email", con))
                {
                    cmd1.Parameters.AddWithValue("email", txt4.Text);
                    exists = (int)cmd1.ExecuteScalar() > 0;
                }
                if (exists)
                {
                    Response.Write("<script>alert('email already exits')</script>");
                }
                else
                {
                    SqlCommand cmd = new SqlCommand("useradd", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@employee_id", Convert.ToInt32(hfuserID.Value == "" ? "0" : hfuserID.Value));
                    cmd.Parameters.AddWithValue("@firstname", txt1.Text.Trim());
                    cmd.Parameters.AddWithValue("@lastname", txt2.Text.Trim());
                    cmd.Parameters.AddWithValue("@phone", txt3.Text.Trim());
                    cmd.Parameters.AddWithValue("@email", txt4.Text.Trim());
                    cmd.Parameters.AddWithValue("@pincode", txt6.Text.Trim());
                    cmd.Parameters.AddWithValue("@adress", txt5.Text.Trim());
                    cmd.Parameters.AddWithValue("@password", txt7.Text.Trim());
                    cmd.ExecuteNonQuery();
                    Clear();

                    Response.Write("<script>alert('inserted succssfully')</script>");
                    Response.Redirect("home.aspx");
                }
                con.Close(); 
            }
            void Clear()
            {
                txt1.Text = txt2.Text = txt3.Text = txt4.Text = txt5.Text = txt6.Text = txt7.Text = "";
                hfuserID.Value = "";

            }
        }

        protected void password(object source, ServerValidateEventArgs args)
        {
            string inputData = args.Value;
            if (inputData.Length < 8)
            {
                args.IsValid = false;
            }
            else
            {
                args.IsValid = true;
            }
            foreach (char c in inputData)
            {
                if(c >= 'a' && c <= 'z')
                {
                    args.IsValid = false;
                   
                }
                if(c >= 'A' && c <= 'Z')
                {
                    args.IsValid = false;
                }
              
            }
           
        }
    }
   
}
