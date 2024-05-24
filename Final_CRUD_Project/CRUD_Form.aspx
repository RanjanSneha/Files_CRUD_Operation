<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CRUD_Form.aspx.cs" Inherits="Final_CRUD_Project.CRUD_Form" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
   table , th , td {
       border : 1px double;
   }
    </style>
</head>

<body>
    <form id="form1" runat="server">
        <div>
            <table>
                <tr>
                    <asp:Label ID="DataMessage" runat="server" ForeColor="Green"></asp:Label>
                </tr>
                <tr>
                    <td> <asp:Label ID="Label1" runat="server" Text="Name : "></asp:Label>
                         <asp:RequiredFieldValidator ID="RequiredName" runat="server" ErrorMessage="This field is required" SetFocusOnError="true" Display="Dynamic" ForeColor="red" ControlToValidate="TextName"></asp:RequiredFieldValidator>
                    </td>
                    <td><asp:TextBox ID="TextName" runat="server"></asp:TextBox></td>
                   
                </tr>
                <tr>
                    <td><asp:Label ID="Label2" runat="server" Text="Age : "></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredAge" runat="server" ErrorMessage="This field is required" SetFocusOnError="true" Display="Dynamic" ForeColor="red" ControlToValidate="TextAge"></asp:RequiredFieldValidator>
                    </td>
                    <td><asp:TextBox ID="TextAge" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td><asp:Label ID="Label3" runat="server" Text="Gender : "></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredGender" runat="server" ErrorMessage="This field is required" SetFocusOnError="true" Display="Dynamic" ForeColor="Red" ToolTip="This field is required" ControlToValidate="DDGender" InitialValue="-1"></asp:RequiredFieldValidator>
                    </td>
                    <td><asp:DropDownList ID="DDGender" runat="server" Width="177px">
                        <asp:ListItem Text="Select Gender" Value="-1"></asp:ListItem>
                        <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
                        <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
                        <asp:ListItem Text="Other" Value="Other"></asp:ListItem>
                        </asp:DropDownList></td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align:center">
                        <asp:Button ID="SubmitBtn" runat="server" Text="SUBMIT" OnClick="SubmitBtn_Click" /></td>
                </tr>
            </table>
            <br />
            <asp:GridView ID="GridView1" runat="server" Width="200px" BackColor="#FFFFCC" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" DataKeyNames="ID" OnRowUpdating="OnRowUpdating" OnRowDeleting="OnRowDeleting">
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" InsertVisible="False" SortExpression="ID"></asp:BoundField>
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name"></asp:BoundField>
                    <asp:BoundField DataField="Age" HeaderText="Age" SortExpression="Age"></asp:BoundField>
                    <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender"></asp:BoundField>
                    
                    <asp:ButtonField Text="Edit"></asp:ButtonField>
                    <asp:ButtonField Text="Delete" CommandName="delete" > </asp:ButtonField>
                </Columns>
            </asp:GridView>
            

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FinalCRUDProjectConnectionString %>" SelectCommand="SELECT * FROM [StudentData]"DeleteCommand="DELETE FROM StudentData WHERE ID = @ID"> <DeleteParameters>
        <asp:Parameter ID="ID" Type"Int32" />
    </DeleteParameters></asp:SqlDataSource>

        </div>
    </form>
</body>
</html>
