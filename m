From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 108980] GF117: MMIO write of 0000001f FAULT at
 6013d4 [ IBUS ]
Date: Sun, 09 Dec 2018 15:35:06 +0000
Message-ID: <bug-108980-8800-ykoXQNUvFq@http.bugs.freedesktop.org/>
References: <bug-108980-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1956955754=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-108980-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1956955754==
Content-Type: multipart/alternative; boundary="15443697050.b352.29268"
Content-Transfer-Encoding: 7bit


--15443697050.b352.29268
Date: Sun, 9 Dec 2018 15:35:05 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D108980

--- Comment #7 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
OK, I see what's going on. This is going to be a game of whack-a-mole.

We make a bunch of MMIO accesses to "illegal" areas. The "error" buffer is =
only
1-deep, i.e. it keeps track of only the last one. When we enable reporting,=
 it
reports whichever was the first, or the last such error. With the vga write
fixed, now it's something else.

84048 is PVLD.ACCESS_EN. I guess we're accessing it before it's enabled? It
looks like this is coming from nvkm_falcon_fini (which is, counter-intuitiv=
ely,
called as part of the initialization flow).

The logic in core/subdev.c is to first run ->fini() and then do nvkm_mc_res=
et()
which will turn off-then-on the bit that enables the engine.

Ben - what's the proper way to deal with this? Tweak PMC.ENABLE in
nvkm_device_fini? [We could always just clear out those errors before first
enabling the bus intr reporting, but that would just be sticking our heads =
in
the sand...]

In the meanwhile, I'll work on a proper patch for the vgalock thing.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15443697050.b352.29268
Date: Sun, 9 Dec 2018 15:35:05 +0000
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
   title=3D"NEW - GF117: MMIO write of 0000001f FAULT at 6013d4 [ IBUS ]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108980#c7">Commen=
t # 7</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - GF117: MMIO write of 0000001f FAULT at 6013d4 [ IBUS ]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108980">bug 10898=
0</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>OK, I see what's going on. This is going to be a game of whack=
-a-mole.

We make a bunch of MMIO accesses to &quot;illegal&quot; areas. The &quot;er=
ror&quot; buffer is only
1-deep, i.e. it keeps track of only the last one. When we enable reporting,=
 it
reports whichever was the first, or the last such error. With the vga write
fixed, now it's something else.

84048 is PVLD.ACCESS_EN. I guess we're accessing it before it's enabled? It
looks like this is coming from nvkm_falcon_fini (which is, counter-intuitiv=
ely,
called as part of the initialization flow).

The logic in core/subdev.c is to first run -&gt;fini() and then do nvkm_mc_=
reset()
which will turn off-then-on the bit that enables the engine.

Ben - what's the proper way to deal with this? Tweak PMC.ENABLE in
nvkm_device_fini? [We could always just clear out those errors before first
enabling the bus intr reporting, but that would just be sticking our heads =
in
the sand...]

In the meanwhile, I'll work on a proper patch for the vgalock thing.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15443697050.b352.29268--

--===============1956955754==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1956955754==--
