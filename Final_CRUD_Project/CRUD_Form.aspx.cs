using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Net.NetworkInformation;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

namespace Final_CRUD_Project
{
    public partial class CRUD_Form : System.Web.UI.Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {
           
                

        }

        protected void SubmitBtn_Click(object sender, EventArgs e)
        {


           String cs= ConfigurationManager.ConnectionStrings["FinalCRUDProjectConnectionString"].ConnectionString;
            SqlConnection con=new SqlConnection(cs);
            SqlCommand cmd = new SqlCommand("Insert into StudentData(Name, Age, Gender) Values(@name,@age,@gender)",con);
            cmd.Parameters.AddWithValue("@name", TextName.Text);
            cmd.Parameters.AddWithValue("@age", TextAge.Text);
            cmd.Parameters.AddWithValue("@gender", DDGender.SelectedValue);
            con.Open();
            int m =cmd.ExecuteNonQuery();
            if (m > 0 && Page.IsValid)
            {
                DataMessage.Text = "Data Saved Successfully";

            }
            else
            {
                DataMessage.Text = "There is an error occured";
                DataMessage.ForeColor = System.Drawing.Color.Red;
            }
            con.Close();


            if (IsPostBack)
            {
                GridView1.DataBind();
            }

        }

        protected void OnRowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            /*int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString());
            string name = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("TextName")).Text;
            string age = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("txtempcode")).Text;
            string Gender = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("txtempage")).Text;
            SqlConnection con = new SqlConnection();
            con.Open();

            SqlCommand cmd = new SqlCommand("update StudentData set Name = @name , Age =@age , Gender = @gender where Id = @ id", con);
            cmd.Parameters.AddWithValue("@Id ", ID);
            cmd.Parameters.AddWithValue("@name ", name);
            cmd.Parameters.AddWithValue("@Age ", age);
            cmd.Parameters.AddWithValue("@Gender ", Gender);
            cmd.ExecuteNonQuery();
            con.Close();
            GridView1.EditIndex = -1;// no row in edit mode  */
        }

        protected void OnRowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["FinalCRUDProjectConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);            int ID = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString());
            SqlCommand cmd = new SqlCommand("delete from StudentData where ID = @id", con);
            cmd.Parameters.AddWithValue("@id", ID);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close() ;

        }
    }
}