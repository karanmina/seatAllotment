using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SeatAllotment
{
    public partial class display : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("server=.;database=SeatAllotment;uid=zuchamo3;pwd=zubby;");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                string RegNo = Request.QueryString["regNumber"].ToString();
                //Response.Write(RegNo);
                con.Open();
                SqlCommand cmd = new SqlCommand("select RegistrationNo,RoomID,Hostel_Id,AllocationDate from Allocation where Status ='active' and RegistrationNo=" + RegNo, con);
                SqlDataReader reader = cmd.ExecuteReader();
                GridViewdisplay.DataSource = reader;
                GridViewdisplay.DataBind();
                con.Close();
            

            }
        }

        
    }
}