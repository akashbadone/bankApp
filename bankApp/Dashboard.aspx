<%@ Page Title="Dashboard" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="bankApp.Dashboard" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row">
        <div class="col-md-12">
            <h2 style="border-left: 5px skyblue solid">PACS Details</h2>
            <br />
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="form" style="border: 1px #ccc solid; border-radius: 5px; padding: 12px">
                <asp:Label runat="server" ID="lblmsg" ForeColor="red" Visible="false"></asp:Label>
                <div class="row">
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="ddlBank">Bank <small style="color: red">*</small></label>
                            <asp:DropDownList runat="server" ID="ddlBank" CssClass="form-control" AutoPostBack="true" OnInit="ddlBank_Init" OnSelectedIndexChanged="ddlBank_SelectedIndexChanged"></asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="ddlBranch">Branch <small style="color: red">*</small></label>
                            <asp:DropDownList runat="server" ID="ddlBranch" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlBranch_SelectedIndexChanged"></asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="ddlPACS">PACS <small style="color: red">*</small></label>
                            <asp:DropDownList runat="server" ID="ddlPACS" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlPACS_SelectedIndexChanged"></asp:DropDownList>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-md-12" style="margin-top: 25px">
            <asp:Label runat="server" ID="lblSuccess" Visible="false"
                Style="padding: 10px; margin: 36%; text-align: center; background-color: green; color: #fff; font-size: 25px; border-radius: 4px"></asp:Label>
            <div class="form" runat="server" id="divSave" visible="false" style="border: 1px #ccc solid; border-radius: 5px; padding: 0px 100px; margin-top: 50px;">
                <h3>Please Enter PACS Details (to be updated)</h3>
                <br />
                <div class="form-group">
                    <div class="row">
                        <div class="col-md-6">
                            <label for="txtPACSID">PACS ID</label>
                        </div>
                        <div class="col-md-6">
                            <asp:TextBox runat="server" ID="txtPACSID" CssClass="form-control" placeholder="Please Enter PACS ID (Max 6 digits)" MaxLength="6"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ID="rfvPACSID" ControlToValidate="txtPACSID" ErrorMessage="Please Enter PACS ID" ForeColor="Red" ValidationGroup="save"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="row">
                        <div class="col-md-6">
                            <label for="txtNoMember">Number of Members</label>
                        </div>
                        <div class="col-md-6">
                            <asp:TextBox runat="server" ID="txtNoMember" placeholder="Please Enter No of Members (Max 4 digits)" CssClass="form-control" MaxLength="4"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ID="rfvNoMember" ControlToValidate="txtNoMember" ErrorMessage="Please enter No of Members" ForeColor="Red" ValidationGroup="save"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator runat="server" ID="revNoMember" ControlToValidate="txtNoMember"
                                ErrorMessage="Please enter Numbers only" ForeColor="Red" ValidationGroup="save" ValidationExpression="\d+"></asp:RegularExpressionValidator>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="row">
                        <div class="col-md-6">
                            <label for="txtAnnualDeposit">Annual Deposits</label>
                        </div>
                        <div class="col-md-6">
                            <asp:TextBox runat="server" ID="txtAnnualDeposit" placeholder="Please Enter Annual Deposits (Max 10 digits)" CssClass="form-control" MaxLength="10"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ID="rfvAnnualDeposit" ControlToValidate="txtAnnualDeposit" ErrorMessage="Please Enter Annual Deposits" ForeColor="Red" ValidationGroup="save"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator runat="server" ID="revAnnualDeposit" ControlToValidate="txtAnnualDeposit"
                                ErrorMessage="Please enter Numbers only" ForeColor="Red" ValidationGroup="save" ValidationExpression="\d+"></asp:RegularExpressionValidator>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="row">
                        <div class="col-md-6">
                            <asp:Button runat="server" CssClass="btn btn-success btn-" CausesValidation="true" ValidationGroup="save" Style="float: right" ID="btnSave" OnClientClick="confirm('Do You want to Submit the details')" OnClick="btnSave_Click" Text="Save" />
                        </div>
                        <div class="col-md-6">
                            <button type="reset" class="btn btn-default" onclick="confirm('Do You want to Cancle Updation')">Cancle</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-12" style="margin-top: 25px">
            <br />
            <br />
            <br />
            <br />
        </div>
    </div>

</asp:Content>
