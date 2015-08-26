From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 81690] nouveau GPU locks up under memory pressure
Date: Wed, 26 Aug 2015 15:17:12 +0000
Message-ID: <bug-81690-8800-oU2zcOEOnn@http.bugs.freedesktop.org/>
References: <bug-81690-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0954933777=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-81690-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0954933777==
Content-Type: multipart/alternative; boundary="1440602232.cCacD52.3853"; charset="UTF-8"


--1440602232.cCacD52.3853
Date: Wed, 26 Aug 2015 15:17:12 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=81690

--- Comment #3 from xpue <r9ku1q-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Happens for me too, when any program uses 3d, and any other(or same) uses
significant amount of memory and causes swapping.

You can find many similiar bug reports here by searching PAGE_NOT_PRESENT.

Only two messages in dmesg every time that it happens:

nouveau E[   PFIFO][0000:02:00.0] read fault at 0x00065a0000 [PAGE_NOT_PRESENT]
from PGRAPH/GPC0/TEX on channel 0x003fb49000 [chrome[21010]]
nouveau E[   PFIFO][0000:02:00.0] PGRAPH engine fault on channel 5,
recovering...

nouveau E[   PFIFO][0000:02:00.0] read fault at 0x001146e000 [PAGE_NOT_PRESENT]
from PGRAPH/GPC0/PROP on channel 0x003fb49000 [chrome[20217]]
nouveau E[   PFIFO][0000:02:00.0] PGRAPH engine fault on channel 5,
recovering...

nouveau E[   PFIFO][0000:02:00.0] write fault at 0x0000218000
[PAGE_NOT_PRESENT] from PGRAPH/DISPATCH on channel 0x003fb49000 [Xorg[79]]
nouveau E[   PFIFO][0000:02:00.0] PGRAPH engine fault on channel 5,
recovering...

nouveau E[   PFIFO][0000:02:00.0] read fault at 0x001583a000 [PAGE_NOT_PRESENT]
from PGRAPH/GPC0/UNK07 on channel 0x003fb49000 [Xorg[79]]
nouveau E[   PFIFO][0000:02:00.0] PGRAPH engine fault on channel 5,
recovering...

nouveau E[   PFIFO][0000:02:00.0] read fault at 0x0008c14000 [PAGE_NOT_PRESENT]
from PGRAPH/GPC0/PROP on channel 0x003fb49000 [Xorg[81]]
nouveau E[   PFIFO][0000:02:00.0] PGRAPH engine fault on channel 5,
recovering...

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1440602232.cCacD52.3853
Date: Wed, 26 Aug 2015 15:17:12 +0000
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
   title="NEW - nouveau GPU locks up under memory pressure"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=81690#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - nouveau GPU locks up under memory pressure"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=81690">bug 81690</a>
              from <span class="vcard"><a class="email" href="mailto:r9ku1q&#64;gmail.com" title="xpue &lt;r9ku1q&#64;gmail.com&gt;"> <span class="fn">xpue</span></a>
</span></b>
        <pre>Happens for me too, when any program uses 3d, and any other(or same) uses
significant amount of memory and causes swapping.

You can find many similiar bug reports here by searching PAGE_NOT_PRESENT.

Only two messages in dmesg every time that it happens:

nouveau E[   PFIFO][0000:02:00.0] read fault at 0x00065a0000 [PAGE_NOT_PRESENT]
from PGRAPH/GPC0/TEX on channel 0x003fb49000 [chrome[21010]]
nouveau E[   PFIFO][0000:02:00.0] PGRAPH engine fault on channel 5,
recovering...

nouveau E[   PFIFO][0000:02:00.0] read fault at 0x001146e000 [PAGE_NOT_PRESENT]
from PGRAPH/GPC0/PROP on channel 0x003fb49000 [chrome[20217]]
nouveau E[   PFIFO][0000:02:00.0] PGRAPH engine fault on channel 5,
recovering...

nouveau E[   PFIFO][0000:02:00.0] write fault at 0x0000218000
[PAGE_NOT_PRESENT] from PGRAPH/DISPATCH on channel 0x003fb49000 [Xorg[79]]
nouveau E[   PFIFO][0000:02:00.0] PGRAPH engine fault on channel 5,
recovering...

nouveau E[   PFIFO][0000:02:00.0] read fault at 0x001583a000 [PAGE_NOT_PRESENT]
from PGRAPH/GPC0/UNK07 on channel 0x003fb49000 [Xorg[79]]
nouveau E[   PFIFO][0000:02:00.0] PGRAPH engine fault on channel 5,
recovering...

nouveau E[   PFIFO][0000:02:00.0] read fault at 0x0008c14000 [PAGE_NOT_PRESENT]
from PGRAPH/GPC0/PROP on channel 0x003fb49000 [Xorg[81]]
nouveau E[   PFIFO][0000:02:00.0] PGRAPH engine fault on channel 5,
recovering...</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1440602232.cCacD52.3853--

--===============0954933777==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0954933777==--
