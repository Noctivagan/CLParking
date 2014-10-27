using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace CL_Parking
{
    public partial class index : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            // Reset any left over parking
            sqlParking.UpdateCommand ="Update CL_Spaces set Active=0 where DateDiff(\"dd\",getDate(),date)!=0";
            sqlParking.Update();

            // If there is no querystring, disable the buttons
            if(Request.QueryString.Count == 0)
            {
                lblTitle.Text = "Who's parked behind you?";
                ddlCar.Visible = false;
                colorSpaces();
                foreach (Control control in Page.Form.Controls)
                {
                    if(control is ImageButton)
                    {
                        ((ImageButton)control).Enabled = false;
                    }
                }
            }
            else
            {
                // Clear your spaces.
                Int32 tempPerson = Convert.ToInt32(Request.QueryString["personID"]);
                sqlParking.UpdateParameters.Clear();
                sqlParking.UpdateCommand = ("update CL_Spaces set active=0 where carID in (select carid from cl_Cars where personid=@personID)");
                sqlParking.UpdateParameters.Add("personID", tempPerson.ToString());
                sqlParking.Update();
                lblTitle.Text = "Where did you park your ";
                ddlCar.Visible = true;
                colorSpaces();
            }
        }

        protected void colorSpaces()
        {
            // Loop through the spaces and mark who is parked where
            ImageButton ibTemp = new ImageButton();
            Int32 spaceNum = 0;
            SqlConnection sqlConn = new SqlConnection();
            sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["MaritomConnectionString"].ConnectionString;
            SqlCommand sqlComm = new SqlCommand("select * from cl_spaces as s join cl_cars as c on s.carID = c.carID join cl_person as p on p.personID = c.personID where s.active=1", sqlConn);
            sqlConn.Open();
            SqlDataReader drSpaces = sqlComm.ExecuteReader(CommandBehavior.CloseConnection);
            while (drSpaces.Read())
            {
                spaceNum = (Int32)drSpaces["spaceNum"];
                foreach (Control control in Page.Form.Controls)
                {
                    if (control is ImageButton)
                    {
                        ibTemp = (ImageButton)control;
                        ibTemp.Width = 50;
                        ibTemp.Height = 50;

                        if (Convert.ToInt32(ibTemp.CommandArgument) == spaceNum)
                        {
                            ibTemp.BackColor = System.Drawing.Color.Red;
                            ibTemp.ImageUrl = drSpaces["imageURL"].ToString();
                            ibTemp.ToolTip = "Person: " + drSpaces["firstName"].ToString() + " " + drSpaces["lastName"].ToString() + "\nLocation: " + drSpaces["location"].ToString() + "\nCar: " + drSpaces["description"].ToString();
                        } else if (ibTemp.BackColor != System.Drawing.Color.Red)
                        {
                            ibTemp.BackColor = System.Drawing.Color.Green;
                        }
                    }
                }
            }
        }

        protected void ibSpace_click(object sender, ImageClickEventArgs e)
        {
            ImageButton imbTemp = (ImageButton)sender;

            // if image is already there, show details
            if (imbTemp.ImageUrl.Length != 0)
            {
                //imbTemp.ToolTip.
                
            }
            sqlParking.InsertParameters.Clear();
            sqlParking.InsertParameters.Add("carID", ddlCar.SelectedValue);

            // Set the space number from the button commandArgument
            sqlParking.InsertParameters.Add("spaceNum",imbTemp.CommandArgument);
            sqlParking.Insert();

            Response.Redirect("./index.aspx");
        }
    }
}