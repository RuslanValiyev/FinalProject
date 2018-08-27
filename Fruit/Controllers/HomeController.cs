using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Fruit.Models;
using Fruit.ViewModel;
namespace Fruit.Controllers
{
    public class HomeController : Controller
    {
        private FruitDbEntities db = new FruitDbEntities();
        public ActionResult Index()
        {
            MainModel model = new MainModel();
            model.Blogs = db.Blogs.ToList();
            model.Categories = db.Categories.ToList();
            model.Fermers = db.Fermers.ToList();
            model.Products = db.Products.Where(m=>m.BoxOrNot==false).OrderByDescending(m=>m.Id).ToList();
            return View(model);
        }

        public ActionResult Layout()
        {
            Contact con = db.Contacts.FirstOrDefault();
            return Json(con,JsonRequestBehavior.AllowGet);
        }

       public ActionResult Subscribe(string email)
        {
            if(email!=null && email.Length>4 && email.Contains("@"))
            {
                db.Subscribes.Add(new Subscribe() { Email = email });
                db.SaveChanges();
                return Json(new {message= "You are subscribed" },JsonRequestBehavior.AllowGet);
            }else
            return Json(new {message= "insert correct email" },JsonRequestBehavior.AllowGet);
        }

    }
}