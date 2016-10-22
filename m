From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 98386] [NVE7] bus: MMIO write of FAULT at [ IBUS ],
 Pointer to {TDMS, flat panel) table invalid
Date: Sat, 22 Oct 2016 16:53:37 +0000
Message-ID: <bug-98386-8800-x1tT9XyIAr@http.bugs.freedesktop.org/>
References: <bug-98386-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0207200917=="
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


--===============0207200917==
Content-Type: multipart/alternative; boundary="14771552161.3F515d3d.3277";
 charset="UTF-8"


--14771552161.3F515d3d.3277
Date: Sat, 22 Oct 2016 16:53:36 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D98386

--- Comment #2 from bruno.pagani-vYW+cPY1g1pg9hUCZPvPmw@public.gmane.org ---
(In reply to Ilia Mirkin from comment #1)
> (In reply to bruno.pagani from comment #0)
> > [  454.919271] nouveau 0000:02:00.0: bus: MMIO write of 00000002 FAULT =
at
> > 4188ac [ IBUS ]
>=20
> That's bad.
>=20
> 4188ac =3D PGRAPH.GPC_BROADCAST.FFB.PART_CONFIG
>=20
> I believe we do this here:
>=20
> drm/nouveau/nvkm/engine/gr/gk104.c:     nvkm_wr32(device, GPC_BCAST(0x08a=
c),
> nvkm_rd32(device, 0x100800));
>=20
> > [  470.245180] nouveau 0000:02:00.0: bus: MMIO write of ffffff1f FAULT =
at
> > 6013d4 [ IBUS ]
>=20
> That's bad too. This is related to the legacy 0x3d4 VGA IO port (which st=
ill
> has to be used for various display-related things). Unless you've skimped=
 on
> the dmesg, you don't have any DCB entries and it may be reasonable to
> believe you don't have a display block at all. (I assume there are no
> outputs wired up to the NVIDIA GPU?) In that case, we should probably tra=
ck
> down where we're trying to do this from and skip it. Based on the location
> in the logs, probably something VBIOS- or other early-init-related.
>=20
> Unfortunately I don't have any actual debugging steps for you. Perhaps Ben
> will.

Indeed, this is an Optimus laptop with no output wired to the NVIDIA GPU.

Also, now that you mention it, the second hex chain is indeed always 6013d4=
 on
following attempts (only the first hex chain changes).

Will wait for Ben requests of information/debug trial then.=E2=80=AF;)

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14771552161.3F515d3d.3277
Date: Sat, 22 Oct 2016 16:53:36 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98386#c2">Comment=
 # 2</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVE7] bus: MMIO write of FAULT at [ IBUS ], Pointer to {=
TDMS,flat panel) table invalid"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98386">bug 98386<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
bruno.pagani&#64;ens-lyon.org" title=3D"bruno.pagani&#64;ens-lyon.org">brun=
o.pagani&#64;ens-lyon.org</a>
</span></b>
        <pre>(In reply to Ilia Mirkin from <a href=3D"show_bug.cgi?id=3D983=
86#c1">comment #1</a>)
<span class=3D"quote">&gt; (In reply to bruno.pagani from <a href=3D"show_b=
ug.cgi?id=3D98386#c0">comment #0</a>)
&gt; &gt; [  454.919271] nouveau 0000:02:00.0: bus: MMIO write of 00000002 =
FAULT at
&gt; &gt; 4188ac [ IBUS ]
&gt;=20
&gt; That's bad.
&gt;=20
&gt; 4188ac =3D PGRAPH.GPC_BROADCAST.FFB.PART_CONFIG
&gt;=20
&gt; I believe we do this here:
&gt;=20
&gt; drm/nouveau/nvkm/engine/gr/gk104.c:     nvkm_wr32(device, GPC_BCAST(0x=
08ac),
&gt; nvkm_rd32(device, 0x100800));
&gt;=20
&gt; &gt; [  470.245180] nouveau 0000:02:00.0: bus: MMIO write of ffffff1f =
FAULT at
&gt; &gt; 6013d4 [ IBUS ]
&gt;=20
&gt; That's bad too. This is related to the legacy 0x3d4 VGA IO port (which=
 still
&gt; has to be used for various display-related things). Unless you've skim=
ped on
&gt; the dmesg, you don't have any DCB entries and it may be reasonable to
&gt; believe you don't have a display block at all. (I assume there are no
&gt; outputs wired up to the NVIDIA GPU?) In that case, we should probably =
track
&gt; down where we're trying to do this from and skip it. Based on the loca=
tion
&gt; in the logs, probably something VBIOS- or other early-init-related.
&gt;=20
&gt; Unfortunately I don't have any actual debugging steps for you. Perhaps=
 Ben
&gt; will.</span >

Indeed, this is an Optimus laptop with no output wired to the NVIDIA GPU.

Also, now that you mention it, the second hex chain is indeed always 6013d4=
 on
following attempts (only the first hex chain changes).

Will wait for Ben requests of information/debug trial then.=E2=80=AF;)</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14771552161.3F515d3d.3277--

--===============0207200917==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0207200917==--
