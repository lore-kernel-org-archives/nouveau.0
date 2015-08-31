From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90453] [NVE4] Desktop freezes & PDISP, PFIFO,
 PGRAPH and PGR errors
Date: Mon, 31 Aug 2015 16:55:00 +0000
Message-ID: <bug-90453-8800-1ewV9lX0bQ@http.bugs.freedesktop.org/>
References: <bug-90453-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0158424074=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-90453-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0158424074==
Content-Type: multipart/alternative; boundary="1441040100.5D163.11503"; charset="UTF-8"


--1441040100.5D163.11503
Date: Mon, 31 Aug 2015 16:55:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90453

--- Comment #25 from Arthur Heymans <arthurphilippeheymans-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Hi 
I also have this bug (screen freeze and mouse still usable) on a my system
using a nvidia 660ti [NVE4]:
dmesg gives
[  112.780941] nouveau E[   PFIFO][0000:03:00.0] SCHED_ERROR [ CTXSW_TIMEOUT ]
[  112.780947] nouveau E[   PFIFO][0000:03:00.0] PGRAPH engine fault on channel
8, recovering...

or 

[  294.274092] nouveau E[   PFIFO][0000:03:00.0] write fault at 0x000a002000
[PTE] from GR/GPC0/PROP_0 on channel 0x007f6ab000 [systemd-logind[426]]
[  294.274103] nouveau E[   PFIFO][0000:03:00.0] PGRAPH engine fault on channel
5, recovering...

I might be the same bug as I reported earlier
https://bugs.freedesktop.org/show_bug.cgi?id=90276

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1441040100.5D163.11503
Date: Mon, 31 Aug 2015 16:55:00 +0000
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
   title="NEW - [NVE4] Desktop freezes &amp; PDISP, PFIFO, PGRAPH and PGR errors"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90453#c25">Comment # 25</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVE4] Desktop freezes &amp; PDISP, PFIFO, PGRAPH and PGR errors"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90453">bug 90453</a>
              from <span class="vcard"><a class="email" href="mailto:arthurphilippeheymans&#64;gmail.com" title="Arthur Heymans &lt;arthurphilippeheymans&#64;gmail.com&gt;"> <span class="fn">Arthur Heymans</span></a>
</span></b>
        <pre>Hi 
I also have this bug (screen freeze and mouse still usable) on a my system
using a nvidia 660ti [NVE4]:
dmesg gives
[  112.780941] nouveau E[   PFIFO][0000:03:00.0] SCHED_ERROR [ CTXSW_TIMEOUT ]
[  112.780947] nouveau E[   PFIFO][0000:03:00.0] PGRAPH engine fault on channel
8, recovering...

or 

[  294.274092] nouveau E[   PFIFO][0000:03:00.0] write fault at 0x000a002000
[PTE] from GR/GPC0/PROP_0 on channel 0x007f6ab000 [systemd-logind[426]]
[  294.274103] nouveau E[   PFIFO][0000:03:00.0] PGRAPH engine fault on channel
5, recovering...

I might be the same bug as I reported earlier
<a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVE4] read fault error, bisected"
   href="show_bug.cgi?id=90276">https://bugs.freedesktop.org/show_bug.cgi?id=90276</a></pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1441040100.5D163.11503--

--===============0158424074==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0158424074==--
