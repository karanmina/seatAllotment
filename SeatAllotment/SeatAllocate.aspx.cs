using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SeatAllotment
{
    public partial class SeatAllocate : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("server=.;database=SeatAllotment;uid=zuchamo3;pwd=zubby;");

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {


            con.Open();
            SqlCommand cmd = new SqlCommand("select RegistrationNo,Name,Gender from Student_Details where   Batch='" + DropDownListBatch.Text + "'and Branch='" + DropDownListBranch.Text + "' and  RegistrationNo  not in (select RegistrationNo from Allocation where Status= 'active')", con);
            SqlDataReader rdr = cmd.ExecuteReader();
            GridViewStudent.DataSource = rdr;
            GridViewStudent.DataBind();
            con.Close();


        }

       

        protected void Button2_Click(object sender, EventArgs e)
        {
           
            
            SqlCommand command = new SqlCommand("select count(*) from Student_Details where  RegistrationNo ='" + TextBoxRegNo.Text + "'",con);
            con.Open();
            int StudentExist = (int)command.ExecuteScalar();
            if (StudentExist > 0)
            {
                SqlCommand comd = new SqlCommand("select count(*) from Allocation where  RegistrationNo ='" + TextBoxRegNo.Text + "' and Status='Active'", con);
                int StudtExist = (int)comd.ExecuteScalar();
                if (StudtExist > 0)
                {
                    
                    Labelwrite1.Text = "Student Already Alloted";
                }
                else
                {
                    
                    SqlCommand comnd = new SqlCommand("select RegistrationNo,Name,Gender from Student_Details where RegistrationNo ='" + TextBoxRegNo.Text + "'and  RegistrationNo  not in (select RegistrationNo from Allocation where Status= 'active')", con);
                    SqlDataReader rdr = comnd.ExecuteReader();
                    GridViewStudent.DataSource = rdr;
                    GridViewStudent.DataBind();
                    con.Close();
                }

            }

            else
            {
              
                  Labelwrite1.Text = "No Details Found Check If Regiatration No is correct";
            }
        }

        protected void GridViewStudent_SelectedIndexChanged1(object sender, EventArgs e)
        {
            string regNo = GridViewStudent.SelectedRow.Cells[1].Text;
            // Response.Write(regNo);
            Response.Redirect("ChooseData.aspx?regNumber=" + regNo + "");
        }
    }

}
