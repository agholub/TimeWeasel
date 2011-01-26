using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security;
using System.Security.Principal;

public partial class SiteMaster : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.User.IsInRole("admin"))
        {
            NavigationMenuAdmin.Visible = false;
            //nuItem breaker = new MenuItem();
            
            MenuItem admin1 = new MenuItem("Projects","Projects","","manageProjects.aspx");
            MenuItem admin2 = new MenuItem("Clients", "Clients", "", "manageClients.aspx");
            MenuItem admin3 = new MenuItem("Contacts", "Contacts", "", "manageContacts.aspx");
            MenuItem admin4 = new MenuItem("Users", "Users", "", "manageUsers.aspx");
            MenuItem admin5 = new MenuItem("Reports", "Reports", "", "manageReports.aspx");
            NavigationMenu.Items.Add(admin1);
            NavigationMenu.Items.Add(admin2);
            NavigationMenu.Items.Add(admin3);
            NavigationMenu.Items.Add(admin4);
            NavigationMenu.Items.Add(admin5);
        }
        else
        {
            NavigationMenuAdmin.Visible = false;
        }

    }
}
