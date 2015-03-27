From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 89730] NV50: LightDM GTK+ Greeter Background -
 inconsistent display
Date: Fri, 27 Mar 2015 17:41:54 +0000
Message-ID: <bug-89730-8800-JZvXfLQRCY@http.bugs.freedesktop.org/>
References: <bug-89730-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0881463898=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-89730-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0881463898==
Content-Type: multipart/alternative; boundary="1427478114.6EBc1.10956"; charset="UTF-8"


--1427478114.6EBc1.10956
Date: Fri, 27 Mar 2015 17:41:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=89730

--- Comment #13 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
poma, not sure what your skillset is... If you're comfortable modifying code,
you could start hacking away at xf86-video-nouveau.

Take a look at src/nv50_exa.c -- there are a bunch of functions like
NV50EXAPrepare*. In each of them, Just put as the first line (after variable
decls) something like

NOUVEAU_FALLBACK("poma\n");

If you do it in all the prepare functions, I bet that the background will start
to work. (And you will basically have no accel.). Figure out which operation is
the one that causes all the trouble (by starting to remove the fallbacks). Once
you figure out which high-level op it is, I can provide further instructions to
narrow down the specific operation further.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1427478114.6EBc1.10956
Date: Fri, 27 Mar 2015 17:41:54 +0000
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
   title="NEW - NV50: LightDM GTK+ Greeter Background - inconsistent display"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89730#c13">Comment # 13</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - NV50: LightDM GTK+ Greeter Background - inconsistent display"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89730">bug 89730</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>poma, not sure what your skillset is... If you're comfortable modifying code,
you could start hacking away at xf86-video-nouveau.

Take a look at src/nv50_exa.c -- there are a bunch of functions like
NV50EXAPrepare*. In each of them, Just put as the first line (after variable
decls) something like

NOUVEAU_FALLBACK(&quot;poma\n&quot;);

If you do it in all the prepare functions, I bet that the background will start
to work. (And you will basically have no accel.). Figure out which operation is
the one that causes all the trouble (by starting to remove the fallbacks). Once
you figure out which high-level op it is, I can provide further instructions to
narrow down the specific operation further.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1427478114.6EBc1.10956--

--===============0881463898==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0881463898==--
