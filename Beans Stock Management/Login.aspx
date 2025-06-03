<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Beans_Stock_Management.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <style type="text/css">
        body{
            background-color:#311432;
        }
        .box {
            width:300px;
            height:300px;
            position:fixed;
            margin-left:-150px;
            margin-top:-150px;
            top:50%;
            left:50%;
        }
    </style>
    <form id="form1" runat="server">
        <div>
            <table border="1" class="box">
                <tr>
                    <td>
                        <table>
                            <tr style="height: 50px">
                                <td style="width: 50%">
                                    <asp:Label ID="usernameL" runat="server" Text="Username" Font-Names="Poppins Light" Font-Size="20px" ForeColor="FloralWhite"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBoxUsername" runat="server" Font-Names="Poppins Light" Font-Size="18px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorUsername" runat="server" ErrorMessage="Username is empty" ForeColor="Red" Font-Size="18px" ControlToValidate="TextBoxUsername"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr style="height: 50px">
                                <td>
                                    <asp:Label ID="passwordL" runat="server" Text="Password" Font-Names="Poppins Light" Font-Size="20px" ForeColor="FloralWhite"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBoxPassword" runat="server" TextMode="Password" Font-Names="Poppins Light" Font-Size="18px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorPassword" runat="server" ErrorMessage="Password is empty" ForeColor="Red" Font-Size="18px" ControlToValidate="TextBoxPassword"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr style="height: 50px">
                                <td>

                                </td>
                                <td>
                                    <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" Font-Size="18px" Height="38px" Width="96px" />
                                    <br />
                                    <asp:Label ID="LabelMsg" runat="server" Text="" ForeColor="Red" Font-Size="18px"></asp:Label>
                                </td>
                            </tr>
                        </table>
                        <br />
                        <asp:SqlDataSource ID="SqlDataSourceLogin" runat="server" ConnectionString="<%$ ConnectionStrings:StockConnection %>" SelectCommand="SELECT username, password FROM UserTable WHERE username = @username AND password = @password">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="TextBoxUsername" Name="username" PropertyName="Text" />
                                <asp:ControlParameter ControlID="TextBoxPassword" Name="password" PropertyName="Text" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
