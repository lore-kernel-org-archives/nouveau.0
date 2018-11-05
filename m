From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 100567] Nouveau system freeze fifo: SCHED_ERROR 0a
 [CTXSW_TIMEOUT]
Date: Mon, 05 Nov 2018 10:27:12 +0000
Message-ID: <bug-100567-8800-Gfh9EntW96@http.bugs.freedesktop.org/>
References: <bug-100567-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0612895483=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-100567-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0612895483==
Content-Type: multipart/alternative; boundary="15414136324.824f5d7F6.3158"
Content-Transfer-Encoding: 7bit


--15414136324.824f5d7F6.3158
Date: Mon, 5 Nov 2018 10:27:12 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D100567

--- Comment #16 from Daniel Gustaw <gustaw.daniel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I had the same problem:

Nov  5 10:56:01 daniel-Inspiron-3543 kernel: [ 8431.056748] nouveau
0000:05:00.0: fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT]
Nov  5 10:56:01 daniel-Inspiron-3543 kernel: [ 8431.056765] nouveau
0000:05:00.0: fifo: runlist 0: scheduled for recovery
Nov  5 10:56:01 daniel-Inspiron-3543 kernel: [ 8431.056781] nouveau
0000:05:00.0: fifo: channel 15: killed
Nov  5 10:56:01 daniel-Inspiron-3543 kernel: [ 8431.056791] nouveau
0000:05:00.0: fifo: engine 7: scheduled for recovery
Nov  5 10:56:01 daniel-Inspiron-3543 kernel: [ 8431.056798] nouveau
0000:05:00.0: fifo: engine 0: scheduled for recovery
Nov  5 10:56:01 daniel-Inspiron-3543 kernel: [ 8431.057508] nouveau
0000:05:00.0: gnome-shell[4200]: channel 15 killed!

lsb_release -d
Description:    Ubuntu 18.04.1 LTS
gnome-shell --version
GNOME Shell 3.28.3

sudo lshw -c video
  *-display=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
       description: VGA compatible controller
       product: GK107 [NVS 510]
       vendor: NVIDIA Corporation
       physical id: 0
       bus info: pci@0000:05:00.0
       version: a1
       width: 64 bits
       clock: 33MHz
       capabilities: pm msi pciexpress vga_controller bus_master cap_list r=
om
       configuration: driver=3Dnouveau latency=3D0
       resources: irq:47 memory:de000000-deffffff memory:c0000000-cfffffff
memory:d0000000-d1ffffff ioport:c000(size=3D128) memory:c0000-dffff

hwinfo --gfxcard
56: PCI 500.0: 0300 VGA compatible controller (VGA)=20=20=20=20=20=20=20=20=
=20=20=20=20=20
  [Created at pci.378]
  Unique ID: Ddhb.WEoD030yuUF
  Parent ID: _Znp.jlvukYYcj4B
  SysFS ID: /devices/pci0000:00/0000:00:02.0/0000:05:00.0
  SysFS BusID: 0000:05:00.0
  Hardware Class: graphics card
  Model: "nVidia GK107 [NVS 510]"
  Vendor: pci 0x10de "nVidia Corporation"
  Device: pci 0x0ffd "GK107 [NVS 510]"
  SubVendor: pci 0x10de "nVidia Corporation"
  SubDevice: pci 0x0967=20
  Revision: 0xa1
  Driver: "nouveau"
  Driver Modules: "nouveau"
  Memory Range: 0xde000000-0xdeffffff (rw,non-prefetchable)
  Memory Range: 0xc0000000-0xcfffffff (ro,non-prefetchable)
  Memory Range: 0xd0000000-0xd1ffffff (ro,non-prefetchable)
  I/O Ports: 0xc000-0xc07f (rw)
  Memory Range: 0x000c0000-0x000dffff (rw,non-prefetchable,disabled)
  IRQ: 47 (296925 events)
  I/O Port: 0x00 (rw)
  Module Alias: "pci:v000010DEd00000FFDsv000010DEsd00000967bc03sc00i00"
  Driver Info #0:
    Driver Status: nvidiafb is not active
    Driver Activation Cmd: "modprobe nvidiafb"
  Driver Info #1:
    Driver Status: nouveau is active
    Driver Activation Cmd: "modprobe nouveau"
  Config Status: cfg=3Dnew, avail=3Dyes, need=3Dno, active=3Dunknown
  Attached to: #73 (PCI bridge)

Primary display adapter: #56

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15414136324.824f5d7F6.3158
Date: Mon, 5 Nov 2018 10:27:12 +0000
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
   title=3D"NEW - Nouveau system freeze fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT=
]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100567#c16">Comme=
nt # 16</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Nouveau system freeze fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT=
]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100567">bug 10056=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
gustaw.daniel&#64;gmail.com" title=3D"Daniel Gustaw &lt;gustaw.daniel&#64;g=
mail.com&gt;"> <span class=3D"fn">Daniel Gustaw</span></a>
</span></b>
        <pre>I had the same problem:

Nov  5 10:56:01 daniel-Inspiron-3543 kernel: [ 8431.056748] nouveau
0000:05:00.0: fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT]
Nov  5 10:56:01 daniel-Inspiron-3543 kernel: [ 8431.056765] nouveau
0000:05:00.0: fifo: runlist 0: scheduled for recovery
Nov  5 10:56:01 daniel-Inspiron-3543 kernel: [ 8431.056781] nouveau
0000:05:00.0: fifo: channel 15: killed
Nov  5 10:56:01 daniel-Inspiron-3543 kernel: [ 8431.056791] nouveau
0000:05:00.0: fifo: engine 7: scheduled for recovery
Nov  5 10:56:01 daniel-Inspiron-3543 kernel: [ 8431.056798] nouveau
0000:05:00.0: fifo: engine 0: scheduled for recovery
Nov  5 10:56:01 daniel-Inspiron-3543 kernel: [ 8431.057508] nouveau
0000:05:00.0: gnome-shell[4200]: channel 15 killed!

lsb_release -d
Description:    Ubuntu 18.04.1 LTS
gnome-shell --version
GNOME Shell 3.28.3

sudo lshw -c video
  *-display=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
       description: VGA compatible controller
       product: GK107 [NVS 510]
       vendor: NVIDIA Corporation
       physical id: 0
       bus info: pci&#64;0000:05:00.0
       version: a1
       width: 64 bits
       clock: 33MHz
       capabilities: pm msi pciexpress vga_controller bus_master cap_list r=
om
       configuration: driver=3Dnouveau latency=3D0
       resources: irq:47 memory:de000000-deffffff memory:c0000000-cfffffff
memory:d0000000-d1ffffff ioport:c000(size=3D128) memory:c0000-dffff

hwinfo --gfxcard
56: PCI 500.0: 0300 VGA compatible controller (VGA)=20=20=20=20=20=20=20=20=
=20=20=20=20=20
  [Created at pci.378]
  Unique ID: Ddhb.WEoD030yuUF
  Parent ID: _Znp.jlvukYYcj4B
  SysFS ID: /devices/pci0000:00/0000:00:02.0/0000:05:00.0
  SysFS BusID: 0000:05:00.0
  Hardware Class: graphics card
  Model: &quot;nVidia GK107 [NVS 510]&quot;
  Vendor: pci 0x10de &quot;nVidia Corporation&quot;
  Device: pci 0x0ffd &quot;GK107 [NVS 510]&quot;
  SubVendor: pci 0x10de &quot;nVidia Corporation&quot;
  SubDevice: pci 0x0967=20
  Revision: 0xa1
  Driver: &quot;nouveau&quot;
  Driver Modules: &quot;nouveau&quot;
  Memory Range: 0xde000000-0xdeffffff (rw,non-prefetchable)
  Memory Range: 0xc0000000-0xcfffffff (ro,non-prefetchable)
  Memory Range: 0xd0000000-0xd1ffffff (ro,non-prefetchable)
  I/O Ports: 0xc000-0xc07f (rw)
  Memory Range: 0x000c0000-0x000dffff (rw,non-prefetchable,disabled)
  IRQ: 47 (296925 events)
  I/O Port: 0x00 (rw)
  Module Alias: &quot;pci:v000010DEd00000FFDsv000010DEsd00000967bc03sc00i00=
&quot;
  Driver Info #0:
    Driver Status: nvidiafb is not active
    Driver Activation Cmd: &quot;modprobe nvidiafb&quot;
  Driver Info #1:
    Driver Status: nouveau is active
    Driver Activation Cmd: &quot;modprobe nouveau&quot;
  Config Status: cfg=3Dnew, avail=3Dyes, need=3Dno, active=3Dunknown
  Attached to: #73 (PCI bridge)

Primary display adapter: #56</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15414136324.824f5d7F6.3158--

--===============0612895483==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0612895483==--
