From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92077] nouveau graphics freeze when using KDE Plasma
 5; PGR engine fault
Date: Thu, 14 Apr 2016 23:09:48 +0000
Message-ID: <bug-92077-8800-i1RkKpKvDc@http.bugs.freedesktop.org/>
References: <bug-92077-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1863972531=="
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


--===============1863972531==
Content-Type: multipart/alternative; boundary="14606753880.4ec8D39A.3820";
 charset="UTF-8"


--14606753880.4ec8D39A.3820
Date: Thu, 14 Apr 2016 23:09:48 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=92077

--- Comment #17 from Andrey Mazo <ahippo-o+MxOtu4lMCHXe+LvDLADg@public.gmane.org> ---
I think, I'm also experiencing the same bug as described in comment 0.
(screen doesn't wake from a sleep after 2-3 days of uptime)

I'm also running Gentoo and have the following packages installed.
Linux version 4.4.6-gentoo-20160401 (root@localhost) (gcc version 4.8.5 (Gentoo
4.8.5 p1.3, pie-0.6.2) ) #1 SMP Fri Apr 1 15:03:40 EDT 2016
x11-base/xorg-server-1.17.4
x11-drivers/xf86-video-nouveau-1.0.12
media-libs/mesa-11.0.6
x11-libs/libdrm-2.4.65
kde-plasma/plasma-workspace-5.6.1
www-client/vivaldi-1.0.344.37_p1 (a chromium-based browser)

eselect qtgraphicssystem is set to native

(as far as I remember, kernel 4.5.0 wasn't able to show me anything on the
screen besides total garbage)

I'm ready to recompile the kernel with whatever debugging options you might
need to investigate the problem (increased CONFIG_NOUVEAU_DEBUG or any generic
kernel hacking options).

I'm also glad to capture an apitrace, but not sure of what.
plasmashell, X, a browser?


zoominee, have you tried disabling the system activity applet that you
suspected could trigger the issue?


Here is a part of my dmesg:
[190683.157049] nouveau 0000:03:00.0: gr: TRAP ch 8 [001faea000
plasmashell[26949]]
[190683.157063] nouveau 0000:03:00.0: gr: GPC0/TPC0/TEX: 80000049
[190683.157082] nouveau 0000:03:00.0: fifo: read fault at 0001115000 engine 00
[PGRAPH] client 01 [GPC0/TEX] reason 02 [PAGE_NOT_PRESENT] on channel 8
[001faea000 plasmashell[26949]]
[190683.157084] nouveau 0000:03:00.0: fifo: gr engine fault on channel 8,
recovering...
[192882.157535] nouveau 0000:03:00.0: fifo: PBDMA0: 04000000 [] ch 2
[001fe71000 X[24266]] subc 0 mthd 001c data 00001004
[192882.157807] nouveau 0000:03:00.0: fifo: PBDMA0: 04000000 [] ch 2
[001fe71000 X[24266]] subc 0 mthd 001c data 00001004
[195081.297439] nouveau 0000:03:00.0: fifo: PBDMA0: 04000000 [] ch 2
[001fe71000 X[24266]] subc 0 mthd 001c data 00001004
[195214.396093] [TTM] Failed to expire sync object before buffer eviction
[195229.455046] [TTM] Failed to expire sync object before buffer eviction


And after initiating reboot:
[197665.853048] nouveau 0000:03:00.0: X[24266]: failed to idle channel 2
[X[24266]]
[197680.853033] nouveau 0000:03:00.0: X[24266]: failed to idle channel 2
[X[24266]]
[197680.853119] nouveau 0000:03:00.0: fifo: read fault at 000001b000 engine 07
[PFIFO] client 07 [BAR_READ] reason 02 [PAGE_NOT_PRESENT] on channel 2
[001fe71000 X[24266]]
...
[197680.853150] =============================================
[197680.853151] [ INFO: possible recursive locking detected ]
[197680.853152] 4.4.6-gentoo-20160401 #1 Not tainted
[197680.853153] ---------------------------------------------
[197680.853154] kworker/0:1/27582 is trying to acquire lock:
[197680.853155]  ((&fifo->fault)){+.+...}, at: [<ffffffffa42cebd0>]
flush_work+0x0/0x280
[197680.853162]
                but task is already holding lock:
[197680.853163]  ((&fifo->fault)){+.+...}, at: [<ffffffffa42cf644>]
process_one_work+0x144/0x430
[197680.853167]
                other info that might help us debug this:
[197680.853168]  Possible unsafe locking scenario:

[197680.853169]        CPU0
[197680.853169]        ----
[197680.853170]   lock((&fifo->fault));
[197680.853171]   lock((&fifo->fault));
[197680.853172]
                 *** DEADLOCK ***

[197680.853173]  May be due to missing lock nesting notation

[197680.853174] 2 locks held by kworker/0:1/27582:
[197680.853175]  #0:  ("events"){.+.+.+}, at: [<ffffffffa42cf644>]
process_one_work+0x144/0x430
[197680.853178]  #1:  ((&fifo->fault)){+.+...}, at: [<ffffffffa42cf644>]
process_one_work+0x144/0x430
[197680.853181]
                stack backtrace:
[197680.853183] CPU: 0 PID: 27582 Comm: kworker/0:1 Not tainted
4.4.6-gentoo-hippo-20160401 #1
[197680.853184] Hardware name: Dell Inc. Precision Tower 7910/0215PR, BIOS A06
01/19/2015
[197680.853187] Workqueue: events gf100_fifo_recover_work
[197680.853189]  0000000000000000 ffff8803875bfaf0 ffffffffa453193e
ffffffffa572ac50
[197680.853191]  ffffffffa572ac50 ffff8803875bfbb0 ffffffffa42fcbda
000000010bc3ca5c
[197680.853193]  ffff88083bcf6140 0000000000000000 0000000000000000
00000002442f617b
[197680.853195] Call Trace:
[197680.853198]  [<ffffffffa453193e>] dump_stack+0x67/0x99
[197680.853201]  [<ffffffffa42fcbda>] __lock_acquire+0x16fa/0x1b90
[197680.853202]  [<ffffffffa42fd7e0>] lock_acquire+0x60/0x80
[197680.853204]  [<ffffffffa42cebd0>] ? mod_delayed_work_on+0x80/0x80
[197680.853206]  [<ffffffffa42cec17>] flush_work+0x47/0x280
[197680.853207]  [<ffffffffa42cebd0>] ? mod_delayed_work_on+0x80/0x80
[197680.853210]  [<ffffffffa463cc16>] ? nvkm_subdev_fini+0x46/0x1f0
[197680.853212]  [<ffffffffa42fb026>] ? mark_held_locks+0x66/0x90
[197680.853214]  [<ffffffffa4319fba>] ? ktime_get+0x6a/0x110
[197680.853216]  [<ffffffffa469b390>] gf100_fifo_fini+0x10/0x20
[197680.853217]  [<ffffffffa469975a>] nvkm_fifo_fini+0x1a/0x30
[197680.853219]  [<ffffffffa4639040>] nvkm_engine_fini+0x20/0x30
[197680.853220]  [<ffffffffa463cc2f>] nvkm_subdev_fini+0x5f/0x1f0
[197680.853222]  [<ffffffffa469bbae>] gf100_fifo_recover_work+0xee/0x200
[197680.853224]  [<ffffffffa42cf6a0>] process_one_work+0x1a0/0x430
[197680.853225]  [<ffffffffa42cf644>] ? process_one_work+0x144/0x430
[197680.853227]  [<ffffffffa42cfa45>] worker_thread+0x115/0x460
[197680.853230]  [<ffffffffa4916a66>] ? __schedule+0x2f6/0x920
[197680.853232]  [<ffffffffa42cf930>] ? process_one_work+0x430/0x430
[197680.853234]  [<ffffffffa42d5959>] kthread+0xf9/0x110
[197680.853236]  [<ffffffffa42d5860>] ? kthread_create_on_node+0x230/0x230
[197680.853238]  [<ffffffffa491cabf>] ret_from_fork+0x3f/0x70
[197680.853239]  [<ffffffffa42d5860>] ? kthread_create_on_node+0x230/0x230

-- 
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.
--14606753880.4ec8D39A.3820
Date: Thu, 14 Apr 2016 23:09:48 +0000
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
   title="NEW - nouveau graphics freeze when using KDE Plasma 5; PGR engine fault"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92077#c17">Comment # 17</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - nouveau graphics freeze when using KDE Plasma 5; PGR engine fault"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92077">bug 92077</a>
              from <span class="vcard"><a class="email" href="mailto:ahippo&#64;yandex.ru" title="Andrey Mazo &lt;ahippo&#64;yandex.ru&gt;"> <span class="fn">Andrey Mazo</span></a>
</span></b>
        <pre>I think, I'm also experiencing the same bug as described in <a href="show_bug.cgi?id=92077#c0">comment 0</a>.
(screen doesn't wake from a sleep after 2-3 days of uptime)

I'm also running Gentoo and have the following packages installed.
Linux version 4.4.6-gentoo-20160401 (root&#64;localhost) (gcc version 4.8.5 (Gentoo
4.8.5 p1.3, pie-0.6.2) ) #1 SMP Fri Apr 1 15:03:40 EDT 2016
x11-base/xorg-server-1.17.4
x11-drivers/xf86-video-nouveau-1.0.12
media-libs/mesa-11.0.6
x11-libs/libdrm-2.4.65
kde-plasma/plasma-workspace-5.6.1
www-client/vivaldi-1.0.344.37_p1 (a chromium-based browser)

eselect qtgraphicssystem is set to native

(as far as I remember, kernel 4.5.0 wasn't able to show me anything on the
screen besides total garbage)

I'm ready to recompile the kernel with whatever debugging options you might
need to investigate the problem (increased CONFIG_NOUVEAU_DEBUG or any generic
kernel hacking options).

I'm also glad to capture an apitrace, but not sure of what.
plasmashell, X, a browser?


zoominee, have you tried disabling the system activity applet that you
suspected could trigger the issue?


Here is a part of my dmesg:
[190683.157049] nouveau 0000:03:00.0: gr: TRAP ch 8 [001faea000
plasmashell[26949]]
[190683.157063] nouveau 0000:03:00.0: gr: GPC0/TPC0/TEX: 80000049
[190683.157082] nouveau 0000:03:00.0: fifo: read fault at 0001115000 engine 00
[PGRAPH] client 01 [GPC0/TEX] reason 02 [PAGE_NOT_PRESENT] on channel 8
[001faea000 plasmashell[26949]]
[190683.157084] nouveau 0000:03:00.0: fifo: gr engine fault on channel 8,
recovering...
[192882.157535] nouveau 0000:03:00.0: fifo: PBDMA0: 04000000 [] ch 2
[001fe71000 X[24266]] subc 0 mthd 001c data 00001004
[192882.157807] nouveau 0000:03:00.0: fifo: PBDMA0: 04000000 [] ch 2
[001fe71000 X[24266]] subc 0 mthd 001c data 00001004
[195081.297439] nouveau 0000:03:00.0: fifo: PBDMA0: 04000000 [] ch 2
[001fe71000 X[24266]] subc 0 mthd 001c data 00001004
[195214.396093] [TTM] Failed to expire sync object before buffer eviction
[195229.455046] [TTM] Failed to expire sync object before buffer eviction


And after initiating reboot:
[197665.853048] nouveau 0000:03:00.0: X[24266]: failed to idle channel 2
[X[24266]]
[197680.853033] nouveau 0000:03:00.0: X[24266]: failed to idle channel 2
[X[24266]]
[197680.853119] nouveau 0000:03:00.0: fifo: read fault at 000001b000 engine 07
[PFIFO] client 07 [BAR_READ] reason 02 [PAGE_NOT_PRESENT] on channel 2
[001fe71000 X[24266]]
...
[197680.853150] =============================================
[197680.853151] [ INFO: possible recursive locking detected ]
[197680.853152] 4.4.6-gentoo-20160401 #1 Not tainted
[197680.853153] ---------------------------------------------
[197680.853154] kworker/0:1/27582 is trying to acquire lock:
[197680.853155]  ((&amp;fifo-&gt;fault)){+.+...}, at: [&lt;ffffffffa42cebd0&gt;]
flush_work+0x0/0x280
[197680.853162]
                but task is already holding lock:
[197680.853163]  ((&amp;fifo-&gt;fault)){+.+...}, at: [&lt;ffffffffa42cf644&gt;]
process_one_work+0x144/0x430
[197680.853167]
                other info that might help us debug this:
[197680.853168]  Possible unsafe locking scenario:

[197680.853169]        CPU0
[197680.853169]        ----
[197680.853170]   lock((&amp;fifo-&gt;fault));
[197680.853171]   lock((&amp;fifo-&gt;fault));
[197680.853172]
                 *** DEADLOCK ***

[197680.853173]  May be due to missing lock nesting notation

[197680.853174] 2 locks held by kworker/0:1/27582:
[197680.853175]  #0:  (&quot;events&quot;){.+.+.+}, at: [&lt;ffffffffa42cf644&gt;]
process_one_work+0x144/0x430
[197680.853178]  #1:  ((&amp;fifo-&gt;fault)){+.+...}, at: [&lt;ffffffffa42cf644&gt;]
process_one_work+0x144/0x430
[197680.853181]
                stack backtrace:
[197680.853183] CPU: 0 PID: 27582 Comm: kworker/0:1 Not tainted
4.4.6-gentoo-hippo-20160401 #1
[197680.853184] Hardware name: Dell Inc. Precision Tower 7910/0215PR, BIOS A06
01/19/2015
[197680.853187] Workqueue: events gf100_fifo_recover_work
[197680.853189]  0000000000000000 ffff8803875bfaf0 ffffffffa453193e
ffffffffa572ac50
[197680.853191]  ffffffffa572ac50 ffff8803875bfbb0 ffffffffa42fcbda
000000010bc3ca5c
[197680.853193]  ffff88083bcf6140 0000000000000000 0000000000000000
00000002442f617b
[197680.853195] Call Trace:
[197680.853198]  [&lt;ffffffffa453193e&gt;] dump_stack+0x67/0x99
[197680.853201]  [&lt;ffffffffa42fcbda&gt;] __lock_acquire+0x16fa/0x1b90
[197680.853202]  [&lt;ffffffffa42fd7e0&gt;] lock_acquire+0x60/0x80
[197680.853204]  [&lt;ffffffffa42cebd0&gt;] ? mod_delayed_work_on+0x80/0x80
[197680.853206]  [&lt;ffffffffa42cec17&gt;] flush_work+0x47/0x280
[197680.853207]  [&lt;ffffffffa42cebd0&gt;] ? mod_delayed_work_on+0x80/0x80
[197680.853210]  [&lt;ffffffffa463cc16&gt;] ? nvkm_subdev_fini+0x46/0x1f0
[197680.853212]  [&lt;ffffffffa42fb026&gt;] ? mark_held_locks+0x66/0x90
[197680.853214]  [&lt;ffffffffa4319fba&gt;] ? ktime_get+0x6a/0x110
[197680.853216]  [&lt;ffffffffa469b390&gt;] gf100_fifo_fini+0x10/0x20
[197680.853217]  [&lt;ffffffffa469975a&gt;] nvkm_fifo_fini+0x1a/0x30
[197680.853219]  [&lt;ffffffffa4639040&gt;] nvkm_engine_fini+0x20/0x30
[197680.853220]  [&lt;ffffffffa463cc2f&gt;] nvkm_subdev_fini+0x5f/0x1f0
[197680.853222]  [&lt;ffffffffa469bbae&gt;] gf100_fifo_recover_work+0xee/0x200
[197680.853224]  [&lt;ffffffffa42cf6a0&gt;] process_one_work+0x1a0/0x430
[197680.853225]  [&lt;ffffffffa42cf644&gt;] ? process_one_work+0x144/0x430
[197680.853227]  [&lt;ffffffffa42cfa45&gt;] worker_thread+0x115/0x460
[197680.853230]  [&lt;ffffffffa4916a66&gt;] ? __schedule+0x2f6/0x920
[197680.853232]  [&lt;ffffffffa42cf930&gt;] ? process_one_work+0x430/0x430
[197680.853234]  [&lt;ffffffffa42d5959&gt;] kthread+0xf9/0x110
[197680.853236]  [&lt;ffffffffa42d5860&gt;] ? kthread_create_on_node+0x230/0x230
[197680.853238]  [&lt;ffffffffa491cabf&gt;] ret_from_fork+0x3f/0x70
[197680.853239]  [&lt;ffffffffa42d5860&gt;] ? kthread_create_on_node+0x230/0x230</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
          <li>You are the QA Contact for the bug.</li>
      </ul>
    </body>
</html>
--14606753880.4ec8D39A.3820--

--===============1863972531==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1863972531==--
