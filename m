From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 103421] Kernel 4.13+ nouveau breaks screen output
Date: Fri, 10 Nov 2017 00:13:30 +0000
Message-ID: <bug-103421-8800-qRXnt4697s@http.bugs.freedesktop.org/>
References: <bug-103421-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0539728458=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-103421-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0539728458==
Content-Type: multipart/alternative; boundary="15102728103.2E7efF.22057";
 charset="UTF-8"


--15102728103.2E7efF.22057
Date: Fri, 10 Nov 2017 00:13:30 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D103421

Andrey Mazo <ahippo-o+MxOtu4lMCHXe+LvDLADg@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |ahippo-o+MxOtu4lMCHXe+LvDLADg@public.gmane.org

--- Comment #1 from Andrey Mazo <ahippo-o+MxOtu4lMCHXe+LvDLADg@public.gmane.org> ---
I'm seeing the same problem on 4.13.11.

I have the same video card:
03:00.0 VGA compatible controller [0300]: NVIDIA Corporation GF119 [NVS 310]
[10de:107d] (rev a1)

And a NULL pointer dereference:
[    2.354551] nouveau 0000:03:00.0: DRM: allocated 1920x1080 fb: 0x60000, =
bo
ffffa3167a6b2000
[    2.455441] BUG: unable to handle kernel NULL pointer dereference at=20=
=20=20=20=20=20=20=20
  (null)
[    2.455444] IP:           (null)
[    2.455445] PGD 0
[    2.455446] P4D 0

[    2.455448] Oops: 0010 [#1] SMP
[    2.455449] Modules linked in:
...
[    2.455471] Call Trace:
[    2.455476]  ? nvkm_dp_train_drive+0x1e8/0x2d0
[    2.455479]  nvkm_dp_acquire+0x8eb/0xcd0
[    2.455482]  nv50_disp_super_2_2+0x6b/0x430
[    2.455486]  ? nvkm_devinit_pll_set+0xa/0x10
[    2.455487]  gf119_disp_super+0x1ac/0x2f0
[    2.455492]  process_one_work+0x193/0x430
[    2.455493]  ? process_one_work+0x136/0x430
[    2.455495]  worker_thread+0x49/0x450
[    2.455499]  kthread+0x109/0x140
[    2.455500]  ? create_worker+0x1a0/0x1a0
[    2.455502]  ? kthread_create_on_node+0x40/0x40
[    2.455509]  ret_from_fork+0x27/0x40
[    2.455510] Code:  Bad RIP value.
[    2.455514] RIP:           (null) RSP: ffffbeed062afc10
[    2.455514] CR2: 0000000000000000
[    2.455517] ---[ end trace 85d5c96bafea0973 ]---

Please, see the full kernel.log attached.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15102728103.2E7efF.22057
Date: Fri, 10 Nov 2017 00:13:30 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:ahippo&#6=
4;yandex.ru" title=3D"Andrey Mazo &lt;ahippo&#64;yandex.ru&gt;"> <span clas=
s=3D"fn">Andrey Mazo</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Kernel 4.13+ nouveau breaks screen output"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D103421">bug 10342=
1</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">CC</td>
           <td>
               &nbsp;
           </td>
           <td>ahippo&#64;yandex.ru
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Kernel 4.13+ nouveau breaks screen output"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D103421#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Kernel 4.13+ nouveau breaks screen output"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D103421">bug 10342=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
ahippo&#64;yandex.ru" title=3D"Andrey Mazo &lt;ahippo&#64;yandex.ru&gt;"> <=
span class=3D"fn">Andrey Mazo</span></a>
</span></b>
        <pre>I'm seeing the same problem on 4.13.11.

I have the same video card:
03:00.0 VGA compatible controller [0300]: NVIDIA Corporation GF119 [NVS 310]
[10de:107d] (rev a1)

And a NULL pointer dereference:
[    2.354551] nouveau 0000:03:00.0: DRM: allocated 1920x1080 fb: 0x60000, =
bo
ffffa3167a6b2000
[    2.455441] BUG: unable to handle kernel NULL pointer dereference at=20=
=20=20=20=20=20=20=20
  (null)
[    2.455444] IP:           (null)
[    2.455445] PGD 0
[    2.455446] P4D 0

[    2.455448] Oops: 0010 [#1] SMP
[    2.455449] Modules linked in:
...
[    2.455471] Call Trace:
[    2.455476]  ? nvkm_dp_train_drive+0x1e8/0x2d0
[    2.455479]  nvkm_dp_acquire+0x8eb/0xcd0
[    2.455482]  nv50_disp_super_2_2+0x6b/0x430
[    2.455486]  ? nvkm_devinit_pll_set+0xa/0x10
[    2.455487]  gf119_disp_super+0x1ac/0x2f0
[    2.455492]  process_one_work+0x193/0x430
[    2.455493]  ? process_one_work+0x136/0x430
[    2.455495]  worker_thread+0x49/0x450
[    2.455499]  kthread+0x109/0x140
[    2.455500]  ? create_worker+0x1a0/0x1a0
[    2.455502]  ? kthread_create_on_node+0x40/0x40
[    2.455509]  ret_from_fork+0x27/0x40
[    2.455510] Code:  Bad RIP value.
[    2.455514] RIP:           (null) RSP: ffffbeed062afc10
[    2.455514] CR2: 0000000000000000
[    2.455517] ---[ end trace 85d5c96bafea0973 ]---

Please, see the full kernel.log attached.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15102728103.2E7efF.22057--

--===============0539728458==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0539728458==--
