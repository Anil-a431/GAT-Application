using GitamManagement.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Security.Cryptography;
using System.Text;
using System.Web;

namespace GitamManagement
{
    public class Common
    {
        public string GetMD5Hash(string input)
        {
            using (MD5 md5Hash = MD5.Create())
            {
                // Convert the input string to a byte array and compute the hash. 
                byte[] data = md5Hash.ComputeHash(Encoding.UTF8.GetBytes(input));
                // Create a new Stringbuilder to collect the bytes 
                // and create a string. 
                StringBuilder sBuilder = new StringBuilder();
                // Loop through each byte of the hashed data
                // and format each one as a hexadecimal string. 

                for (int i = 0; i < (data.Length); i++)
                {
                    sBuilder.Append(data[i].ToString("x2"));
                }
                // Return the hexadecimal string.
                return sBuilder.ToString();
            }
        }

        public string PasswordGenerator()
        {
            Random RNG = new Random();
            int length = 16;
            var rString = "";
            for (var i = 0; i < length; i++)
            {
                if (i % 2 == 0)
                {
                    rString += ((char)(RNG.Next(1, 26) + 64)).ToString().ToLower();
                }
                else
                {
                    rString += ((char)(RNG.Next(1, 26) + 64)).ToString().ToUpper();
                }

            }
            return rString;
        }

        public string SendEmailUser(EmailModel obj)
        {
            try
            {
                var serverName = ConfigurationManager.AppSettings["serverName"];
                int portNumber = Convert.ToInt32(ConfigurationManager.AppSettings["portNumber"]);
                obj.fromEmail = ConfigurationManager.AppSettings["fromEmail"];
                obj.fromEmailPassword = ConfigurationManager.AppSettings["fromEmailPassword"];
                string to = obj.toEmail; //To address    
                string from = obj.fromEmail;
                MailMessage message = new MailMessage(from, to);
                string mailbody = GenerateHTML(obj.templateName, obj.Username, obj.mailContent, obj.toEmail, obj.Password,obj.Id);
                message.Subject = obj.mailHeader;
                message.Body = mailbody;
                message.BodyEncoding = Encoding.UTF8;
                message.IsBodyHtml = true;
                SmtpClient client = new SmtpClient(serverName, portNumber); //Gmail smtp    
                System.Net.NetworkCredential basicCredential1 = new
                System.Net.NetworkCredential(obj.fromEmail, obj.fromEmailPassword);
                client.EnableSsl = true;
                client.UseDefaultCredentials = false;
                client.Credentials = basicCredential1;

                client.Send(message);
                return "Successful";
            }

            catch (Exception ex)
            {
                throw ex;
                return "Failure";
            }
        }
        public string GenerateHTML(string templateName,string Username,string Description,
            string DynamicEmail,string DynamicPassword,string Id)
        {
            string path = string.Empty;
            string body = string.Empty;
            var ApplicationURL = ConfigurationManager.AppSettings["ApplicationURL"];
            switch (templateName)
            {
                case "Registration": path = @"/EmailTemplates/RegistrationTemplate.html";
                    break;
                case "ForgotPassword":path = @"/EmailTemplates/ForgotPasswordTemplate.html";
                    break;
                case "Confirmation": path = @"/EmailTemplates/ConfirmationTemplate.html";
                    break;
            }
            if(path != string.Empty)
            {
                if (path == @"/EmailTemplates/ConfirmationTemplate.html")
                {
                    string filePath1 = HttpContext.Current.Server.MapPath(path);
                    using (StreamReader replaceContent = new StreamReader(filePath1))
                    {
                        body = replaceContent.ReadToEnd();
                    }
                    body = body.Replace("{UserName}", Username);
                    body = body.Replace("{Description}", Description);
                    body = body.Replace("{UserID}", Id);
                }
                else
                {
                    string filePath = HttpContext.Current.Server.MapPath(path);
                    using (StreamReader replaceContent = new StreamReader(filePath))
                    {
                        body = replaceContent.ReadToEnd();
                    }
                    body = body.Replace("{UserName}", Username);
                    body = body.Replace("{Description}", Description);
                    body = body.Replace("{ApplicationURL}", ApplicationURL);
                    body = body.Replace("{DynamicEmail}", DynamicEmail);
                    body = body.Replace("{DynamicPassword}", DynamicPassword);
                }
            }
            return body;
            
        }
    }
}