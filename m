From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 15502] Unknown LVDS configuration bits
Date: Tue, 15 Apr 2008 11:29:46 -0700 (PDT)
Message-ID: <20080415182946.75C0F1301D1@annarchy.freedesktop.org>
References: <bug-15502-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-15502-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

http://bugs.freedesktop.org/show_bug.cgi?id=15502





--- Comment #2 from Alexey Dobriyan <adobriyan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>  2008-04-15 11:29:45 PST ---
Same here with nv84:

09:00.0 3D controller [0302]: nVidia Corporation Unknown device [10de:0407]
(rev a1)
        Subsystem: Toshiba America Info Systems Unknown device [1179:ff00]
        Control: I/O- Mem- BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR+ FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort-
<MAbort- >SERR- <PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Interrupt: pin A routed to IRQ 11
        Region 0: Memory at f2000000 (32-bit, non-prefetchable) [disabled]
[size=16M]
        Region 1: Memory at d0000000 (64-bit, prefetchable) [disabled]
[size=256M]
        Region 3: Memory at f0000000 (64-bit, non-prefetchable) [disabled]
[size=32M]
        Region 5: I/O ports at 2000 [disabled] [size=128]
        Capabilities: <access denied>
        Kernel modules: nvidia

0a:00.0 VGA compatible controller [0300]: nVidia Corporation Unknown device
[10de:0407] (rev a1) (prog-if 00 [VGA controller])
        Subsystem: Toshiba America Info Systems Unknown device [1179:ff00]
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR+ FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort-
<MAbort- >SERR- <PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Interrupt: pin A routed to IRQ 10
        Region 0: Memory at f3000000 (32-bit, non-prefetchable) [size=16M]
        Region 1: Memory at c0000000 (64-bit, prefetchable) [size=256M]
        Region 3: Memory at f4000000 (64-bit, non-prefetchable) [size=32M]
        Region 5: I/O ports at 3000 [size=128]
        Capabilities: <access denied>
        Kernel modules: nvidia


    (II) NOUVEAU(0): Found LVDS manufacturer table revision 4.0
    (EE) NOUVEAU(0): LVDS table revision not currently supported
    (EE) NOUVEAU(0): Pointers to flat panel table invalid
    (II) NOUVEAU(0): Found TMDS table revision 2.0
    (WW) NOUVEAU(0): TMDS table script pointers not stubbed
    (II) NOUVEAU(0): Setting owner: 0x0.
    (II) NOUVEAU(0): Setting owner: 0x3.
    (II) NOUVEAU(0): Setting owner: 0x0.
    (II) NOUVEAU(0): Display Configuration Block version 4.0 found
    (II) NOUVEAU(0): DCB header length 27, with 10 possible entries
    Raw DCB entry 0: 01000323 00000034
    (EE) NOUVEAU(0): Unknown LVDS configuration bits, please report
    (II) NOUVEAU(0): NV50DispPreInit is called.

If I disable check in parse_dcb_entry(), X later segfaults at:

    (WW) NOUVEAU(1): DCB type 14 not known
    (II) NOUVEAU(1): nv50_lvds_detect is called.
    (II) NOUVEAU(1): Output LVDS-0 connected

    Backtrace:
    0: X(xf86SigHandler+0x6d) [0x48efbd]
    1: /lib/libc.so.6 [0x2b538de9f430]
    2: /lib/libc.so.6(memcpy+0xd2) [0x2b538dee49a2]
    3: X(xf86DuplicateMode+0x2e) [0x4b69be]
    4: X(xf86ProbeOutputModes+0x25c) [0x4b21cc]
    5: X(xf86InitialConfiguration+0x78) [0x4b27f8]
    6: /usr/lib64/xorg/modules/drivers//nouveau_drv.so [0x2b538f74c7bb]
    7: X(InitOutput+0x9b6) [0x468156]
    8: X(main+0x275) [0x439ba5]
    9: /lib/libc.so.6(__libc_start_main+0xf4) [0x2b538de8cb74]
    10: X(FontFileCompleteXLFD+0x209) [0x439079]

    Fatal server error:
    Caught signal 11.  Server aborting


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
