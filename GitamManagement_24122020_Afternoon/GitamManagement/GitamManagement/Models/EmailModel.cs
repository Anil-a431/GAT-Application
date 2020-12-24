using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GitamManagement.Models
{
    public class EmailModel
    {
        public string fromEmail { get; set; }
        public string toEmail { get; set; }
        public string stmpEmailServer { get; set; }
        public string fromEmailPassword { get; set; }
        public string mailContent { get; set; }
        public string mailHeader { get; set; }
        
        public string templateName { get; set; }
        public string Username { get; set; }

        public string Password { get; set; }

        public string Id { get; set; }

    }
}