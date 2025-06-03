<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PurchaseDetails.aspx.cs" Inherits="Beans_Stock_Management.PurchaseDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br /><br />
    <style type="text/css">
        body{
            background-color:#311432;
        }
        .floatRight {
            float: right;
        }

        .floatLeft {
            float: left;
        }
    </style>

    <div>
        <asp:Panel ID="Panel1" runat="server" Width="20%" CssClass="floatLeft">
            <div style="margin-top:50px">
                <table style="border-right: 3px solid gray; width:90%; height:180px;">
                  <tr>
                      <td>
                          <p style="font-family:Lobster; font-size:55px; text-align:center; color:FloralWhite;">Purchase<br />Details</p>
                      </td>
                  </tr>
                </table>
            </div>
        </asp:Panel>

        <asp:Panel ID="Panel2" runat="server" Width="80%" CssClass="floatRight">
            <br /><br />
            <table>
                <tr style="height:50px">
                    <td style="width:50%">
                        <asp:Label ID="currentDateL" runat="server" Text="Current Date" Font-Names="Poppins Light" Font-Size="20px" ForeColor="FloralWhite"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="currentDateTB" runat="server" ReadOnly="True" Font-Names="Poppins Light" Font-Size="18px"></asp:TextBox>
                    </td>
                </tr>
                <tr style="height:50px">
                    <td>
                        <asp:Label ID="customerNameL" runat="server" Text="Customer username" Font-Names="Poppins Light" Font-Size="20px" ForeColor="FloralWhite"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="usernameDDL" runat="server" DataSourceID="SqlDataSource1" DataTextField="username" DataValueField="username" AutoPostBack="True" Font-Names="Poppins Light" Font-Size="18px"></asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:StockConnection %>" SelectCommand="SELECT [username] FROM [Customer]"></asp:SqlDataSource>
                    </td>
                </tr>
            </table>
            <br /><br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" Height="100%" Width="100%" Font-Size="16px" BackColor="LightGray"  BorderColor="#2f4c66" BorderStyle="Solid">
                <Columns>
                    <asp:BoundField DataField="customerName" HeaderText="Customer Name" SortExpression="customerName" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="#507ca3"/>
                    <asp:BoundField DataField="itemName" HeaderText="Item Name" SortExpression="itemName" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="#507ca3"/>
                    <asp:BoundField DataField="description" HeaderText="Description" SortExpression="description" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="#507ca3"/>
                    <asp:BoundField DataField="price" HeaderText="Price" SortExpression="price" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="#507ca3"/>
                    <asp:BoundField DataField="purchase_date" HeaderText="Purchase Date" SortExpression="purchase_date" ReadOnly="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="#507ca3"/>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:StockConnection %>" SelectCommand="SELECT Customer.customerName, Item.itemName, Item.description, Item.price, FORMAT (Purchase.purchase_date,'yyyy/MM/dd') AS purchase_date FROM Customer, Purchase, Item WHERE Customer.username = Purchase.username AND Item.itemID = Purchase.itemID AND (Purchase.username = @username) AND (FORMAT (Purchase.purchase_date, 'yyyy/MM/dd') &gt;= DATEADD(DAY, -31, @startDate))">
                <SelectParameters>
                    <asp:ControlParameter ControlID="usernameDDL" Name="username" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="currentDateTB" Name="startDate" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
        </asp:Panel>
    </div>
</asp:Content>
