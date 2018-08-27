using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Fruit.Comman;
using Fruit.Models;

namespace Fruit.Areas.Admin.Controllers
{
    [Authentication]
    public class FermersController : Controller
    {
        private FruitDbEntities db = new FruitDbEntities();

        // GET: Admin/Fermers
        public ActionResult Index()
        {
            return View(db.Fermers.ToList());
        }

        // GET: Admin/Fermers/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Fermer fermer = db.Fermers.Find(id);
            if (fermer == null)
            {
                return HttpNotFound();
            }
            return View(fermer);
        }

        // GET: Admin/Fermers/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/Fermers/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Name,Surname,About,Image")] Fermer fermer,HttpPostedFileBase file)
        {
            if (ModelState.IsValid)
            {
                fermer.Image = Comman.WorkWithFile.Upload("~/Uploads/", file);
                db.Fermers.Add(fermer);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(fermer);
        }

        // GET: Admin/Fermers/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Fermer fermer = db.Fermers.Find(id);
            if (fermer == null)
            {
                return HttpNotFound();
            }
            return View(fermer);
        }

        // POST: Admin/Fermers/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Name,Surname,About,Image")] Fermer fermer,HttpPostedFileBase file)
        {
            if (ModelState.IsValid)
            {
                fermer.Image = Comman.WorkWithFile.Upload("~/Uploads/", file);
                db.Entry(fermer).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(fermer);
        }

        // POST: Admin/Fermers/Delete/5
        [ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            Fermer fermer = db.Fermers.Find(id);
            if (System.IO.File.Exists("~/Uploads/" + fermer.Image))
                System.IO.File.Delete("~/Uploads/" + fermer.Image);
            db.Fermers.Remove(fermer);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
