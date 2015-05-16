From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90453] [NVE4] Desktop freezes & PDISP,
	PFIFO and PGRAPH errors
Date: Sat, 16 May 2015 08:40:48 +0000
Message-ID: <bug-90453-8800-qGa1RhRml7@http.bugs.freedesktop.org/>
References: <bug-90453-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1831743895=="
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


--===============1831743895==
Content-Type: multipart/alternative; boundary="1431765648.2Ed4721D1.22836"; charset="UTF-8"


--1431765648.2Ed4721D1.22836
Date: Sat, 16 May 2015 08:40:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90453

--- Comment #17 from Michiel Helvensteijn <mhelvens-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Indeed, problem not solved. Here's a new set of errors produced during a
freeze:

[  690.870744] nouveau E[     PGR][0000:01:00.0] TRAP ch 8 [0x007f2f2000
gnome-shell[2652]]
[  690.870754] nouveau E[     PGR][0000:01:00.0] GPC1/PROP trap:
ZETA_STORAGE_TYPE_MISMATCH
[  690.870756] nouveau E[     PGR][0000:01:00.0] x = 1232, y = 56, format = 0,
storage type = fe
[  690.870763] nouveau E[     PGR][0000:01:00.0] GPC2/PROP trap:
ZETA_STORAGE_TYPE_MISMATCH
[  690.870765] nouveau E[     PGR][0000:01:00.0] x = 1056, y = 328, format = 0,
storage type = fe
[  695.179294] nouveau E[   PFIFO][0000:01:00.0] SCHED_ERROR [ CTXSW_TIMEOUT ]
[  695.179298] nouveau E[   PFIFO][0000:01:00.0] PGR engine fault on channel
10, recovering...

This one happened earlier than usual.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1431765648.2Ed4721D1.22836
Date: Sat, 16 May 2015 08:40:48 +0000
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
   title="NEW - [NVE4] Desktop freezes &amp; PDISP, PFIFO and PGRAPH errors"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90453#c17">Comment # 17</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVE4] Desktop freezes &amp; PDISP, PFIFO and PGRAPH errors"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90453">bug 90453</a>
              from <span class="vcard"><a class="email" href="mailto:mhelvens&#64;gmail.com" title="Michiel Helvensteijn &lt;mhelvens&#64;gmail.com&gt;"> <span class="fn">Michiel Helvensteijn</span></a>
</span></b>
        <pre>Indeed, problem not solved. Here's a new set of errors produced during a
freeze:

[  690.870744] nouveau E[     PGR][0000:01:00.0] TRAP ch 8 [0x007f2f2000
gnome-shell[2652]]
[  690.870754] nouveau E[     PGR][0000:01:00.0] GPC1/PROP trap:
ZETA_STORAGE_TYPE_MISMATCH
[  690.870756] nouveau E[     PGR][0000:01:00.0] x = 1232, y = 56, format = 0,
storage type = fe
[  690.870763] nouveau E[     PGR][0000:01:00.0] GPC2/PROP trap:
ZETA_STORAGE_TYPE_MISMATCH
[  690.870765] nouveau E[     PGR][0000:01:00.0] x = 1056, y = 328, format = 0,
storage type = fe
[  695.179294] nouveau E[   PFIFO][0000:01:00.0] SCHED_ERROR [ CTXSW_TIMEOUT ]
[  695.179298] nouveau E[   PFIFO][0000:01:00.0] PGR engine fault on channel
10, recovering...

This one happened earlier than usual.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1431765648.2Ed4721D1.22836--

--===============1831743895==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1831743895==--
