<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="WebApplication4.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>


     <style>
        html, body {
            min-height: 100%;
        }

        body, div, form, .input, select, textarea, .label, p {
            padding: 0;
            margin: 0;
            outline: none;
            font-family: Roboto, Arial, sans-serif;
            font-size: 14px;
            color: #666;
            line-height: 22px;
        }

        h1 {
            position: absolute;
            margin: 0;
            font-size: 40px;
            color: #fff;
            z-index: 2;
            line-height: 23px;
        }

        textarea {
            width: calc(100% - 12px);
            padding: 5px;
        }

        .testbox {
            display: flex;
            justify-content: center;
            align-items: center;
            height: inherit;
            padding: 20px;
        }

        form {
            width: 450px;
            height:20%;
            padding: 20px;
            border-radius: 6px;
            background: #fff;
            box-shadow: 0 0 8px #669999;
        }

        .banner {
            position: relative;
            height: 100px;
            background-image: url("/uploads/media/default/0001/02/c1504011491c4e04e5158b63a27a4ea654b03ed1.jpeg");
            background-size: cover;
            display: flex;
            justify-content: center;
            align-items: center;
            text-align: center;
        }

            .banner::after {
                content: "";
                background-color: rgba(0, 0, 0, 0.2);
                position: absolute;
                width: 100%;
                height: 100%;
            }

        .input, select, textarea {
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }

        .input {
            width: 290px;
            padding: 5px;
            margin-left:-100px;
        }

            input[type="date"] {
                padding: 4px 5px;
            }

        textarea {
            width: calc(100% - 12px);
            padding: 5px;
        }

        .item:hover p, .item:hover i, .question:hover p, .question label:hover, input:hover::placeholder {
            color: #669999;
        }

        .item input:hover, .item select:hover, .item textarea:hover {
            border: 1px solid transparent;
            box-shadow: 0 0 3px 0 #669999;
            color: #669999;
        }

        .item {
            position: relative;
            margin: 10px 0;
        }

           

        .week {
            display: flex;
            
        }

        .colums {
            display: flex;
            justify-content: space-between;
            flex-direction: row;
            flex-wrap: wrap;
        }

            .colums div {
                width: 48%;
            }

        .input[type="date"]::-webkit-inner-spin-button {
            display: none;
        }

        .item i, input[type="date"]::-webkit-calendar-picker-indicator {
            position: absolute;
            font-size: 20px;
            color: #a3c2c2;
        }

        .item i {
            right: 1%;
            top: 30px;
            z-index: 1;
        }

        input[type=radio], input[type=checkbox] {
            display: none;
        }

        label.radio {
            position: relative;
            display: inline-block;
            margin: 5px 20px 15px 0;
            cursor: pointer;
        }

        .question span {
            margin-left: 30px;
        }

        .question-answer label {
            display: block;
        }

        label.radio:before {
            content: "";
            position: absolute;
            left: 0;
            width: 17px;
            height: 17px;
            border-radius: 50%;
            border: 2px solid #ccc;
        }

        .input[type=radio]:checked + label:before, label.radio:hover:before {
            border: 2px solid #669999;
        }

        label.radio:after {
            content: "";
            position: absolute;
            top: 6px;
            left: 5px;
            width: 8px;
            height: 4px;
            border: 3px solid #669999;
            border-top: none;
            border-right: none;
            transform: rotate(-45deg);
            opacity: 0;
        }

        .input[type=radio]:checked + label:after {
            opacity: 1;
        }

        .flax {
            display: flex;
            justify-content: space-around;
        }

        .btn-block {
            margin-top: 10px;
            text-align: center;
        }

        .button {
            width: 150px;
            padding: 10px;
            border: none;
            border-radius: 5px;
            background: #669999;
            font-size: 16px;
            color: #fff;
            cursor: pointer;
        }
        .input1{
           padding-left:140px;
        }

            .button:hover {
                background: #a3c2c2;
            }

        @media (min-width: 568px) {
            .name-item, .city-item {
                display: flex;
                flex-wrap: wrap;
                justify-content: space-between;
            }

                .name-item input, .name-item div {
                    width: calc(50% - 20px);
                }

                    .name-item div input {
                        width: 97%;
                    }

                    .name-item div label {
                        display: block;
                        padding-bottom: 5px;
                    }
        }
         .auto-style1 {
             width: 239px;
         }
    </style>
    </head>
<body>
    
        <div class="testbox">
            <form id="form1" runat="server">
                <div class="banner">
                <h1>New Member Registration</h1>
                </div>
                     <table style="padding-top:10px;">
                          <asp:HiddenField ID="hfuserID" runat="server"/> 
                         <tr class="item">
                             <td>
                                    <asp:Label CssClass="label"  runat="server">First Name:</asp:Label>     
                             </td>
                             <td>
                                  <asp:TextBox ID="txt1" CssClass="input" required="required" runat="server"></asp:TextBox>

                             </td>
                           
                         </tr>
                         <tr>
                               <td  class="input1">
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="txt1" ForeColor="Red"></asp:RequiredFieldValidator>
                             </td>
                         </tr>
                         <tr class="item">
                             <td> 
                                                     <asp:Label CssClass="label" runat="server">Last Name:</asp:Label>

                             </td>
                             <td>                <asp:TextBox ID="txt2" CssClass="input" required="required" runat="server"></asp:TextBox>
</td>
                             
                         </tr>
                           <tr>
                               <td  class="input1">
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="txt2" ForeColor="Red"></asp:RequiredFieldValidator>
                             </td>
                         </tr>
                          <tr class="item">
                             <td>                    <asp:Label CssClass="label" runat="server">Phone:</asp:Label>
</td>
                             <td>                <asp:TextBox ID="txt3" CssClass="input" required="required" runat="server" TextMode="Phone"></asp:TextBox>
</td>
                         </tr>
                         <tr>
                             <td  class="input1">
                         <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="not valid" ControlToValidate="txt3" ForeColor="Red" ValidationExpression="^[0-9][0-9]{9}$"></asp:RegularExpressionValidator>

                             </td>
                         </tr>
                          <tr class="item">
                             <td>                    <asp:Label CssClass="label" runat="server">Email:</asp:Label>
</td>
                             <td>                <asp:TextBox ID="txt4" CssClass="input" required="required" runat="server" TextMode="Email"></asp:TextBox>
</td>
                         </tr>
                         <tr>
                             <td  class="input1">
                         <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="not valid" ControlToValidate="txt4" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>

                             </td>
                         </tr>
                          <tr class="item">
                             <td>                    <asp:Label CssClass="label" runat="server">Zip/Postal Code:</asp:Label>
</td>
                             <td>                <asp:TextBox ID="txt6" CssClass="input" required="required" runat="server"></asp:TextBox>
</td>
                         </tr>
                           <tr>
                               <td  class="input1">
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ControlToValidate="txt6" ForeColor="Red"></asp:RequiredFieldValidator>
                             </td>
                         </tr>
                          <tr class="item">
                             <td>                    <asp:Label CssClass="label" runat="server">Address:</asp:Label>
</td>
                             <td>                <asp:TextBox ID="txt5" CssClass="input" required="required" runat="server"></asp:TextBox>
</td>
                         </tr>
                           <tr>
                               <td  class="input1">
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ControlToValidate="txt5" ForeColor="Red"></asp:RequiredFieldValidator>
                             </td>
                         </tr>
                          <tr class="item">
                             <td>                    <asp:Label CssClass="label" runat="server">Password:</asp:Label>
</td>
                             <td>                
                                 <asp:TextBox ID="txt7" CssClass="input" required="required" runat="server" TextMode="Password"></asp:TextBox>
</td>
                         </tr>
                         <tr>
                             <td>
                                 <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txt7" ErrorMessage="*atleast one lower,upper,splecial,number and length 8" ForeColor="Red" ValidationExpression="^.*(?=.{8,})(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!*@#$%^&amp;+=]).*$"></asp:RegularExpressionValidator>
                             </td>
                         </tr>
                         <tr >
                              <td> <h2 class="auto-style1">Terms and Conditions</h2></td>
                             <td class="btn-block">
                                                     <asp:Button CssClass="input button" Text="Submit" runat="server" OnClick="Unnamed8_Click"></asp:Button>

                             </td>
                         </tr>

                     </table>
               
            </form>            
        </div>


</body>
</html>
