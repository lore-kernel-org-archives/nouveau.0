From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 105173] [MCP79][Regression] Unhandled NULL pointer
 dereference in nvkm_object_unmap since kernel 4.15
Date: Thu, 01 Mar 2018 08:20:02 +0000
Message-ID: <bug-105173-8800-jDVjcKesNi@http.bugs.freedesktop.org/>
References: <bug-105173-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2092058489=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-105173-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2092058489==
Content-Type: multipart/alternative; boundary="15198924020.552ad5fF1.15768"
Content-Transfer-Encoding: 7bit


--15198924020.552ad5fF1.15768
Date: Thu, 1 Mar 2018 08:20:02 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D105173

--- Comment #11 from Nick Lee <nvlbox-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to Pierre Moreau from comment #10)

> What exactly is reproducible? The artefacts I would assume, but which err=
or
> exactly? The NULL pointer dereference, or the =E2=80=9Ctrapped read at 00=
80000000 on
> channel 1 [0fbb0000 DRM] engine 00 [PGRAPH] client 03 [DISPATCH] subclient
> 04 [M2M_IN] reason 00000006 [NULL_DMAOBJ]=E2=80=9D one?
> I did manage to reproduce the second one with Wayland, but still no luck
> with the first one.

This error:
[  372.954548] nouveau 0000:03:00.0: imem: OOM: 00100000 00001000 -28
[  372.954702] nouveau 0000:03:00.0: gr: TRAP_M2MF 00000002 [IN]
[  372.954712] nouveau 0000:03:00.0: gr: TRAP_M2MF 00320951 c0001fc0 000000=
00
04000430
[  372.954722] nouveau 0000:03:00.0: gr: 00200000 [] ch 1 [000fbb0000 DRM] =
subc
4 class 5039 mthd 0100 data 00000000
[  372.954752] nouveau 0000:03:00.0: fb: trapped read at 00c0000000 on chan=
nel
1 [0fbb0000 DRM] engine 00 [PGRAPH] client 03 [DISPATCH] subclient 04 [M2M_=
IN]
reason 00000000 [PT_NOT_PRESENT]

kernel-4.15.6-300.vanilla.knurd.1.fc27.x86_64
mesa-17.3.6

Screenshot:
https://s9.postimg.org/hajle1skf/Screenshot_from_2018-03-01_10-12-28.png

> (In reply to Nick Lee from comment #8)
> > Fedora-Workstation-Live-x86_64-Rawhide-20180220.n.0.iso
> > wayland session
> >=20
> > [ 1035.437016] nouveau 0000:03:00.0: swiotlb buffer is full (sz: 2097152
>=20
> I=E2=80=99ll try the iso. Did you get this error with supertuxkart as wel=
l, or
> simply by launching the session?
>=20

by launching the session

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15198924020.552ad5fF1.15768
Date: Thu, 1 Mar 2018 08:20:02 +0000
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
          bz_status_ASSIGNED "
   title=3D"ASSIGNED - [MCP79][Regression] Unhandled NULL pointer dereferen=
ce in nvkm_object_unmap since kernel 4.15"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105173#c11">Comme=
nt # 11</a>
              on <a class=3D"bz_bug_link=20
          bz_status_ASSIGNED "
   title=3D"ASSIGNED - [MCP79][Regression] Unhandled NULL pointer dereferen=
ce in nvkm_object_unmap since kernel 4.15"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105173">bug 10517=
3</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
nvlbox&#64;gmail.com" title=3D"Nick Lee &lt;nvlbox&#64;gmail.com&gt;"> <spa=
n class=3D"fn">Nick Lee</span></a>
</span></b>
        <pre>(In reply to Pierre Moreau from <a href=3D"show_bug.cgi?id=3D1=
05173#c10">comment #10</a>)

<span class=3D"quote">&gt; What exactly is reproducible? The artefacts I wo=
uld assume, but which error
&gt; exactly? The NULL pointer dereference, or the =E2=80=9Ctrapped read at=
 0080000000 on
&gt; channel 1 [0fbb0000 DRM] engine 00 [PGRAPH] client 03 [DISPATCH] subcl=
ient
&gt; 04 [M2M_IN] reason 00000006 [NULL_DMAOBJ]=E2=80=9D one?
&gt; I did manage to reproduce the second one with Wayland, but still no lu=
ck
&gt; with the first one.</span >

This error:
[  372.954548] nouveau 0000:03:00.0: imem: OOM: 00100000 00001000 -28
[  372.954702] nouveau 0000:03:00.0: gr: TRAP_M2MF 00000002 [IN]
[  372.954712] nouveau 0000:03:00.0: gr: TRAP_M2MF 00320951 c0001fc0 000000=
00
04000430
[  372.954722] nouveau 0000:03:00.0: gr: 00200000 [] ch 1 [000fbb0000 DRM] =
subc
4 class 5039 mthd 0100 data 00000000
[  372.954752] nouveau 0000:03:00.0: fb: trapped read at 00c0000000 on chan=
nel
1 [0fbb0000 DRM] engine 00 [PGRAPH] client 03 [DISPATCH] subclient 04 [M2M_=
IN]
reason 00000000 [PT_NOT_PRESENT]

kernel-4.15.6-300.vanilla.knurd.1.fc27.x86_64
mesa-17.3.6

Screenshot:
<a href=3D"https://s9.postimg.org/hajle1skf/Screenshot_from_2018-03-01_10-1=
2-28.png">https://s9.postimg.org/hajle1skf/Screenshot_from_2018-03-01_10-12=
-28.png</a>

<span class=3D"quote">&gt; (In reply to Nick Lee from <a href=3D"show_bug.c=
gi?id=3D105173#c8">comment #8</a>)
&gt; &gt; Fedora-Workstation-Live-x86_64-Rawhide-20180220.n.0.iso
&gt; &gt; wayland session
&gt; &gt;=20
&gt; &gt; [ 1035.437016] nouveau 0000:03:00.0: swiotlb buffer is full (sz: =
2097152
&gt;=20
&gt; I=E2=80=99ll try the iso. Did you get this error with supertuxkart as =
well, or
&gt; simply by launching the session?
&gt; </span >

by launching the session</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15198924020.552ad5fF1.15768--

--===============2092058489==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============2092058489==--
