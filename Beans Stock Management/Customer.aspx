<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Customer.aspx.cs" Inherits="Beans_Stock_Management.Customer" %>
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
                <table style="border-right: 3px solid gray; width:90%; height:339px;">
                  <tr>
                      <td>
                          <p style="font-family:Lobster; font-size:55px; text-align:center; color:FloralWhite;">Customer</p>
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
                        <asp:Label ID="usernameL" runat="server" Text="Username" Font-Names="Poppins Light" Font-Size="20px" ForeColor="FloralWhite"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="usernameTB" runat="server" Font-Names="Poppins Light" Font-Size="18px"></asp:TextBox>
                    </td>
                </tr>
                <tr style="height:50px">
                    <td>
                        <asp:Label ID="nameL" runat="server" Text="Customer Name" Font-Names="Poppins Light" Font-Size="20px" ForeColor="FloralWhite"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="nameTB" runat="server" Font-Names="Poppins Light" Font-Size="18px"></asp:TextBox>
                    </td>
                </tr>
                <tr style="height:50px">
                    <td>
                        <asp:Label ID="addressL" runat="server" Text="Address" Font-Names="Poppins Light" Font-Size="20px" ForeColor="FloralWhite"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="addressTB" runat="server" Font-Names="Poppins Light" Font-Size="18px"></asp:TextBox>
                    </td>
                </tr>
                <tr style="height:50px">
                    <td>
                        <asp:Label ID="contactL" runat="server" Text="Contact No." Font-Names="Poppins Light" Font-Size="20px" ForeColor="FloralWhite"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="contactTB" runat="server" TextMode="Number" Font-Names="Poppins Light" Font-Size="18px"></asp:TextBox>
                    </td>
                </tr>
                <tr style="height:50px">
                    <td>
                        <asp:Label ID="memberTypeL" runat="server" Text="Member Type" Font-Names="Poppins Light" Font-Size="20px" ForeColor="FloralWhite"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="memberTypeDDL" runat="server" Font-Names="Poppins Light" Font-Size="18px" Width="179px">
                            <asp:ListItem>Regular</asp:ListItem>
                            <asp:ListItem>New</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr style="height:50px">
                    <td>
                        <asp:Label ID="emailL" runat="server" Text="Email" Font-Names="Poppins Light" Font-Size="20px" ForeColor="FloralWhite"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="emailTB" runat="server" TextMode="Email" Font-Names="Poppins Light" Font-Size="18px"></asp:TextBox>
                    </td>
                </tr>
                <tr style="height:50px">
                    <td>
                        <asp:Label ID="passwordL" runat="server" Text="Password" Font-Names="Poppins Light" Font-Size="20px" ForeColor="FloralWhite"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="passwordTB" runat="server" TextMode="Password" Font-Names="Poppins Light" Font-Size="18px"></asp:TextBox>
                    </td>
                </tr>
            </table>
            <br /><br />
            <asp:Button ID="addBtn" runat="server" Text="Add" OnClick="addBtn_Click" Font-Size="18px" Height="38px" Width="96px"/>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:StockConnection %>" DeleteCommand="DELETE FROM [Customer] WHERE [username] = @username" InsertCommand="INSERT INTO [Customer] ([username], [customerName], [customerAddress], [contactNo], [email], [memberType], [password]) VALUES (@username, @customerName, @customerAddress, @contactNo, @email, @memberType, @password)" SelectCommand="SELECT * FROM [Customer]" UpdateCommand="UPDATE [Customer] SET [customerName] = @customerName, [customerAddress] = @customerAddress, [contactNo] = @contactNo, [email] = @email, [memberType] = @memberType, [password] = @password WHERE [username] = @username">
                <DeleteParameters>
                    <asp:Parameter Name="username" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="username" Type="String" />
                    <asp:Parameter Name="customerName" Type="String" />
                    <asp:Parameter Name="customerAddress" Type="String" />
                    <asp:Parameter Name="contactNo" Type="String" />
                    <asp:Parameter Name="email" Type="String" />
                    <asp:Parameter Name="memberType" Type="String" />
                    <asp:Parameter Name="password" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="customerName" Type="String" />
                    <asp:Parameter Name="customerAddress" Type="String" />
                    <asp:Parameter Name="contactNo" Type="String" />
                    <asp:Parameter Name="email" Type="String" />
                    <asp:Parameter Name="memberType" Type="String" />
                    <asp:Parameter Name="password" Type="String" />
                    <asp:Parameter Name="username" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </asp:Panel>
    </div>
</asp:Content>
