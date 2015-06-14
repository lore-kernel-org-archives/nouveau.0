From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90453] [NVE4] Desktop freezes & PDISP, PFIFO,
 PGRAPH and PGR errors
Date: Sun, 14 Jun 2015 14:04:33 +0000
Message-ID: <bug-90453-8800-pfQZ1aJ3nU@http.bugs.freedesktop.org/>
References: <bug-90453-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0075304476=="
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


--===============0075304476==
Content-Type: multipart/alternative; boundary="1434290673.2d8EA3AC1.10493"; charset="UTF-8"


--1434290673.2d8EA3AC1.10493
Date: Sun, 14 Jun 2015 14:04:33 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90453

--- Comment #22 from Argyris Megalios <argymeg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I originally added my problem to bug 89912, as my original error message was
not seen here.

kernel: nouveau E[   PFIFO][0000:01:00.0] write fault at 0x00002a0000 [PTE]
from GR/GPC0/PROP_0 on channel 0x007f96c000 [Xorg[383]]
kernel: nouveau E[   PFIFO][0000:01:00.0] PGR engine fault on channel 2,
recovering...

However, after also getting the following:
kernel: nouveau E[   PFIFO][0000:01:00.0] SCHED_ERROR [ CTXSW_TIMEOUT ]
kernel: nouveau E[   PFIFO][0000:01:00.0] PGR engine fault on channel 10,
recovering...

I am inclined to thing the bugs are duplicates.
Now, while playing a game (which actually played fine yesterday) I have had two
consecutive freezes with the message:

kernel: nouveau E[     DRM] GPU lockup - switching to software fbcon

I, too, will be switching to the nvidia driver for the moment, however I will
be happy to assist with any fix tests.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1434290673.2d8EA3AC1.10493
Date: Sun, 14 Jun 2015 14:04:33 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90453#c22">Comment # 22</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVE4] Desktop freezes &amp; PDISP, PFIFO, PGRAPH and PGR errors"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90453">bug 90453</a>
              from <span class="vcard"><a class="email" href="mailto:argymeg&#64;gmail.com" title="Argyris Megalios &lt;argymeg&#64;gmail.com&gt;"> <span class="fn">Argyris Megalios</span></a>
</span></b>
        <pre>I originally added my problem to <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Sometimes Nouveau hangs kernel with PGRAPH engine fault"
   href="show_bug.cgi?id=89912">bug 89912</a>, as my original error message was
not seen here.

kernel: nouveau E[   PFIFO][0000:01:00.0] write fault at 0x00002a0000 [PTE]
from GR/GPC0/PROP_0 on channel 0x007f96c000 [Xorg[383]]
kernel: nouveau E[   PFIFO][0000:01:00.0] PGR engine fault on channel 2,
recovering...

However, after also getting the following:
kernel: nouveau E[   PFIFO][0000:01:00.0] SCHED_ERROR [ CTXSW_TIMEOUT ]
kernel: nouveau E[   PFIFO][0000:01:00.0] PGR engine fault on channel 10,
recovering...

I am inclined to thing the bugs are duplicates.
Now, while playing a game (which actually played fine yesterday) I have had two
consecutive freezes with the message:

kernel: nouveau E[     DRM] GPU lockup - switching to software fbcon

I, too, will be switching to the nvidia driver for the moment, however I will
be happy to assist with any fix tests.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1434290673.2d8EA3AC1.10493--

--===============0075304476==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0075304476==--
