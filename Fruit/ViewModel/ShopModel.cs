using Fruit.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Fruit.ViewModel
{
    public class ShopModel
    {
        public IEnumerable<Product> Products { get; set; }
        public IEnumerable<Category> Categories { get; set; }
    }
}