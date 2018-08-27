using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Fruit.Comman
{
    public class Authentication: ActionFilterAttribute
    {
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            if (HttpContext.Current.Session["controlUser"] == null)
                filterContext.Result = new RedirectResult("~/Admin/Login");

            base.OnActionExecuting(filterContext);
        }
    }
}