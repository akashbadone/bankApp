<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Report.aspx.cs" Inherits="bankApp.Report" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <link href="Content/jquery.dataTables.min.css" rel="stylesheet" />
    <link href="Content/dataTables.bootstrap.css" rel="stylesheet" />
    <link href="Content/colReorder.dataTables.min.css" rel="stylesheet" />
    <link href="Content/buttons.dataTables.min.css" rel="stylesheet" />

    <script src="Scripts/jquery-3.3.1.js"></script>
    <script src="Scripts/jquery.dataTables.min.js"></script>
    <script src="Scripts/dataTables.colReorder.min.js"></script>
    <script src="Scripts/dataTables.buttons.min.js"></script>
    <script src="Scripts/buttons.print.min.js"></script>

    <script src="Scripts/buttons.html5.min.js"></script>
    <script src="Scripts/buttons.colVis.min.js"></script>
    <script src="Scripts/jszip.min.js"></script>
    <script src="Scripts/pdfmake.js"></script>
    <script src="Scripts/pdfmake.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js"></script>
    <div class="row">
        <div class="col-md-12">
            <h2 style="border-left: 5px skyblue solid"><%: Title %></h2>
            <br />
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="form" style="border: 1px #ccc solid; border-radius: 5px; padding: 12px">
                <asp:Label runat="server" ID="lblMsg" ForeColor="red" Visible="false"></asp:Label>
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <asp:CheckBox ID="CheckBox2" AutoPostBack="true" runat="server" OnCheckedChanged="CheckBox2_CheckedChanged" Text="All" />
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <asp:CheckBox ID="CheckBox1" AutoPostBack="true" runat="server" OnCheckedChanged="CheckBox1_CheckedChanged" Text="BankWise Report" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row" runat="server" id="divAll" visible="false">
        <div class="col-md-12">
            <div class="form" style="border: 1px #ccc solid; border-radius: 5px; padding: 12px">
                <asp:GridView CssClass="datatable table table-hover table-bordered table-striped pagination-ys"
                    ShowHeaderWhenEmpty="true" AutoGenerateColumns="False" ID="GridView1" PageSize="50" runat="server">
                    <Columns>
                        <asp:TemplateField HeaderText="SNo." ItemStyle-Width="5%" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                            </ItemTemplate>
                            <ItemStyle Width="30px" HorizontalAlign="Center"></ItemStyle>
                        </asp:TemplateField>
                        <asp:BoundField DataField="bank" HeaderText="Bank" />
                        <asp:BoundField DataField="branch" HeaderText="Branch" />
                        <asp:BoundField DataField="pacsname" HeaderText="PACS" />
                        <asp:BoundField DataField="pacs_id" HeaderText="PACS ID" />
                        <asp:BoundField DataField="members" HeaderText="No. of Members" />
                        <asp:BoundField DataField="deposits" HeaderText="Deposits" />
                    </Columns>
                    <HeaderStyle BackColor="#348cd4" ForeColor="White" />
                </asp:GridView>
            </div>
        </div>
    </div>
    <div class="row" runat="server" id="divBankwise" visible="false">
        <div class="col-md-12">
            <div class="form" style="border: 1px #ccc solid; border-radius: 5px; padding: 12px">
                <asp:DropDownList runat="server" AutoPostBack="true" ID="ddlBanks" CssClass="form-control" OnInit="ddlBanks_Init" 
                    Style="margin: 0 auto;" OnSelectedIndexChanged="ddlBanks_SelectedIndexChanged"></asp:DropDownList>
                <asp:GridView Visible="false" CssClass="datatable table table-hover table-bordered table-striped pagination-ys"
                    ShowHeaderWhenEmpty="true" AutoGenerateColumns="False" ID="GridView2" PageSize="50" runat="server">
                    <Columns>
                        <asp:TemplateField HeaderText="SNo." ItemStyle-Width="5%" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                            </ItemTemplate>
                            <ItemStyle Width="30px" HorizontalAlign="Center"></ItemStyle>
                        </asp:TemplateField>
                        <asp:BoundField DataField="bank" HeaderText="Bank" />
                        <asp:BoundField DataField="branch" HeaderText="Branch" />
                        <asp:BoundField DataField="pacsname" HeaderText="PACS" />
                        <asp:BoundField DataField="pacs_id" HeaderText="PACS ID" />
                        <asp:BoundField DataField="members" HeaderText="No. of Members" />
                        <asp:BoundField DataField="deposits" HeaderText="Deposits" />
                    </Columns>
                    <HeaderStyle BackColor="#348cd4" ForeColor="White" />
                </asp:GridView>
            </div>
        </div>
    </div>
    <div class="col-md-12" style="margin-top: 25px">
        <br />
        <br />
        <br />
        <br />
    </div>
    <script>
        $(document).ready(function () {
            $("#<%=GridView1.ClientID %>").DataTable({
                dom: "<'row'<'col-xs-6 col-sm-4 col-md-4'B><'hidden-xs col-sm-4 col-md-4'l><'col-xs-6 col-sm-4 col-md-4'f>>" +
                    "<'row'<'col-sm-12'tr>>" +
                    "<'row'<'col-xs-5 col-sm-5 text-left'i><'col-xs-7 col-sm-7'p>>",
                "responsive": true,
                "lengthChange": false,
                "autoWidth": false,
                "buttons": ["copy", "csv", "excel", "pdf", "print"],
                "pageLength": 10
            }).buttons().container().appendTo('#<%=GridView1.ClientID %>_wrapper .col-md-6:eq(0)');

            $("#<%=GridView2.ClientID %>").DataTable({
                dom: "<'row'<'col-xs-6 col-sm-4 col-md-4'B><'hidden-xs col-sm-4 col-md-4'l><'col-xs-6 col-sm-4 col-md-4'f>>" +
                    "<'row'<'col-sm-12'tr>>" +
                    "<'row'<'col-xs-5 col-sm-5 text-left'i><'col-xs-7 col-sm-7'p>>",
                "responsive": true,
                "lengthChange": false,
                "autoWidth": false,
                "buttons": ["copy", "csv", "excel", "pdf", "print"],
                "pageLength": 10
            }).buttons().container().appendTo('#<%=GridView2.ClientID %>_wrapper .col-md-6:eq(0)');
        });
    </script>
</asp:Content>
