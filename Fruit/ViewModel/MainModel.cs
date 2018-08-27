using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Fruit.Models;
namespace Fruit.ViewModel
{
    public class MainModel
    {
        public  IEnumerable<Product> Products { get; set; }
        public  IEnumerable<Fermer> Fermers { get; set; }
        public  IEnumerable<Blog> Blogs { get; set; }
        public IEnumerable<Category> Categories { get; set; }

    }
}