From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92523] [Quadro FX 370] Compiz freezes entire desktop.
Date: Tue, 20 Oct 2015 05:20:37 +0000
Message-ID: <bug-92523-8800-lv6PRuxved@http.bugs.freedesktop.org/>
References: <bug-92523-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1011713967=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-92523-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1011713967==
Content-Type: multipart/alternative; boundary="1445318437.8Ebe2.5352"; charset="UTF-8"


--1445318437.8Ebe2.5352
Date: Tue, 20 Oct 2015 05:20:37 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=92523

--- Comment #5 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Please give the patch at
http://lists.freedesktop.org/archives/nouveau/2015-October/022732.html a shot
-- it will hopefully help with the suspend/resume issues, and who knows --
perhaps even fix these -- you only have 256MB of vram, so similar situations
will occur as with suspend/resume, with buffers getting swapped out.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1445318437.8Ebe2.5352
Date: Tue, 20 Oct 2015 05:20:37 +0000
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
   title="NEW - [Quadro FX 370] Compiz freezes entire desktop."
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92523#c5">Comment # 5</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [Quadro FX 370] Compiz freezes entire desktop."
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92523">bug 92523</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Please give the patch at
<a href="http://lists.freedesktop.org/archives/nouveau/2015-October/022732.html">http://lists.freedesktop.org/archives/nouveau/2015-October/022732.html</a> a shot
-- it will hopefully help with the suspend/resume issues, and who knows --
perhaps even fix these -- you only have 256MB of vram, so similar situations
will occur as with suspend/resume, with buffers getting swapped out.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1445318437.8Ebe2.5352--

--===============1011713967==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1011713967==--
