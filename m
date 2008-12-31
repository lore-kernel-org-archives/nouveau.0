From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 15758] Invisible mouse pointer on NV4E (C51)
Date: Wed, 31 Dec 2008 11:57:38 -0800 (PST)
Message-ID: <20081231195738.D38B1130057@annarchy.freedesktop.org>
References: <bug-15758-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-15758-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=15758





--- Comment #4 from Ronald <ronald645-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>  2008-12-31 11:57:37 PST ---
Hello everyone,

I'm facing the same problem (invisible cursor) in this bugreport with my card
[1]. It happens whenever I use xrandr or switch VT's (also s2disk is affected).
Unloading and reloading the modules does not 'cure' it. However, it seems that
adding HWcursor with parameter 0 to the device section in xorg[2].conf seems to
work around this. I have build my own vanilla kernel[3] and pulled the drivers
from git[4]. I would like to help to solve this problem (if possible). I fairly
know my way around and this system is not important for stuff like e.g.
homework...

1: Charlie:~# lspci -v -v -s 00:05.0
00:05.0 VGA compatible controller: nVidia Corporation C51 [Geforce 6150 Go]
(rev a2) (prog-if 00 [VGA controller])
        Subsystem: Hewlett-Packard Company Presario V6133CL
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx-
        Status: Cap+ 66MHz+ UDF- FastB2B+ ParErr- DEVSEL=fast >TAbort- <TAbort-
<MAbort- >SERR- <PERR- INTx-
        Latency: 0
        Interrupt: pin A routed to IRQ 18
        Region 0: Memory at b2000000 (32-bit, non-prefetchable) [size=16M]
        Region 1: Memory at c0000000 (64-bit, prefetchable) [size=256M]
        Region 3: Memory at b1000000 (64-bit, non-prefetchable) [size=16M]
        [virtual] Expansion ROM at 50000000 [disabled] [size=128K]
        Capabilities: [48] Power Management version 2
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA
PME(D0-,D1-,D2-,D3hot-,D3cold-)
                Status: D0 PME-Enable- DSel=0 DScale=0 PME-
        Capabilities: [50] Message Signalled Interrupts: Mask- 64bit+ Queue=0/0
Enable-
                Address: 0000000000000000  Data: 0000

2: X.Org X Server 1.4.2
Release Date: 11 June 2008
Build Operating System: Linux Debian (xorg-server 2:1.4.2-9)

3. Linux Charlie 2.6.28 #1 Sun Dec 28 17:27:07 CET 2008 i686 GNU/Linux

4. drm-58d557c73b9e4ad1964fd083abeec74875c141cb
xf86-video-nouveau-5d281a2439de1e8c1848b6b700f30476575966e0


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
