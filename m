From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 105173] [MCP79][Regression] Unhandled NULL pointer
 dereference in nvkm_object_unmap since kernel 4.15
Date: Fri, 02 Mar 2018 07:42:24 +0000
Message-ID: <bug-105173-8800-lJxSPyNJ8m@http.bugs.freedesktop.org/>
References: <bug-105173-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0033400385=="
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


--===============0033400385==
Content-Type: multipart/alternative; boundary="15199765440.f1275f9d9.8282"
Content-Transfer-Encoding: 7bit


--15199765440.f1275f9d9.8282
Date: Fri, 2 Mar 2018 07:42:24 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D105173

--- Comment #15 from Nick Lee <nvlbox-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
today I got that (without OOM Error):

[ 1868.631494] nouveau 0000:03:00.0: gr: magic set 0:
[ 1868.631502] nouveau 0000:03:00.0: gr:        00408604: 98084805
[ 1868.631507] nouveau 0000:03:00.0: gr:        00408608: 00383d66
[ 1868.631511] nouveau 0000:03:00.0: gr:        0040860c: 40000430
[ 1868.631515] nouveau 0000:03:00.0: gr:        00408610: 3bd00002
[ 1868.631520] nouveau 0000:03:00.0: gr: TRAP_TEXTURE - TP0: 00000009 [
LINEAR_MISMATCH]
[ 1868.631527] nouveau 0000:03:00.0: gr: 00200000 [] ch 24 [000db13000
Xwayland[2070]] subc 3 class 8397 mthd 0f04 data 00000000

I don't know when moment it happened and how to reproduce. Graphics system
works without issues (without artefacts etc) The same I got earlier on kern=
els
< 4.15.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15199765440.f1275f9d9.8282
Date: Fri, 2 Mar 2018 07:42:24 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105173#c15">Comme=
nt # 15</a>
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
        <pre>today I got that (without OOM Error):

[ 1868.631494] nouveau 0000:03:00.0: gr: magic set 0:
[ 1868.631502] nouveau 0000:03:00.0: gr:        00408604: 98084805
[ 1868.631507] nouveau 0000:03:00.0: gr:        00408608: 00383d66
[ 1868.631511] nouveau 0000:03:00.0: gr:        0040860c: 40000430
[ 1868.631515] nouveau 0000:03:00.0: gr:        00408610: 3bd00002
[ 1868.631520] nouveau 0000:03:00.0: gr: TRAP_TEXTURE - TP0: 00000009 [
LINEAR_MISMATCH]
[ 1868.631527] nouveau 0000:03:00.0: gr: 00200000 [] ch 24 [000db13000
Xwayland[2070]] subc 3 class 8397 mthd 0f04 data 00000000

I don't know when moment it happened and how to reproduce. Graphics system
works without issues (without artefacts etc) The same I got earlier on kern=
els
&lt; 4.15.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15199765440.f1275f9d9.8282--

--===============0033400385==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0033400385==--
