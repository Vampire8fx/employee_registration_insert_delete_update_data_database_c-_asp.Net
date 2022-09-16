using System;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace WebApplication4
{
    public partial class home : System.Web.UI.Page
    {
        string connectionString = @"Data Source=DESKTOP-GKAS3BE;Initial Catalog=employee;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                gvbind();
            }
        }
        protected void gvbind()
        {
            using (SqlConnection con = new SqlConnection(connectionString))

            {
                con.Open();
                SqlCommand cmd = new SqlCommand("select *from employee_details", con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows == true)
                {
                    GridView1.DataSource = dr;
                    GridView1.DataBind();
                }
            }
        }

        protected void Unnamed1_Click(object sender, EventArgs e)
        {
            Response.Redirect("index.aspx");
        }

        protected void updatedata(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            gvbind();
        }

       


        protected void update1data(object sender, GridViewUpdateEventArgs e)
        {
            
           
            int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString());
            string firstname = ((TextBox)GridView1.Rows[e.RowIndex].Cells[1].Controls[0]).Text;
            string lastname = ((TextBox)GridView1.Rows[e.RowIndex].Cells[2].Controls[0]).Text;
            string phone = ((TextBox)GridView1.Rows[e.RowIndex].Cells[3].Controls[0]).Text;
            string email = ((TextBox)GridView1.Rows[e.RowIndex].Cells[4].Controls[0]).Text;
            string pincode = ((TextBox)GridView1.Rows[e.RowIndex].Cells[6].Controls[0]).Text;
            string address = ((TextBox)GridView1.Rows[e.RowIndex].Cells[5].Controls[0]).Text;
            //   string password = ((TextBox)GridView1.Rows[e.RowIndex].Cells[7].Controls[0]).Text;

            using (SqlConnection con = new SqlConnection(connectionString))

            {
                con.Open();
                bool exists = false;
                Regex validation = new Regex("\\w+([-+.']\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*");
                Match match = validation.Match(email);
                Regex mobile = new Regex("[0-9][0-9]{9}$");
                Match match1 = mobile.Match(phone);
                using (SqlCommand cmd1 = new SqlCommand("select count(*) from [employee_details] where email = @email", con))
                {
                    cmd1.Parameters.AddWithValue("email", email);
                    exists = (int)cmd1.ExecuteScalar() > 1;
                }
                if(firstname == "" || lastname == "" || phone == "" || email == "" || pincode =="" || address =="")
                {
                    Response.Write("<script>alert('fill all details')</script>");
                    return;
                }
                if (exists)
                {
                    Response.Write("<script>alert('email already exits')</script>");
                    return;
                }
                if(!match1.Success)
                {
                    Response.Write("<script>alert('mobile number invalid')</script>");
                    return;
                }   
                
                if(!match.Success)
                {
                    Response.Write("<script>alert('email id invalid')</script>");
                }
                else
                {

                    SqlCommand cmd = new SqlCommand("update employee_details set firstname='" + firstname + "',lastname='" + lastname + "',phone='" + phone + "',email='" + email + "',pincode='" + pincode + "',adress='" + address + "' where employee_id='" + id + "'", con);


                    int t = cmd.ExecuteNonQuery();
                    if (t > 0)
                    {
                        Response.Write("<script>alert('updated successfully')</script>");
                        GridView1.EditIndex = -1;
                        gvbind();
                    }
                }
            }

        }

        protected void cancelediting(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            gvbind();
        }

        protected void deletedata(object sender, GridViewDeleteEventArgs e)
        {
        
            int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString());
             using (SqlConnection con = new SqlConnection(connectionString))
             {
                 con.Open();
                 SqlCommand cmd = new SqlCommand("delete from employee_details where employee_id='" + id + "'", con);
                 int t = cmd.ExecuteNonQuery();
                if(e.RowIndex == 0)
                { }
                 if (t > 0)
                 {
                     Response.Write("<script>alert('are u want to delete data'))</script>");
                     GridView1.EditIndex = -1;
                     gvbind();

                 }
             }
           
        }

            }
        }

  
   



