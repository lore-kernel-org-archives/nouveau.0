From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92077] nouveau graphics freeze when using KDE Plasma
 5; PGR engine fault
Date: Sun, 04 Oct 2015 21:09:10 +0000
Message-ID: <bug-92077-8800-Tt61ABGsLm@http.bugs.freedesktop.org/>
References: <bug-92077-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0643480553=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-92077-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0643480553==
Content-Type: multipart/alternative; boundary="1443992950.2Fe8e0.4687"; charset="UTF-8"


--1443992950.2Fe8e0.4687
Date: Sun, 4 Oct 2015 21:09:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=92077

--- Comment #7 from dmidge <quelque_ri1-Qt13gs6zZMY@public.gmane.org> ---
Hi everyone,

I can identify myself in this bug. As zoominee did, I reported a similar bug on
KDE forum: https://bugs.kde.org/show_bug.cgi?id=353292. There, you can access
the stacktrace (on an Archlinux system). You also have the dmesg messages.
There is a sample of what is displayed:
[251170.682470] nouveau E[  PGRAPH][0000:01:00.0] magic set 1:
[251170.682485] nouveau E[  PGRAPH][0000:01:00.0]     0x00408e04: 0x2008bf05
[251170.682494] nouveau E[  PGRAPH][0000:01:00.0]     0x00408e08: 0x00205640
[251170.682501] nouveau E[  PGRAPH][0000:01:00.0]     0x00408e0c: 0x40000432
[251170.682509] nouveau E[  PGRAPH][0000:01:00.0]     0x00408e10: 0x56400000
[251170.682515] nouveau E[  PGRAPH][0000:01:00.0] TRAP_TEXTURE - TP1:  FAULT
[251170.682531] nouveau E[  PGRAPH][0000:01:00.0] ch 9 [0x003f518000
plasmashell[503]] subc 3 class 0x8597 mthd 0x1b0c data 0x1000f010
[251170.682555] nouveau E[     PFB][0000:01:00.0] trapped read at 0x0020564000
on channel 0x0003f518 [plasmashell[503]] PGRAPH/TEXTURE/00 reason:
PAGE_NOT_PRESENT
[251170.683469] nouveau E[  PGRAPH][0000:01:00.0] magic set 1:
[251170.683476] nouveau E[  PGRAPH][0000:01:00.0]     0x00408e04: 0x2009bc05
[251170.683481] nouveau E[  PGRAPH][0000:01:00.0]     0x00408e08: 0x00205641
[251170.683485] nouveau E[  PGRAPH][0000:01:00.0]     0x00408e0c: 0x40000432
[251170.683490] nouveau E[  PGRAPH][0000:01:00.0]     0x00408e10: 0x56400000
[251170.683493] nouveau E[  PGRAPH][0000:01:00.0] TRAP_TEXTURE - TP1:  FAULT
[251170.683502] nouveau E[  PGRAPH][0000:01:00.0] ch 9 [0x003f518000
plasmashell[503]] subc 3 class 0x8597 mthd 0x1b0c data 0x1000f010
[251170.683513] nouveau E[     PFB][0000:01:00.0] trapped read at 0x0020564100
on channel 0x0003f518 [plasmashell[503]] PGRAPH/TEXTURE/00 reason:
PAGE_NOT_PRESENT
[251170.683543] nouveau E[  PGRAPH][0000:01:00.0] magic set 1:
[251170.683555] nouveau E[  PGRAPH][0000:01:00.0]     0x00408e04: 0x2009610f
[251170.683560] nouveau E[  PGRAPH][0000:01:00.0]     0x00408e08: 0x00205734
[251170.683565] nouveau E[  PGRAPH][0000:01:00.0]     0x00408e0c: 0x40000432
[251170.683570] nouveau E[  PGRAPH][0000:01:00.0]     0x00408e10: 0x57200000
[251170.683574] nouveau E[  PGRAPH][0000:01:00.0] TRAP_TEXTURE - TP1:  FAULT
[251170.683586] nouveau E[  PGRAPH][0000:01:00.0] ch 9 [0x003f518000
plasmashell[503]] subc 3 class 0x8597 mthd 0x15f0 data 0x02000201
[251170.683599] nouveau E[     PFB][0000:01:00.0] trapped read at 0x0020573400
on channel 0x0003f518 [plasmashell[503]] PGRAPH/TEXTURE/00 reason:
PAGE_NOT_PRESENT
[251170.683632] nouveau E[  PGRAPH][0000:01:00.0] magic set 1:
[251170.683644] nouveau E[  PGRAPH][0000:01:00.0]     0x00408e04: 0x20086805
[251170.683650] nouveau E[  PGRAPH][0000:01:00.0]     0x00408e08: 0x00205890
[251170.683656] nouveau E[  PGRAPH][0000:01:00.0]     0x00408e0c: 0x40000432
[251170.683662] nouveau E[  PGRAPH][0000:01:00.0]     0x00408e10: 0x58900000
[251170.683667] nouveau E[  PGRAPH][0000:01:00.0] TRAP_TEXTURE - TP1:  FAULT
[251170.683680] nouveau E[  PGRAPH][0000:01:00.0] ch 9 [0x003f518000
plasmashell[503]] subc 3 class 0x8597 mthd 0x0900 data 0x20000010
[251170.683698] nouveau E[     PFB][0000:01:00.0] trapped read at 0x0020589000
on channel 0x0003f518 [plasmashell[503]] PGRAPH/TEXTURE/00 reason:
PAGE_NOT_PRESENT

... and there is more there. Please see the attachment.

I can also add that it makes the plasmashell application hangs for a while,
with 100%CPU usage. After some time, the system is responsive again, with some
glitches in the interface (meaning, some icons disappearing or wrongly
displayed for instance. Once, it made the file explorer dolphin crash).

It has been identified by a problem with nouveau (I refer you to the comment 4
of the ticket, that gives better understanding of the problem):
https://bugs.kde.org/show_bug.cgi?id=353292#c4

Thank you for your time! And keep the good work going!
Cheers.

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1443992950.2Fe8e0.4687
Date: Sun, 4 Oct 2015 21:09:10 +0000
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
   title="NEW - nouveau graphics freeze when using KDE Plasma 5; PGR engine fault"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92077#c7">Comment # 7</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - nouveau graphics freeze when using KDE Plasma 5; PGR engine fault"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92077">bug 92077</a>
              from <span class="vcard"><a class="email" href="mailto:quelque_ri1&#64;yahoo.fr" title="dmidge &lt;quelque_ri1&#64;yahoo.fr&gt;"> <span class="fn">dmidge</span></a>
</span></b>
        <pre>Hi everyone,

I can identify myself in this bug. As zoominee did, I reported a similar bug on
KDE forum: <a href="https://bugs.kde.org/show_bug.cgi?id=353292">https://bugs.kde.org/show_bug.cgi?id=353292</a>. There, you can access
the stacktrace (on an Archlinux system). You also have the dmesg messages.
There is a sample of what is displayed:
[251170.682470] nouveau E[  PGRAPH][0000:01:00.0] magic set 1:
[251170.682485] nouveau E[  PGRAPH][0000:01:00.0]     0x00408e04: 0x2008bf05
[251170.682494] nouveau E[  PGRAPH][0000:01:00.0]     0x00408e08: 0x00205640
[251170.682501] nouveau E[  PGRAPH][0000:01:00.0]     0x00408e0c: 0x40000432
[251170.682509] nouveau E[  PGRAPH][0000:01:00.0]     0x00408e10: 0x56400000
[251170.682515] nouveau E[  PGRAPH][0000:01:00.0] TRAP_TEXTURE - TP1:  FAULT
[251170.682531] nouveau E[  PGRAPH][0000:01:00.0] ch 9 [0x003f518000
plasmashell[503]] subc 3 class 0x8597 mthd 0x1b0c data 0x1000f010
[251170.682555] nouveau E[     PFB][0000:01:00.0] trapped read at 0x0020564000
on channel 0x0003f518 [plasmashell[503]] PGRAPH/TEXTURE/00 reason:
PAGE_NOT_PRESENT
[251170.683469] nouveau E[  PGRAPH][0000:01:00.0] magic set 1:
[251170.683476] nouveau E[  PGRAPH][0000:01:00.0]     0x00408e04: 0x2009bc05
[251170.683481] nouveau E[  PGRAPH][0000:01:00.0]     0x00408e08: 0x00205641
[251170.683485] nouveau E[  PGRAPH][0000:01:00.0]     0x00408e0c: 0x40000432
[251170.683490] nouveau E[  PGRAPH][0000:01:00.0]     0x00408e10: 0x56400000
[251170.683493] nouveau E[  PGRAPH][0000:01:00.0] TRAP_TEXTURE - TP1:  FAULT
[251170.683502] nouveau E[  PGRAPH][0000:01:00.0] ch 9 [0x003f518000
plasmashell[503]] subc 3 class 0x8597 mthd 0x1b0c data 0x1000f010
[251170.683513] nouveau E[     PFB][0000:01:00.0] trapped read at 0x0020564100
on channel 0x0003f518 [plasmashell[503]] PGRAPH/TEXTURE/00 reason:
PAGE_NOT_PRESENT
[251170.683543] nouveau E[  PGRAPH][0000:01:00.0] magic set 1:
[251170.683555] nouveau E[  PGRAPH][0000:01:00.0]     0x00408e04: 0x2009610f
[251170.683560] nouveau E[  PGRAPH][0000:01:00.0]     0x00408e08: 0x00205734
[251170.683565] nouveau E[  PGRAPH][0000:01:00.0]     0x00408e0c: 0x40000432
[251170.683570] nouveau E[  PGRAPH][0000:01:00.0]     0x00408e10: 0x57200000
[251170.683574] nouveau E[  PGRAPH][0000:01:00.0] TRAP_TEXTURE - TP1:  FAULT
[251170.683586] nouveau E[  PGRAPH][0000:01:00.0] ch 9 [0x003f518000
plasmashell[503]] subc 3 class 0x8597 mthd 0x15f0 data 0x02000201
[251170.683599] nouveau E[     PFB][0000:01:00.0] trapped read at 0x0020573400
on channel 0x0003f518 [plasmashell[503]] PGRAPH/TEXTURE/00 reason:
PAGE_NOT_PRESENT
[251170.683632] nouveau E[  PGRAPH][0000:01:00.0] magic set 1:
[251170.683644] nouveau E[  PGRAPH][0000:01:00.0]     0x00408e04: 0x20086805
[251170.683650] nouveau E[  PGRAPH][0000:01:00.0]     0x00408e08: 0x00205890
[251170.683656] nouveau E[  PGRAPH][0000:01:00.0]     0x00408e0c: 0x40000432
[251170.683662] nouveau E[  PGRAPH][0000:01:00.0]     0x00408e10: 0x58900000
[251170.683667] nouveau E[  PGRAPH][0000:01:00.0] TRAP_TEXTURE - TP1:  FAULT
[251170.683680] nouveau E[  PGRAPH][0000:01:00.0] ch 9 [0x003f518000
plasmashell[503]] subc 3 class 0x8597 mthd 0x0900 data 0x20000010
[251170.683698] nouveau E[     PFB][0000:01:00.0] trapped read at 0x0020589000
on channel 0x0003f518 [plasmashell[503]] PGRAPH/TEXTURE/00 reason:
PAGE_NOT_PRESENT

... and there is more there. Please see the attachment.

I can also add that it makes the plasmashell application hangs for a while,
with 100%CPU usage. After some time, the system is responsive again, with some
glitches in the interface (meaning, some icons disappearing or wrongly
displayed for instance. Once, it made the file explorer dolphin crash).

It has been identified by a problem with nouveau (I refer you to the <a href="show_bug.cgi?id=92077#c4">comment 4</a>
of the ticket, that gives better understanding of the problem):
<a href="https://bugs.kde.org/show_bug.cgi?id=353292#c4">https://bugs.kde.org/show_bug.cgi?id=353292#c4</a>

Thank you for your time! And keep the good work going!
Cheers.</pre>
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

--1443992950.2Fe8e0.4687--

--===============0643480553==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0643480553==--
