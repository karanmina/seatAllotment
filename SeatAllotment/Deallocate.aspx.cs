using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SeatAllotment
{
    public partial class Deallocate : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("server=.;database=SeatAllotment;uid=zuchamo3;pwd=zubby;");

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Page.IsPostBack)
            {
                Show_data();
                Show_DropDownData();

            }
        }

       
       

        private void Show_data()
        {
                con.Open();
                SqlCommand cmd = new SqlCommand("select a.RegistrationNo,s.Name,s.Branch,s.Batch,h.Hostel_Name,r.RoomNO from Allocation a,Student_Details s,Hostel h,Rooms r where a.RegistrationNo = s.RegistrationNo and  a.Hostel_Id=h.Hostel_ID and a.RoomID=r.RoomId and a.Status='active'", con);
                DataSet ds = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(ds);
                GridViewDetailsForDeallocation.DataSource = ds;
                GridViewDetailsForDeallocation.DataBind();
                con.Close();
                
         }
        private void UpdateStatus( int REGNO)
        {
            string Roomid = getRoomId(REGNO);
            SqlCommand cmd = new SqlCommand();
            con.Open();
            cmd.CommandText = " update Rooms set Status='Available' where RoomId='" +Roomid + "'";
            cmd.Connection = con;
            cmd.ExecuteNonQuery();
            con.Close();
            
        }
        private string getRoomId(int REGNO)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "select RoomId from  Allocation where RegistrationNo='" + REGNO + "'";
            cmd.Connection = con;
            con.Open();

            SqlDataReader dr = cmd.ExecuteReader();
            dr.Read();
            string roomId = dr.GetString(0);
            con.Close();
            return roomId;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlCommand comd = new SqlCommand("select count(*) from Allocation where  RegistrationNo ='" + TextBoxRegno.Text + "' and Status='Active'", con);
            con.Open();
            int StudtExist = (int)comd.ExecuteScalar();
            if (StudtExist > 0)
            {

                SqlCommand cmd = new SqlCommand("select a.RegistrationNo,s.Name,s.Branch,s.Batch,h.Hostel_Name,r.RoomNO from Allocation a,Student_Details s,Hostel h,Rooms r where a.RegistrationNo = s.RegistrationNo and  a.Hostel_Id=h.Hostel_ID and a.RoomID=r.RoomId and a.Status='active' and a.RegistrationNo ='" + TextBoxRegno.Text + "'", con);
                DataSet ds = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(ds);
                GridViewDetailsForDeallocation.DataSource = ds;
                GridViewDetailsForDeallocation.DataBind();
                con.Close();

            }
            else
            {
                LabelWrite1.Text = "*Student Details Not Found Check If Registration Number is Correct";
            }

        }
        private void Show_DropDownData()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("select Batch from Student_Details group by Batch", con);
            SqlDataReader rdr = cmd.ExecuteReader();
            DropDownListBAtch.DataSource = rdr;
            DropDownListBAtch.DataTextField = "Batch";
            DropDownListBAtch.DataValueField = "Batch";
            DropDownListBAtch.DataBind();
            con.Close();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand();
            con.Open();
            cmd.CommandText = "update Allocation  set  Status ='Inactive' ,DeallocationDate=GetDate()   where RegistrationNo in(select RegistrationNo from Student_Details where Batch= '" + DropDownListBAtch.Text + "' ) ";
            cmd.Connection = con;
            cmd.ExecuteNonQuery();

            cmd.CommandText = "Update Rooms set Status ='Available' where RoomId in(Select RoomID from Allocation where RegistrationNo in( select RegistrationNo from Student_Details where Batch='"+ DropDownListBAtch.Text + "')) ";
            cmd.Connection = con;
            cmd.ExecuteNonQuery();

            con.Close();
            Show_data();
        }

      

        protected void GridViewDetailsForDeallocation_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

            int tmp = e.RowIndex;
            int REGNO = Int32.Parse(GridViewDetailsForDeallocation.Rows[tmp].Cells[1].Text);
            //Response.Write(REGNO);
            SqlCommand cmd = new SqlCommand();
            con.Open();
            cmd.CommandText = " update Allocation set Status='Inactive', DeallocationDate=GetDate() where RegistrationNo='" + REGNO + "'";
            cmd.Connection = con;
            cmd.ExecuteNonQuery();
            con.Close();
            UpdateStatus(REGNO);
            Show_data();
        }
    }
}