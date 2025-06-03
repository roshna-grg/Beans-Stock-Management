<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Item.aspx.cs" Inherits="Beans_Stock_Management.Item" %>
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
        <asp:Panel ID="Panel1" runat="server" Width="40%" CssClass="floatLeft">
            <div style="margin-top:50px">
                <table style="border-right: 3px solid gray; width:90%; height:387px;">
                  <tr>
                      <td>
                          <p style="font-family:Lobster; font-size:55px; text-align:center; color:FloralWhite;">Add Items</p>
                      </td>
                  </tr>
                </table>
            </div>
        </asp:Panel>

        <asp:Panel ID="Panel2" runat="server" Width="60%" CssClass="floatRight">
            <br /><br />
            <table>
                <tr style="height:50px">
                    <td style="width:50%">
                        <asp:Label ID="itemIDL" runat="server" Text="Item ID" Font-Names="Poppins Light" Font-Size="20px" ForeColor="FloralWhite"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="itemIDTB" runat="server" TextMode="Number" Font-Names="Poppins Light" Font-Size="18px"></asp:TextBox>
                    </td>
                </tr>
                <tr style="height:50px">
                    <td>
                        <asp:Label ID="itemNameL" runat="server" Text="Item Name" Font-Names="Poppins Light" Font-Size="20px" ForeColor="FloralWhite"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="itemNameTB" runat="server" Font-Names="Poppins Light" Font-Size="18px"></asp:TextBox>
                    </td>
                </tr>
                <tr style="height:50px">
                    <td>
                        <asp:Label ID="descriptionL" runat="server" Text="Description" Font-Names="Poppins Light" Font-Size="20px" ForeColor="FloralWhite"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="descriptionTB" runat="server" Font-Names="Poppins Light" Font-Size="18px"></asp:TextBox>
                    </td>
                </tr>
                <tr style="height:50px">
                    <td>
                        <asp:Label ID="priceL" runat="server" Text="Price" Font-Names="Poppins Light" Font-Size="20px" ForeColor="FloralWhite"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="priceTB" runat="server" Font-Names="Poppins Light" Font-Size="18px"></asp:TextBox>
                    </td>
                </tr>
                <tr style="height:50px">
                    <td>
                        <asp:Label ID="purchaseL" runat="server" Text="Purchase Date" Font-Names="Poppins Light" Font-Size="20px" ForeColor="FloralWhite"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="purchaseTB" runat="server" TextMode="Date" Font-Names="Poppins Light" Font-Size="18px"></asp:TextBox>
                    </td>
                </tr>
                <tr style="height:50px">
                    <td>
                        <asp:Label ID="categoryL" runat="server" Text="Category Name" Font-Names="Poppins Light" Font-Size="20px" ForeColor="FloralWhite"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="categoryDDL" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="categoryName" DataValueField="categoryID" Font-Names="Poppins Light" Font-Size="18px"></asp:DropDownList>

                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:StockConnection %>" SelectCommand="SELECT [categoryID], [categoryName] FROM [Category]"></asp:SqlDataSource>
                    </td>
                </tr>
                <tr style="height:50px">
                    <td>
                        <asp:Label ID="manufactureL" runat="server" Text="Manufacture Date" Font-Names="Poppins Light" Font-Size="20px" ForeColor="FloralWhite"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="manufactureTB" runat="server" TextMode="Date" Font-Names="Poppins Light" Font-Size="18px"></asp:TextBox>
                    </td>
                </tr>
                <tr style="height:50px">
                    <td>
                        <asp:Label ID="expiryL" runat="server" Text="Expiry Date" Font-Names="Poppins Light" Font-Size="20px" ForeColor="FloralWhite"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="expiryTB" runat="server" TextMode="Date" Font-Names="Poppins Light" Font-Size="18px"></asp:TextBox>
                    </td>
                </tr>
            </table>
            <br />
            <asp:Button ID="addBtn" runat="server" Text="Add" OnClick="addBtn_Click" Font-Size="18px" Height="38px" Width="96px"/>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:StockConnection %>" DeleteCommand="DELETE FROM [Item] WHERE [itemID] = @itemID" InsertCommand="INSERT INTO [Item] ([itemID], [itemName], [description], [price], [purchaseDate], [categoryID], [manufactureDate], [expiryDate]) VALUES (@itemID, @itemName, @description, @price, @purchaseDate, @categoryID, @manufactureDate, @expiryDate)" SelectCommand="SELECT * FROM [Item]" UpdateCommand="UPDATE [Item] SET [itemName] = @itemName, [description] = @description, [price] = @price, [purchaseDate] = @purchaseDate, [categoryID] = @categoryID, [manufactureDate] = @manufactureDate, [expiryDate] = @expiryDate WHERE [itemID] = @itemID">
                <DeleteParameters>
                    <asp:Parameter Name="itemID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="itemID" Type="Int32" />
                    <asp:Parameter Name="itemName" Type="String" />
                    <asp:Parameter Name="description" Type="String" />
                    <asp:Parameter Name="price" Type="Int32" />
                    <asp:Parameter DbType="Date" Name="purchaseDate" />
                    <asp:Parameter Name="categoryID" Type="Int32" />
                    <asp:Parameter DbType="Date" Name="manufactureDate" />
                    <asp:Parameter DbType="Date" Name="expiryDate" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="itemName" Type="String" />
                    <asp:Parameter Name="description" Type="String" />
                    <asp:Parameter Name="price" Type="Int32" />
                    <asp:Parameter DbType="Date" Name="purchaseDate" />
                    <asp:Parameter Name="categoryID" Type="Int32" />
                    <asp:Parameter DbType="Date" Name="manufactureDate" />
                    <asp:Parameter DbType="Date" Name="expiryDate" />
                    <asp:Parameter Name="itemID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </asp:Panel>
    </div>
</asp:Content>
