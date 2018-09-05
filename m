From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 107829] New: nouveau crash/freeze
 [MULTIPLE_WARP_ERRORS] warp 3f0009 [ILLEGAL_INSTR_ENCODING]
Date: Wed, 05 Sep 2018 07:56:43 +0000
Message-ID: <bug-107829-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0859707643=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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


--===============0859707643==
Content-Type: multipart/alternative; boundary="15361342050.E8C225.25049"
Content-Transfer-Encoding: 7bit


--15361342050.E8C225.25049
Date: Wed, 5 Sep 2018 07:56:45 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D107829

            Bug ID: 107829
           Summary: nouveau crash/freeze [MULTIPLE_WARP_ERRORS] warp
                    3f0009 [ILLEGAL_INSTR_ENCODING]
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: major
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: sassmann-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 141458
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D141458&action=3Dedit
dmesg.txt

After an arbitrary amount of time of working in the terminal the screen hard
freezes.
External monitor is connected via DisplayPort on Lenovo Dock.

dmesg then shows:
[172362.507754] nouveau 0000:01:00.0: gr: TRAP ch 6 [00ff396000 Xorg[4075]]
[172362.507767] nouveau 0000:01:00.0: gr: GPC0/TPC1/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp 3f0009 [ILLEGAL_INSTR_ENCODING]
[172362.507775] nouveau 0000:01:00.0: gr: GPC0/TPC2/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp 3f0009 [ILLEGAL_INSTR_ENCODING]
[172362.507782] nouveau 0000:01:00.0: gr: GPC0/TPC3/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp 3c0009 [ILLEGAL_INSTR_ENCODING]
[172362.507805] nouveau 0000:01:00.0: gr: TRAP ch 6 [00ff396000 Xorg[4075]]
[172362.507815] nouveau 0000:01:00.0: gr: GPC0/TPC1/MP trap: global 0000000=
0 []
warp 3e0009 [ILLEGAL_INSTR_ENCODING]
[172362.507823] nouveau 0000:01:00.0: gr: GPC0/TPC2/MP trap: global 0000000=
0 []
warp 3e0009 [ILLEGAL_INSTR_ENCODING]
[172362.507830] nouveau 0000:01:00.0: gr: GPC0/TPC3/MP trap: global 0000000=
0 []
warp 3d0009 [ILLEGAL_INSTR_ENCODING]
[172362.517638] nouveau 0000:01:00.0: gr: TRAP ch 6 [00ff396000 Xorg[4075]]
[172362.517651] nouveau 0000:01:00.0: gr: GPC0/TPC1/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp 3d0009 [ILLEGAL_INSTR_ENCODING]
[172362.517658] nouveau 0000:01:00.0: gr: GPC0/TPC2/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp 3d0009 [ILLEGAL_INSTR_ENCODING]
[172362.517665] nouveau 0000:01:00.0: gr: GPC0/TPC3/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp 3f0009 [ILLEGAL_INSTR_ENCODING]
[172362.517685] nouveau 0000:01:00.0: gr: TRAP ch 6 [00ff396000 Xorg[4075]]
[172362.517695] nouveau 0000:01:00.0: gr: GPC0/TPC1/MP trap: global 0000000=
0 []
warp 3c0009 [ILLEGAL_INSTR_ENCODING]
[172362.517702] nouveau 0000:01:00.0: gr: GPC0/TPC2/MP trap: global 0000000=
0 []
warp 3c0009 [ILLEGAL_INSTR_ENCODING]
[172362.517711] nouveau 0000:01:00.0: gr: GPC0/TPC3/MP trap: global 0000000=
0 []
warp 3e0009 [ILLEGAL_INSTR_ENCODING]
[172362.534375] nouveau 0000:01:00.0: gr: TRAP ch 6 [00ff396000 Xorg[4075]]
[172362.534387] nouveau 0000:01:00.0: gr: GPC0/TPC1/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp 3f0009 [ILLEGAL_INSTR_ENCODING]
[172362.534394] nouveau 0000:01:00.0: gr: GPC0/TPC2/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp 3f0009 [ILLEGAL_INSTR_ENCODING]
[172362.534399] nouveau 0000:01:00.0: gr: GPC0/TPC3/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp 3d0009 [ILLEGAL_INSTR_ENCODING]
Reboot is required at this point. Happens regularly, sometimes after few ho=
urs,
sometimes after 1-2 days.

Hardware: Lenovo P50 running Fedora 28 4.17.19-200.fc28.x86_64
xorg-x11-drv-nouveau-1.0.15-4.fc28.x86_64
mesa-dri-drivers-18.0.5-3.fc28.x86_64

01:00.0 VGA compatible controller [0300]: NVIDIA Corporation GM107GLM [Quad=
ro
M1000M] [10de:13b1] (rev a2) (prog-if 00 [VGA controller])
        Subsystem: Lenovo Device [17aa:2230]
        Flags: bus master, fast devsel, latency 0, IRQ 131
        Memory at b2000000 (32-bit, non-prefetchable) [size=3D16M]
        Memory at a0000000 (64-bit, prefetchable) [size=3D256M]
        Memory at b0000000 (64-bit, prefetchable) [size=3D32M]
        I/O ports at 4000 [size=3D128]
        Expansion ROM at 000c0000 [disabled] [size=3D128K]
        Capabilities: [60] Power Management version 3
        Capabilities: [68] MSI: Enable+ Count=3D1/1 Maskable- 64bit+
        Capabilities: [78] Express Endpoint, MSI 00
        Capabilities: [100] Virtual Channel
        Capabilities: [250] Latency Tolerance Reporting
        Capabilities: [258] L1 PM Substates
        Capabilities: [128] Power Budgeting <?>
        Capabilities: [600] Vendor Specific Information: ID=3D0001 Rev=3D1 =
Len=3D024
<?>
        Capabilities: [900] #19
        Kernel driver in use: nouveau
        Kernel modules: nouveau

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15361342050.E8C225.25049
Date: Wed, 5 Sep 2018 07:56:45 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
        <tr>
          <th>Bug ID</th>
          <td><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - nouveau crash/freeze [MULTIPLE_WARP_ERRORS] warp 3f0009 [=
ILLEGAL_INSTR_ENCODING]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D107829">107829</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>nouveau crash/freeze [MULTIPLE_WARP_ERRORS] warp 3f0009 [ILLE=
GAL_INSTR_ENCODING]
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86-64 (AMD64)
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>major
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Driver/nouveau
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>sassmann&#64;redhat.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D141458=
" name=3D"attach_141458" title=3D"dmesg.txt">attachment 141458</a> <a href=
=3D"attachment.cgi?id=3D141458&amp;action=3Dedit" title=3D"dmesg.txt">[deta=
ils]</a></span>
dmesg.txt

After an arbitrary amount of time of working in the terminal the screen hard
freezes.
External monitor is connected via DisplayPort on Lenovo Dock.

dmesg then shows:
[172362.507754] nouveau 0000:01:00.0: gr: TRAP ch 6 [00ff396000 Xorg[4075]]
[172362.507767] nouveau 0000:01:00.0: gr: GPC0/TPC1/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp 3f0009 [ILLEGAL_INSTR_ENCODING]
[172362.507775] nouveau 0000:01:00.0: gr: GPC0/TPC2/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp 3f0009 [ILLEGAL_INSTR_ENCODING]
[172362.507782] nouveau 0000:01:00.0: gr: GPC0/TPC3/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp 3c0009 [ILLEGAL_INSTR_ENCODING]
[172362.507805] nouveau 0000:01:00.0: gr: TRAP ch 6 [00ff396000 Xorg[4075]]
[172362.507815] nouveau 0000:01:00.0: gr: GPC0/TPC1/MP trap: global 0000000=
0 []
warp 3e0009 [ILLEGAL_INSTR_ENCODING]
[172362.507823] nouveau 0000:01:00.0: gr: GPC0/TPC2/MP trap: global 0000000=
0 []
warp 3e0009 [ILLEGAL_INSTR_ENCODING]
[172362.507830] nouveau 0000:01:00.0: gr: GPC0/TPC3/MP trap: global 0000000=
0 []
warp 3d0009 [ILLEGAL_INSTR_ENCODING]
[172362.517638] nouveau 0000:01:00.0: gr: TRAP ch 6 [00ff396000 Xorg[4075]]
[172362.517651] nouveau 0000:01:00.0: gr: GPC0/TPC1/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp 3d0009 [ILLEGAL_INSTR_ENCODING]
[172362.517658] nouveau 0000:01:00.0: gr: GPC0/TPC2/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp 3d0009 [ILLEGAL_INSTR_ENCODING]
[172362.517665] nouveau 0000:01:00.0: gr: GPC0/TPC3/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp 3f0009 [ILLEGAL_INSTR_ENCODING]
[172362.517685] nouveau 0000:01:00.0: gr: TRAP ch 6 [00ff396000 Xorg[4075]]
[172362.517695] nouveau 0000:01:00.0: gr: GPC0/TPC1/MP trap: global 0000000=
0 []
warp 3c0009 [ILLEGAL_INSTR_ENCODING]
[172362.517702] nouveau 0000:01:00.0: gr: GPC0/TPC2/MP trap: global 0000000=
0 []
warp 3c0009 [ILLEGAL_INSTR_ENCODING]
[172362.517711] nouveau 0000:01:00.0: gr: GPC0/TPC3/MP trap: global 0000000=
0 []
warp 3e0009 [ILLEGAL_INSTR_ENCODING]
[172362.534375] nouveau 0000:01:00.0: gr: TRAP ch 6 [00ff396000 Xorg[4075]]
[172362.534387] nouveau 0000:01:00.0: gr: GPC0/TPC1/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp 3f0009 [ILLEGAL_INSTR_ENCODING]
[172362.534394] nouveau 0000:01:00.0: gr: GPC0/TPC2/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp 3f0009 [ILLEGAL_INSTR_ENCODING]
[172362.534399] nouveau 0000:01:00.0: gr: GPC0/TPC3/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp 3d0009 [ILLEGAL_INSTR_ENCODING]
Reboot is required at this point. Happens regularly, sometimes after few ho=
urs,
sometimes after 1-2 days.

Hardware: Lenovo P50 running Fedora 28 4.17.19-200.fc28.x86_64
xorg-x11-drv-nouveau-1.0.15-4.fc28.x86_64
mesa-dri-drivers-18.0.5-3.fc28.x86_64

01:00.0 VGA compatible controller [0300]: NVIDIA Corporation GM107GLM [Quad=
ro
M1000M] [10de:13b1] (rev a2) (prog-if 00 [VGA controller])
        Subsystem: Lenovo Device [17aa:2230]
        Flags: bus master, fast devsel, latency 0, IRQ 131
        Memory at b2000000 (32-bit, non-prefetchable) [size=3D16M]
        Memory at a0000000 (64-bit, prefetchable) [size=3D256M]
        Memory at b0000000 (64-bit, prefetchable) [size=3D32M]
        I/O ports at 4000 [size=3D128]
        Expansion ROM at 000c0000 [disabled] [size=3D128K]
        Capabilities: [60] Power Management version 3
        Capabilities: [68] MSI: Enable+ Count=3D1/1 Maskable- 64bit+
        Capabilities: [78] Express Endpoint, MSI 00
        Capabilities: [100] Virtual Channel
        Capabilities: [250] Latency Tolerance Reporting
        Capabilities: [258] L1 PM Substates
        Capabilities: [128] Power Budgeting &lt;?&gt;
        Capabilities: [600] Vendor Specific Information: ID=3D0001 Rev=3D1 =
Len=3D024
&lt;?&gt;
        Capabilities: [900] #19
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

--15361342050.E8C225.25049--

--===============0859707643==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0859707643==--
