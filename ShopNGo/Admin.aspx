<%@ Page Async="true" Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="ShopNGo.Admin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <!-- Dropdown List to select categories -->
                <asp:DropDownList ID="ddlCategories" runat="server" AutoPostBack="True" 
                    CssClass="form-control mb-3"
                    DataSourceID="SqlDataSourceCategories" DataTextField="category_name" DataValueField="category_id">
                </asp:DropDownList>

                <!-- SqlDataSource for categories -->
                <asp:SqlDataSource ID="SqlDataSourceCategories" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ShopNGoConnectionString2 %>" 
                    SelectCommand="SELECT [category_id], [category_name] FROM [Categories]">
                </asp:SqlDataSource>

                <!-- DataList to show products based on selected category -->
                <asp:DataList ID="dlProducts" runat="server" DataSourceID="SqlDataSourceProducts" 
                    CssClass="list-group">
                    <ItemTemplate>
                        <div class="list-group-item">
                            <h4 class="list-group-item-heading"><%# Eval("name") %></h4>
                            <p class="list-group-item-text"><%# Eval("description") %></p>
                        </div>
                    </ItemTemplate>
                </asp:DataList>

                <!-- SqlDataSource for products based on selected category -->
                <asp:SqlDataSource ID="SqlDataSourceProducts" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ShopNGoConnectionString2 %>" 
                    SelectCommand="SELECT * FROM Products WHERE category_id = @category_id">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddlCategories" Name="category_id" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>

                <!-- GridView for categories with CRUD operations -->
                <asp:GridView ID="gvCategories" runat="server" AutoGenerateColumns="False" DataKeyNames="category_id" 
                    DataSourceID="SqlDataSourceCategoriesCRUD" AllowPaging="True" AllowSorting="True" 
                    OnRowUpdated="gvCategories_RowUpdated" OnRowDeleted="gvCategories_RowDeleted" 
                    CssClass="table table-bordered">
                    <Columns>
                        <asp:BoundField DataField="category_id" HeaderText="ID" ReadOnly="True" SortExpression="category_id" />
                        <asp:BoundField DataField="category_name" HeaderText="Category Name" SortExpression="category_name" />
                        <asp:BoundField DataField="description" HeaderText="Description" SortExpression="description" />
                        <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
                    </Columns>
                </asp:GridView>

                <!-- SqlDataSource for categories CRUD -->
                <asp:SqlDataSource ID="SqlDataSourceCategoriesCRUD" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ShopNGoConnectionString2 %>" 
                    SelectCommand="SELECT * FROM Categories"
                    UpdateCommand="UPDATE Categories SET category_name = @category_name, description = @description WHERE category_id = @category_id"
                    DeleteCommand="DELETE FROM Categories WHERE category_id = @category_id">
                    <UpdateParameters>
                        <asp:Parameter Name="category_name" Type="String" />
                        <asp:Parameter Name="description" Type="String" />
                        <asp:Parameter Name="category_id" Type="Int32" />
                    </UpdateParameters>
                    <DeleteParameters>
                        <asp:Parameter Name="category_id" Type="Int32" />
                    </DeleteParameters>
                </asp:SqlDataSource>

                <!-- Form to add new category -->
                <asp:TextBox ID="txtCategoryName" runat="server" Placeholder="Category Name" CssClass="form-control mb-2"></asp:TextBox>
                <asp:TextBox ID="txtCategoryDescription" runat="server" Placeholder="Description" CssClass="form-control mb-2"></asp:TextBox>
                <asp:Button ID="btnAddCategory" runat="server" Text="Add New Category" OnClick="btnAddCategory_Click" CssClass="btn btn-primary" />

                <!-- SqlDataSource to add new category -->
                <asp:SqlDataSource ID="SqlDataSourceAddCategory" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ShopNGoConnectionString2 %>" 
                    InsertCommand="INSERT INTO Categories (category_name, description) VALUES (@category_name, @description)" SelectCommand="select * from Categories ">
                    <InsertParameters>
                        <asp:Parameter Name="category_name" Type="String" />
                        <asp:Parameter Name="description" Type="String" />
                    </InsertParameters>
                </asp:SqlDataSource>
            </div>
            <div class="col-md-6">
                <!-- GridView for products with Select button -->
                <asp:GridView ID="gvProducts" runat="server" AutoGenerateColumns="False" DataKeyNames="product_id" 
                    DataSourceID="SqlDataSourceProductsCRUD" AllowPaging="True" AllowSorting="True" 
                    OnSelectedIndexChanged="gvProducts_SelectedIndexChanged"
                    CssClass="table table-bordered">
                    <Columns>
                        <asp:BoundField DataField="name" HeaderText="Product Name" SortExpression="product_name" />
                        <asp:BoundField DataField="description" HeaderText="Description" SortExpression="description" />
                        <asp:BoundField DataField="price" HeaderText="Price" SortExpression="price" />
                        <asp:CommandField ShowSelectButton="True"  ShowDeleteButton="True"/>
                    </Columns>
                </asp:GridView>

                <!-- SqlDataSource for products CRUD -->
                <asp:SqlDataSource ID="SqlDataSourceProductsCRUD" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ShopNGoConnectionString2 %>" 
                    SelectCommand="SELECT * FROM Products"
                    UpdateCommand="UPDATE Products SET name = @name, description = @description, price = @price WHERE product_id = @product_id"
                    DeleteCommand="DELETE FROM Products WHERE product_id = @product_id"
                    InsertCommand="INSERT INTO Products (name, description, price, stock_quantity, category_id, image_url, original_price, sale_price, stock) 
                    VALUES (@name, @description, @price, @stock_quantity, @category_id, @image_url, @original_price, @sale_price, @stock)">
                    <UpdateParameters>
                        <asp:Parameter Name="name" Type="String" />
                        <asp:Parameter Name="description" Type="String" />
                        <asp:Parameter Name="price" Type="Decimal" />
                        <asp:Parameter Name="product_id" Type="Int32" />
                    </UpdateParameters>
                    <DeleteParameters>
                        <asp:Parameter Name="product_id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
        <asp:Parameter Name="name" Type="String" />
        <asp:Parameter Name="description" Type="String" />
        <asp:Parameter Name="price" Type="Decimal" />
        <asp:Parameter Name="stock_quantity" Type="Int32" />
        <asp:Parameter Name="category_id" Type="Int32" />
        <asp:Parameter Name="image_url" Type="String" />
        <asp:Parameter Name="original_price" Type="Decimal" />
        <asp:Parameter Name="sale_price" Type="Decimal" />
        <asp:Parameter Name="stock" Type="Int32" />
    </InsertParameters>
                </asp:SqlDataSource>

                <!-- DetailsView for selected product with CRUD operations -->
                <asp:DetailsView ID="dvProducts" runat="server" AutoGenerateRows="False" DataKeyNames="product_id" 
                    DataSourceID="SqlDataSourceProductsCRUD" DefaultMode="Edit" CssClass="table">
    <Fields>
        <asp:BoundField DataField="name" HeaderText="Product Name" SortExpression="name" />
        <asp:BoundField DataField="description" HeaderText="Description" SortExpression="description" />
        <asp:BoundField DataField="price" HeaderText="Price" SortExpression="price" DataFormatString="{0:C}" />
        <asp:BoundField DataField="stock_quantity" HeaderText="Stock Quantity" SortExpression="stock_quantity" />
        <asp:BoundField DataField="category_id" HeaderText="Category ID" SortExpression="category_id" />
        <asp:BoundField DataField="image_url" HeaderText="Image URL" SortExpression="image_url" />
        <asp:BoundField DataField="original_price" HeaderText="Original Price" SortExpression="original_price" DataFormatString="{0:C}" />
        <asp:BoundField DataField="sale_price" HeaderText="Sale Price" SortExpression="sale_price" DataFormatString="{0:C}" />
        <asp:BoundField DataField="stock" HeaderText="Stock" SortExpression="stock" />
        <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" ShowInsertButton="True" />
    </Fields>
</asp:DetailsView>

                <!-- Button to add new product -->
                <asp:Button ID="btnAddProduct" runat="server" Text="Add New Product" OnClick="btnAddProduct_Click" CssClass="btn btn-success mt-2" />
            </div>
        </div>
    </div>
</asp:Content>