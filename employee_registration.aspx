<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="WebApplication4.home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
      
        .button {
  background-color: grey; 
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin-top:30px;
  border-radius:10px;
  cursor: pointer;
  -webkit-transition-duration: 0.4s;
  transition-duration: 0.4s;
}

.vamps
{
    margin-bottom:10px;
}
.button:hover {
  box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24),0 17px 50px 0 rgba(0,0,0,0.20);
}
.colums
{
    padding-left:200px;
    padding-top:200px;
    
}

        </style>
</head>
<body>
    <div class="container">
         <form id="form1" runat="server">
        
        
             <div class="colums">
                 <div class="vamps">
            <asp:Button CssClass="button"  runat="server" Text="Add" OnClick="Unnamed1_Click" ></asp:Button>
        </div>
         
            <asp:GridView ID="GridView1" EditRowStyle-CssClass="colums" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="employee_id" OnRowEditing="updatedata" OnRowUpdating="update1data" OnRowCancelingEdit="cancelediting" OnRowDeleting="deletedata">
                <Columns>
                    <asp:BoundField DataField="employee_id" HeaderText="employee ID" ReadOnly="True" />
                    <asp:BoundField DataField="firstname" HeaderText="firstname" />
                    <asp:BoundField DataField="lastname" HeaderText="lastname" />
                    <asp:BoundField DataField="phone" HeaderText="phone" />
                    <asp:BoundField DataField="email" HeaderText="email" />
                    <asp:BoundField DataField="adress" HeaderText="address" />
                    <asp:BoundField DataField="pincode" HeaderText="pincode" />
                    <asp:BoundField DataField="password" HeaderText="password" DataFormatString="*******" ReadOnly="True" />
                    <asp:CommandField  ButtonType="Button"  ShowEditButton="True" >
                    <ControlStyle  BackColor="#CCCCCC" BorderStyle="None" />
                    </asp:CommandField>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:Button ID="Button1" runat="server" OnClientClick="return confirm('are u want to delete?')" CausesValidation="False" CommandName="Delete" Text="Delete" />
                        </ItemTemplate>
                        <ControlStyle BackColor="#CCCCCC" BorderStyle="None" />
                    </asp:TemplateField>
                    
                </Columns>

<EditRowStyle CssClass="colums"></EditRowStyle>

                <FooterStyle  BackColor="#99CCCC" ForeColor="#003399" />
                <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                <RowStyle  BackColor="White" ForeColor="#003399" />
                <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                <SortedAscendingCellStyle BackColor="#EDF6F6" />
                <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                <SortedDescendingCellStyle BackColor="#D6DFDF" />
                <SortedDescendingHeaderStyle BackColor="#002876" />
            </asp:GridView>
                 </div>

             
            </form>

    </div>
           
        </body>
</html>
