From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 99505] Attempting to reclock GeForce GT740M (GK208)
 cause GPU and system to hang
Date: Mon, 23 Jan 2017 14:48:25 +0000
Message-ID: <bug-99505-8800-XHvf9YKbGn@http.bugs.freedesktop.org/>
References: <bug-99505-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1851616766=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-99505-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1851616766==
Content-Type: multipart/alternative; boundary="14851829051.086b5.2230";
 charset="UTF-8"


--14851829051.086b5.2230
Date: Mon, 23 Jan 2017 14:48:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D99505

--- Comment #6 from Boyan Ding <stu_dby-KN7UnAbNpbg@public.gmane.org> ---
(In reply to Ilia Mirkin from comment #5)
> (In reply to Boyan Ding from comment #3)
> > I tried to reclock while running glxgears (the AC line shows 405 MHz in=
stead
> > of 0), but it also hangs.
>=20
> Hmmm... this is probably a different issue then. To double-check, try
> booting with nouveau.runpm=3D0 (which will disable all the runpm stuff).
>=20
> Either way, please try to figure out where the echo gets stuck (you can e=
cho
> ... something into sysrq-trigger, I forget what... 'w' maybe?)

I added nouveau.runpm=3D0 and it still hangs, sysrq-trigger with w shows the
following:

[  169.926880] sysrq: SysRq : Show Blocked State
[  169.926883]   task                        PC stack   pid father
[  169.926954] kworker/1:123   D ffff880242063c90     0   315      2 0x0000=
0000
[  169.926982] Workqueue: events nvkm_pstate_work [nouveau]
[  169.926984]  ffff880242063c90 00ff880239628b00 ffff880244a59c80
ffff880242048000
[  169.926987]  ffffffffa06e1cec ffff880242064000 ffff88024210c800
ffff880239628a80
[  169.926989]  ffff88024456ad00 0000000000000009 ffff880242063ca8
ffffffff815f40ec
[  169.926992] Call Trace:
[  169.927012]  [<ffffffffa06e1cec>] ? memx_out+0x3c/0x90 [nouveau]
[  169.927014]  [<ffffffff815f40ec>] schedule+0x3c/0x90
[  169.927032]  [<ffffffffa06e1b8a>] nvkm_pmu_send+0x24a/0x2c0 [nouveau]
[  169.927035]  [<ffffffff810c0450>] ? wake_atomic_t_function+0x60/0x60
[  169.927051]  [<ffffffffa06e1fa8>] nvkm_memx_fini+0xe8/0xf0 [nouveau]
[  169.927064]  [<ffffffffa068ff5f>] ? nvkm_boolopt+0x2f/0x190 [nouveau]
[  169.927080]  [<ffffffffa06c2a4b>] gk104_ram_prog+0x9b/0xc0 [nouveau]
[  169.927095]  [<ffffffffa06a4014>] nvkm_pstate_work+0x154/0x540 [nouveau]
[  169.927097]  [<ffffffff810a3277>] ? finish_task_switch+0x77/0x1e0
[  169.927100]  [<ffffffff81095ef5>] process_one_work+0x1e5/0x470
[  169.927102]  [<ffffffff810961c8>] worker_thread+0x48/0x4e0
[  169.927104]  [<ffffffff81096180>] ? process_one_work+0x470/0x470
[  169.927106]  [<ffffffff8109be38>] kthread+0xd8/0xf0
[  169.927108]  [<ffffffff8102c782>] ? __switch_to+0x2d2/0x630
[  169.927110]  [<ffffffff815f823f>] ret_from_fork+0x1f/0x40
[  169.927112]  [<ffffffff8109bd60>] ? kthread_worker_fn+0x170/0x170
[  169.927217] bash            D ffff8802202afb60     0  1863   1862 0x0000=
0000
[  169.927220]  ffff8802202afb60 00ff88020e930000 ffff880244a59c80
ffff88020e930000
[  169.927222]  0000000000000246 ffff8802202b0000 ffff88024210b948
0000000000000008
[  169.927225]  ffff88024210b800 0000000000000028 ffff8802202afb78
ffffffff815f40ec
[  169.927227] Call Trace:
[  169.927229]  [<ffffffff815f40ec>] schedule+0x3c/0x90
[  169.927244]  [<ffffffffa06a3cdb>] nvkm_pstate_calc+0x7b/0xd0 [nouveau]
[  169.927246]  [<ffffffff810c0450>] ? wake_atomic_t_function+0x60/0x60
[  169.927260]  [<ffffffffa06a4598>] nvkm_clk_ustate+0x98/0xb0 [nouveau]
[  169.927277]  [<ffffffffa06f0235>] nvkm_control_mthd+0x315/0x440 [nouveau]
[  169.927290]  [<ffffffffa068f2e8>] nvkm_object_mthd+0x18/0x20 [nouveau]
[  169.927302]  [<ffffffffa068daa6>] nvkm_ioctl_mthd+0x66/0xb0 [nouveau]
[  169.927314]  [<ffffffffa068e3b7>] nvkm_ioctl+0x107/0x260 [nouveau]
[  169.927329]  [<ffffffffa07382d2>] nvkm_client_ioctl+0x12/0x20 [nouveau]
[  169.927341]  [<ffffffffa068b041>] nvif_object_ioctl+0x41/0x50 [nouveau]
[  169.927352]  [<ffffffffa068b3e8>] nvif_object_mthd+0x138/0x160 [nouveau]
[  169.927354]  [<ffffffff81217c7c>] ? path_openat+0x31c/0x1170
[  169.927356]  [<ffffffff81316e4b>] ? _kstrtoull+0x3b/0x90
[  169.927371]  [<ffffffffa07352fe>] nouveau_debugfs_pstate_set+0x12e/0x1c0
[nouveau]
[  169.927373]  [<ffffffff812993c0>] full_proxy_write+0x60/0xa0
[  169.927375]  [<ffffffff81208797>] __vfs_write+0x37/0x140
[  169.927378]  [<ffffffff81227bc9>] ? __alloc_fd+0xc9/0x180
[  169.927379]  [<ffffffff81206dd6>] ? filp_close+0x56/0x80
[  169.927382]  [<ffffffff810c7be7>] ? percpu_down_read+0x17/0x50
[  169.927384]  [<ffffffff81209566>] vfs_write+0xb6/0x1a0
[  169.927385]  [<ffffffff8120a9e5>] SyS_write+0x55/0xc0
[  169.927387]  [<ffffffff81227e92>] ? __close_fd+0x92/0xb0
[  169.927389]  [<ffffffff815f8032>] entry_SYSCALL_64_fastpath+0x1a/0xa4

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14851829051.086b5.2230
Date: Mon, 23 Jan 2017 14:48:25 +0000
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
   title=3D"NEW - Attempting to reclock GeForce GT740M (GK208) cause GPU an=
d system to hang"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99505#c6">Comment=
 # 6</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Attempting to reclock GeForce GT740M (GK208) cause GPU an=
d system to hang"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99505">bug 99505<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
stu_dby&#64;126.com" title=3D"Boyan Ding &lt;stu_dby&#64;126.com&gt;"> <spa=
n class=3D"fn">Boyan Ding</span></a>
</span></b>
        <pre>(In reply to Ilia Mirkin from <a href=3D"show_bug.cgi?id=3D995=
05#c5">comment #5</a>)
<span class=3D"quote">&gt; (In reply to Boyan Ding from <a href=3D"show_bug=
.cgi?id=3D99505#c3">comment #3</a>)
&gt; &gt; I tried to reclock while running glxgears (the AC line shows 405 =
MHz instead
&gt; &gt; of 0), but it also hangs.
&gt;=20
&gt; Hmmm... this is probably a different issue then. To double-check, try
&gt; booting with nouveau.runpm=3D0 (which will disable all the runpm stuff=
).
&gt;=20
&gt; Either way, please try to figure out where the echo gets stuck (you ca=
n echo
&gt; ... something into sysrq-trigger, I forget what... 'w' maybe?)</span >

I added nouveau.runpm=3D0 and it still hangs, sysrq-trigger with w shows the
following:

[  169.926880] sysrq: SysRq : Show Blocked State
[  169.926883]   task                        PC stack   pid father
[  169.926954] kworker/1:123   D ffff880242063c90     0   315      2 0x0000=
0000
[  169.926982] Workqueue: events nvkm_pstate_work [nouveau]
[  169.926984]  ffff880242063c90 00ff880239628b00 ffff880244a59c80
ffff880242048000
[  169.926987]  ffffffffa06e1cec ffff880242064000 ffff88024210c800
ffff880239628a80
[  169.926989]  ffff88024456ad00 0000000000000009 ffff880242063ca8
ffffffff815f40ec
[  169.926992] Call Trace:
[  169.927012]  [&lt;ffffffffa06e1cec&gt;] ? memx_out+0x3c/0x90 [nouveau]
[  169.927014]  [&lt;ffffffff815f40ec&gt;] schedule+0x3c/0x90
[  169.927032]  [&lt;ffffffffa06e1b8a&gt;] nvkm_pmu_send+0x24a/0x2c0 [nouve=
au]
[  169.927035]  [&lt;ffffffff810c0450&gt;] ? wake_atomic_t_function+0x60/0x=
60
[  169.927051]  [&lt;ffffffffa06e1fa8&gt;] nvkm_memx_fini+0xe8/0xf0 [nouvea=
u]
[  169.927064]  [&lt;ffffffffa068ff5f&gt;] ? nvkm_boolopt+0x2f/0x190 [nouve=
au]
[  169.927080]  [&lt;ffffffffa06c2a4b&gt;] gk104_ram_prog+0x9b/0xc0 [nouvea=
u]
[  169.927095]  [&lt;ffffffffa06a4014&gt;] nvkm_pstate_work+0x154/0x540 [no=
uveau]
[  169.927097]  [&lt;ffffffff810a3277&gt;] ? finish_task_switch+0x77/0x1e0
[  169.927100]  [&lt;ffffffff81095ef5&gt;] process_one_work+0x1e5/0x470
[  169.927102]  [&lt;ffffffff810961c8&gt;] worker_thread+0x48/0x4e0
[  169.927104]  [&lt;ffffffff81096180&gt;] ? process_one_work+0x470/0x470
[  169.927106]  [&lt;ffffffff8109be38&gt;] kthread+0xd8/0xf0
[  169.927108]  [&lt;ffffffff8102c782&gt;] ? __switch_to+0x2d2/0x630
[  169.927110]  [&lt;ffffffff815f823f&gt;] ret_from_fork+0x1f/0x40
[  169.927112]  [&lt;ffffffff8109bd60&gt;] ? kthread_worker_fn+0x170/0x170
[  169.927217] bash            D ffff8802202afb60     0  1863   1862 0x0000=
0000
[  169.927220]  ffff8802202afb60 00ff88020e930000 ffff880244a59c80
ffff88020e930000
[  169.927222]  0000000000000246 ffff8802202b0000 ffff88024210b948
0000000000000008
[  169.927225]  ffff88024210b800 0000000000000028 ffff8802202afb78
ffffffff815f40ec
[  169.927227] Call Trace:
[  169.927229]  [&lt;ffffffff815f40ec&gt;] schedule+0x3c/0x90
[  169.927244]  [&lt;ffffffffa06a3cdb&gt;] nvkm_pstate_calc+0x7b/0xd0 [nouv=
eau]
[  169.927246]  [&lt;ffffffff810c0450&gt;] ? wake_atomic_t_function+0x60/0x=
60
[  169.927260]  [&lt;ffffffffa06a4598&gt;] nvkm_clk_ustate+0x98/0xb0 [nouve=
au]
[  169.927277]  [&lt;ffffffffa06f0235&gt;] nvkm_control_mthd+0x315/0x440 [n=
ouveau]
[  169.927290]  [&lt;ffffffffa068f2e8&gt;] nvkm_object_mthd+0x18/0x20 [nouv=
eau]
[  169.927302]  [&lt;ffffffffa068daa6&gt;] nvkm_ioctl_mthd+0x66/0xb0 [nouve=
au]
[  169.927314]  [&lt;ffffffffa068e3b7&gt;] nvkm_ioctl+0x107/0x260 [nouveau]
[  169.927329]  [&lt;ffffffffa07382d2&gt;] nvkm_client_ioctl+0x12/0x20 [nou=
veau]
[  169.927341]  [&lt;ffffffffa068b041&gt;] nvif_object_ioctl+0x41/0x50 [nou=
veau]
[  169.927352]  [&lt;ffffffffa068b3e8&gt;] nvif_object_mthd+0x138/0x160 [no=
uveau]
[  169.927354]  [&lt;ffffffff81217c7c&gt;] ? path_openat+0x31c/0x1170
[  169.927356]  [&lt;ffffffff81316e4b&gt;] ? _kstrtoull+0x3b/0x90
[  169.927371]  [&lt;ffffffffa07352fe&gt;] nouveau_debugfs_pstate_set+0x12e=
/0x1c0
[nouveau]
[  169.927373]  [&lt;ffffffff812993c0&gt;] full_proxy_write+0x60/0xa0
[  169.927375]  [&lt;ffffffff81208797&gt;] __vfs_write+0x37/0x140
[  169.927378]  [&lt;ffffffff81227bc9&gt;] ? __alloc_fd+0xc9/0x180
[  169.927379]  [&lt;ffffffff81206dd6&gt;] ? filp_close+0x56/0x80
[  169.927382]  [&lt;ffffffff810c7be7&gt;] ? percpu_down_read+0x17/0x50
[  169.927384]  [&lt;ffffffff81209566&gt;] vfs_write+0xb6/0x1a0
[  169.927385]  [&lt;ffffffff8120a9e5&gt;] SyS_write+0x55/0xc0
[  169.927387]  [&lt;ffffffff81227e92&gt;] ? __close_fd+0x92/0xb0
[  169.927389]  [&lt;ffffffff815f8032&gt;] entry_SYSCALL_64_fastpath+0x1a/0=
xa4</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14851829051.086b5.2230--

--===============1851616766==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1851616766==--
