<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="CL_Parking.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script>
        window.open('', '_self', ''); 
        setTimeout("window.close()", 50000);
    </script>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Label ID="lblTitle" runat="server" Text="Label"></asp:Label>
&nbsp;<asp:DropDownList ID="ddlCar" runat="server" DataSourceID="sqlCars" DataTextField="description" DataValueField="carID">
        </asp:DropDownList><br />
        <table><tr><td><asp:ImageButton ID="ibSpace1" runat="server" CommandArgument="1" OnClick="ibSpace_click" BorderStyle="Solid" BorderWidth="1px" BorderColor="#33CC33" Height="50px" Width="50px" /></td>
            <td><asp:ImageButton ID="ImageButton1" runat="server" CommandArgument="3" OnClick="ibSpace_click" BorderStyle="Solid" BorderWidth="1px" BorderColor="#33CC33" Height="50px" Width="50px" /></td>
            <td><asp:ImageButton ID="ImageButton2" runat="server" CommandArgument="5" OnClick="ibSpace_click" BorderStyle="Solid" BorderWidth="1px" BorderColor="#33CC33" Height="50px" Width="50px" /></td>
            <td><asp:ImageButton ID="ImageButton3" runat="server" CommandArgument="7" OnClick="ibSpace_click" BorderStyle="Solid" BorderWidth="1px" BorderColor="#33CC33" Height="50px" Width="50px" /></td>
            <td><asp:ImageButton ID="ImageButton4" runat="server" CommandArgument="9" OnClick="ibSpace_click" BorderStyle="Solid" BorderWidth="1px" BorderColor="#33CC33" Height="50px" Width="50px" /></td>
            <td><asp:ImageButton ID="ImageButton5" runat="server" CommandArgument="11" OnClick="ibSpace_click" BorderStyle="Solid" BorderWidth="1px" BorderColor="#33CC33" Height="50px" Width="50px" /></td>
            <td><asp:ImageButton ID="ImageButton12" runat="server" CommandArgument="13" OnClick="ibSpace_click" BorderStyle="Solid" BorderWidth="1px" BorderColor="#33CC33" Height="50px" Width="50px" /></td>
            <td><asp:ImageButton ID="ImageButton13" runat="server" CommandArgument="15" OnClick="ibSpace_click" BorderStyle="Solid" BorderWidth="1px" BorderColor="#33CC33" Height="50px" Width="50px" /></td></tr>
            <tr><td><asp:ImageButton ID="ImageButton6" runat="server" CommandArgument="2" OnClick="ibSpace_click" BorderStyle="Solid" BorderWidth="1px" BorderColor="#33CC33" Height="50px" Width="50px" /></td>
                <td><asp:ImageButton ID="ImageButton7" runat="server" CommandArgument="4" OnClick="ibSpace_click" BorderStyle="Solid" BorderWidth="1px" BorderColor="#33CC33" Height="50px" Width="50px" /></td>
                <td><asp:ImageButton ID="ImageButton8" runat="server" CommandArgument="6" OnClick="ibSpace_click" BorderStyle="Solid" BorderWidth="1px" BorderColor="#33CC33" Height="50px" Width="50px" /></td>
                <td><asp:ImageButton ID="ImageButton9" runat="server" CommandArgument="8" OnClick="ibSpace_click" BorderStyle="Solid" BorderWidth="1px" BorderColor="#33CC33" Height="50px" Width="50px" /></td>
                <td><asp:ImageButton ID="ImageButton10" runat="server" CommandArgument="10" OnClick="ibSpace_click" BorderStyle="Solid" BorderWidth="1px" BorderColor="#33CC33" Height="50px" Width="50px" /></td>
                <td><asp:ImageButton ID="ImageButton14" runat="server" CommandArgument="12" OnClick="ibSpace_click" BorderStyle="Solid" BorderWidth="1px" BorderColor="#33CC33" Height="50px" Width="50px" /></td>
                <td><asp:ImageButton ID="ImageButton15" runat="server" CommandArgument="14" OnClick="ibSpace_click" BorderStyle="Solid" BorderWidth="1px" BorderColor="#33CC33" Height="50px" Width="50px" /></td>
                <td><asp:ImageButton ID="ImageButton11" runat="server" CommandArgument="16" OnClick="ibSpace_click" BorderStyle="Solid" BorderWidth="1px" BorderColor="#33CC33" Height="50px" Width="50px" /></td></tr>
            </table>
&nbsp;<asp:SqlDataSource ID="sqlCars" runat="server" ConnectionString="<%$ ConnectionStrings:MaritomConnectionString %>" SelectCommand="SELECT * FROM [CL_Cars] WHERE ([personID] = @personID) ORDER BY [default] DESC">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="0" Name="personID" QueryStringField="personID" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    </div>
        <asp:SqlDataSource ID="sqlParking" runat="server" ConnectionString="<%$ ConnectionStrings:MaritomConnectionString %>" DeleteCommand="DELETE FROM [CL_Spaces] WHERE [spaceID] = @spaceID" InsertCommand="INSERT INTO [CL_Spaces] ([carID],[spaceNum]) VALUES (@carID,@spaceNum)" SelectCommand="SELECT * FROM [CL_Spaces] where active=1" UpdateCommand="UPDATE [CL_Spaces] SET [carID] = @carID, [date] = @date, [active] = @active, [spaceNum] = @spaceNum WHERE [spaceID] = @spaceID">
            <DeleteParameters>
                <asp:Parameter Name="spaceID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="carID" Type="Int32" />
                <asp:Parameter Name="date" Type="DateTime" />
                <asp:Parameter Name="active" Type="Boolean" />
                <asp:Parameter Name="spaceNum" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="carID" Type="Int32" />
                <asp:Parameter Name="date" Type="DateTime" />
                <asp:Parameter Name="active" Type="Boolean" />
                <asp:Parameter Name="spaceNum" Type="Int32" />
                <asp:Parameter Name="spaceID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
