using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RA2_Test_App
{
    public partial class RA_Test : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        
        protected void btnRegister_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("Data Source = localhost\\sqlexpress; Initial Catalog = RA2 Test; Integrated Security = True");
            try
            {
                SqlCommand cmd = new SqlCommand("INSERT INTO Customers " + "(Name, Email)values(@Name, @Email)", con);
                cmd.Parameters.AddWithValue("@Name", txtName.Text);
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
              
                lblMessage.Text = "Thank you for registering";

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();



            }
            catch (SqlException ex)
            {

              

            }
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            txtEmail.Text = "";
            txtName.Text = "";
        }
    }
}