<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RA2 Test.aspx.cs" Inherits="RA2_Test_App.RA_Test" %>

<!DOCTYPE html>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link href="Content/Styles.css" rel="stylesheet" />
<link href="Content/bootstrap.css" rel="stylesheet" type="text/css"/>
<script src="Scripts/bootstrap.bundle.js"></script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .textColor {
            font-weight: normal;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="data">
        <br />
        <asp:DropDownList ID="ddlProvince" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="Province" DataValueField="Province" CssClass="btn btn-secondary">
        </asp:DropDownList><br/>
            <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RA2 TestConnectionString %>" SelectCommand="SELECT DISTINCT [Province] FROM [Cities]"></asp:SqlDataSource>
        <asp:GridView  ID="gvCityInfo" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" CssClass="table table-dark">
            <Columns>
                <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                <asp:BoundField DataField="Population" HeaderText="Population" SortExpression="Population" />
                <asp:BoundField DataField="MedianIncome" DataFormatString="{0:c}" HeaderText="MedianIncome" SortExpression="MedianIncome" />
            </Columns>
        </asp:GridView>
            </div>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:RA2 TestConnectionString %>" SelectCommand="SELECT [City], [Population], [MedianIncome] FROM [Cities] WHERE ([Province] = @Province2)">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlProvince" Name="Province2" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <h2><strong><span class="textColor">Register Today!</span></strong></h2>
        <table class="table">
            <tr>
            <td>Name:</td>
            <td><asp:TextBox ID="txtName" runat="server" CssClass="input-group form-group"></asp:TextBox></td>
            </tr>
        <tr>
            <td>Email:</td>
            <td><asp:TextBox ID="txtEmail" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td><asp:Button ID="btnRegister" runat="server" OnClick="btnRegister_Click" Text="Register" /></td>
            <td><asp:Button ID="btnClear" runat="server" Text="Clear" OnClick="btnClear_Click" /></td>
        </tr>
        </table>
        <p>
            <asp:Label ID="lblMessage" runat="server"></asp:Label>
        </p>
    </form>
</body>
</html>
