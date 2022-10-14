<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="bankApp.Default" %>

<!DOCTYPE html>

<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Login</title>

    <asp:PlaceHolder runat="server">
        <%: Scripts.Render("~/bundles/modernizr") %>
    </asp:PlaceHolder>

    <webopt:BundleReference runat="server" Path="~/Content/css" />
    <link href="~/favicon.ico" rel="shortcut icon" type="image/x-icon" />

</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager runat="server">
            <Scripts>
                <%--To learn more about bundling scripts in ScriptManager see https://go.microsoft.com/fwlink/?LinkID=301884 --%>
                <%--Framework Scripts--%>
                <asp:ScriptReference Name="MsAjaxBundle" />
                <asp:ScriptReference Name="jquery" />
                <asp:ScriptReference Name="bootstrap" />
                <asp:ScriptReference Name="WebForms.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebForms.js" />
                <asp:ScriptReference Name="WebUIValidation.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebUIValidation.js" />
                <asp:ScriptReference Name="MenuStandards.js" Assembly="System.Web" Path="~/Scripts/WebForms/MenuStandards.js" />
                <asp:ScriptReference Name="GridView.js" Assembly="System.Web" Path="~/Scripts/WebForms/GridView.js" />
                <asp:ScriptReference Name="DetailsView.js" Assembly="System.Web" Path="~/Scripts/WebForms/DetailsView.js" />
                <asp:ScriptReference Name="TreeView.js" Assembly="System.Web" Path="~/Scripts/WebForms/TreeView.js" />
                <asp:ScriptReference Name="WebParts.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebParts.js" />
                <asp:ScriptReference Name="Focus.js" Assembly="System.Web" Path="~/Scripts/WebForms/Focus.js" />
                <asp:ScriptReference Name="WebFormsBundle" />
                <%--Site Scripts--%>
            </Scripts>
        </asp:ScriptManager>
        <div class="container body-content">
            <div class="panel panel-primary" style="margin: 10% 25%;">
                <%--<div class="panel-heading">
                    <h3>Login</h3>
                </div>--%>
                <div class="form panel-body" style="padding: 15px 25%;">
                    <asp:Label runat="server" ID="lblmsg" ForeColor="red" Visible="false"></asp:Label>
                    <div class="form-group">
                        <label for="txtusername">Email address</label>
                        <asp:TextBox runat="server" ID="txtusername" CssClass="form-control" placeholder="Enter Username"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="txtPass">Password</label>
                        <asp:TextBox TextMode="Password" runat="server" ID="txtPass" CssClass="form-control" placeholder="Enter Password"></asp:TextBox>
                    </div>
                    <asp:Button Text="Login" CssClass="btn btn-primary btn-block" runat="server" ID="btnLogin" OnClick="btnLogin_Click" />
                </div>
            </div>
        </div>
        <footer style="position: fixed; bottom: 10px; width: 100%">
            <hr />
            <p class="container">&copy; <%: DateTime.Now.Year %> - bankApp</p>
        </footer>
    </form>
</body>
</html>
