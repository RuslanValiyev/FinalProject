using Fruit.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Fruit.Controllers
{
    public class BlogController : Controller
    {
        private FruitDbEntities db = new FruitDbEntities();
        // GET: Blog
        public ActionResult Index()
        {
            return View(db.Blogs.ToList());
        }

        public  ActionResult Detail(int id)
        {
            return View(db.Blogs.Include("Comments").Where(m=>m.Id==id).FirstOrDefault());
        }
        [HttpPost]
        public ActionResult PostComment(string text,int id)
        {
            db.Comments.Add(new Comment { BlogDate = DateTime.Now, BlogContent = text, BlogId = id });
            db.SaveChanges();
            return View("Detail",db.Blogs.Include("Comments").Where(m => m.Id == id).FirstOrDefault());
        }
    }
}