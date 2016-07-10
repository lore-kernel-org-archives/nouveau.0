From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 96836] Kernel unaligned access at TPC[105d9fb4]
 nvkm_instobj_wr32+0x14/0x20 [nouveau]
Date: Sun, 10 Jul 2016 02:58:12 +0000
Message-ID: <bug-96836-8800-RdcuFSVT8T@http.bugs.freedesktop.org/>
References: <bug-96836-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2139811842=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-96836-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2139811842==
Content-Type: multipart/alternative; boundary="14681194920.377bEEa.20175";
 charset="UTF-8"


--14681194920.377bEEa.20175
Date: Sun, 10 Jul 2016 02:58:12 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D96836

--- Comment #14 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
OK, well let's start small. One source of problems is that we have

drivers/gpu/drm/nouveau/nouveau_bios.h:#define ROM16(x) le16_to_cpu(*(u16
*)&(x))

Which can only work on aligned pointers x, but it gets called with unaligned
offsets in nouveau_bios.c

Can you try changing that to

#define ROM16(x) get_unaligned_le16(&(x))

I'm guessing that will help with the first group of unaligned traps.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14681194920.377bEEa.20175
Date: Sun, 10 Jul 2016 02:58:12 +0000
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
   title=3D"NEW - Kernel unaligned access at TPC[105d9fb4] nvkm_instobj_wr3=
2+0x14/0x20 [nouveau]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D96836#c14">Commen=
t # 14</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Kernel unaligned access at TPC[105d9fb4] nvkm_instobj_wr3=
2+0x14/0x20 [nouveau]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D96836">bug 96836<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>OK, well let's start small. One source of problems is that we =
have

drivers/gpu/drm/nouveau/nouveau_bios.h:#define ROM16(x) le16_to_cpu(*(u16
*)&amp;(x))

Which can only work on aligned pointers x, but it gets called with unaligned
offsets in nouveau_bios.c

Can you try changing that to

#define ROM16(x) get_unaligned_le16(&amp;(x))

I'm guessing that will help with the first group of unaligned traps.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14681194920.377bEEa.20175--

--===============2139811842==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============2139811842==--
