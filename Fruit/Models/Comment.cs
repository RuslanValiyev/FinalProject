//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Fruit.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;

    public partial class Comment
    {
        public int Id { get; set; }
        public int BlogId { get; set; }
        [Required]
        [MaxLength(250)]
        public string BlogContent { get; set; }
        public Nullable<System.DateTime> BlogDate { get; set; }
    
        public virtual Blog Blog { get; set; }
    }
}
