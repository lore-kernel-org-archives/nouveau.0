From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 87819] [NVAC] EQ overflowing
Date: Wed, 04 Feb 2015 12:18:30 +0000
Message-ID: <bug-87819-8800-8Zxmdq321i@http.bugs.freedesktop.org/>
References: <bug-87819-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2122775845=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-87819-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============2122775845==
Content-Type: multipart/alternative; boundary="1423052310.0CDB4451.2889"; charset="UTF-8"


--1423052310.0CDB4451.2889
Date: Wed, 4 Feb 2015 12:18:30 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=87819

--- Comment #9 from Etienne URBAH <eurbah-GANU6spQydw@public.gmane.org> ---
Module nouveau from linux-3.19.0-rc7 seems to be more resilient :
I had to perform video streaming under Firefox to get an X freeze.

I have attached :

-  Xorg.0.log,

-  kern.log, restricted to 'linux-3.19.0-rc7', with 'Loglevel set to 1' and
'SysRq : Show State'.

I hope that these log files will be useful.


I am NOT sure that I can test the latest 'Arch Linux' image from
http://nouveau.pmoreau.org but I will try.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1423052310.0CDB4451.2889
Date: Wed, 4 Feb 2015 12:18:30 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVAC] EQ overflowing"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=87819#c9">Comment # 9</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVAC] EQ overflowing"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=87819">bug 87819</a>
              from <span class="vcard"><a class="email" href="mailto:eurbah&#64;free.fr" title="Etienne URBAH &lt;eurbah&#64;free.fr&gt;"> <span class="fn">Etienne URBAH</span></a>
</span></b>
        <pre>Module nouveau from linux-3.19.0-rc7 seems to be more resilient :
I had to perform video streaming under Firefox to get an X freeze.

I have attached :

-  Xorg.0.log,

-  kern.log, restricted to 'linux-3.19.0-rc7', with 'Loglevel set to 1' and
'SysRq : Show State'.

I hope that these log files will be useful.


I am NOT sure that I can test the latest 'Arch Linux' image from
<a href="http://nouveau.pmoreau.org">http://nouveau.pmoreau.org</a> but I will try.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1423052310.0CDB4451.2889--

--===============2122775845==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============2122775845==--
