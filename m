From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 100758] Kernel Oops when starting X nv50_dma_push
Date: Sat, 22 Apr 2017 15:06:51 +0000
Message-ID: <bug-100758-8800-8tH2Pvn4Yw@http.bugs.freedesktop.org/>
References: <bug-100758-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1175688616=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-100758-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1175688616==
Content-Type: multipart/alternative; boundary="14928736101.3d8b.7130";
 charset="UTF-8"


--14928736101.3d8b.7130
Date: Sat, 22 Apr 2017 15:06:50 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D100758

--- Comment #3 from Kevin Winchester <kjwinchester-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
01:00.0 VGA compatible controller: NVIDIA Corporation GT216M [GeForce GT 23=
0M]
(rev a2) (prog-if 00 [VGA controller])
        Subsystem: Hewlett-Packard Company Device 365c
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx+
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dfast >TAbort- <T=
Abort-
<MAbort- >SERR- <PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Interrupt: pin A routed to IRQ 29
        Region 0: Memory at d2000000 (32-bit, non-prefetchable) [size=3D16M]
        Region 1: Memory at c0000000 (64-bit, prefetchable) [size=3D256M]
        Region 3: Memory at d0000000 (64-bit, prefetchable) [size=3D32M]
        Region 5: I/O ports at 6000 [size=3D128]
        Expansion ROM at 000c0000 [disabled] [size=3D128K]
        Capabilities: <access denied>
        Kernel driver in use: nouveau
        Kernel modules: nouveau

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14928736101.3d8b.7130
Date: Sat, 22 Apr 2017 15:06:50 +0000
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
   title=3D"NEW - Kernel Oops when starting X nv50_dma_push"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100758#c3">Commen=
t # 3</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Kernel Oops when starting X nv50_dma_push"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100758">bug 10075=
8</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
kjwinchester&#64;gmail.com" title=3D"Kevin Winchester &lt;kjwinchester&#64;=
gmail.com&gt;"> <span class=3D"fn">Kevin Winchester</span></a>
</span></b>
        <pre>01:00.0 VGA compatible controller: NVIDIA Corporation GT216M [=
GeForce GT 230M]
(rev a2) (prog-if 00 [VGA controller])
        Subsystem: Hewlett-Packard Company Device 365c
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx+
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dfast &gt;TAbort-=
 &lt;TAbort-
&lt;MAbort- &gt;SERR- &lt;PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Interrupt: pin A routed to IRQ 29
        Region 0: Memory at d2000000 (32-bit, non-prefetchable) [size=3D16M]
        Region 1: Memory at c0000000 (64-bit, prefetchable) [size=3D256M]
        Region 3: Memory at d0000000 (64-bit, prefetchable) [size=3D32M]
        Region 5: I/O ports at 6000 [size=3D128]
        Expansion ROM at 000c0000 [disabled] [size=3D128K]
        Capabilities: &lt;access denied&gt;
        Kernel driver in use: nouveau
        Kernel modules: nouveau</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14928736101.3d8b.7130--

--===============1175688616==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1175688616==--
