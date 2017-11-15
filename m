From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 103764] 3D renering results in a distorted frame.
Date: Wed, 15 Nov 2017 16:52:56 +0000
Message-ID: <bug-103764-8800-37rsYOO8n7@http.bugs.freedesktop.org/>
References: <bug-103764-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0464783274=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-103764-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0464783274==
Content-Type: multipart/alternative; boundary="15107647760.Efb1.13360";
 charset="UTF-8"


--15107647760.Efb1.13360
Date: Wed, 15 Nov 2017 16:52:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D103764

--- Comment #7 from Ilya <dikiy_evrej-S0/GAf8tV78@public.gmane.org> ---
(In reply to Ilia Mirkin from comment #6)
> Can you check if MSI is enabled (lspci -nn -vv -d 10de: )? Also see if
> interrupts are being properly delivered (cat /proc/interrupts)
>=20
> NV46 had some issues with that, although they should have been fixed in 4=
.4,
> which you're running...

01:00.0 VGA compatible controller [0300]: NVIDIA Corporation G72M [Quadro N=
VS
110M/GeForce Go 7300] [10de:01d7] (rev a1) (prog-if 00 [VGA controller])
        Subsystem: Lenovo G72M [Quadro NVS 110M/GeForce Go 7300] [17aa:3839]
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR+ FastB2B- DisINTx+
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dfast >TAbort- <T=
Abort-
<MAbort- >SERR- <PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Interrupt: pin A routed to IRQ 30
        Region 0: Memory at c9000000 (32-bit, non-prefetchable) [size=3D16M]
        Region 1: Memory at d0000000 (64-bit, prefetchable) [size=3D256M]
        Region 3: Memory at ca000000 (64-bit, non-prefetchable) [size=3D16M]
        Expansion ROM at <unassigned> [disabled]
        Capabilities: <access denied>
        Kernel driver in use: nouveau
        Kernel modules: nvidiafb, nouveau

The PCI-MSI counter (relative nvkm) is rapidly increasing, if glxgears are
running. I tried to count, its about 120 interrupts per second, which seems=
 to
be ok, till vsync on 60Hz is enabled.

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--15107647760.Efb1.13360
Date: Wed, 15 Nov 2017 16:52:56 +0000
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
   title=3D"NEW - 3D renering results in a distorted frame."
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D103764#c7">Commen=
t # 7</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - 3D renering results in a distorted frame."
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D103764">bug 10376=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
dikiy_evrej&#64;web.de" title=3D"Ilya &lt;dikiy_evrej&#64;web.de&gt;"> <spa=
n class=3D"fn">Ilya</span></a>
</span></b>
        <pre>(In reply to Ilia Mirkin from <a href=3D"show_bug.cgi?id=3D103=
764#c6">comment #6</a>)
<span class=3D"quote">&gt; Can you check if MSI is enabled (lspci -nn -vv -=
d 10de: )? Also see if
&gt; interrupts are being properly delivered (cat /proc/interrupts)
&gt;=20
&gt; NV46 had some issues with that, although they should have been fixed i=
n 4.4,
&gt; which you're running...</span >

01:00.0 VGA compatible controller [0300]: NVIDIA Corporation G72M [Quadro N=
VS
110M/GeForce Go 7300] [10de:01d7] (rev a1) (prog-if 00 [VGA controller])
        Subsystem: Lenovo G72M [Quadro NVS 110M/GeForce Go 7300] [17aa:3839]
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR+ FastB2B- DisINTx+
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dfast &gt;TAbort-=
 &lt;TAbort-
&lt;MAbort- &gt;SERR- &lt;PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Interrupt: pin A routed to IRQ 30
        Region 0: Memory at c9000000 (32-bit, non-prefetchable) [size=3D16M]
        Region 1: Memory at d0000000 (64-bit, prefetchable) [size=3D256M]
        Region 3: Memory at ca000000 (64-bit, non-prefetchable) [size=3D16M]
        Expansion ROM at &lt;unassigned&gt; [disabled]
        Capabilities: &lt;access denied&gt;
        Kernel driver in use: nouveau
        Kernel modules: nvidiafb, nouveau

The PCI-MSI counter (relative nvkm) is rapidly increasing, if glxgears are
running. I tried to count, its about 120 interrupts per second, which seems=
 to
be ok, till vsync on 60Hz is enabled.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
          <li>You are the QA Contact for the bug.</li>
      </ul>
    </body>
</html>=

--15107647760.Efb1.13360--

--===============0464783274==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0464783274==--
