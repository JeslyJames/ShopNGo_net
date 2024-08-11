namespace ShopNGo.Models
{
    public class CartItem
    {
        public CartItem() { }

        public CartItem(Product product, int quantity)
        {
            this.Product = product;
            this.Quantity = quantity;
        }

        public Product Product { get; set; }
        public int Quantity { get; set; }

        public decimal TotalPrice => Quantity * Product.Price;

        public void AddQuantity(int quantity)
        {
            this.Quantity += quantity;
        }

        public string Display()
        {
            return $"{Product.Name} ({Quantity} at {Product.Price:C})";
        }
    }
}
