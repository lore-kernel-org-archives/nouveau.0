From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90350] [G96] Portal's portal are incorrectly rendered
Date: Thu, 07 May 2015 20:18:51 +0000
Message-ID: <bug-90350-8800-OasFfj1jY3@http.bugs.freedesktop.org/>
References: <bug-90350-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0624604182=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-90350-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0624604182==
Content-Type: multipart/alternative; boundary="1431029931.A6f80.25470"; charset="UTF-8"


--1431029931.A6f80.25470
Date: Thu, 7 May 2015 20:18:51 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90350

--- Comment #2 from Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org> ---
Bisected to

commit 44673512a84c0897c8eddabf4a56e79b7d5b3395
Author: Roy Spliet <rspliet-pPYjZ15w/Xhulxpn9UvDqw@public.gmane.org>
Date:   Mon Jan 5 00:22:17 2015 +0100

    nv50/ir: Add sat modifier for mul

    Signed-off-by: Roy Spliet <rspliet-pPYjZ15w/Xhulxpn9UvDqw@public.gmane.org>
    Reviewed-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1431029931.A6f80.25470
Date: Thu, 7 May 2015 20:18:51 +0000
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
   title="NEW - [G96] Portal's portal are incorrectly rendered"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90350#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [G96] Portal's portal are incorrectly rendered"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90350">bug 90350</a>
              from <span class="vcard"><a class="email" href="mailto:pierre.morrow&#64;free.fr" title="Pierre Moreau &lt;pierre.morrow&#64;free.fr&gt;"> <span class="fn">Pierre Moreau</span></a>
</span></b>
        <pre>Bisected to

commit 44673512a84c0897c8eddabf4a56e79b7d5b3395
Author: Roy Spliet &lt;<a href="mailto:rspliet&#64;eclipso.eu">rspliet&#64;eclipso.eu</a>&gt;
Date:   Mon Jan 5 00:22:17 2015 +0100

    nv50/ir: Add sat modifier for mul

    Signed-off-by: Roy Spliet &lt;<a href="mailto:rspliet&#64;eclipso.eu">rspliet&#64;eclipso.eu</a>&gt;
    Reviewed-by: Ilia Mirkin &lt;<a href="mailto:imirkin&#64;alum.mit.edu">imirkin&#64;alum.mit.edu</a>&gt;</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1431029931.A6f80.25470--

--===============0624604182==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0624604182==--
