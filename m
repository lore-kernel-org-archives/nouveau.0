From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 87244] [NV94] X hangs,
 logs show kernel: nouveau E[ PFIFO][0000:01:00.0] still angry after
 101 spins, halt followed by an X trace
Date: Tue, 23 Dec 2014 16:55:12 +0000
Message-ID: <bug-87244-8800-ZHGKurUyqe@http.bugs.freedesktop.org/>
References: <bug-87244-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1238648827=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-87244-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1238648827==
Content-Type: multipart/alternative; boundary="1419353712.0a2c72a1.8997"; charset="UTF-8"


--1419353712.0a2c72a1.8997
Date: Tue, 23 Dec 2014 16:55:12 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=87244

--- Comment #2 from Adam Williamson <adamw-cfjF3rc+CpsYNetmKr+vY16hYfS7NtTn@public.gmane.org> ---
Just saw this again, but between occurrences I had a boot running for like
three days with drm.debug=15 and it didn't happen, eventually I had to give up
because I needed to see something else in my logs :( I'll try another boot with
drm.debug=14 and hope to catch it...

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1419353712.0a2c72a1.8997
Date: Tue, 23 Dec 2014 16:55:12 +0000
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
   title="NEW - [NV94] X hangs, logs show kernel: nouveau E[ PFIFO][0000:01:00.0] still angry after 101 spins, halt followed by an X trace"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=87244#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV94] X hangs, logs show kernel: nouveau E[ PFIFO][0000:01:00.0] still angry after 101 spins, halt followed by an X trace"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=87244">bug 87244</a>
              from <span class="vcard"><a class="email" href="mailto:adamw&#64;happyassassin.net" title="Adam Williamson &lt;adamw&#64;happyassassin.net&gt;"> <span class="fn">Adam Williamson</span></a>
</span></b>
        <pre>Just saw this again, but between occurrences I had a boot running for like
three days with drm.debug=15 and it didn't happen, eventually I had to give up
because I needed to see something else in my logs :( I'll try another boot with
drm.debug=14 and hope to catch it...</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1419353712.0a2c72a1.8997--

--===============1238648827==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1238648827==--
