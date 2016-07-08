From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 96836] Kernel unaligned access at TPC[105d9fb4]
 nvkm_instobj_wr32+0x14/0x20 [nouveau]
Date: Fri, 08 Jul 2016 23:34:16 +0000
Message-ID: <bug-96836-8800-HOyBGymN9x@http.bugs.freedesktop.org/>
References: <bug-96836-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0405020300=="
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


--===============0405020300==
Content-Type: multipart/alternative; boundary="14680208562.43Ce26A8.3184";
 charset="UTF-8"


--14680208562.43Ce26A8.3184
Date: Fri, 8 Jul 2016 23:34:16 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D96836

--- Comment #3 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Hmmm... maybe with nv3x the 4K pages aren't such a hard requirement. Defini=
tely
people on PPC64 with 64K pages had trouble with nv4x though.

But, if it worked before, it can work again. Since this isn't exactly *the*
most common setup, you're going to have to do a bit more of the work. Try m=
ore
kernels. Nouveau got a huge rewrite in kernel 4.3, try 4.2 maybe? That rewr=
ite
ended up breaking BE briefly, but I fixed it up again and it was working
semi-recently on my FX5200 in a G5 (PPC64, also BE).

iowrite32_native is used all over the place to write to the card's MMIO spa=
ce
in one of the BARs (can never remember which).

The specific error seems to indicate that we did a wr32 on an instobj to a
non-32-bit-aligned address. This would be very surprising. Please boot with

nouveau.debug=3Dtrace

and attach a full log of the result. (It should be large.)

Also, please try several kernels, including both pre- and post-4.3 ones.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14680208562.43Ce26A8.3184
Date: Fri, 8 Jul 2016 23:34:16 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D96836#c3">Comment=
 # 3</a>
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
        <pre>Hmmm... maybe with nv3x the 4K pages aren't such a hard requir=
ement. Definitely
people on PPC64 with 64K pages had trouble with nv4x though.

But, if it worked before, it can work again. Since this isn't exactly *the*
most common setup, you're going to have to do a bit more of the work. Try m=
ore
kernels. Nouveau got a huge rewrite in kernel 4.3, try 4.2 maybe? That rewr=
ite
ended up breaking BE briefly, but I fixed it up again and it was working
semi-recently on my FX5200 in a G5 (PPC64, also BE).

iowrite32_native is used all over the place to write to the card's MMIO spa=
ce
in one of the BARs (can never remember which).

The specific error seems to indicate that we did a wr32 on an instobj to a
non-32-bit-aligned address. This would be very surprising. Please boot with

nouveau.debug=3Dtrace

and attach a full log of the result. (It should be large.)

Also, please try several kernels, including both pre- and post-4.3 ones.</p=
re>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14680208562.43Ce26A8.3184--

--===============0405020300==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0405020300==--
