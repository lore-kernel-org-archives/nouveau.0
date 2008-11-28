From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 18809] New: X w/ nouveau driver doesn't start on
 G86M [ GeForce 8400M GT] chip
Date: Fri, 28 Nov 2008 15:34:10 -0800 (PST)
Message-ID: <bug-18809-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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

http://bugs.freedesktop.org/show_bug.cgi?id=18809

           Summary: X w/ nouveau driver doesn't start on G86M [GeForce 8400M
                    GT] chip
           Product: xorg
           Version: 7.4
          Platform: Other
        OS/Version: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: ingmar-k5O9xmZG+kVAfugRpC6u6w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


X w/ nouveau driver doesn't start on G86M [GeForce 8400M GT] chip

This is with
    libdrm @ 7e4e0fbbb82b0467d46386bcac1115812aaa1393
    xf86-video-nouveau @ 20f93a94ae034ee7c744947f42a29a7c0b50ee9d
    Xorg 7.4, xserver 1.5.3

lspci -vv:

01:00.0 VGA compatible controller: nVidia Corporation G86M [GeForce 8400M GT]
(rev a1) (prog-if 00 [VGA controller])
        Subsystem: Sony Corporation Device 902d                                 
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR+ FastB2B- DisINTx-       
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort-
<MAbort- >SERR- <PERR- INTx-        
        Latency: 0, Cache Line Size: 64 bytes                                   
        Interrupt: pin A routed to IRQ 16                                       
        Region 0: Memory at ce000000 (32-bit, non-prefetchable) [size=16M]      
        Region 1: Memory at d0000000 (64-bit, prefetchable) [size=256M]         
        Region 3: Memory at cc000000 (64-bit, non-prefetchable) [size=32M]      
        Region 5: I/O ports at 2000 [size=128]                                  
        Capabilities: [60] Power Management version 2                           
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA
PME(D0-,D1-,D2-,D3hot-,D3cold-)                          
                Status: D0 PME-Enable- DSel=0 DScale=0 PME-                     
        Capabilities: [68] MSI: Mask- 64bit+ Count=1/1 Enable-                  
                Address: 0000000000000000  Data: 0000                           
        Capabilities: [78] Express (v1) Endpoint, MSI 00                        
                DevCap: MaxPayload 128 bytes, PhantFunc 0, Latency L0s <512ns,
L1 <4us                              
                        ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ FLReset-         
                DevCtl: Report errors: Correctable- Non-Fatal- Fatal-
Unsupported-                                  
                        RlxdOrd+ ExtTag- PhantFunc- AuxPwr- NoSnoop+            
                        MaxPayload 128 bytes, MaxReadReq 512 bytes              
                DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr-
TransPend-                                 
                LnkCap: Port #0, Speed 2.5GT/s, Width x16, ASPM L0s L1, Latency
L0 <512ns, L1 <4us                  
                        ClockPM- Suprise- LLActRep- BwNot-                      
                LnkCtl: ASPM L0s L1 Enabled; RCB 128 bytes Disabled- Retrain-
CommClk+                              
                        ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-          
                LnkSta: Speed 2.5GT/s, Width x16, TrErr- Train- SlotClk+
DLActive- BWMgmt- ABWMgmt-                 
        Capabilities: [100] Virtual Channel <?>                                 
        Capabilities: [128] Power Budgeting <?>                                 
        Capabilities: [600] Vendor Specific Information <?>                     
        Kernel driver in use: nouveau

Console output is as follows:

X.Org X Server 1.5.3
Release Date: 5 November 2008
X Protocol Version 11, Revision 0
Build Operating System: Linux 2.6.27-rc8 x86_64 
Current Operating System: Linux pinky 2.6.27-rc8 #4 SMP Wed Oct 1 12:57:24 UTC
2008 x86_64
Build Date: 28 November 2008  10:13:14PM

        Before reporting problems, check http://wiki.x.org
        to make sure that you have the latest version.
Markers: (--) probed, (**) from config file, (==) default setting,
        (++) from command line, (!!) notice, (II) informational,
        (WW) warning, (EE) error, (NI) not implemented, (??) unknown.
(==) Log file: "/var/log/Xorg.0.log", Time: Fri Nov 28 23:37:36 2008
(==) Using config file: "/etc/X11/xorg.conf"
(EE) NOUVEAU(0): ========== unknown reg 0x0002130C ==========
(EE) NOUVEAU(0): ========== unknown reg 0x00021218 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x0002004C ==========
(EE) NOUVEAU(0): ========== unknown reg 0x00020060 ==========
(EE) NOUVEAU(0): 0xC767: Init table command not found: 0x76
(EE) NOUVEAU(0): LVDS and no modes found, bailing out.

Backtrace:
0: X(xorg_backtrace+0x26) [0x4df036]
1: X(xf86SigHandler+0x39) [0x48a9d9]
2: /lib/libc.so.6 [0x7f1ad4632ac0]
3: /usr/lib64/xorg/modules/drivers//nouveau_drv.so [0x7f1ad353423b]
4: X(xf86ProbeOutputModes+0x5a8) [0x499f38]
5: X(xf86InitialConfiguration+0x165) [0x49a5a5]
6: /usr/lib64/xorg/modules/drivers//nouveau_drv.so [0x7f1ad350dab4]
7: X(InitOutput+0xbe6) [0x45c676]
8: X(main+0x2c2) [0x428e32]
9: /lib/libc.so.6(__libc_start_main+0xe6) [0x7f1ad461f146]
10: X(FontFileCompleteXLFD+0x219) [0x428849]

Fatal server error:
Caught signal 11.  Server aborting


Can't think of any other useful information atm...

Thanks!
-Ingmar


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
