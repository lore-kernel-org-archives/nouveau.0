From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90932] gm107 font glitches with kernel 4.1rc
Date: Tue, 23 Jun 2015 13:45:29 +0000
Message-ID: <bug-90932-8800-WslP6GVWNB@http.bugs.freedesktop.org/>
References: <bug-90932-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0450173062=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-90932-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0450173062==
Content-Type: multipart/alternative; boundary="1435067128.17fAD2.9256"; charset="UTF-8"


--1435067128.17fAD2.9256
Date: Tue, 23 Jun 2015 13:45:28 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90932

--- Comment #5 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to Marcus Moeller from comment #3)
> It still appears in Kernel 4.1 final.

Updating Xorg to 1.17 and switching to the modesetting X ddx (instead of the
nouveau X ddx) should fix this. The reason you're seeing this in 4.1 and not
4.0 is that 4.1 finally has acceleration enabled by default for GM107.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1435067128.17fAD2.9256
Date: Tue, 23 Jun 2015 13:45:28 +0000
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
   title="NEW - gm107 font glitches with kernel 4.1rc"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90932#c5">Comment # 5</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - gm107 font glitches with kernel 4.1rc"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90932">bug 90932</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to Marcus Moeller from <a href="show_bug.cgi?id=90932#c3">comment #3</a>)
<span class="quote">&gt; It still appears in Kernel 4.1 final.</span >

Updating Xorg to 1.17 and switching to the modesetting X ddx (instead of the
nouveau X ddx) should fix this. The reason you're seeing this in 4.1 and not
4.0 is that 4.1 finally has acceleration enabled by default for GM107.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1435067128.17fAD2.9256--

--===============0450173062==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0450173062==--
