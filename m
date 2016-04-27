From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 93629] [NVE6] complete system freeze,
 PGRAPH engine fault on channel 2, SCHED_ERROR [ CTXSW_TIMEOUT ]
Date: Wed, 27 Apr 2016 09:22:28 +0000
Message-ID: <bug-93629-8800-0QIrCZwNRP@http.bugs.freedesktop.org/>
References: <bug-93629-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1391404452=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-93629-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1391404452==
Content-Type: multipart/alternative; boundary="14617489474.EdEF8b.12373";
 charset="UTF-8"


--14617489474.EdEF8b.12373
Date: Wed, 27 Apr 2016 09:22:27 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=93629

--- Comment #18 from Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Compiled and booted a 3.10 kernel in order to attempt a bisect, but the issue
showed up on that version as well:

[   95.424646] nouveau E[  PGRAPH][0000:01:00.0] GPC ch 7 [0x000027f563
Xorg[1698]]:
[   95.424659] nouveau E[  PGRAPH][0000:01:00.0] GPC0/TP0/MP trap:
INVALID_OPCODE
[   95.424671] nouveau E[  PGRAPH][0000:01:00.0] GPC2/TP0/MP trap:
INVALID_OPCODE
[   95.424805] nouveau E[  PGRAPH][0000:01:00.0] GPC ch 7 [0x000027f563
Xorg[1698]]:
[   95.424813] nouveau E[  PGRAPH][0000:01:00.0] GPC1/TP0/MP trap:
INVALID_OPCODE
[   95.424826] nouveau E[  PGRAPH][0000:01:00.0] GPC2/TP1/MP trap:
INVALID_OPCODE
[   99.750909] nouveau W[   PFIFO][0000:01:00.0] unknown status 0x00000100
[  102.082998] nouveau E[  PGRAPH][0000:01:00.0] ROP0 ch 5 [0x000027f71f
Xorg[1698]] 0x80000000 0x80000001
[  102.083000] nouveau E[  PGRAPH][0000:01:00.0] ROP1 ch 5 [0x000027f71f
Xorg[1698]] 0x80000000 0x80000001
[  102.083000] nouveau E[  PGRAPH][0000:01:00.0] ROP2 ch 5 [0x000027f71f
Xorg[1698]] 0x80000000 0x80000001
[  104.045757] nouveau W[   PFIFO][0000:01:00.0] unknown status 0x00000100
[  108.340607] nouveau W[   PFIFO][0000:01:00.0] unknown status 0x00000100

Using the external firmware, I cannot reproduce the problem on this kernel
either. So it seems like the NVE6 firmware has a long-standing bug.

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14617489474.EdEF8b.12373
Date: Wed, 27 Apr 2016 09:22:27 +0000
MIME-Version: 1.0
Content-Type: text/html

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVE6] complete system freeze, PGRAPH engine fault on channel 2, SCHED_ERROR [ CTXSW_TIMEOUT ]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93629#c18">Comment # 18</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVE6] complete system freeze, PGRAPH engine fault on channel 2, SCHED_ERROR [ CTXSW_TIMEOUT ]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93629">bug 93629</a>
              from <span class="vcard"><a class="email" href="mailto:gnurou&#64;gmail.com" title="Alexandre Courbot &lt;gnurou&#64;gmail.com&gt;"> <span class="fn">Alexandre Courbot</span></a>
</span></b>
        <pre>Compiled and booted a 3.10 kernel in order to attempt a bisect, but the issue
showed up on that version as well:

[   95.424646] nouveau E[  PGRAPH][0000:01:00.0] GPC ch 7 [0x000027f563
Xorg[1698]]:
[   95.424659] nouveau E[  PGRAPH][0000:01:00.0] GPC0/TP0/MP trap:
INVALID_OPCODE
[   95.424671] nouveau E[  PGRAPH][0000:01:00.0] GPC2/TP0/MP trap:
INVALID_OPCODE
[   95.424805] nouveau E[  PGRAPH][0000:01:00.0] GPC ch 7 [0x000027f563
Xorg[1698]]:
[   95.424813] nouveau E[  PGRAPH][0000:01:00.0] GPC1/TP0/MP trap:
INVALID_OPCODE
[   95.424826] nouveau E[  PGRAPH][0000:01:00.0] GPC2/TP1/MP trap:
INVALID_OPCODE
[   99.750909] nouveau W[   PFIFO][0000:01:00.0] unknown status 0x00000100
[  102.082998] nouveau E[  PGRAPH][0000:01:00.0] ROP0 ch 5 [0x000027f71f
Xorg[1698]] 0x80000000 0x80000001
[  102.083000] nouveau E[  PGRAPH][0000:01:00.0] ROP1 ch 5 [0x000027f71f
Xorg[1698]] 0x80000000 0x80000001
[  102.083000] nouveau E[  PGRAPH][0000:01:00.0] ROP2 ch 5 [0x000027f71f
Xorg[1698]] 0x80000000 0x80000001
[  104.045757] nouveau W[   PFIFO][0000:01:00.0] unknown status 0x00000100
[  108.340607] nouveau W[   PFIFO][0000:01:00.0] unknown status 0x00000100

Using the external firmware, I cannot reproduce the problem on this kernel
either. So it seems like the NVE6 firmware has a long-standing bug.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14617489474.EdEF8b.12373--

--===============1391404452==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1391404452==--
