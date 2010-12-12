From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 32341] New: nouveau only reads half the EDID.
Date: Sun, 12 Dec 2010 10:20:56 -0800 (PST)
Message-ID: <bug-32341-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
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

https://bugs.freedesktop.org/show_bug.cgi?id=32341

           Summary: nouveau only reads half the EDID.
           Product: xorg
           Version: unspecified
          Platform: Other
        OS/Version: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: buzzbuzz22-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


nv driver reads edid correctly.
nvidia driver reads edid correctly.
nouveau driver reads only half the EDID.

NV(0): EDID (in hex):
[    16.577] (II) NV(0):        00ffffffffffff003cad003700000000
[    16.577] (II) NV(0):        0a120103801009780a6837a454489a25
[    16.577] (II) NV(0):        0f4a4c3fef8001010101010101010101
[    16.578] (II) NV(0):        010101010101011d8018711c1620582c
[    16.578] (II) NV(0):        250010090000009e011d007251d01e20
[    16.578] (II) NV(0):        6e28550010090000001e000000fc0020
[    16.578] (II) NV(0):        33325f4c43445f54560a2020000000fd
[    16.578] (II) NV(0):        00313d0f2e08000a202020202020013f
[    16.578] (II) NV(0):        02032471500102048506111314150307
[    16.578] (II) NV(0):        12161f2010230907018301000066030c
[    16.578] (II) NV(0):        001000808c0ad08a20e02d10103e9600
[    16.578] (II) NV(0):        0403000000188c0aa01451f01600267c
[    16.578] (II) NV(0):        4300040300000099011d80d0721c1620
[    16.578] (II) NV(0):        102c258010090000009f011d00bc52d0
[    16.578] (II) NV(0):        1e20b828554010090000001e00000000
[    16.578] (II) NV(0):        000000000000000000000000000000f2


[   403.545] (II) NOUVEAU(0): EDID (in hex):
[   403.545] (II) NOUVEAU(0):   00ffffffffffff003cad003700000000
[   403.545] (II) NOUVEAU(0):   0a120103801009780a6837a454489a25
[   403.545] (II) NOUVEAU(0):   0f4a4c3fef8001010101010101010101
[   403.545] (II) NOUVEAU(0):   010101010101011d8018711c1620582c
[   403.545] (II) NOUVEAU(0):   250010090000009e011d007251d01e20
[   403.545] (II) NOUVEAU(0):   6e28550010090000001e000000fc0020
[   403.545] (II) NOUVEAU(0):   33325f4c43445f54560a2020000000fd
[   403.545] (II) NOUVEAU(0):   00313d0f2e08000a202020202020013f

[    24.423] (--) NVIDIA(0): Raw EDID bytes:
[    24.423] (--) NVIDIA(0):
[    24.423] (--) NVIDIA(0):   00 ff ff ff ff ff ff 00  3c ad 00 37 00 00 00 00
[    24.423] (--) NVIDIA(0):   0a 12 01 03 80 10 09 78  0a 68 37 a4 54 48 9a 25
[    24.423] (--) NVIDIA(0):   0f 4a 4c 3f ef 80 01 01  01 01 01 01 01 01 01 01
[    24.423] (--) NVIDIA(0):   01 01 01 01 01 01 01 1d  80 18 71 1c 16 20 58 2c
[    24.423] (--) NVIDIA(0):   25 00 10 09 00 00 00 9e  01 1d 00 72 51 d0 1e 20
[    24.423] (--) NVIDIA(0):   6e 28 55 00 10 09 00 00  00 1e 00 00 00 fc 00 20
[    24.423] (--) NVIDIA(0):   33 32 5f 4c 43 44 5f 54  56 0a 20 20 00 00 00 fd
[    24.423] (--) NVIDIA(0):   00 31 3d 0f 2e 08 00 0a  20 20 20 20 20 20 01 3f
[    24.423] (--) NVIDIA(0):   02 03 24 71 50 01 02 04  85 06 11 13 14 15 03 07
[    24.423] (--) NVIDIA(0):   12 16 1f 20 10 23 09 07  01 83 01 00 00 66 03 0c
[    24.423] (--) NVIDIA(0):   00 10 00 80 8c 0a d0 8a  20 e0 2d 10 10 3e 96 00
[    24.423] (--) NVIDIA(0):   04 03 00 00 00 18 8c 0a  a0 14 51 f0 16 00 26 7c
[    24.424] (--) NVIDIA(0):   43 00 04 03 00 00 00 99  01 1d 80 d0 72 1c 16 20
[    24.424] (--) NVIDIA(0):   10 2c 25 80 10 09 00 00  00 9f 01 1d 00 bc 52 d0
[    24.424] (--) NVIDIA(0):   1e 20 b8 28 55 40 10 09  00 00 00 1e 00 00 00 00
[    24.424] (--) NVIDIA(0):   00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 f2

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
