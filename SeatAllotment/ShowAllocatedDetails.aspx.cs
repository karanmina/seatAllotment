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
    public partial class ShowAllocatedDetails : System.Web.UI.Page
     {
        SqlConnection con = new SqlConnection("server=.;database=SeatAllotment;uid=zuchamo3;pwd=zubby;");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                showBatch();
                showHostel();
                con.Open();
                SqlCommand cmd = new SqlCommand("select a.RegistrationNo,s.Name,s.Branch,s.Batch,h.Hostel_Name,r.RoomNO from Allocation a,Student_Details s,Hostel h,Rooms r where a.RegistrationNo = s.RegistrationNo and  a.Hostel_Id=h.Hostel_ID and a.RoomID=r.RoomId and a.Status='active'", con);
                // rdr = cmd.ExecuteReader(); // reader doesnt support paging
                DataSet ds = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(ds);
                GridViewShowDetails.DataSource = ds;
                GridViewShowDetails.DataBind();
                con.Close();
            }
        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("select a.RegistrationNo,s.Name,s.Branch,s.Batch,h.Hostel_Name,r.RoomNO from Allocation a,Student_Details s,Hostel h,Rooms r where a.RegistrationNo = s.RegistrationNo and  a.Hostel_Id=h.Hostel_ID and a.RoomID=r.RoomId and a.Status='active' and s.Batch='"+ DropDownListBatchFiler.Text + "'", con);
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            GridViewShowDetails.DataSource = ds;
            GridViewShowDetails.DataBind();
            con.Close();
        }

        protected void DropDownListFilterByHostel_SelectedIndexChanged(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("select a.RegistrationNo,s.Name,s.Branch,s.Batch,h.Hostel_Name,r.RoomNO from Allocation a,Student_Details s,Hostel h,Rooms r where a.RegistrationNo = s.RegistrationNo and  a.Hostel_Id=h.Hostel_ID and a.RoomID=r.RoomId and a.Status='active' and h.Hostel_Name='" + DropDownListFilterByHostel.Text + "'", con);
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            GridViewShowDetails.DataSource = ds;
            GridViewShowDetails.DataBind();
            con.Close();
        }


        protected void Button1_Click1(object sender, EventArgs e)
        {
            SqlCommand comd = new SqlCommand("select count(*) from Allocation where  RegistrationNo ='" + TextBoxRegNo.Text + "' and Status='Active'", con);
            con.Open();
            int StudtExist = (int)comd.ExecuteScalar();
            if (StudtExist > 0)
            {
               
                SqlCommand cmd = new SqlCommand("select a.RegistrationNo,s.Name,s.Branch,s.Batch,h.Hostel_Name,r.RoomNO from Allocation a,Student_Details s,Hostel h,Rooms r where a.RegistrationNo = s.RegistrationNo and  a.Hostel_Id=h.Hostel_ID and a.RoomID=r.RoomId and a.Status='active' and a.RegistrationNo ='" + TextBoxRegNo.Text + "'", con);
                DataSet ds = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(ds);
                GridViewShowDetails.DataSource = ds;
                GridViewShowDetails.DataBind();
                con.Close();

            }
            else
            {
                LabelWrite.Text = "*Student Details Not Found Check If Registration Number is Correct";
            }
        
        }

        protected void ButtonRefresh_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("select a.RegistrationNo,s.Name,s.Branch,s.Batch,h.Hostel_Name,r.RoomNO from Allocation a,Student_Details s,Hostel h,Rooms r where a.RegistrationNo = s.RegistrationNo and  a.Hostel_Id=h.Hostel_ID and a.RoomID=r.RoomId and a.Status='active'", con);
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            GridViewShowDetails.DataSource = ds;
            GridViewShowDetails.DataBind();
            con.Close();

        }

        public void showHostel()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("Select Hostel_Name from Hostel", con);
            SqlDataReader rdr = cmd.ExecuteReader();
            DropDownListFilterByHostel.DataSource = rdr;
            DropDownListFilterByHostel.DataTextField = "Hostel_Name";
            DropDownListFilterByHostel.DataValueField = "Hostel_Name";
            DropDownListFilterByHostel.DataBind();
            con.Close();


        }


        public void showBatch()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("select Batch from Student_Details group by Batch", con);
            SqlDataReader rdr = cmd.ExecuteReader();
            DropDownListBatchFiler.DataSource = rdr;
            DropDownListBatchFiler.DataTextField = "Batch";
            DropDownListBatchFiler.DataValueField = "Batch";
            DropDownListBatchFiler.DataBind();
            con.Close();


        }

       
    }
    
}