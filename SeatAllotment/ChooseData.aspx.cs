using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace SeatAllotment
{
    public partial class ChooseData : System.Web.UI.Page
    {

        SqlConnection con = new SqlConnection("server=.;database=SeatAllotment;uid=zuchamo3;pwd=zubby;");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
               string RegNo = Request.QueryString["regNumber"].ToString();
                //Response.Write(RegNo);
                con.Open();
                SqlCommand cmd = new SqlCommand("select RegistrationNo,Name,Branch,Batch,Gender,Category from Student_Details where RegistrationNo=" + RegNo, con);
                SqlDataReader reader = cmd.ExecuteReader();
                GridViewStudDetails.DataSource = reader;
                GridViewStudDetails.DataBind();
                con.Close();
                show_data();
               
            }
        }


        public void show_data()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("Select Hostel_Name from Hostel", con);
            SqlDataReader rdr = cmd.ExecuteReader();
            DropDownListHostel.DataSource = rdr;
            DropDownListHostel.DataTextField = "Hostel_Name";
            DropDownListHostel.DataValueField = "Hostel_Name";
            DropDownListHostel.DataBind();
            con.Close();
          

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("select a.Hostel_ID,a.RoomNo,a.Capacity from Rooms a where a.Hostel_ID in (select b.Hostel_ID from Hostel b where b.Hostel_Name='"+DropDownListHostel.Text+"')", con);
            SqlDataReader rdr = cmd.ExecuteReader();
            GridViewHostel.DataSource = rdr;
            GridViewHostel.DataBind();
            string selectedHostel = DropDownListHostel.SelectedItem.Text;
             //Response.Write(selectedHostel);
            con.Close();
            show_Room_No();
         }

        public void show_Room_No()
        {
           // Response.Write(HostelSelected);
            con.Open(); 
            SqlCommand cmd = new SqlCommand("select RoomNo from Rooms where  Hostel_ID= (select Hostel_ID from Hostel where Hostel_Name='"+DropDownListHostel.Text+"') and Status='Available'", con);
            SqlDataReader rdr = cmd.ExecuteReader();
            DropDownListSelectRoom.DataSource = rdr;
            DropDownListSelectRoom.DataTextField ="RoomNo";
            DropDownListSelectRoom.DataValueField ="RoomNo";
            DropDownListSelectRoom.DataBind();
            con.Close();
            
            
        }

        protected void Button2_Click(object sender, EventArgs e)
        {

            string RegNo = Request.QueryString["regNumber"].ToString();
            Response.Write(RegNo);
            int HId = getHostelId();
            string RoomId = getRoomId();
           
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "insert into Allocation (RegistrationNo,RoomID,Hostel_Id,AllocationDate,Status) values ('"+RegNo+"','"+RoomId+"','"+HId+"',GetDate(),'Active')";

            cmd.Connection = con;
            cmd.ExecuteNonQuery();
            con.Close();
            UpdateStatus();
            Response.Redirect("display.aspx?regNumber=" + RegNo + "");
        }

        private int getHostelId()
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "select Hostel_Id from Hostel where Hostel_Name ='" + DropDownListHostel.Text + "'";
            cmd.Connection = con;
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            dr.Read();
            int HId = dr.GetInt32(0);
            con.Close();
            return HId;
        }
        private string getRoomId()
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "select RoomId from Rooms WHERE RoomNo='"+ DropDownListSelectRoom.Text + "' AND Hostel_ID=(SELECT Hostel_ID from Hostel where Hostel_Name='"+ DropDownListHostel.Text + "')";
            cmd.Connection = con;
            con.Open();
            
            SqlDataReader dr = cmd.ExecuteReader();
            dr.Read();
            string roomId = dr.GetString(0);
            con.Close();
            return roomId;
        }
        private void UpdateStatus()
        {
            string RId = getRoomId();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "SELECT COUNT( * ) FROM Allocation  where Status='Active' Group by RoomID HAVING RoomID = '" + RId+"'";
            cmd.Connection = con;
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            dr.Read();
            int allocated = dr.GetInt32(0);
            con.Close();
            //fetch room capacity
            cmd.CommandText = "select Capacity  from Rooms where RoomId='" + RId + "'";
            cmd.Connection = con;
            con.Open();
            SqlDataReader datareader = cmd.ExecuteReader();
            datareader.Read();
            int capacity = datareader.GetInt32(0);
            con.Close();  
                 
                if(capacity== allocated)
                    {
                        con.Open();
                         cmd.CommandText = " update Rooms set Status='FULL' where RoomId='" + RId +"'";
                         cmd.Connection = con;
                         cmd.ExecuteNonQuery();
                         con.Close();
                     }

         }

        
    }

}