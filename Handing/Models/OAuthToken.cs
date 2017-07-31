﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Handing.Models
{
    public class OAuthToken
    {
        public string access_token { get; set; }
        public int expires_in { get; set; }
        public string refresh_token { get; set; }
        public string openid { get; set; }
        public string scope { get; set; }

    }

    public class AccessToken
    {
        public string access_token { get; set; }
        public int expires_in { get; set; }
    }

    public class OAuthUserInfo
    {
        public string openid { get; set; }
        public string nickname { get; set; }
        public int sex { get; set; }
        public string language { get; set; }
        public string city { get; set; }
        public string province { get; set; }
        public string country { get; set; }
        public string headimgurl { get; set; }
        //public string privilege { get; set; }
        public string unionid { get; set; }
        
    }
}