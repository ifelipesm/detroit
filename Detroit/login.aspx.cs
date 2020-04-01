using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Detroit
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        /* public static string SHA1(string text,Encoding enc)
         {
             try
             {
                 byte[] buffer = enc.GetBytes(text);
                 System.Security.Cryptography.SHA1CryptoServiceProvider cryptoTransformSHA1 = new System.Security.Cryptography.SHA1CryptoServiceProvider();
                 string hash = BitConverter.ToString(cryptoTransformSHA1.ComputeHash(buffer)).Replace("-", "");
                 return hash;
             }
             catch (Exception x)
             {
                 throw new Exception(x.Message);
             }
         }*/

        private static readonly Encoding Encoding1252 = Encoding.GetEncoding(1252);


        public static class SHA1Hash
        {
            /// <summary>
            /// Compute hash for string encoded as UTF8
            /// </summary>
            /// <param name="s">String to be hashed</param>
            /// <returns>40-character hex string</returns>
            public static string SHA1UTF8(string s)
            {
                byte[] bytes = Encoding1252.GetBytes(s);

                var sha1 = SHA1.Create();
                byte[] hashBytes = sha1.ComputeHash(bytes);

                return SHA1HEXBYTES(hashBytes);
            }

            /// <summary>
            /// Convert an array of bytes to a string of hex digits
            /// </summary>
            /// <param name="bytes">array of bytes</param>
            /// <returns>String of hex digits</returns>
            public static string SHA1HEXBYTES(byte[] bytes)
            {
                var sb = new StringBuilder();
                foreach (byte b in bytes)
                {
                    var hex = b.ToString("x2");
                    sb.Append(hex);
                }
                return sb.ToString();
            }
        }

        /* public string MD5(string input)
         {
             System.Security.Cryptography.MD5CryptoServiceProvider x = new System.Security.Cryptography.MD5CryptoServiceProvider();
             //byte[] bs = System.Text.Encoding.ASCII.GetBytes(input);
             //byte[] bs = System.Text.Encoding.UTF7.GetBytes(input);
             //byte[] bs = System.Text.Encoding.UTF8.GetBytes(input);
             byte[] bs = System.Text.Encoding.Unicode.GetBytes(input);
             //byte[] bs = System.Text.Encoding.UTF32.GetBytes(input);
             bs = x.ComputeHash(bs);
             System.Text.StringBuilder s = new System.Text.StringBuilder();
             foreach (byte b in bs)
             {
                 s.Append(b.ToString("x2").ToLower());
             }
             string password = s.ToString();
             return password;
         }*/

        protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
        {
            // Recupera elementos do formulario
            string usuario = Login1.UserName;

            DataView dv = (DataView)loginsql.Select(DataSourceSelectArguments.Empty); //Verifica os parametros
            var rowCount = dv.Count;
            if (rowCount > 0)
            {
                //e.Authenticated = true;
                //FormsAuthentication.RedirectFromLoginPage(Login1.UserName, false);
                /*DataView dv2 = (DataView)TipoLoginSql.Select(DataSourceSelectArguments.Empty);
                DataView custView = new DataView(custDS.Tables["tipo_login"],"nome", DataViewRowState.CurrentRows);

                int rowIndex = custView.Find("The Cracker Box");

                if (rowIndex == -1)
                    Console.WriteLine("No match found.");
                else
                    Console.WriteLine("{0}, {1}",
                      custView[rowIndex]["CustomerID"].ToString(),
                      custView[rowIndex]["CompanyName"].ToString());*/

                Session["Usuario"] = usuario;
                Session["Senha"] = hashgen.Value;
                Response.Redirect("principal.aspx");
            }
            else
            {
                //e.Authenticated = false;
                Response.Redirect("login.aspx");
            }

        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            string senha = SHA1Hash.SHA1UTF8(Login1.Password);
            hashgen.Value = senha;
        }
    }
}