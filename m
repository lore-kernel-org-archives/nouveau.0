From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 69882] [NVE6] GPU lockups
Date: Tue, 10 Nov 2015 16:56:16 +0000
Message-ID: <bug-69882-8800-Ezba9BY0iu@http.bugs.freedesktop.org/>
References: <bug-69882-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1451476990=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-69882-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1451476990==
Content-Type: multipart/alternative; boundary="1447174576.12c1FFcb2.23141"; charset="UTF-8"


--1447174576.12c1FFcb2.23141
Date: Tue, 10 Nov 2015 16:56:16 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D69882

--- Comment #18 from Dainius Masili=C5=ABnas <pastas4-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Testing it a few more times, it is indeed the read fault by nouveau that's
causing the lockup in this case. The general DRM error does not appear duri=
ng
all boots, but the nouveau read fault does. When waiting around for a long
time, the kernel log also has this:

INFO: task kworker/0:4:956 blocked for more than 480 seconds.
      Tainted: G        W  O    4.3.0-1-default #1
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
kworker/0:4     D 0000000000000000     0   956      2 0x00000080
Workqueue: events gk104_fifo_recover_work [nouveau]
ffff8800d9d8bbc8 0000000000000046 ffff8801fd2b2080 ffff880214b0e040
ffff8800d9d8c000 ffff8800d9d8bd18 ffff8800d9d8bd10 ffff880214b0e040
ffff8802142d8810 ffff8800d9d8bbe0 ffffffff8166a1aa 7fffffffffffffff
Call Trace:
[<ffffffff8166a1aa>] schedule+0x3a/0x90
[<ffffffff8166cfb7>] schedule_timeout+0x197/0x260
[<ffffffff8166b526>] wait_for_completion+0x96/0x100
[<ffffffff8108019d>] flush_work+0xed/0x180
[<ffffffffa02b79dd>] gk104_fifo_fini+0x1d/0x50 [nouveau]
[<ffffffffa02b443c>] nvkm_fifo_fini+0x1c/0x30 [nouveau]
[<ffffffffa02546a0>] nvkm_engine_fini+0x20/0x30 [nouveau]
[<ffffffffa0258511>] nvkm_subdev_fini+0x61/0x1e0 [nouveau]
[<ffffffffa02b8d3b>] gk104_fifo_recover_work+0xeb/0x290 [nouveau]
[<ffffffff81080c89>] process_one_work+0x159/0x470
[<ffffffff81080fe8>] worker_thread+0x48/0x4a0
[<ffffffff81086c79>] kthread+0xc9/0xe0
[<ffffffff8166e80f>] ret_from_fork+0x3f/0x70
DWARF2 unwinder stuck at ret_from_fork+0x3f/0x70

Leftover inexact backtrace:
[<ffffffff81086bb0>] ? kthread_worker_fn+0x170/0x170

I'm still not sure if this should be a separate bug report.

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1447174576.12c1FFcb2.23141
Date: Tue, 10 Nov 2015 16:56:16 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_REOPENED "
   title=3D"REOPENED - [NVE6] GPU lockups"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D69882#c18">Commen=
t # 18</a>
              on <a class=3D"bz_bug_link=20
          bz_status_REOPENED "
   title=3D"REOPENED - [NVE6] GPU lockups"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D69882">bug 69882<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
pastas4&#64;gmail.com" title=3D"Dainius Masili=C5=ABnas &lt;pastas4&#64;gma=
il.com&gt;"> <span class=3D"fn">Dainius Masili=C5=ABnas</span></a>
</span></b>
        <pre>Testing it a few more times, it is indeed the read fault by no=
uveau that's
causing the lockup in this case. The general DRM error does not appear duri=
ng
all boots, but the nouveau read fault does. When waiting around for a long
time, the kernel log also has this:

INFO: task kworker/0:4:956 blocked for more than 480 seconds.
      Tainted: G        W  O    4.3.0-1-default #1
&quot;echo 0 &gt; /proc/sys/kernel/hung_task_timeout_secs&quot; disables th=
is message.
kworker/0:4     D 0000000000000000     0   956      2 0x00000080
Workqueue: events gk104_fifo_recover_work [nouveau]
ffff8800d9d8bbc8 0000000000000046 ffff8801fd2b2080 ffff880214b0e040
ffff8800d9d8c000 ffff8800d9d8bd18 ffff8800d9d8bd10 ffff880214b0e040
ffff8802142d8810 ffff8800d9d8bbe0 ffffffff8166a1aa 7fffffffffffffff
Call Trace:
[&lt;ffffffff8166a1aa&gt;] schedule+0x3a/0x90
[&lt;ffffffff8166cfb7&gt;] schedule_timeout+0x197/0x260
[&lt;ffffffff8166b526&gt;] wait_for_completion+0x96/0x100
[&lt;ffffffff8108019d&gt;] flush_work+0xed/0x180
[&lt;ffffffffa02b79dd&gt;] gk104_fifo_fini+0x1d/0x50 [nouveau]
[&lt;ffffffffa02b443c&gt;] nvkm_fifo_fini+0x1c/0x30 [nouveau]
[&lt;ffffffffa02546a0&gt;] nvkm_engine_fini+0x20/0x30 [nouveau]
[&lt;ffffffffa0258511&gt;] nvkm_subdev_fini+0x61/0x1e0 [nouveau]
[&lt;ffffffffa02b8d3b&gt;] gk104_fifo_recover_work+0xeb/0x290 [nouveau]
[&lt;ffffffff81080c89&gt;] process_one_work+0x159/0x470
[&lt;ffffffff81080fe8&gt;] worker_thread+0x48/0x4a0
[&lt;ffffffff81086c79&gt;] kthread+0xc9/0xe0
[&lt;ffffffff8166e80f&gt;] ret_from_fork+0x3f/0x70
DWARF2 unwinder stuck at ret_from_fork+0x3f/0x70

Leftover inexact backtrace:
[&lt;ffffffff81086bb0&gt;] ? kthread_worker_fn+0x170/0x170

I'm still not sure if this should be a separate bug report.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
=20=20=20=20=20=20
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1447174576.12c1FFcb2.23141--

--===============1451476990==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1451476990==--
