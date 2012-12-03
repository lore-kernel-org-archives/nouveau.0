From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 57837] New: nouveau invalid opcode for NVIDIA
Date: Mon, 03 Dec 2012 12:22:22 +0000
Message-ID: <bug-57837-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1543150763=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1543150763==
Content-Type: multipart/alternative; boundary="1354537342.4A8B1.16253"; charset="us-ascii"


--1354537342.4A8B1.16253
Date: Mon, 3 Dec 2012 12:22:22 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=57837

          Priority: medium
            Bug ID: 57837
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: nouveau invalid opcode for NVIDIA
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: All
          Reporter: yetist-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: Other
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

Created attachment 70967
  --> https://bugs.freedesktop.org/attachment.cgi?id=70967&action=edit
dmesg full output

Description:
into DM (xfce4, gnome3, etc) can't see any useful info on desktop screen after
first login.

$ uname -a
Linux mybook 3.6.8-1-ARCH #1 SMP PREEMPT Tue Nov 27 07:58:01 CET 2012 i686
GNU/Linux

$ lspci -nnvv
02:00.0 VGA compatible controller [0300]: NVIDIA Corporation G86 [GeForce 8400M
G] [10de:0428] (rev a1) (prog-if 00 [VGA controller])
Subsystem: ASUSTeK Computer Inc. Device [1043:1513]
Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping-
SERR- FastB2B- DisINTx-
Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort-
<MAbort- >SERR- <PERR- INTx-
Latency: 0, Cache Line Size: 64 bytes
Interrupt: pin A routed to IRQ 19
Region 0: Memory at fc000000 (32-bit, non-prefetchable) [size=16M]
Region 1: Memory at d0000000 (64-bit, prefetchable) [size=256M]
Region 3: Memory at fa000000 (64-bit, non-prefetchable) [size=32M]
Region 5: I/O ports at dc00 [size=128]
Expansion ROM at fd6e0000 [disabled] [size=128K]
Capabilities: <access denied>
Kernel driver in use: nouveau

$ dmesg
[ 23.316445] wlan0: associated
[ 23.316516] IPv6: ADDRCONF(NETDEV_CHANGE): wlan0: link becomes ready
[ 29.796733] EXT4-fs (sda3): re-mounted. Opts: errors=remount-ro,commit=0
[ 99.061057] [drm] nouveau 0000:02:00.0: PGRAPH_TRAP_MP_EXEC - TP 0 MP 0:
INVALID_OPCODE at 000000 warp 0, opcode ff637893 ff637893
[ 99.061076] [drm] nouveau 0000:02:00.0: PGRAPH - TRAP
[ 99.061087] [drm] nouveau 0000:02:00.0: PGRAPH - ch 2 (0x000080d000) subc 7
class 0x8297 mthd 0x15e0 data 0x00000000
[ 99.064749] [drm] nouveau 0000:02:00.0: PGRAPH_TRAP_MP_EXEC - TP 0 MP 0:
INVALID_OPCODE at 000000 warp 0, opcode ff637893 ff637893
[ 99.064766] [drm] nouveau 0000:02:00.0: PGRAPH - TRAP
[ 99.064777] [drm] nouveau 0000:02:00.0: PGRAPH - ch 2 (0x000080d000) subc 7
class 0x8297 mthd 0x15e0 data 0x00000000
[ 99.081476] [drm] nouveau 0000:02:00.0: PGRAPH_TRAP_MP_EXEC - TP 0 MP 0:
INVALID_OPCODE at 000000 warp 0, opcode ff637893 ff637893
[ 99.081495] [drm] nouveau 0000:02:00.0: PGRAPH - TRAP
[ 99.081505] [drm] nouveau 0000:02:00.0: PGRAPH - ch 2 (0x000080d000) subc 7
class 0x8297 mthd 0x15e0 data 0x00000000
[ 99.085396] [drm] nouveau 0000:02:00.0: PGRAPH_TRAP_MP_EXEC - TP 0 MP 0:
INVALID_OPCODE at 000000 warp 0, opcode ff637893 ff637893
[ 99.085413] [drm] nouveau 0000:02:00.0: PGRAPH - TRAP
[ 99.085423] [drm] nouveau 0000:02:00.0: PGRAPH - ch 2 (0x000080d000) subc 7
class 0x8297 mthd 0x15e0 data 0x00000000
[ 99.089483] [drm] nouveau 0000:02:00.0: PGRAPH_TRAP_MP_EXEC - TP 0 MP 0:
INVALID_OPCODE at 000000 warp 0, opcode ff637893 ff637893
[ 99.089500] [drm] nouveau 0000:02:00.0: PGRAPH - TRAP
[ 99.089510] [drm] nouveau 0000:02:00.0: PGRAPH - ch 2 (0x000080d000) subc 7
class 0x8297 mthd 0x15e0 data 0x00000000
[ 99.093291] [drm] nouveau 0000:02:00.0: PGRAPH_TRAP_MP_EXEC - TP 0 MP 0:
INVALID_OPCODE at 000000 warp 0, opcode ff637893 ff637893
[ 99.093310] [drm] nouveau 0000:02:00.0: PGRAPH - TRAP
[ 99.093321] [drm] nouveau 0000:02:00.0: PGRAPH - ch 2 (0x000080d000) subc 7
class 0x8297 mthd 0x15e0 data 0x00000000
[ 99.096527] [drm] nouveau 0000:02:00.0: PGRAPH_TRAP_MP_EXEC - TP 0 MP 0:
INVALID_OPCODE at 000000 warp 0, opcode ff637893 ff637893
[ 99.096543] [drm] nouveau 0000:02:00.0: PGRAPH - TRAP
[ 99.096553] [drm] nouveau 0000:02:00.0: PGRAPH - ch 2 (0x000080d000) subc 7
class 0x8297 mthd 0x15e0 data 0x00000000
[ 99.100852] [drm] nouveau 0000:02:00.0: PGRAPH_TRAP_MP_EXEC - TP 0 MP 0:
INVALID_OPCODE at 000000 warp 0, opcode ff637893 ff637893
[ 99.100867] [drm] nouveau 0000:02:00.0: PGRAPH - TRAP
[ 99.100877] [drm] nouveau 0000:02:00.0: PGRAPH - ch 2 (0x000080d000) subc 7
class 0x8297 mthd 0x15e0 data 0x00000000
[ 99.103495] [drm] nouveau 0000:02:00.0: PGRAPH_TRAP_MP_EXEC - TP 0 MP 0:
INVALID_OPCODE at 000000 warp 0, opcode ff637893 ff637893
[ 99.103511] [drm] nouveau 0000:02:00.0: PGRAPH - TRAP
[ 99.103521] [drm] nouveau 0000:02:00.0: PGRAPH - ch 2 (0x000080d000) subc 7
class 0x8297 mthd 0x15e0 data 0x00000000
[ 99.107467] [drm] nouveau 0000:02:00.0: PGRAPH_TRAP_MP_EXEC - TP 0 MP 0:
INVALID_OPCODE at 000000 warp 0, opcode ff637893 ff637893
[ 99.107482] [drm] nouveau 0000:02:00.0: PGRAPH - TRAP
[ 99.107492] [drm] nouveau 0000:02:00.0: PGRAPH - ch 2 (0x000080d000) subc 7
class 0x8297 mthd 0x15e0 data 0x00000000
[ 99.110268] [drm] nouveau 0000:02:00.0: PGRAPH_TRAP_MP_EXEC - TP 0 MP 0:
INVALID_OPCODE at 000000 warp 0, opcode ff637893 ff637893
[ 99.110283] [drm] nouveau 0000:02:00.0: PGRAPH - TRAP
[ 99.110293] [drm] nouveau 0000:02:00.0: PGRAPH - ch 2 (0x000080d000) subc 7
class 0x8297 mthd 0x15e0 data 0x00000000
[ 99.113794] [drm] nouveau 0000:02:00.0: PGRAPH_TRAP_MP_EXEC - TP 0 MP 0:
INVALID_OPCODE at 000000 warp 0, opcode ff637893 ff637893
[ 99.113812] [drm] nouveau 0000:02:00.0: PGRAPH - TRAP
[ 99.113822] [drm] nouveau 0000:02:00.0: PGRAPH - ch 2 (0x000080d000) subc 7
class 0x8297 mthd 0x15e0 data 0x00000000
[ 99.117618] [drm] nouveau 0000:02:00.0: PGRAPH_TRAP_MP_EXEC - TP 0 MP 0:
INVALID_OPCODE at 000000 warp 0, opcode ff637893 ff637893
[ 99.117636] [drm] nouveau 0000:02:00.0: PGRAPH - TRAP
[ 99.117647] [drm] nouveau 0000:02:00.0: PGRAPH - ch 2 (0x000080d000) subc 7
class 0x8297 mthd 0x15e0 data 0x00000000
[ 99.120215] [drm] nouveau 0000:02:00.0: PGRAPH_TRAP_MP_EXEC - TP 0 MP 0:
INVALID_OPCODE at 000000 warp 0, opcode ff637893 ff637893
[ 99.120229] [drm] nouveau 0000:02:00.0: PGRAPH - TRAP
[ 99.120239] [drm] nouveau 0000:02:00.0: PGRAPH - ch 2 (0x000080d000) subc 7
class 0x8297 mthd 0x15e0 data 0x00000000
[ 99.124188] [drm] nouveau 0000:02:00.0: PGRAPH_TRAP_MP_EXEC - TP 0 MP 0:
INVALID_OPCODE at 000000 warp 0, opcode ff637893 ff637893
[ 99.124204] [drm] nouveau 0000:02:00.0: PGRAPH - TRAP
[ 99.124214] [drm] nouveau 0000:02:00.0: PGRAPH - ch 2 (0x000080d000) subc 7
class 0x8297 mthd 0x15e0 data 0x00000000
[ 99.126823] [drm] nouveau 0000:02:00.0: PGRAPH_TRAP_MP_EXEC - TP 0 MP 0:
INVALID_OPCODE at 000000 warp 0, opcode ff637893 ff637893
[ 99.126837] [drm] nouveau 0000:02:00.0: PGRAPH - TRAP
[ 99.126847] [drm] nouveau 0000:02:00.0: PGRAPH - ch 2 (0x000080d000) subc 7
class 0x8297 mthd 0x15e0 data 0x00000000
[ 99.130360] [drm] nouveau 0000:02:00.0: PGRAPH_TRAP_MP_EXEC - TP 0 MP 0:
INVALID_OPCODE at 000000 warp 0, opcode ff637893 ff637893
[ 99.130375] [drm] nouveau 0000:02:00.0: PGRAPH - TRAP
[ 99.130385] [drm] nouveau 0000:02:00.0: PGRAPH - ch 2 (0x000080d000) subc 7
class 0x8297 mthd 0x15e0 data 0x00000000
[ 99.134410] [drm] nouveau 0000:02:00.0: PGRAPH_TRAP_MP_EXEC - TP 0 MP 0:
INVALID_OPCODE at 000000 warp 0, opcode ff637893 ff637893
[ 99.134426] [drm] nouveau 0000:02:00.0: PGRAPH - TRAP
[ 99.134437] [drm] nouveau 0000:02:00.0: PGRAPH - ch 2 (0x000080d000) subc 7
class 0x8297 mthd 0x15e0 data 0x00000000
[ 99.138017] [drm] nouveau 0000:02:00.0: PGRAPH_TRAP_MP_EXEC - TP 0 MP 0:
INVALID_OPCODE at 000000 warp 0, opcode ff637893 ff637893
[ 99.138035] [drm] nouveau 0000:02:00.0: PGRAPH - TRAP
[ 99.138047] [drm] nouveau 0000:02:00.0: PGRAPH - ch 2 (0x000080d000) subc 7
class 0x8297 mthd 0x15e0 data 0x00000000
[ 99.141282] [drm] nouveau 0000:02:00.0: PGRAPH_TRAP_MP_EXEC - TP 0 MP 0:
INVALID_OPCODE at 000000 warp 0, opcode ff637893 ff637893
[ 99.141301] [drm] nouveau 0000:02:00.0: PGRAPH - TRAP

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1354537342.4A8B1.16253
Date: Mon, 3 Dec 2012 12:22:22 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><table border="1" cellspacing="0" cellpadding="8">
        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Bug ID</th>
          <td><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - nouveau invalid opcode for NVIDIA"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=57837">57837</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>nouveau invalid opcode for NVIDIA
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>normal
          </td>
        </tr>

        <tr>
          <th>Classification</th>
          <td>Unclassified
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>All
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>yetist&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>Other
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Driver/nouveau
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=70967" name="attach_70967" title="dmesg full output">attachment 70967</a> <a href="attachment.cgi?id=70967&amp;action=edit" title="dmesg full output">[details]</a></span>
dmesg full output

Description:
into DM (xfce4, gnome3, etc) can't see any useful info on desktop screen after
first login.

$ uname -a
Linux mybook 3.6.8-1-ARCH #1 SMP PREEMPT Tue Nov 27 07:58:01 CET 2012 i686
GNU/Linux

$ lspci -nnvv
02:00.0 VGA compatible controller [0300]: NVIDIA Corporation G86 [GeForce 8400M
G] [10de:0428] (rev a1) (prog-if 00 [VGA controller])
Subsystem: ASUSTeK Computer Inc. Device [1043:1513]
Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping-
SERR- FastB2B- DisINTx-
Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast &gt;TAbort- &lt;TAbort-
&lt;MAbort- &gt;SERR- &lt;PERR- INTx-
Latency: 0, Cache Line Size: 64 bytes
Interrupt: pin A routed to IRQ 19
Region 0: Memory at fc000000 (32-bit, non-prefetchable) [size=16M]
Region 1: Memory at d0000000 (64-bit, prefetchable) [size=256M]
Region 3: Memory at fa000000 (64-bit, non-prefetchable) [size=32M]
Region 5: I/O ports at dc00 [size=128]
Expansion ROM at fd6e0000 [disabled] [size=128K]
Capabilities: &lt;access denied&gt;
Kernel driver in use: nouveau

$ dmesg
[ 23.316445] wlan0: associated
[ 23.316516] IPv6: ADDRCONF(NETDEV_CHANGE): wlan0: link becomes ready
[ 29.796733] EXT4-fs (sda3): re-mounted. Opts: errors=remount-ro,commit=0
[ 99.061057] [drm] nouveau 0000:02:00.0: PGRAPH_TRAP_MP_EXEC - TP 0 MP 0:
INVALID_OPCODE at 000000 warp 0, opcode ff637893 ff637893
[ 99.061076] [drm] nouveau 0000:02:00.0: PGRAPH - TRAP
[ 99.061087] [drm] nouveau 0000:02:00.0: PGRAPH - ch 2 (0x000080d000) subc 7
class 0x8297 mthd 0x15e0 data 0x00000000
[ 99.064749] [drm] nouveau 0000:02:00.0: PGRAPH_TRAP_MP_EXEC - TP 0 MP 0:
INVALID_OPCODE at 000000 warp 0, opcode ff637893 ff637893
[ 99.064766] [drm] nouveau 0000:02:00.0: PGRAPH - TRAP
[ 99.064777] [drm] nouveau 0000:02:00.0: PGRAPH - ch 2 (0x000080d000) subc 7
class 0x8297 mthd 0x15e0 data 0x00000000
[ 99.081476] [drm] nouveau 0000:02:00.0: PGRAPH_TRAP_MP_EXEC - TP 0 MP 0:
INVALID_OPCODE at 000000 warp 0, opcode ff637893 ff637893
[ 99.081495] [drm] nouveau 0000:02:00.0: PGRAPH - TRAP
[ 99.081505] [drm] nouveau 0000:02:00.0: PGRAPH - ch 2 (0x000080d000) subc 7
class 0x8297 mthd 0x15e0 data 0x00000000
[ 99.085396] [drm] nouveau 0000:02:00.0: PGRAPH_TRAP_MP_EXEC - TP 0 MP 0:
INVALID_OPCODE at 000000 warp 0, opcode ff637893 ff637893
[ 99.085413] [drm] nouveau 0000:02:00.0: PGRAPH - TRAP
[ 99.085423] [drm] nouveau 0000:02:00.0: PGRAPH - ch 2 (0x000080d000) subc 7
class 0x8297 mthd 0x15e0 data 0x00000000
[ 99.089483] [drm] nouveau 0000:02:00.0: PGRAPH_TRAP_MP_EXEC - TP 0 MP 0:
INVALID_OPCODE at 000000 warp 0, opcode ff637893 ff637893
[ 99.089500] [drm] nouveau 0000:02:00.0: PGRAPH - TRAP
[ 99.089510] [drm] nouveau 0000:02:00.0: PGRAPH - ch 2 (0x000080d000) subc 7
class 0x8297 mthd 0x15e0 data 0x00000000
[ 99.093291] [drm] nouveau 0000:02:00.0: PGRAPH_TRAP_MP_EXEC - TP 0 MP 0:
INVALID_OPCODE at 000000 warp 0, opcode ff637893 ff637893
[ 99.093310] [drm] nouveau 0000:02:00.0: PGRAPH - TRAP
[ 99.093321] [drm] nouveau 0000:02:00.0: PGRAPH - ch 2 (0x000080d000) subc 7
class 0x8297 mthd 0x15e0 data 0x00000000
[ 99.096527] [drm] nouveau 0000:02:00.0: PGRAPH_TRAP_MP_EXEC - TP 0 MP 0:
INVALID_OPCODE at 000000 warp 0, opcode ff637893 ff637893
[ 99.096543] [drm] nouveau 0000:02:00.0: PGRAPH - TRAP
[ 99.096553] [drm] nouveau 0000:02:00.0: PGRAPH - ch 2 (0x000080d000) subc 7
class 0x8297 mthd 0x15e0 data 0x00000000
[ 99.100852] [drm] nouveau 0000:02:00.0: PGRAPH_TRAP_MP_EXEC - TP 0 MP 0:
INVALID_OPCODE at 000000 warp 0, opcode ff637893 ff637893
[ 99.100867] [drm] nouveau 0000:02:00.0: PGRAPH - TRAP
[ 99.100877] [drm] nouveau 0000:02:00.0: PGRAPH - ch 2 (0x000080d000) subc 7
class 0x8297 mthd 0x15e0 data 0x00000000
[ 99.103495] [drm] nouveau 0000:02:00.0: PGRAPH_TRAP_MP_EXEC - TP 0 MP 0:
INVALID_OPCODE at 000000 warp 0, opcode ff637893 ff637893
[ 99.103511] [drm] nouveau 0000:02:00.0: PGRAPH - TRAP
[ 99.103521] [drm] nouveau 0000:02:00.0: PGRAPH - ch 2 (0x000080d000) subc 7
class 0x8297 mthd 0x15e0 data 0x00000000
[ 99.107467] [drm] nouveau 0000:02:00.0: PGRAPH_TRAP_MP_EXEC - TP 0 MP 0:
INVALID_OPCODE at 000000 warp 0, opcode ff637893 ff637893
[ 99.107482] [drm] nouveau 0000:02:00.0: PGRAPH - TRAP
[ 99.107492] [drm] nouveau 0000:02:00.0: PGRAPH - ch 2 (0x000080d000) subc 7
class 0x8297 mthd 0x15e0 data 0x00000000
[ 99.110268] [drm] nouveau 0000:02:00.0: PGRAPH_TRAP_MP_EXEC - TP 0 MP 0:
INVALID_OPCODE at 000000 warp 0, opcode ff637893 ff637893
[ 99.110283] [drm] nouveau 0000:02:00.0: PGRAPH - TRAP
[ 99.110293] [drm] nouveau 0000:02:00.0: PGRAPH - ch 2 (0x000080d000) subc 7
class 0x8297 mthd 0x15e0 data 0x00000000
[ 99.113794] [drm] nouveau 0000:02:00.0: PGRAPH_TRAP_MP_EXEC - TP 0 MP 0:
INVALID_OPCODE at 000000 warp 0, opcode ff637893 ff637893
[ 99.113812] [drm] nouveau 0000:02:00.0: PGRAPH - TRAP
[ 99.113822] [drm] nouveau 0000:02:00.0: PGRAPH - ch 2 (0x000080d000) subc 7
class 0x8297 mthd 0x15e0 data 0x00000000
[ 99.117618] [drm] nouveau 0000:02:00.0: PGRAPH_TRAP_MP_EXEC - TP 0 MP 0:
INVALID_OPCODE at 000000 warp 0, opcode ff637893 ff637893
[ 99.117636] [drm] nouveau 0000:02:00.0: PGRAPH - TRAP
[ 99.117647] [drm] nouveau 0000:02:00.0: PGRAPH - ch 2 (0x000080d000) subc 7
class 0x8297 mthd 0x15e0 data 0x00000000
[ 99.120215] [drm] nouveau 0000:02:00.0: PGRAPH_TRAP_MP_EXEC - TP 0 MP 0:
INVALID_OPCODE at 000000 warp 0, opcode ff637893 ff637893
[ 99.120229] [drm] nouveau 0000:02:00.0: PGRAPH - TRAP
[ 99.120239] [drm] nouveau 0000:02:00.0: PGRAPH - ch 2 (0x000080d000) subc 7
class 0x8297 mthd 0x15e0 data 0x00000000
[ 99.124188] [drm] nouveau 0000:02:00.0: PGRAPH_TRAP_MP_EXEC - TP 0 MP 0:
INVALID_OPCODE at 000000 warp 0, opcode ff637893 ff637893
[ 99.124204] [drm] nouveau 0000:02:00.0: PGRAPH - TRAP
[ 99.124214] [drm] nouveau 0000:02:00.0: PGRAPH - ch 2 (0x000080d000) subc 7
class 0x8297 mthd 0x15e0 data 0x00000000
[ 99.126823] [drm] nouveau 0000:02:00.0: PGRAPH_TRAP_MP_EXEC - TP 0 MP 0:
INVALID_OPCODE at 000000 warp 0, opcode ff637893 ff637893
[ 99.126837] [drm] nouveau 0000:02:00.0: PGRAPH - TRAP
[ 99.126847] [drm] nouveau 0000:02:00.0: PGRAPH - ch 2 (0x000080d000) subc 7
class 0x8297 mthd 0x15e0 data 0x00000000
[ 99.130360] [drm] nouveau 0000:02:00.0: PGRAPH_TRAP_MP_EXEC - TP 0 MP 0:
INVALID_OPCODE at 000000 warp 0, opcode ff637893 ff637893
[ 99.130375] [drm] nouveau 0000:02:00.0: PGRAPH - TRAP
[ 99.130385] [drm] nouveau 0000:02:00.0: PGRAPH - ch 2 (0x000080d000) subc 7
class 0x8297 mthd 0x15e0 data 0x00000000
[ 99.134410] [drm] nouveau 0000:02:00.0: PGRAPH_TRAP_MP_EXEC - TP 0 MP 0:
INVALID_OPCODE at 000000 warp 0, opcode ff637893 ff637893
[ 99.134426] [drm] nouveau 0000:02:00.0: PGRAPH - TRAP
[ 99.134437] [drm] nouveau 0000:02:00.0: PGRAPH - ch 2 (0x000080d000) subc 7
class 0x8297 mthd 0x15e0 data 0x00000000
[ 99.138017] [drm] nouveau 0000:02:00.0: PGRAPH_TRAP_MP_EXEC - TP 0 MP 0:
INVALID_OPCODE at 000000 warp 0, opcode ff637893 ff637893
[ 99.138035] [drm] nouveau 0000:02:00.0: PGRAPH - TRAP
[ 99.138047] [drm] nouveau 0000:02:00.0: PGRAPH - ch 2 (0x000080d000) subc 7
class 0x8297 mthd 0x15e0 data 0x00000000
[ 99.141282] [drm] nouveau 0000:02:00.0: PGRAPH_TRAP_MP_EXEC - TP 0 MP 0:
INVALID_OPCODE at 000000 warp 0, opcode ff637893 ff637893
[ 99.141301] [drm] nouveau 0000:02:00.0: PGRAPH - TRAP</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1354537342.4A8B1.16253--

--===============1543150763==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1543150763==--
