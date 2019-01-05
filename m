From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 99900] [NVC1] nouveau: freeze / crash after kernel
 update to 4.10
Date: Sat, 05 Jan 2019 21:53:53 +0000
Message-ID: <bug-99900-8800-vIsnD2Bz7K@http.bugs.freedesktop.org/>
References: <bug-99900-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0386586916=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-99900-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0386586916==
Content-Type: multipart/alternative; boundary="15467252330.EaF559dc.12012"
Content-Transfer-Encoding: 7bit


--15467252330.EaF559dc.12012
Date: Sat, 5 Jan 2019 21:53:53 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D99900

--- Comment #26 from kenorb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org ---
Similar problem, described in:
https://bugs.freedesktop.org/show_bug.cgi?id=3D100567#c18

Call Trace:
 __schedule+0x29e/0x840
 schedule+0x2c/0x80
 schedule_timeout+0x258/0x360
 ? nv50_wndw_atomic_destroy_state+0x1d/0x20 [nouveau]
 dma_fence_default_wait+0x1fc/0x260
 ? dma_fence_release+0xa0/0xa0
 dma_fence_wait_timeout+0x3e/0xf0
 drm_atomic_helper_wait_for_fences+0x3f/0xc0 [drm_kms_helper]
 nv50_disp_atomic_commit_tail+0x78/0x860 [nouveau]
 ? __switch_to_asm+0x40/0x70
 ? __switch_to_asm+0x34/0x70
 nv50_disp_atomic_commit_work+0x12/0x20 [nouveau]
 process_one_work+0x20f/0x3c0
 worker_thread+0x34/0x400
 kthread+0x120/0x140
 ? pwq_unbound_release_workfn+0xd0/0xd0
 ? kthread_bind+0x40/0x40
 ret_from_fork+0x35/0x40

Full log: https://gist.github.com/kenorb/5b95caa1694dbf7f030ccc808a110856

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15467252330.EaF559dc.12012
Date: Sat, 5 Jan 2019 21:53:53 +0000
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
   title=3D"NEW - [NVC1] nouveau: freeze / crash after kernel update to 4.1=
0"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99900#c26">Commen=
t # 26</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVC1] nouveau: freeze / crash after kernel update to 4.1=
0"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99900">bug 99900<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
kenorb&#64;gmail.com" title=3D"kenorb&#64;gmail.com">kenorb&#64;gmail.com</=
a>
</span></b>
        <pre>Similar problem, described in:
<a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Nouveau system freeze fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT=
]"
   href=3D"show_bug.cgi?id=3D100567#c18">https://bugs.freedesktop.org/show_=
bug.cgi?id=3D100567#c18</a>

Call Trace:
 __schedule+0x29e/0x840
 schedule+0x2c/0x80
 schedule_timeout+0x258/0x360
 ? nv50_wndw_atomic_destroy_state+0x1d/0x20 [nouveau]
 dma_fence_default_wait+0x1fc/0x260
 ? dma_fence_release+0xa0/0xa0
 dma_fence_wait_timeout+0x3e/0xf0
 drm_atomic_helper_wait_for_fences+0x3f/0xc0 [drm_kms_helper]
 nv50_disp_atomic_commit_tail+0x78/0x860 [nouveau]
 ? __switch_to_asm+0x40/0x70
 ? __switch_to_asm+0x34/0x70
 nv50_disp_atomic_commit_work+0x12/0x20 [nouveau]
 process_one_work+0x20f/0x3c0
 worker_thread+0x34/0x400
 kthread+0x120/0x140
 ? pwq_unbound_release_workfn+0xd0/0xd0
 ? kthread_bind+0x40/0x40
 ret_from_fork+0x35/0x40

Full log: <a href=3D"https://gist.github.com/kenorb/5b95caa1694dbf7f030ccc8=
08a110856">https://gist.github.com/kenorb/5b95caa1694dbf7f030ccc808a110856<=
/a></pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15467252330.EaF559dc.12012--

--===============0386586916==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0386586916==--
