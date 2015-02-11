From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 87244] [NV94] X hangs,
 logs show kernel: nouveau E[ PFIFO][0000:01:00.0] still angry after
 101 spins, halt followed by an X trace
Date: Wed, 11 Feb 2015 21:21:28 +0000
Message-ID: <bug-87244-8800-8RqH0c2c02@http.bugs.freedesktop.org/>
References: <bug-87244-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0505754552=="
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


--===============0505754552==
Content-Type: multipart/alternative; boundary="1423689688.DF0E11.7520"; charset="UTF-8"


--1423689688.DF0E11.7520
Date: Wed, 11 Feb 2015 21:21:27 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=87244

--- Comment #12 from Adam Williamson <adamw-cfjF3rc+CpsYNetmKr+vY16hYfS7NtTn@public.gmane.org> ---
So Ben told me on IRC he'd committed a change that should address this, but I
guess it didn't make it in time for 3.19 because I just hit it with 3.19 stable
:( Ben, any chance it could be backported for 3.19 updates? It's a pretty icky
bug.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1423689688.DF0E11.7520
Date: Wed, 11 Feb 2015 21:21:28 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=87244#c12">Comment # 12</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV94] X hangs, logs show kernel: nouveau E[ PFIFO][0000:01:00.0] still angry after 101 spins, halt followed by an X trace"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=87244">bug 87244</a>
              from <span class="vcard"><a class="email" href="mailto:adamw&#64;happyassassin.net" title="Adam Williamson &lt;adamw&#64;happyassassin.net&gt;"> <span class="fn">Adam Williamson</span></a>
</span></b>
        <pre>So Ben told me on IRC he'd committed a change that should address this, but I
guess it didn't make it in time for 3.19 because I just hit it with 3.19 stable
:( Ben, any chance it could be backported for 3.19 updates? It's a pretty icky
bug.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1423689688.DF0E11.7520--

--===============0505754552==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0505754552==--
