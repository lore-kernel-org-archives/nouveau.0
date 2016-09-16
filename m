From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92077] nouveau graphics freeze when using KDE Plasma
 5; PGR engine fault
Date: Fri, 16 Sep 2016 17:51:10 +0000
Message-ID: <bug-92077-8800-Gdv3M9ea5m@http.bugs.freedesktop.org/>
References: <bug-92077-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1999018260=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-92077-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1999018260==
Content-Type: multipart/alternative; boundary="14740482700.a9AA0.13878";
 charset="UTF-8"


--14740482700.a9AA0.13878
Date: Fri, 16 Sep 2016 17:51:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D92077

--- Comment #24 from Andrey Mazo <ahippo-o+MxOtu4lMCHXe+LvDLADg@public.gmane.org> ---
A similar fault and a deadlock that happened on newer kernel (4.7.2).
Looks like to be triggered by qupzilla (www-client/qupzilla-2.0.1, compiled
with KDE/Plasma 5 support) launch this time.
Could be a QtWebEngine problem though.

[838735.611662] nouveau 0000:03:00.0: fifo: PBDMA0: 00200000 [ILLEGAL_MTHD]=
 ch
15 [001f68d000 qupzilla[12159]] subc 0 mthd 000c data 0000003c
[838735.611680] nouveau 0000:03:00.0: fifo: PBDMA0: 02000000 [] ch 15
[001f68d000 qupzilla[12159]] subc 0 mthd 0020 data 00000000
[838735.611694] nouveau 0000:03:00.0: fifo: PBDMA0: 00200000 [ILLEGAL_MTHD]=
 ch
15 [001f68d000 qupzilla[12159]] subc 0 mthd 0030 data 0000003c
[838735.611707] nouveau 0000:03:00.0: fifo: PBDMA0: 00200000 [ILLEGAL_MTHD]=
 ch
15 [001f68d000 qupzilla[12159]] subc 0 mthd 0034 data 20040360
[838735.611720] nouveau 0000:03:00.0: fifo: PBDMA0: 00200000 [ILLEGAL_MTHD]=
 ch
15 [001f68d000 qupzilla[12159]] subc 0 mthd 0038 data 00000000
[838735.611733] nouveau 0000:03:00.0: fifo: PBDMA0: 00200000 [ILLEGAL_MTHD]=
 ch
15 [001f68d000 qupzilla[12159]] subc 0 mthd 003c data 00000000
[838735.611746] nouveau 0000:03:00.0: fifo: PBDMA0: 00200000 [ILLEGAL_MTHD]=
 ch
15 [001f68d000 qupzilla[12159]] subc 0 mthd 0040 data 00000000
[838735.611758] nouveau 0000:03:00.0: fifo: PBDMA0: 00200000 [ILLEGAL_MTHD]=
 ch
15 [001f68d000 qupzilla[12159]] subc 0 mthd 0044 data 00000000
[838735.611771] nouveau 0000:03:00.0: fifo: PBDMA0: 00200000 [ILLEGAL_MTHD]=
 ch
15 [001f68d000 qupzilla[12159]] subc 0 mthd 0048 data 20010674
[838735.611784] nouveau 0000:03:00.0: fifo: PBDMA0: 00200000 [ILLEGAL_MTHD]=
 ch
15 [001f68d000 qupzilla[12159]] subc 0 mthd 004c data 0000003c
[838735.611798] nouveau 0000:03:00.0: fifo: PBDMA0: 00200000 [ILLEGAL_MTHD]=
 ch
15 [001f68d000 qupzilla[12159]] subc 0 mthd 0054 data 00000000
[838735.611811] nouveau 0000:03:00.0: fifo: PBDMA0: 00200000 [ILLEGAL_MTHD]=
 ch
15 [001f68d000 qupzilla[12159]] subc 0 mthd 0058 data 00252000
[838735.611824] nouveau 0000:03:00.0: fifo: PBDMA0: 00200000 [ILLEGAL_MTHD]=
 ch
15 [001f68d000 qupzilla[12159]] subc 0 mthd 005c data 200240c7
[838735.611836] nouveau 0000:03:00.0: fifo: PBDMA0: 00200000 [ILLEGAL_MTHD]=
 ch
15 [001f68d000 qupzilla[12159]] subc 0 mthd 0060 data 00000048
[838735.611855] nouveau 0000:03:00.0: fifo: read fault at 0000000000 engine=
 07
[PFIFO] client 07 [BAR_READ] reason 02 [PAGE_NOT_PRESENT] on channel 15
[001f68d000 qupzilla[12159]]
[838735.611858] nouveau 0000:03:00.0: fifo: fifo engine fault on channel 15,
recovering...

[838735.612309] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
[838735.612311] [ INFO: possible recursive locking detected ]
[838735.612314] 4.7.2-gentoo-20160906 #2 Not tainted
[838735.612315] ---------------------------------------------
[838735.612317] kworker/0:1/12138 is trying to acquire lock:
[838735.612319]  ((&fifo->recover.work)){+.+...}, at: [<ffffffffb72d5340>]
flush_work+0x0/0x290
[838735.612329]
                but task is already holding lock:
[838735.612331]  ((&fifo->recover.work)){+.+...}, at: [<ffffffffb72d5e3b>]
process_one_work+0x14b/0x450
[838735.612336]
                other info that might help us debug this:
[838735.612337]  Possible unsafe locking scenario:

[838735.612339]        CPU0
[838735.612340]        ----
[838735.612341]   lock((&fifo->recover.work));
[838735.612343]   lock((&fifo->recover.work));
[838735.612345]
                 *** DEADLOCK ***

[838735.612347]  May be due to missing lock nesting notation

[838735.612349] 2 locks held by kworker/0:1/12138:
[838735.612351]  #0:  ("events"){.+.+.+}, at: [<ffffffffb72d5e3b>]
process_one_work+0x14b/0x450
[838735.612356]  #1:  ((&fifo->recover.work)){+.+...}, at: [<ffffffffb72d5e=
3b>]
process_one_work+0x14b/0x450
[838735.612360]
                stack backtrace:
[838735.612363] CPU: 0 PID: 12138 Comm: kworker/0:1 Not tainted
4.7.2-gentoo-20160906 #2
[838735.612365] Hardware name: Dell Inc. Precision Tower 7910/0215PR, BIOS =
A06
01/19/2015
[838735.612371] Workqueue: events gf100_fifo_recover_work
[838735.612373]  0000000000000000 ffff8800750a7af0 ffffffffb7567885
ffff88082f220000
[838735.612378]  ffffffffb86fd780 ffff8800750a7bb8 ffffffffb73064c8
00000000b86fd780
[838735.612381]  ffff88082f220050 ffff8800750a7b00 0000000268312189
0000000000000002
[838735.612385] Call Trace:
[838735.612391]  [<ffffffffb7567885>] dump_stack+0x67/0x92
[838735.612396]  [<ffffffffb73064c8>] __lock_acquire+0x1508/0x1620
[838735.612399]  [<ffffffffb73069d0>] lock_acquire+0x60/0x80
[838735.612401]  [<ffffffffb72d5340>] ? mod_delayed_work_on+0x80/0x80
[838735.612403]  [<ffffffffb72d5387>] flush_work+0x47/0x290
[838735.612405]  [<ffffffffb72d5340>] ? mod_delayed_work_on+0x80/0x80
[838735.612408]  [<ffffffffb7304b21>] ? mark_held_locks+0x71/0x90
[838735.612414]  [<ffffffffb732412a>] ? ktime_get+0x6a/0x130
[838735.612417]  [<ffffffffb76dbbc0>] gf100_fifo_fini+0x10/0x20
[838735.612420]  [<ffffffffb76d9d8a>] nvkm_fifo_fini+0x1a/0x30
[838735.612424]  [<ffffffffb76745e0>] nvkm_engine_fini+0x20/0x30
[838735.612429]  [<ffffffffb767839a>] nvkm_subdev_fini+0x5a/0x160
[838735.612432]  [<ffffffffb76dc20a>] gf100_fifo_recover_work+0xea/0x1f0
[838735.612434]  [<ffffffffb72d5e9a>] process_one_work+0x1aa/0x450
[838735.612436]  [<ffffffffb72d5e3b>] ? process_one_work+0x14b/0x450
[838735.612438]  [<ffffffffb72d6639>] worker_thread+0x49/0x490
[838735.612441]  [<ffffffffb72d65f0>] ? workqueue_congested+0x160/0x160
[838735.612443]  [<ffffffffb72d65f0>] ? workqueue_congested+0x160/0x160
[838735.612447]  [<ffffffffb72dc449>] kthread+0xf9/0x110
[838735.612452]  [<ffffffffb7978c3f>] ret_from_fork+0x1f/0x40
[838735.612455]  [<ffffffffb72dc350>] ? kthread_create_on_node+0x230/0x230

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--14740482700.a9AA0.13878
Date: Fri, 16 Sep 2016 17:51:10 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - nouveau graphics freeze when using KDE Plasma 5; PGR engi=
ne fault"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D92077#c24">Commen=
t # 24</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - nouveau graphics freeze when using KDE Plasma 5; PGR engi=
ne fault"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D92077">bug 92077<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
ahippo&#64;yandex.ru" title=3D"Andrey Mazo &lt;ahippo&#64;yandex.ru&gt;"> <=
span class=3D"fn">Andrey Mazo</span></a>
</span></b>
        <pre>A similar fault and a deadlock that happened on newer kernel (=
4.7.2).
Looks like to be triggered by qupzilla (www-client/qupzilla-2.0.1, compiled
with KDE/Plasma 5 support) launch this time.
Could be a QtWebEngine problem though.

[838735.611662] nouveau 0000:03:00.0: fifo: PBDMA0: 00200000 [ILLEGAL_MTHD]=
 ch
15 [001f68d000 qupzilla[12159]] subc 0 mthd 000c data 0000003c
[838735.611680] nouveau 0000:03:00.0: fifo: PBDMA0: 02000000 [] ch 15
[001f68d000 qupzilla[12159]] subc 0 mthd 0020 data 00000000
[838735.611694] nouveau 0000:03:00.0: fifo: PBDMA0: 00200000 [ILLEGAL_MTHD]=
 ch
15 [001f68d000 qupzilla[12159]] subc 0 mthd 0030 data 0000003c
[838735.611707] nouveau 0000:03:00.0: fifo: PBDMA0: 00200000 [ILLEGAL_MTHD]=
 ch
15 [001f68d000 qupzilla[12159]] subc 0 mthd 0034 data 20040360
[838735.611720] nouveau 0000:03:00.0: fifo: PBDMA0: 00200000 [ILLEGAL_MTHD]=
 ch
15 [001f68d000 qupzilla[12159]] subc 0 mthd 0038 data 00000000
[838735.611733] nouveau 0000:03:00.0: fifo: PBDMA0: 00200000 [ILLEGAL_MTHD]=
 ch
15 [001f68d000 qupzilla[12159]] subc 0 mthd 003c data 00000000
[838735.611746] nouveau 0000:03:00.0: fifo: PBDMA0: 00200000 [ILLEGAL_MTHD]=
 ch
15 [001f68d000 qupzilla[12159]] subc 0 mthd 0040 data 00000000
[838735.611758] nouveau 0000:03:00.0: fifo: PBDMA0: 00200000 [ILLEGAL_MTHD]=
 ch
15 [001f68d000 qupzilla[12159]] subc 0 mthd 0044 data 00000000
[838735.611771] nouveau 0000:03:00.0: fifo: PBDMA0: 00200000 [ILLEGAL_MTHD]=
 ch
15 [001f68d000 qupzilla[12159]] subc 0 mthd 0048 data 20010674
[838735.611784] nouveau 0000:03:00.0: fifo: PBDMA0: 00200000 [ILLEGAL_MTHD]=
 ch
15 [001f68d000 qupzilla[12159]] subc 0 mthd 004c data 0000003c
[838735.611798] nouveau 0000:03:00.0: fifo: PBDMA0: 00200000 [ILLEGAL_MTHD]=
 ch
15 [001f68d000 qupzilla[12159]] subc 0 mthd 0054 data 00000000
[838735.611811] nouveau 0000:03:00.0: fifo: PBDMA0: 00200000 [ILLEGAL_MTHD]=
 ch
15 [001f68d000 qupzilla[12159]] subc 0 mthd 0058 data 00252000
[838735.611824] nouveau 0000:03:00.0: fifo: PBDMA0: 00200000 [ILLEGAL_MTHD]=
 ch
15 [001f68d000 qupzilla[12159]] subc 0 mthd 005c data 200240c7
[838735.611836] nouveau 0000:03:00.0: fifo: PBDMA0: 00200000 [ILLEGAL_MTHD]=
 ch
15 [001f68d000 qupzilla[12159]] subc 0 mthd 0060 data 00000048
[838735.611855] nouveau 0000:03:00.0: fifo: read fault at 0000000000 engine=
 07
[PFIFO] client 07 [BAR_READ] reason 02 [PAGE_NOT_PRESENT] on channel 15
[001f68d000 qupzilla[12159]]
[838735.611858] nouveau 0000:03:00.0: fifo: fifo engine fault on channel 15,
recovering...

[838735.612309] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
[838735.612311] [ INFO: possible recursive locking detected ]
[838735.612314] 4.7.2-gentoo-20160906 #2 Not tainted
[838735.612315] ---------------------------------------------
[838735.612317] kworker/0:1/12138 is trying to acquire lock:
[838735.612319]  ((&amp;fifo-&gt;recover.work)){+.+...}, at: [&lt;ffffffffb=
72d5340&gt;]
flush_work+0x0/0x290
[838735.612329]
                but task is already holding lock:
[838735.612331]  ((&amp;fifo-&gt;recover.work)){+.+...}, at: [&lt;ffffffffb=
72d5e3b&gt;]
process_one_work+0x14b/0x450
[838735.612336]
                other info that might help us debug this:
[838735.612337]  Possible unsafe locking scenario:

[838735.612339]        CPU0
[838735.612340]        ----
[838735.612341]   lock((&amp;fifo-&gt;recover.work));
[838735.612343]   lock((&amp;fifo-&gt;recover.work));
[838735.612345]
                 *** DEADLOCK ***

[838735.612347]  May be due to missing lock nesting notation

[838735.612349] 2 locks held by kworker/0:1/12138:
[838735.612351]  #0:  (&quot;events&quot;){.+.+.+}, at: [&lt;ffffffffb72d5e=
3b&gt;]
process_one_work+0x14b/0x450
[838735.612356]  #1:  ((&amp;fifo-&gt;recover.work)){+.+...}, at: [&lt;ffff=
ffffb72d5e3b&gt;]
process_one_work+0x14b/0x450
[838735.612360]
                stack backtrace:
[838735.612363] CPU: 0 PID: 12138 Comm: kworker/0:1 Not tainted
4.7.2-gentoo-20160906 #2
[838735.612365] Hardware name: Dell Inc. Precision Tower 7910/0215PR, BIOS =
A06
01/19/2015
[838735.612371] Workqueue: events gf100_fifo_recover_work
[838735.612373]  0000000000000000 ffff8800750a7af0 ffffffffb7567885
ffff88082f220000
[838735.612378]  ffffffffb86fd780 ffff8800750a7bb8 ffffffffb73064c8
00000000b86fd780
[838735.612381]  ffff88082f220050 ffff8800750a7b00 0000000268312189
0000000000000002
[838735.612385] Call Trace:
[838735.612391]  [&lt;ffffffffb7567885&gt;] dump_stack+0x67/0x92
[838735.612396]  [&lt;ffffffffb73064c8&gt;] __lock_acquire+0x1508/0x1620
[838735.612399]  [&lt;ffffffffb73069d0&gt;] lock_acquire+0x60/0x80
[838735.612401]  [&lt;ffffffffb72d5340&gt;] ? mod_delayed_work_on+0x80/0x80
[838735.612403]  [&lt;ffffffffb72d5387&gt;] flush_work+0x47/0x290
[838735.612405]  [&lt;ffffffffb72d5340&gt;] ? mod_delayed_work_on+0x80/0x80
[838735.612408]  [&lt;ffffffffb7304b21&gt;] ? mark_held_locks+0x71/0x90
[838735.612414]  [&lt;ffffffffb732412a&gt;] ? ktime_get+0x6a/0x130
[838735.612417]  [&lt;ffffffffb76dbbc0&gt;] gf100_fifo_fini+0x10/0x20
[838735.612420]  [&lt;ffffffffb76d9d8a&gt;] nvkm_fifo_fini+0x1a/0x30
[838735.612424]  [&lt;ffffffffb76745e0&gt;] nvkm_engine_fini+0x20/0x30
[838735.612429]  [&lt;ffffffffb767839a&gt;] nvkm_subdev_fini+0x5a/0x160
[838735.612432]  [&lt;ffffffffb76dc20a&gt;] gf100_fifo_recover_work+0xea/0x=
1f0
[838735.612434]  [&lt;ffffffffb72d5e9a&gt;] process_one_work+0x1aa/0x450
[838735.612436]  [&lt;ffffffffb72d5e3b&gt;] ? process_one_work+0x14b/0x450
[838735.612438]  [&lt;ffffffffb72d6639&gt;] worker_thread+0x49/0x490
[838735.612441]  [&lt;ffffffffb72d65f0&gt;] ? workqueue_congested+0x160/0x1=
60
[838735.612443]  [&lt;ffffffffb72d65f0&gt;] ? workqueue_congested+0x160/0x1=
60
[838735.612447]  [&lt;ffffffffb72dc449&gt;] kthread+0xf9/0x110
[838735.612452]  [&lt;ffffffffb7978c3f&gt;] ret_from_fork+0x1f/0x40
[838735.612455]  [&lt;ffffffffb72dc350&gt;] ? kthread_create_on_node+0x230/=
0x230</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14740482700.a9AA0.13878--

--===============1999018260==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1999018260==--
