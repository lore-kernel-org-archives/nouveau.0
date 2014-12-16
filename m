From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 86539] [NVAC] Trying to register nv_backlight after
	NV96 did it
Date: Tue, 16 Dec 2014 22:28:46 +0000
Message-ID: <bug-86539-8800-uyubj9g9UA@http.bugs.freedesktop.org/>
References: <bug-86539-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0465124555=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-86539-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0465124555==
Content-Type: multipart/alternative; boundary="1418768926.bb5df2b1.26322"; charset="UTF-8"


--1418768926.bb5df2b1.26322
Date: Tue, 16 Dec 2014 22:28:46 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=86539

--- Comment #1 from Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org> ---
With the main card begin the 9400M we have:

* 0x61c084 = 0x0   on the 9600M GT;
* 0x61c084 = 0x400 on the 9400M.

so only one registration for nv_backlight.


However, after setting under Mac OS the 9600M GT as the main card we get:

* 0x61c084 = 0x400 on the 9600M GT;
* 0x61c084 = 0x400 on the 9400M.

thus leading to a double registration.


The NVidia driver is always forcing POST which sets 0x61c084 to 0x0 on the
9600M GT, solving the problem. Should we do something similar in Nouveau or try
some other ways to go around it?

By the way the nv_backlight is useless on this setup as it does nothing: the
backlight is controlled by the mux, and thus by the apple_gmux driver. Would it
make sense to hide the nv_backlight in this case?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1418768926.bb5df2b1.26322
Date: Tue, 16 Dec 2014 22:28:46 +0000
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
   title="NEW - [NVAC] Trying to register nv_backlight after NV96 did it"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=86539#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVAC] Trying to register nv_backlight after NV96 did it"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=86539">bug 86539</a>
              from <span class="vcard"><a class="email" href="mailto:pierre.morrow&#64;free.fr" title="Pierre Moreau &lt;pierre.morrow&#64;free.fr&gt;"> <span class="fn">Pierre Moreau</span></a>
</span></b>
        <pre>With the main card begin the 9400M we have:

* 0x61c084 = 0x0   on the 9600M GT;
* 0x61c084 = 0x400 on the 9400M.

so only one registration for nv_backlight.


However, after setting under Mac OS the 9600M GT as the main card we get:

* 0x61c084 = 0x400 on the 9600M GT;
* 0x61c084 = 0x400 on the 9400M.

thus leading to a double registration.


The NVidia driver is always forcing POST which sets 0x61c084 to 0x0 on the
9600M GT, solving the problem. Should we do something similar in Nouveau or try
some other ways to go around it?

By the way the nv_backlight is useless on this setup as it does nothing: the
backlight is controlled by the mux, and thus by the apple_gmux driver. Would it
make sense to hide the nv_backlight in this case?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1418768926.bb5df2b1.26322--

--===============0465124555==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0465124555==--
