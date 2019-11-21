using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;

namespace InlandMarinaDB
{
    public static class LoginUtility
    {
        public static string GetEncryptedValue(string sourceValue)
        {
            string encryptedValue = "";
            string hashKey = ConfigurationManager.AppSettings["hashKey"];
            byte[] data = Encoding.UTF8.GetBytes(sourceValue);
            using (MD5CryptoServiceProvider md5 = new MD5CryptoServiceProvider())
            {
                byte[] key = md5.ComputeHash(Encoding.UTF8.GetBytes(hashKey));
                using (TripleDESCryptoServiceProvider tripleDES =
                            new TripleDESCryptoServiceProvider()
                            {
                                Key = key,
                                Mode = CipherMode.ECB,
                                Padding = PaddingMode.PKCS7
                            }
                      )
                {
                    ICryptoTransform transform = tripleDES.CreateEncryptor();
                    byte[] result = transform.TransformFinalBlock(data, 0, data.Length);
                    encryptedValue = Convert.ToBase64String(result, 0, result.Length);
                }
            }
            return encryptedValue;
        }

        public static string GetDecryptedValue(string sourceValue)
        {
            string decryptedValue = "";
            string hashKey = ConfigurationManager.AppSettings["hashKey"];
            byte[] data = Convert.FromBase64String(sourceValue);
            using (MD5CryptoServiceProvider md5 = new MD5CryptoServiceProvider())
            {
                byte[] key = md5.ComputeHash(Encoding.UTF8.GetBytes(hashKey));
                using (TripleDESCryptoServiceProvider tripleDES =
                            new TripleDESCryptoServiceProvider()
                            {
                                Key = key,
                                Mode = CipherMode.ECB,
                                Padding = PaddingMode.PKCS7
                            }
                      )
                {
                    ICryptoTransform transform = tripleDES.CreateDecryptor();
                    byte[] result = transform.TransformFinalBlock(data, 0, data.Length);
                    decryptedValue = Encoding.UTF8.GetString(result);
                }
            }
            return decryptedValue;
        }

    }
}