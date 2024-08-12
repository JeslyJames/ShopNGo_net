<%@ Page Async="true" Title="Checkout" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="ShopNGo.Checkout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <h1>Checkout</h1>

        <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="text-danger summary" HeaderText="Please correct these entries:" />

        <!-- Contact Information -->
        <h3>Contact Information</h3>
        <div class="form-group row">
            <label class="control-label col-sm-3">Email Address:</label>
            <div class="col-sm-5">
                <asp:TextBox ID="txtEmail1" runat="server" CssClass="form-control" TextMode="Email"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvEmail1" runat="server" ErrorMessage="Email address required" CssClass="text-danger" Display="Dynamic" ControlToValidate="txtEmail1">Required</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="revEmail1" runat="server" ErrorMessage="Must be a valid email address" CssClass="text-danger" Display="Dynamic" ValidationExpression="^[\w\.-]+@[\w\.-]+\.\w{2,4}$" ControlToValidate="txtEmail1">Invalid email</asp:RegularExpressionValidator>
            </div>
        </div>

        <!-- Date of Birth -->
        <div class="form-group row">
            <label class="control-label col-sm-3">Date of Birth:</label>
            <div class="col-sm-5">
                <asp:TextBox ID="txtDOB" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvDOB" runat="server" ErrorMessage="Date of Birth required" CssClass="text-danger" Display="Dynamic" ControlToValidate="txtDOB">Required</asp:RequiredFieldValidator>
                <asp:CustomValidator ID="cvDOB" runat="server" ErrorMessage="You must be at least 18 years old" CssClass="text-danger" ControlToValidate="txtDOB" OnServerValidate="cvDOB_ServerValidate" ClientValidationFunction="validateDOB">Invalid age</asp:CustomValidator>
            </div>
        </div>

        <!-- Personal Details -->
        <div class="form-group row">
            <label class="control-label col-sm-3">First Name:</label>
            <div class="col-sm-5">
                <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" ErrorMessage="First name required" CssClass="text-danger" Display="Dynamic" ControlToValidate="txtFirstName">Required</asp:RequiredFieldValidator>
            </div>
        </div>

        <div class="form-group row">
            <label class="control-label col-sm-3">Last Name:</label>
            <div class="col-sm-5">
                <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvLastName" runat="server" ErrorMessage="Last name required" CssClass="text-danger" Display="Dynamic" ControlToValidate="txtLastName">Required</asp:RequiredFieldValidator>
            </div>
        </div>

        <div class="form-group row">
            <label class="control-label col-sm-3">Phone Number:</label>
            <div class="col-sm-5">
                <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" TextMode="Phone"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvPhone" runat="server" ErrorMessage="Phone number required" CssClass="text-danger" Display="Dynamic" ControlToValidate="txtPhone">Required</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="revPhone" runat="server" ErrorMessage="Invalid phone number format" CssClass="text-danger" Display="Dynamic" ValidationExpression="(\d{3}-\d{3}-\d{4})" ControlToValidate="txtPhone">Format: 123-456-7890</asp:RegularExpressionValidator>
            </div>
        </div>

        <!-- Address -->
        <h3>Billing Address</h3>
        <div class="form-group row">
            <label class="control-label col-sm-3">Address:</label>
            <div class="col-sm-5">
                <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvAddress" runat="server" ErrorMessage="Billing address required" CssClass="text-danger" Display="Dynamic" ControlToValidate="txtAddress">Required</asp:RequiredFieldValidator>
            </div>
        </div>

        <div class="form-group row">
            <label class="control-label col-sm-3">City:</label>
            <div class="col-sm-5">
                <asp:TextBox ID="txtCity" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvCity" runat="server" ErrorMessage="City required" CssClass="text-danger" Display="Dynamic" ControlToValidate="txtCity">Required</asp:RequiredFieldValidator>
            </div>
        </div>

        <div class="form-group row">
            <label class="control-label col-sm-3">State:</label>
            <div class="col-sm-5">
                <asp:DropDownList ID="ddlState" runat="server" CssClass="form-control">
                    <asp:ListItem Text="Select State" Value=""></asp:ListItem>
                    <asp:ListItem Text="Alabama" Value="AL"></asp:ListItem>
                    <asp:ListItem Text="Alaska" Value="AK"></asp:ListItem>
                    <asp:ListItem Text="Arizona" Value="AZ"></asp:ListItem>
                    <asp:ListItem Text="Arkansas" Value="AR"></asp:ListItem>
                    <asp:ListItem Text="California" Value="CA"></asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvState" runat="server" ErrorMessage="State required" CssClass="text-danger" Display="Dynamic" ControlToValidate="ddlState">Required</asp:RequiredFieldValidator>
            </div>
        </div>

        <div class="form-group row">
            <label class="control-label col-sm-3">Zip Code:</label>
            <div class="col-sm-5">
                <asp:TextBox ID="txtZip" runat="server" CssClass="form-control" MaxLength="7"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvZip" runat="server" ErrorMessage="Zip code required" CssClass="text-danger" Display="Dynamic" ControlToValidate="txtZip">Required</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="revZip" runat="server" ErrorMessage="Invalid zip code" CssClass="text-danger" ValidationExpression="^[A-Za-z]\d[A-Za-z] \d[A-Za-z]\d$" Display="Dynamic" ControlToValidate="txtZip">Invalid format</asp:RegularExpressionValidator>
            </div>
        </div>

        <!-- Shipping Address -->
        <h3>Shipping Address</h3>
        <div class="form-group row">
            <div class="col-sm-offset-3 col-sm-9">
                <asp:CheckBox ID="chkSameAsBilling" runat="server" AutoPostBack="true" OnCheckedChanged="chkSameAsBilling_CheckedChanged" />
                <label>Same as billing address</label>
            </div>
        </div>

        <div class="form-group row">
            <label class="control-label col-sm-3">Address:</label>
            <div class="col-sm-5">
                <asp:TextBox ID="txtShipAddress" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvShipAddress" runat="server" ErrorMessage="Shipping address required" CssClass="text-danger" Display="Dynamic" ControlToValidate="txtShipAddress">Required</asp:RequiredFieldValidator>
            </div>
        </div>

        <div class="form-group row">
            <label class="control-label col-sm-3">City:</label>
            <div class="col-sm-5">
                <asp:TextBox ID="txtShipCity" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvShipCity" runat="server" ErrorMessage="City required" CssClass="text-danger" Display="Dynamic" ControlToValidate="txtShipCity">Required</asp:RequiredFieldValidator>
            </div>
        </div>

        <div class="form-group row">
            <label class="control-label col-sm-3">State:</label>
            <div class="col-sm-5">
                <asp:DropDownList ID="ddlShipState" runat="server" CssClass="form-control">
                    <asp:ListItem Text="Select State" Value=""></asp:ListItem>
                    <asp:ListItem Text="Alabama" Value="AL"></asp:ListItem>
                    <asp:ListItem Text="Alaska" Value="AK"></asp:ListItem>
                    <asp:ListItem Text="Arizona" Value="AZ"></asp:ListItem>
                    <asp:ListItem Text="Arkansas" Value="AR"></asp:ListItem>
                    <asp:ListItem Text="California" Value="CA"></asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvShipState" runat="server" ErrorMessage="State required" CssClass="text-danger" Display="Dynamic" ControlToValidate="ddlShipState">Required</asp:RequiredFieldValidator>
            </div>
        </div>

        <div class="form-group row">
            <label class="control-label col-sm-3">Zip Code:</label>
            <div class="col-sm-5">
                <asp:TextBox ID="txtShipZip" runat="server" CssClass="form-control" MaxLength="7"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvShipZip" runat="server" ErrorMessage="Zip code required" CssClass="text-danger" Display="Dynamic" ControlToValidate="txtShipZip">Required</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="revShipZip" runat="server" ErrorMessage="Invalid zip code" CssClass="text-danger" ValidationExpression="^[A-Za-z]\d[A-Za-z] \d[A-Za-z]\d$" Display="Dynamic" ControlToValidate="txtShipZip">Invalid format</asp:RegularExpressionValidator>
            </div>
        </div>

        <!-- Payment Information -->
        <h3>Payment Information</h3>
        <div class="form-group row">
            <label class="control-label col-sm-3">Credit Card Number:</label>
            <div class="col-sm-5">
                <asp:TextBox ID="txtCardNumber" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvCardNumber" runat="server" ErrorMessage="Credit card number required" CssClass="text-danger" Display="Dynamic" ControlToValidate="txtCardNumber">Required</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="revCardNumber" runat="server" ErrorMessage="Invalid credit card number" CssClass="text-danger" Display="Dynamic" ValidationExpression="^\d{16}$" ControlToValidate="txtCardNumber">Invalid number</asp:RegularExpressionValidator>
            </div>
        </div>

        <div class="form-group row">
            <label class="control-label col-sm-3">Expiry Date:</label>
            <div class="col-sm-5">
                <asp:TextBox ID="txtExpiryDate" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvExpiryDate" runat="server" ErrorMessage="Expiry date required" CssClass="text-danger" Display="Dynamic" ControlToValidate="txtExpiryDate">Required</asp:RequiredFieldValidator>
            </div>
        </div>

        <div class="form-group row">
            <label class="control-label col-sm-3">CVV:</label>
            <div class="col-sm-5">
                <asp:TextBox ID="txtCVV" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvCVV" runat="server" ErrorMessage="CVV required" CssClass="text-danger" Display="Dynamic" ControlToValidate="txtCVV">Required</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="revCVV" runat="server" ErrorMessage="Invalid CVV" CssClass="text-danger" Display="Dynamic" ValidationExpression="^\d{3}$" ControlToValidate="txtCVV">Invalid CVV</asp:RegularExpressionValidator>
            </div>
        </div>

        <!-- Submit Button -->
        <div class="form-group row">
            <div class="col-sm-offset-3 col-sm-5">
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-primary" OnClick="btnSubmit_Click" />
            </div>
        </div>
    </div>
</asp:Content>
