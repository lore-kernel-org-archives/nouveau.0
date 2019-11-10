From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 105940] Display freeze caused by nouveau
Date: Sun, 10 Nov 2019 20:51:48 +0000
Message-ID: <bug-105940-8800-FWlmD5C967@http.bugs.freedesktop.org/>
References: <bug-105940-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1595624402=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-105940-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1595624402==
Content-Type: multipart/alternative; boundary="15734191090.2e42d72B8.23208"
Content-Transfer-Encoding: 7bit


--15734191090.2e42d72B8.23208
Date: Sun, 10 Nov 2019 20:51:49 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D105940

--- Comment #3 from Stefano Biagiotti <stefano.biagiotti-h53T4Qt7PfY@public.gmane.org> ---
Created attachment 145931
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D145931&action=3Dedit
Output of journalctl -k -b -1 --no-pager --no-hostname

Bug still present with kernel-5.3.8-200.fc30.x86_64.

$ lspci | grep VGA
01:00.0 VGA compatible controller: NVIDIA Corporation GT215 [GeForce GT 320]
(rev a2)

Excerpt of attachment.

nov 10 17:50:06 kernel: nouveau 0000:01:00.0: NVIDIA GT215 (0a3100a2)
nov 10 17:50:06 kernel: nouveau 0000:01:00.0: bios: version 70.15.27.00.06
nov 10 17:50:06 kernel: nouveau 0000:01:00.0: fb: 1024 MiB DDR3

[...]

nov 10 18:11:32 kernel: nouveau 0000:01:00.0: gr: TRAP_MP_EXEC - TP 1 MP 0:
00000008 [TIMEOUT] at 07ff20 warp 31, opcode 82020814 c0010a04
nov 10 18:11:32 kernel: nouveau 0000:01:00.0: gr: TRAP_MP_EXEC - TP 1 MP 1:
00000008 [TIMEOUT] at 07ff20 warp 31, opcode 82020814 c0010a04
nov 10 18:11:32 kernel: nouveau 0000:01:00.0: gr: TRAP_MP_EXEC - TP 1 MP 2:
00000008 [TIMEOUT] at 07ff20 warp 31, opcode 82020814 c0010a04
nov 10 18:11:32 kernel: nouveau 0000:01:00.0: gr: 00200000 [] ch 6 [003f5b8=
000
systemd-logind[906]] subc 3 class 8597 mthd 1b0c data 1000f010
nov 10 18:11:32 kernel: nouveau 0000:01:00.0: gr: TRAP_MP_EXEC - TP 1 MP 0:
00000008 [TIMEOUT] at 07ff20 warp 31, opcode 82020814 c0010a04
nov 10 18:11:32 kernel: nouveau 0000:01:00.0: gr: TRAP_MP_EXEC - TP 1 MP 1:
00000008 [TIMEOUT] at 07ff20 warp 31, opcode 82020814 c0010a04
nov 10 18:11:32 kernel: nouveau 0000:01:00.0: gr: TRAP_MP_EXEC - TP 1 MP 2:
00000008 [TIMEOUT] at 07ff20 warp 31, opcode 82020814 c0010a04
nov 10 18:11:32 kernel: nouveau 0000:01:00.0: gr: 00200000 [] ch 6 [003f5b8=
000
systemd-logind[906]] subc 3 class 8597 mthd 1b0c data 1000f010

[...]

nov 10 18:11:34 kernel: nouveau 0000:01:00.0: gr: 00200000 [] ch 6 [003f5b8=
000
systemd-logind[906]] subc 3 class 8597 mthd 1b0c data 1000f010
nov 10 18:11:34 kernel: nouveau 0000:01:00.0: gr: PGRAPH TLB flush idle tim=
eout
fail
nov 10 18:11:34 kernel: nouveau 0000:01:00.0: gr: PGRAPH_STATUS 01bffd01 [B=
USY
CTXPROG CCACHE_PREGEOM STRMOUT_VATTR_POSTGEOM VCLIP RATTR_APLANE TRAST CLIP=
ID
ZCULL ENG2D RMASK TPC_RAST TPC_PROP TPC_TEX ]
nov 10 18:11:34 kernel: nouveau 0000:01:00.0: gr: PGRAPH_VSTATUS0: 00045008
[CCACHE VCLIP]
nov 10 18:11:34 kernel: nouveau 0000:01:00.0: gr: PGRAPH_VSTATUS1: 0000106d
[TPC_TEX TPC_MP]
nov 10 18:11:34 kernel: nouveau 0000:01:00.0: gr: PGRAPH_VSTATUS2: 0034db43
[ENG2D ROP]

[...]

nov 10 18:11:36 kernel: nouveau 0000:01:00.0: gr: TRAP_MP_EXEC - TP 1 MP 0:
00000008 [TIMEOUT] at 07ff20 warp 31, opcode 82020814 c0010a04
nov 10 18:11:36 kernel: nouveau 0000:01:00.0: gr: TRAP_MP_EXEC - TP 1 MP 1:
00000008 [TIMEOUT] at 07ff20 warp 31, opcode 82020814 c0010a04
nov 10 18:11:36 kernel: nouveau 0000:01:00.0: gr: TRAP_MP_EXEC - TP 1 MP 2:
00000008 [TIMEOUT] at 07ff20 warp 31, opcode 82020814 c0010a04
nov 10 18:11:36 kernel: nouveau 0000:01:00.0: gr: 00200000 [] ch 6 [003f5b8=
000
systemd-logind[906]] subc 3 class 8597 mthd 1b0c data 1000f010
nov 10 18:11:36 kernel: ------------[ cut here ]------------
nov 10 18:11:36 kernel: nouveau 0000:01:00.0: timeout
nov 10 18:11:36 kernel: WARNING: CPU: 1 PID: 2384 at
drivers/gpu/drm/nouveau/nvkm/engine/gr/g84.c:168 g84_gr_tlb_flush+0x2e2/0x2=
f0
[nouveau]

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15734191090.2e42d72B8.23208
Date: Sun, 10 Nov 2019 20:51:49 +0000
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
   title=3D"NEW - Display freeze caused by nouveau"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105940#c3">Commen=
t # 3</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Display freeze caused by nouveau"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105940">bug 10594=
0</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
stefano.biagiotti&#64;gtn.it" title=3D"Stefano Biagiotti &lt;stefano.biagio=
tti&#64;gtn.it&gt;"> <span class=3D"fn">Stefano Biagiotti</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D145931=
" name=3D"attach_145931" title=3D"Output of journalctl -k -b -1 --no-pager =
--no-hostname">attachment 145931</a> <a href=3D"attachment.cgi?id=3D145931&=
amp;action=3Dedit" title=3D"Output of journalctl -k -b -1 --no-pager --no-h=
ostname">[details]</a></span>
Output of journalctl -k -b -1 --no-pager --no-hostname

Bug still present with kernel-5.3.8-200.fc30.x86_64.

$ lspci | grep VGA
01:00.0 VGA compatible controller: NVIDIA Corporation GT215 [GeForce GT 320]
(rev a2)

Excerpt of attachment.

nov 10 17:50:06 kernel: nouveau 0000:01:00.0: NVIDIA GT215 (0a3100a2)
nov 10 17:50:06 kernel: nouveau 0000:01:00.0: bios: version 70.15.27.00.06
nov 10 17:50:06 kernel: nouveau 0000:01:00.0: fb: 1024 MiB DDR3

[...]

nov 10 18:11:32 kernel: nouveau 0000:01:00.0: gr: TRAP_MP_EXEC - TP 1 MP 0:
00000008 [TIMEOUT] at 07ff20 warp 31, opcode 82020814 c0010a04
nov 10 18:11:32 kernel: nouveau 0000:01:00.0: gr: TRAP_MP_EXEC - TP 1 MP 1:
00000008 [TIMEOUT] at 07ff20 warp 31, opcode 82020814 c0010a04
nov 10 18:11:32 kernel: nouveau 0000:01:00.0: gr: TRAP_MP_EXEC - TP 1 MP 2:
00000008 [TIMEOUT] at 07ff20 warp 31, opcode 82020814 c0010a04
nov 10 18:11:32 kernel: nouveau 0000:01:00.0: gr: 00200000 [] ch 6 [003f5b8=
000
systemd-logind[906]] subc 3 class 8597 mthd 1b0c data 1000f010
nov 10 18:11:32 kernel: nouveau 0000:01:00.0: gr: TRAP_MP_EXEC - TP 1 MP 0:
00000008 [TIMEOUT] at 07ff20 warp 31, opcode 82020814 c0010a04
nov 10 18:11:32 kernel: nouveau 0000:01:00.0: gr: TRAP_MP_EXEC - TP 1 MP 1:
00000008 [TIMEOUT] at 07ff20 warp 31, opcode 82020814 c0010a04
nov 10 18:11:32 kernel: nouveau 0000:01:00.0: gr: TRAP_MP_EXEC - TP 1 MP 2:
00000008 [TIMEOUT] at 07ff20 warp 31, opcode 82020814 c0010a04
nov 10 18:11:32 kernel: nouveau 0000:01:00.0: gr: 00200000 [] ch 6 [003f5b8=
000
systemd-logind[906]] subc 3 class 8597 mthd 1b0c data 1000f010

[...]

nov 10 18:11:34 kernel: nouveau 0000:01:00.0: gr: 00200000 [] ch 6 [003f5b8=
000
systemd-logind[906]] subc 3 class 8597 mthd 1b0c data 1000f010
nov 10 18:11:34 kernel: nouveau 0000:01:00.0: gr: PGRAPH TLB flush idle tim=
eout
fail
nov 10 18:11:34 kernel: nouveau 0000:01:00.0: gr: PGRAPH_STATUS 01bffd01 [B=
USY
CTXPROG CCACHE_PREGEOM STRMOUT_VATTR_POSTGEOM VCLIP RATTR_APLANE TRAST CLIP=
ID
ZCULL ENG2D RMASK TPC_RAST TPC_PROP TPC_TEX ]
nov 10 18:11:34 kernel: nouveau 0000:01:00.0: gr: PGRAPH_VSTATUS0: 00045008
[CCACHE VCLIP]
nov 10 18:11:34 kernel: nouveau 0000:01:00.0: gr: PGRAPH_VSTATUS1: 0000106d
[TPC_TEX TPC_MP]
nov 10 18:11:34 kernel: nouveau 0000:01:00.0: gr: PGRAPH_VSTATUS2: 0034db43
[ENG2D ROP]

[...]

nov 10 18:11:36 kernel: nouveau 0000:01:00.0: gr: TRAP_MP_EXEC - TP 1 MP 0:
00000008 [TIMEOUT] at 07ff20 warp 31, opcode 82020814 c0010a04
nov 10 18:11:36 kernel: nouveau 0000:01:00.0: gr: TRAP_MP_EXEC - TP 1 MP 1:
00000008 [TIMEOUT] at 07ff20 warp 31, opcode 82020814 c0010a04
nov 10 18:11:36 kernel: nouveau 0000:01:00.0: gr: TRAP_MP_EXEC - TP 1 MP 2:
00000008 [TIMEOUT] at 07ff20 warp 31, opcode 82020814 c0010a04
nov 10 18:11:36 kernel: nouveau 0000:01:00.0: gr: 00200000 [] ch 6 [003f5b8=
000
systemd-logind[906]] subc 3 class 8597 mthd 1b0c data 1000f010
nov 10 18:11:36 kernel: ------------[ cut here ]------------
nov 10 18:11:36 kernel: nouveau 0000:01:00.0: timeout
nov 10 18:11:36 kernel: WARNING: CPU: 1 PID: 2384 at
drivers/gpu/drm/nouveau/nvkm/engine/gr/g84.c:168 g84_gr_tlb_flush+0x2e2/0x2=
f0
[nouveau]</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15734191090.2e42d72B8.23208--

--===============1595624402==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1595624402==--
