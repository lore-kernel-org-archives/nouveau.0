From: Kevin Winchester <kjwinchester-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: PGRAPH - DATA_ERROR SEMANTIC_COLOR_BACK_OVER_LIMIT
Date: Wed, 31 Aug 2011 21:48:04 -0300
Message-ID: <CAELBVzC7zYdJ8OvBM4dksHe9jgxVsJ9C2ZaqPS4Vp0zTVYJyZA@mail.gmail.com>
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

Hi,

I am not sure if this is an application bug or something
nouveau-related.  I have been attempting to play FlightGear but after
a few minutes each time I start the game, my computer becomes
completely unresponsive.  Mouse movement sometimes works for a few
seconds at a time, but no clicks work, nor any keyboard input (other
than SysRq key sequences).

Once I reboot, I can see in my log the following messages repeated
again and again:

[ 2440.151477] [drm] nouveau 0000:01:00.0: PGRAPH - DATA_ERROR
SEMANTIC_COLOR_BACK_OVER_LIMIT
[ 2440.151484] [drm] nouveau 0000:01:00.0: PGRAPH - DATA_ERROR
[ 2440.151489] [drm] nouveau 0000:01:00.0: PGRAPH - ch 4
(0x00058f3000) subc 5 class 0x8297 mthd 0x0d78 data 0x00000002

Interspersed once in a while is:

[ 2443.177390] nouveau_ratelimit: 1291 callbacks suppressed

Is this an error with the application?  I can report it to them if
that is the best thing to do.  Alternatively, if it is a sign of a
nouveau issue, what information would you need to be able to track it
down?  I have the following card:


01:00.0 VGA compatible controller: nVidia Corporation G86 [GeForce
8500 GT] (rev a1) (prog-if 00 [VGA controller])
	Subsystem: eVga.com. Corp. Device c793
	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR+ FastB2B- DisINTx-
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0, Cache Line Size: 64 bytes
	Interrupt: pin A routed to IRQ 25
	Region 0: Memory at fd000000 (32-bit, non-prefetchable) [size=16M]
	Region 1: Memory at a0000000 (64-bit, prefetchable) [size=256M]
	Region 3: Memory at fa000000 (64-bit, non-prefetchable) [size=32M]
	Region 5: I/O ports at dc00 [size=128]
	Expansion ROM at fe7e0000 [disabled] [size=128K]
	Capabilities: [60] Power Management version 2
		Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0-,D1-,D2-,D3hot-,D3cold-)
		Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
	Capabilities: [68] MSI: Enable- Count=1/1 Maskable- 64bit+
		Address: 0000000000000000  Data: 0000
	Capabilities: [78] Express (v1) Endpoint, MSI 00
		DevCap:	MaxPayload 128 bytes, PhantFunc 0, Latency L0s <512ns, L1 <4us
			ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ FLReset-
		DevCtl:	Report errors: Correctable- Non-Fatal- Fatal- Unsupported-
			RlxdOrd+ ExtTag- PhantFunc- AuxPwr- NoSnoop-
			MaxPayload 128 bytes, MaxReadReq 128 bytes
		DevSta:	CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr- TransPend-
		LnkCap:	Port #213, Speed 2.5GT/s, Width x16, ASPM L0s L1, Latency L0
<512ns, L1 <4us
			ClockPM- Surprise- LLActRep- BwNot-
		LnkCtl:	ASPM Disabled; RCB 128 bytes Disabled- Retrain- CommClk+
			ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
		LnkSta:	Speed 2.5GT/s, Width x16, TrErr- Train- SlotClk+ DLActive-
BWMgmt- ABWMgmt-
	Kernel driver in use: nouveau


Thanks,

-- 
Kevin Winchester
