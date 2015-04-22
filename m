From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90145] [NV94] Corruption on very long (vertical)
 pages in Firefox
Date: Wed, 22 Apr 2015 21:07:19 +0000
Message-ID: <bug-90145-8800-C8fSsNR1WR@http.bugs.freedesktop.org/>
References: <bug-90145-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0572994876=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-90145-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0572994876==
Content-Type: multipart/alternative; boundary="1429736839.Dcff68Af2.20910"; charset="UTF-8"


--1429736839.Dcff68Af2.20910
Date: Wed, 22 Apr 2015 21:07:19 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90145

--- Comment #1 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Probably an issue with an X pixmap that is larger than the largest allowable
texture size. X pixmaps go up to 32Kx32K, while nv50-family goes up to 4K (and
nvc0 goes up to 8K).

If you're proficient with X tools, can you double-check that that's the case.
(Not sure how you'd do it... xwininfo gives you info on windows, not pixmaps...
you could look at an xtrace of it I suppose.)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1429736839.Dcff68Af2.20910
Date: Wed, 22 Apr 2015 21:07:19 +0000
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
   title="NEW - [NV94] Corruption on very long (vertical) pages in Firefox"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90145#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV94] Corruption on very long (vertical) pages in Firefox"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90145">bug 90145</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Probably an issue with an X pixmap that is larger than the largest allowable
texture size. X pixmaps go up to 32Kx32K, while nv50-family goes up to 4K (and
nvc0 goes up to 8K).

If you're proficient with X tools, can you double-check that that's the case.
(Not sure how you'd do it... xwininfo gives you info on windows, not pixmaps...
you could look at an xtrace of it I suppose.)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1429736839.Dcff68Af2.20910--

--===============0572994876==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0572994876==--
