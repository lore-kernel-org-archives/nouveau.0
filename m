From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 100567] Nouveau system freeze fifo: SCHED_ERROR 0a
 [CTXSW_TIMEOUT]
Date: Mon, 10 Apr 2017 23:53:06 +0000
Message-ID: <bug-100567-8800-ZRvTGXaO3R@http.bugs.freedesktop.org/>
References: <bug-100567-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1187554586=="
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


--===============1187554586==
Content-Type: multipart/alternative; boundary="14918683862.704f.15734";
 charset="UTF-8"


--14918683862.704f.15734
Date: Mon, 10 Apr 2017 23:53:06 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D100567

kevin-Fk+Xth6EFAKtEw7EPzjzzg@public.gmane.org changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |kevin-Fk+Xth6EFAKtEw7EPzjzzg@public.gmane.org

--- Comment #3 from kevin-Fk+Xth6EFAKtEw7EPzjzzg@public.gmane.org ---
I have the same issue, on Linux 4.11-rc6. journalctl -b:

Apr 10 18:22:55 jenny kernel: nouveau 0000:02:00.0: gr: TRAP ch 2 [007f9010=
00
X[6443]]
Apr 10 18:22:55 jenny kernel: nouveau 0000:02:00.0: gr: GPC2/TPC1/MP trap:
global 00000000 [] warp 3f0009 [ILLEGAL_INSTR_ENCODING]
...
Apr 10 18:22:59 jenny kernel: nouveau 0000:02:00.0: fifo: SCHED_ERROR 0a
[CTXSW_TIMEOUT]
Apr 10 18:22:59 jenny kernel: nouveau 0000:02:00.0: fifo: runlist 0: schedu=
led
for recovery
Apr 10 18:22:59 jenny kernel: nouveau 0000:02:00.0: fifo: channel 2: killed
Apr 10 18:22:59 jenny kernel: nouveau 0000:02:00.0: fifo: engine 0: schedul=
ed
for recovery
Apr 10 18:22:59 jenny kernel: nouveau 0000:02:00.0: X[6443]: channel 2 kill=
ed!

lspci -vv (GTX 770; NVE4):

02:00.0 VGA compatible controller: NVIDIA Corporation GK104 [GeForce GTX 77=
0]
(rev a1) (prog-if 00 [VGA controller])=20=20=20=20=20=20=20=20=20
        Subsystem: Micro-Star International Co., Ltd. [MSI] GK104 [GeForce =
GTX
770]=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
        Flags: bus master, fast devsel, latency 0, IRQ 33=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
        Memory at fa000000 (32-bit, non-prefetchable) [size=3D16M]=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20
        Memory at f0000000 (64-bit, prefetchable) [size=3D128M]=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
        Memory at f8000000 (64-bit, prefetchable) [size=3D32M]=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
        I/O ports at e000 [size=3D128]=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20
        Expansion ROM at fb000000 [disabled] [size=3D512K]=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
        Capabilities: [60] Power Management version 3
        Capabilities: [68] MSI: Enable+ Count=3D1/1 Maskable- 64bit+
        Capabilities: [78] Express Endpoint, MSI 00
        Capabilities: [b4] Vendor Specific Information: Len=3D14 <?>
        Capabilities: [100] Virtual Channel
        Capabilities: [128] Power Budgeting <?>
        Capabilities: [600] Vendor Specific Information: ID=3D0001 Rev=3D1 =
Len=3D024
<?>
        Capabilities: [900] #19
        Kernel driver in use: nouveau

02:00.1 Audio device: NVIDIA Corporation GK104 HDMI Audio Controller (rev a=
1)
        Subsystem: Micro-Star International Co., Ltd. [MSI] GK104 HDMI Audio
Controller
        Flags: bus master, fast devsel, latency 0, IRQ 17
        Memory at fb080000 (32-bit, non-prefetchable) [size=3D16K]
        Capabilities: [60] Power Management version 3
        Capabilities: [68] MSI: Enable- Count=3D1/1 Maskable- 64bit+
        Capabilities: [78] Express Endpoint, MSI 00
        Kernel driver in use: snd_hda_intel

I'll post a proper dmesg the next time the bug appears.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14918683862.704f.15734
Date: Mon, 10 Apr 2017 23:53:06 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:kevin&#64=
;potatofrom.space" title=3D"kevin&#64;potatofrom.space">kevin&#64;potatofro=
m.space</a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Nouveau system freeze fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT=
]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100567">bug 10056=
7</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">CC</td>
           <td>
               &nbsp;
           </td>
           <td>kevin&#64;potatofrom.space
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Nouveau system freeze fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT=
]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100567#c3">Commen=
t # 3</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Nouveau system freeze fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT=
]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100567">bug 10056=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
kevin&#64;potatofrom.space" title=3D"kevin&#64;potatofrom.space">kevin&#64;=
potatofrom.space</a>
</span></b>
        <pre>I have the same issue, on Linux 4.11-rc6. journalctl -b:

Apr 10 18:22:55 jenny kernel: nouveau 0000:02:00.0: gr: TRAP ch 2 [007f9010=
00
X[6443]]
Apr 10 18:22:55 jenny kernel: nouveau 0000:02:00.0: gr: GPC2/TPC1/MP trap:
global 00000000 [] warp 3f0009 [ILLEGAL_INSTR_ENCODING]
...
Apr 10 18:22:59 jenny kernel: nouveau 0000:02:00.0: fifo: SCHED_ERROR 0a
[CTXSW_TIMEOUT]
Apr 10 18:22:59 jenny kernel: nouveau 0000:02:00.0: fifo: runlist 0: schedu=
led
for recovery
Apr 10 18:22:59 jenny kernel: nouveau 0000:02:00.0: fifo: channel 2: killed
Apr 10 18:22:59 jenny kernel: nouveau 0000:02:00.0: fifo: engine 0: schedul=
ed
for recovery
Apr 10 18:22:59 jenny kernel: nouveau 0000:02:00.0: X[6443]: channel 2 kill=
ed!

lspci -vv (GTX 770; NVE4):

02:00.0 VGA compatible controller: NVIDIA Corporation GK104 [GeForce GTX 77=
0]
(rev a1) (prog-if 00 [VGA controller])=20=20=20=20=20=20=20=20=20
        Subsystem: Micro-Star International Co., Ltd. [MSI] GK104 [GeForce =
GTX
770]=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
        Flags: bus master, fast devsel, latency 0, IRQ 33=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
        Memory at fa000000 (32-bit, non-prefetchable) [size=3D16M]=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20
        Memory at f0000000 (64-bit, prefetchable) [size=3D128M]=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
        Memory at f8000000 (64-bit, prefetchable) [size=3D32M]=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
        I/O ports at e000 [size=3D128]=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20
        Expansion ROM at fb000000 [disabled] [size=3D512K]=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
        Capabilities: [60] Power Management version 3
        Capabilities: [68] MSI: Enable+ Count=3D1/1 Maskable- 64bit+
        Capabilities: [78] Express Endpoint, MSI 00
        Capabilities: [b4] Vendor Specific Information: Len=3D14 &lt;?&gt;
        Capabilities: [100] Virtual Channel
        Capabilities: [128] Power Budgeting &lt;?&gt;
        Capabilities: [600] Vendor Specific Information: ID=3D0001 Rev=3D1 =
Len=3D024
&lt;?&gt;
        Capabilities: [900] #19
        Kernel driver in use: nouveau

02:00.1 Audio device: NVIDIA Corporation GK104 HDMI Audio Controller (rev a=
1)
        Subsystem: Micro-Star International Co., Ltd. [MSI] GK104 HDMI Audio
Controller
        Flags: bus master, fast devsel, latency 0, IRQ 17
        Memory at fb080000 (32-bit, non-prefetchable) [size=3D16K]
        Capabilities: [60] Power Management version 3
        Capabilities: [68] MSI: Enable- Count=3D1/1 Maskable- 64bit+
        Capabilities: [78] Express Endpoint, MSI 00
        Kernel driver in use: snd_hda_intel

I'll post a proper dmesg the next time the bug appears.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14918683862.704f.15734--

--===============1187554586==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1187554586==--
