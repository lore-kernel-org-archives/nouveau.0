From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92271] Unusably slow OpenGL performance on nouveau
 (GeForce 9600 GT) with X server 1.18 with rotated output
Date: Thu, 08 Oct 2015 01:46:23 +0000
Message-ID: <bug-92271-8800-O7gdBrOz9R@http.bugs.freedesktop.org/>
References: <bug-92271-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1634994789=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-92271-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1634994789==
Content-Type: multipart/alternative; boundary="1444268784.de0dd4FC3.20648"; charset="UTF-8"


--1444268784.de0dd4FC3.20648
Date: Thu, 8 Oct 2015 01:46:24 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=92271

--- Comment #19 from Adam Williamson <adamw-cfjF3rc+CpsYNetmKr+vY16hYfS7NtTn@public.gmane.org> ---
Well, the code still claims that it defaults to DRI 2:

http://cgit.freedesktop.org/nouveau/xf86-video-nouveau/tree/src/nv_driver.c#n1080

and Fedora is doing nothing to patch that.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1444268784.de0dd4FC3.20648
Date: Thu, 8 Oct 2015 01:46:24 +0000
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
   title="NEW - Unusably slow OpenGL performance on nouveau (GeForce 9600 GT) with X server 1.18 with rotated output"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92271#c19">Comment # 19</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Unusably slow OpenGL performance on nouveau (GeForce 9600 GT) with X server 1.18 with rotated output"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92271">bug 92271</a>
              from <span class="vcard"><a class="email" href="mailto:adamw&#64;happyassassin.net" title="Adam Williamson &lt;adamw&#64;happyassassin.net&gt;"> <span class="fn">Adam Williamson</span></a>
</span></b>
        <pre>Well, the code still claims that it defaults to DRI 2:

<a href="http://cgit.freedesktop.org/nouveau/xf86-video-nouveau/tree/src/nv_driver.c#n1080">http://cgit.freedesktop.org/nouveau/xf86-video-nouveau/tree/src/nv_driver.c#n1080</a>

and Fedora is doing nothing to patch that.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1444268784.de0dd4FC3.20648--

--===============1634994789==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1634994789==--
