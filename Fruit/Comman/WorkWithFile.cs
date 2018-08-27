using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;

namespace Fruit.Comman
{
    public class WorkWithFile
    {
        public static string Upload(string _path,HttpPostedFileBase _file)
        {
            if (_file != null && _file.ContentLength > 0 && _file.ContentLength < 20024)
            {
                string extensionName = DateTime.Now.ToString();
                string fileName = Path.GetFileName(extensionName+_file.FileName);
                string filePath= Path.Combine(System.Web.HttpContext.Current.Server.MapPath(_path),fileName);
                _file.SaveAs(filePath);
                return fileName;
            }
            else throw new OutOfMemoryException();
        }
    }
}