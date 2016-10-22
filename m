From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 98386] [NVE7] bus: MMIO write of FAULT at [ IBUS ],
 Pointer to {TDMS, flat panel) table invalid
Date: Sat, 22 Oct 2016 16:42:56 +0000
Message-ID: <bug-98386-8800-fbjyuE5h4J@http.bugs.freedesktop.org/>
References: <bug-98386-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0630056740=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-98386-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0630056740==
Content-Type: multipart/alternative; boundary="14771545761.4EbeDA.2598";
 charset="UTF-8"


--14771545761.4EbeDA.2598
Date: Sat, 22 Oct 2016 16:42:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D98386

--- Comment #1 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to bruno.pagani from comment #0)
> [  454.919271] nouveau 0000:02:00.0: bus: MMIO write of 00000002 FAULT at
> 4188ac [ IBUS ]

That's bad.

4188ac =3D PGRAPH.GPC_BROADCAST.FFB.PART_CONFIG

I believe we do this here:

drm/nouveau/nvkm/engine/gr/gk104.c:     nvkm_wr32(device, GPC_BCAST(0x08ac),
nvkm_rd32(device, 0x100800));

> [  454.989954] nouveau 0000:02:00.0: DRM: Pointer to TMDS table invalid
> [  454.989957] nouveau 0000:02:00.0: DRM: Pointer to flat panel table inv=
alid

These are (semi-)expected. Should probably just make them no longer errors.

> [  470.245180] nouveau 0000:02:00.0: bus: MMIO write of ffffff1f FAULT at
> 6013d4 [ IBUS ]

That's bad too. This is related to the legacy 0x3d4 VGA IO port (which still
has to be used for various display-related things). Unless you've skimped on
the dmesg, you don't have any DCB entries and it may be reasonable to belie=
ve
you don't have a display block at all. (I assume there are no outputs wired=
 up
to the NVIDIA GPU?) In that case, we should probably track down where we're
trying to do this from and skip it. Based on the location in the logs, prob=
ably
something VBIOS- or other early-init-related.

Unfortunately I don't have any actual debugging steps for you. Perhaps Ben
will.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14771545761.4EbeDA.2598
Date: Sat, 22 Oct 2016 16:42:56 +0000
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
   title=3D"NEW - [NVE7] bus: MMIO write of FAULT at [ IBUS ], Pointer to {=
TDMS,flat panel) table invalid"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98386#c1">Comment=
 # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVE7] bus: MMIO write of FAULT at [ IBUS ], Pointer to {=
TDMS,flat panel) table invalid"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98386">bug 98386<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to bruno.pagani from <a href=3D"show_bug.cgi?id=3D98=
386#c0">comment #0</a>)
<span class=3D"quote">&gt; [  454.919271] nouveau 0000:02:00.0: bus: MMIO w=
rite of 00000002 FAULT at
&gt; 4188ac [ IBUS ]</span >

That's bad.

4188ac =3D PGRAPH.GPC_BROADCAST.FFB.PART_CONFIG

I believe we do this here:

drm/nouveau/nvkm/engine/gr/gk104.c:     nvkm_wr32(device, GPC_BCAST(0x08ac),
nvkm_rd32(device, 0x100800));

<span class=3D"quote">&gt; [  454.989954] nouveau 0000:02:00.0: DRM: Pointe=
r to TMDS table invalid
&gt; [  454.989957] nouveau 0000:02:00.0: DRM: Pointer to flat panel table =
invalid</span >

These are (semi-)expected. Should probably just make them no longer errors.

<span class=3D"quote">&gt; [  470.245180] nouveau 0000:02:00.0: bus: MMIO w=
rite of ffffff1f FAULT at
&gt; 6013d4 [ IBUS ]</span >

That's bad too. This is related to the legacy 0x3d4 VGA IO port (which still
has to be used for various display-related things). Unless you've skimped on
the dmesg, you don't have any DCB entries and it may be reasonable to belie=
ve
you don't have a display block at all. (I assume there are no outputs wired=
 up
to the NVIDIA GPU?) In that case, we should probably track down where we're
trying to do this from and skip it. Based on the location in the logs, prob=
ably
something VBIOS- or other early-init-related.

Unfortunately I don't have any actual debugging steps for you. Perhaps Ben
will.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14771545761.4EbeDA.2598--

--===============0630056740==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0630056740==--
