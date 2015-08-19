From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91570] Upgrading mesa to 10.6 causes segfault in
 OpenGL applications with GeForce4 MX 440 / AGP 8X
Date: Wed, 19 Aug 2015 10:32:51 +0000
Message-ID: <bug-91570-8800-GUb0uNqyJ3@http.bugs.freedesktop.org/>
References: <bug-91570-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2006554918=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-91570-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2006554918==
Content-Type: multipart/alternative; boundary="1439980371.AeD4fCF0.10299"; charset="UTF-8"


--1439980371.AeD4fCF0.10299
Date: Wed, 19 Aug 2015 10:32:51 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91570

--- Comment #19 from omelette <omelette-kcyQbWKpldg@public.gmane.org> ---
(In reply to Ilia Mirkin from comment #18)
> I pushed an alternate version of the patch which just avoids the call to
> tnl_wakeup entirely, it shouldn't be necessary. The patch should be
> cherry-picked into the next 10.6.x release.

Great, thank you again for patching this.

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1439980371.AeD4fCF0.10299
Date: Wed, 19 Aug 2015 10:32:51 +0000
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
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - Upgrading mesa to 10.6 causes segfault in OpenGL applications with GeForce4 MX 440 / AGP 8X"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91570#c19">Comment # 19</a>
              on <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - Upgrading mesa to 10.6 causes segfault in OpenGL applications with GeForce4 MX 440 / AGP 8X"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91570">bug 91570</a>
              from <span class="vcard"><a class="email" href="mailto:omelette&#64;cock.li" title="omelette &lt;omelette&#64;cock.li&gt;"> <span class="fn">omelette</span></a>
</span></b>
        <pre>(In reply to Ilia Mirkin from <a href="show_bug.cgi?id=91570#c18">comment #18</a>)
<span class="quote">&gt; I pushed an alternate version of the patch which just avoids the call to
&gt; tnl_wakeup entirely, it shouldn't be necessary. The patch should be
&gt; cherry-picked into the next 10.6.x release.</span >

Great, thank you again for patching this.</pre>
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

--1439980371.AeD4fCF0.10299--

--===============2006554918==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============2006554918==--
