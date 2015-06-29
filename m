From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90569] [NV67] GUI freezes after startup of Ubuntu
 15.04. on Aspire 7520p [BUG: unable to handle kernel paging request at
 f84c8000]
Date: Mon, 29 Jun 2015 08:27:20 +0000
Message-ID: <bug-90569-8800-S6i4GXAVOH@http.bugs.freedesktop.org/>
References: <bug-90569-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1847339925=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-90569-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1847339925==
Content-Type: multipart/alternative; boundary="1435566440.dCDD21.20486"; charset="UTF-8"


--1435566440.dCDD21.20486
Date: Mon, 29 Jun 2015 08:27:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90569

--- Comment #2 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Does this patch help at all?

http://lists.freedesktop.org/archives/nouveau/2015-June/021416.html

I believe the conditions are the same as the ones I hit...

  25:   01 f2                   add    %esi,%edx
...
  2b:*  89 0a                   mov    %ecx,(%edx)              <-- trapping
instruction

ESI: f84b8000
EDX: f84c8000

So you're going over the 0x10000 size of the ring.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1435566440.dCDD21.20486
Date: Mon, 29 Jun 2015 08:27:20 +0000
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
   title="NEW - [NV67] GUI freezes after startup of Ubuntu 15.04. on Aspire 7520p [BUG: unable to handle kernel paging request at f84c8000]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90569#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV67] GUI freezes after startup of Ubuntu 15.04. on Aspire 7520p [BUG: unable to handle kernel paging request at f84c8000]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90569">bug 90569</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Does this patch help at all?

<a href="http://lists.freedesktop.org/archives/nouveau/2015-June/021416.html">http://lists.freedesktop.org/archives/nouveau/2015-June/021416.html</a>

I believe the conditions are the same as the ones I hit...

  25:   01 f2                   add    %esi,%edx
...
  2b:*  89 0a                   mov    %ecx,(%edx)              &lt;-- trapping
instruction

ESI: f84b8000
EDX: f84c8000

So you're going over the 0x10000 size of the ring.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1435566440.dCDD21.20486--

--===============1847339925==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1847339925==--
