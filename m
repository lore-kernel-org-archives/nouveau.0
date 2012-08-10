From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 53342] New: nouveau driver doesn't set clock rate of
	NV40 card
Date: Fri, 10 Aug 2012 12:56:21 +0000
Message-ID: <bug-53342-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=53342

             Bug #: 53342
           Summary: nouveau driver doesn't set clock rate of NV40 card
    Classification: Unclassified
           Product: xorg
           Version: unspecified
          Platform: Other
        OS/Version: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: baris-PzV5AOq6QM3Iu70zcZT95lAUjnlXr6A1@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


nouveau driver, does not correctly reclock my card (nVidia Corporation G71
[GeForce 7300 GS] (rev a1))

Kernel log snipplet is below:

    [    1.549172] [drm] nouveau 0000:01:00.0: Detected an NV40 generation card
(0x046f00a3)
    [    1.550079] checking generic (d0000000 500000) vs hw (d0000000 10000000)
    [    1.550081] fb: conflicting fb hw usage nouveaufb vs VESA VGA - removing
generic driver
    [    1.550100] Console: switching to colour dummy device 80x25
    [    1.552042] [drm] nouveau 0000:01:00.0: Checking PRAMIN for VBIOS
    [    1.630390] [drm] nouveau 0000:01:00.0: ... appears to be valid
    [    1.630392] [drm] nouveau 0000:01:00.0: Using VBIOS from PRAMIN
    [    1.630395] [drm] nouveau 0000:01:00.0: BIT BIOS found
    [    1.630398] [drm] nouveau 0000:01:00.0: Bios version 05.72.22.34
    [    1.630400] [drm] nouveau 0000:01:00.0: TMDS table version 1.1
    [    1.630486] [drm] nouveau 0000:01:00.0: MXM: no VBIOS data, nothing to
do
    [    1.630488] [drm] nouveau 0000:01:00.0: DCB version 3.0
    [    1.630490] [drm] nouveau 0000:01:00.0: DCB outp 00: 01000300 00000028
    [    1.630492] [drm] nouveau 0000:01:00.0: DCB outp 01: 02011310 00000028
    [    1.630494] [drm] nouveau 0000:01:00.0: DCB outp 02: 01011312 00000000
    [    1.630495] [drm] nouveau 0000:01:00.0: DCB outp 03: 020223f1 00c0c083
    [    1.630497] [drm] nouveau 0000:01:00.0: DCB conn 00: 0000
    [    1.630499] [drm] nouveau 0000:01:00.0: DCB conn 01: 2130
    [    1.630501] [drm] nouveau 0000:01:00.0: DCB conn 02: 0210
    [    1.630502] [drm] nouveau 0000:01:00.0: DCB conn 03: 0211
    [    1.630504] [drm] nouveau 0000:01:00.0: DCB conn 04: 0213
    [    1.630511] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 0 at
offset 0xE195
    [    1.630559] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 1 at
offset 0xE4C6
    [    1.643786] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 2 at
offset 0xEA4D
    [    1.643803] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 3 at
offset 0xEBC8
    [    1.644926] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 4 at
offset 0xED7A
    [    1.645082] [TTM] Zone  kernel: Available graphics memory: 2024458 kiB
    [    1.645084] [TTM] Initializing pool allocator
    [    1.645088] [TTM] Initializing DMA pool allocator
    [    1.645101] [drm] nouveau 0000:01:00.0: Detected 256MiB VRAM (DDR2)
    [    1.652180] [drm] nouveau 0000:01:00.0: 512 MiB GART (aperture)
    [    1.653936] [drm] Supports vblank timestamp caching Rev 1 (10.10.2010).
    [    1.653938] [drm] No driver support for vblank timestamp query.
    [    1.659474] [drm] nouveau 0000:01:00.0: 1 available performance level(s)
    [    1.659477] [drm] nouveau 0000:01:00.0: 0: core 550MHz shader 550MHz
memory 700MHz fanspeed 100%
    [    1.659480] [drm] nouveau 0000:01:00.0: c: core 199MHz memory 391MHz
    [    1.660299] [drm] nouveau 0000:01:00.0: MM: using M2MF for buffer copies
    [    1.660304] [drm] nouveau 0000:01:00.0: 0xD557: Parsing digital output
script table
    [    1.711127] [drm] nouveau 0000:01:00.0: Setting dpms mode 3 on vga
encoder (output 0)
    [    1.711130] [drm] nouveau 0000:01:00.0: Setting dpms mode 3 on vga
encoder (output 1)
    [    1.711132] [drm] nouveau 0000:01:00.0: Setting dpms mode 3 on tmds
encoder (output 2)
    [    1.711135] [drm] nouveau 0000:01:00.0: Setting dpms mode 3 on TV
encoder (output 3)

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
