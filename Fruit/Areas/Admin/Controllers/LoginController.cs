using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Helpers;
using System.Web.Mvc;
using Fruit.Models;
namespace Fruit.Areas.Admin.Controllers
{
    public class LoginController : Controller
    {
        // GET: Admin/Login
        public ActionResult Index()
        {
            return View();
        }
        [ValidateAntiForgeryToken]
        [HttpPost]
        public ActionResult ValidateLogin(string Email,string PassWord)
        {
            FruitDbEntities db = new FruitDbEntities();
            User usr=  db.Users.Where(m => m.Email == Email).FirstOrDefault();
            if(usr!=null && usr.Password==PassWord)
            {
                ViewBag.err = "";
                Session["controlUser"] = "safasfsa";
                return RedirectToAction("Index", "Products");
            }
            ViewBag.err = "Username or Password is wrong";
            return View("Index");
        }

        public ActionResult LogOut()
        {
            Session["controlUser"] = null;
            return View("Index");
        }
    }
}