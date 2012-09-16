From: Dietmar Kling <dietmar.kling-S0/GAf8tV78@public.gmane.org>
Subject: Testing nouveau on C51PV [GeForce 6150] (rev a2)
Date: Sun, 16 Sep 2012 14:25:35 +0200
Message-ID: <5055C53F.1020004@web.de>
References: <5055C31D.9080109@web.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------010103060903070301060204"
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <5055C31D.9080109-S0/GAf8tV78@public.gmane.org>
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

This is a multi-part message in MIME format.
--------------010103060903070301060204
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Dear all,

after having bad experiences with nouveau (using fedora 15,16,17) ,
which resulted in an immediate lockup of my old server machine,
i have given noveau another chance to run on a fedora kernel:

Linux version 3.5.3-1.fc17.x86_64 (mockbuild@)


The good is news is - it doesn't lead to immediate lockup of the machine
anymore.

The bad news. It still leads to a scrambled console screen, which does
not contain any useful information.

It seems that there is an "INVALID_CMD" issued by the noveau driver.

Can anybody help me to resolve this problem?



The hopefully useful information i have compiled in the attachements

dmesg |grep nouveau >nouveau-grep.txt
lspci |grep -i vga >vga-grep.txt
   cat /proc/version >version-grep.txt


Kind Regards
Dietmar








--------------010103060903070301060204
Content-Type: text/plain; charset=windows-1252;
 name="vga-grep.txt"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="vga-grep.txt"

00:05.0 VGA compatible controller: nVidia Corporation C51PV [GeForce 6150] (rev a2)


--------------010103060903070301060204
Content-Type: text/plain; charset=windows-1252;
 name="nouveau-grep.txt"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="nouveau-grep.txt"

[   15.210273] nouveau 0000:00:05.0: setting latency timer to 64
[   15.210326] [drm] nouveau 0000:00:05.0: Detected an NV40 generation card (0x04e000a2)
[   15.211087] fb: conflicting fb hw usage nouveaufb vs VESA VGA - removing generic driver
[   15.218667] [drm] nouveau 0000:00:05.0: Checking PRAMIN for VBIOS
[   15.261581] [drm] nouveau 0000:00:05.0: ... appears to be valid
[   15.261586] [drm] nouveau 0000:00:05.0: Using VBIOS from PRAMIN
[   15.261594] [drm] nouveau 0000:00:05.0: BIT BIOS found
[   15.261600] [drm] nouveau 0000:00:05.0: Bios version 05.51.22.33
[   15.261606] [drm] nouveau 0000:00:05.0: TMDS table version 1.1
[   15.261794] [drm] nouveau 0000:00:05.0: MXM: no VBIOS data, nothing to do
[   15.261799] [drm] nouveau 0000:00:05.0: DCB version 3.0
[   15.261805] [drm] nouveau 0000:00:05.0: DCB outp 00: 02000300 00000023
[   15.261810] [drm] nouveau 0000:00:05.0: DCB outp 01: 03011312 00000000
[   15.261814] [drm] nouveau 0000:00:05.0: DCB outp 02: 020023f1 0040c080
[   15.261819] [drm] nouveau 0000:00:05.0: DCB conn 00: 0000
[   15.261824] [drm] nouveau 0000:00:05.0: DCB conn 01: 0131
[   15.261828] [drm] nouveau 0000:00:05.0: DCB conn 02: 0210
[   15.261832] [drm] nouveau 0000:00:05.0: DCB conn 03: 0211
[   15.261836] [drm] nouveau 0000:00:05.0: DCB conn 04: 0213
[   15.261846] [drm] nouveau 0000:00:05.0: Parsing VBIOS init table 0 at offset 0xDD1D
[   15.261961] [drm] nouveau 0000:00:05.0: Parsing VBIOS init table 1 at offset 0xDE74
[   15.261965] [drm] nouveau 0000:00:05.0: Parsing VBIOS init table 2 at offset 0xDE75
[   15.262666] [drm] nouveau 0000:00:05.0: Parsing VBIOS init table 3 at offset 0xDFF7
[   15.262675] [drm] nouveau 0000:00:05.0: Parsing VBIOS init table 4 at offset 0xE040
[   15.262998] [drm] nouveau 0000:00:05.0: Detected 32MiB VRAM (stolen system memory)
[   15.272560] [drm] nouveau 0000:00:05.0: 512 MiB GART (aperture)
[   15.435031] [drm] nouveau 0000:00:05.0: 1 available performance level(s)
[   15.435036] [drm] nouveau 0000:00:05.0: 0: core 475MHz shader 475MHz fanspeed 100%
[   15.435038] [drm] nouveau 0000:00:05.0: c:
[   15.435664] [drm] nouveau 0000:00:05.0: MM: using M2MF for buffer copies
[   15.435670] [drm] nouveau 0000:00:05.0: 0xD186: Parsing digital output script table
[   15.487039] [drm] nouveau 0000:00:05.0: Setting dpms mode 3 on vga encoder (output 0)
[   15.487045] [drm] nouveau 0000:00:05.0: Setting dpms mode 3 on tmds encoder (output 1)
[   15.487049] [drm] nouveau 0000:00:05.0: Setting dpms mode 3 on TV encoder (output 2)
[   15.521028] [drm] nouveau 0000:00:05.0: Load detected on output B
[   15.535181] [drm] nouveau 0000:00:05.0: allocated 1024x768 fb: 0x49000, bo ffff8800b6271c00
[   15.535377] fbcon: nouveaufb (fb0) is primary device
[   15.535438] fb0: nouveaufb frame buffer device
[   15.535446] [drm] Initialized nouveau 1.0.0 20120316 for 0000:00:05.0 on minor 0
[   54.099534] [drm] nouveau 0000:00:05.0: Setting dpms mode 0 on vga encoder (output 0)
[   54.099538] [drm] nouveau 0000:00:05.0: Output VGA-1 is running on CRTC 0 using output B
[   54.102935] [drm] nouveau 0000:00:05.0: PFIFO_DMA_PUSHER - Ch 0 Get 0x00011000 Put 0x00001890 State 0x80000000 (err: INVALID_CMD) Push 0x00000000
[   59.130732] [drm] nouveau 0000:00:05.0: PFIFO_DMA_PUSHER - Ch 0 Get 0x00011000 Put 0x0000168c State 0x80000000 (err: INVALID_CMD) Push 0x00000000
[   59.130945] [drm] nouveau 0000:00:05.0: PFIFO_DMA_PUSHER - Ch 0 Get 0x00011000 Put 0x0000168c State 0x80000000 (err: INVALID_CMD) Push 0x00000000
[  125.141760] [drm] nouveau 0000:00:05.0: PFIFO_DMA_PUSHER - Ch 0 Get 0x00011000 Put 0x00001284 State 0x80000000 (err: INVALID_CMD) Push 0x00000000
[  125.142166] [drm] nouveau 0000:00:05.0: PFIFO_DMA_PUSHER - Ch 0 Get 0x00011000 Put 0x00001284 State 0x80000000 (err: INVALID_CMD) Push 0x00000000
[  125.163079] [drm] nouveau 0000:00:05.0: PFIFO_DMA_PUSHER - Ch 0 Get 0x00011000 Put 0x00001284 State 0x80000000 (err: INVALID_CMD) Push 0x00000000
[  125.643539] [drm] nouveau 0000:00:05.0: PFIFO_DMA_PUSHER - Ch 0 Get 0x00011000 Put 0x0000168c State 0x80000000 (err: INVALID_CMD) Push 0x00000000
[  125.643943] [drm] nouveau 0000:00:05.0: PFIFO_DMA_PUSHER - Ch 0 Get 0x00011000 Put 0x0000168c State 0x80000000 (err: INVALID_CMD) Push 0x00000000
[  125.669258] [drm] nouveau 0000:00:05.0: PFIFO_DMA_PUSHER - Ch 0 Get 0x00011000 Put 0x0000168c State 0x80000000 (err: INVALID_CMD) Push 0x00000000
[  125.676339] [drm] nouveau 0000:00:05.0: PFIFO_DMA_PUSHER - Ch 0 Get 0x00011000 Put 0x000011b8 State 0x80000000 (err: INVALID_CMD) Push 0x00000000
[  167.303065] [drm] nouveau 0000:00:05.0: PFIFO_DMA_PUSHER - Ch 0 Get 0x00011000 Put 0x000010b4 State 0x80000000 (err: INVALID_CMD) Push 0x00000000
[  187.929590] [drm] nouveau 0000:00:05.0: PFIFO_DMA_PUSHER - Ch 0 Get 0x00011000 Put 0x000018b0 State 0x80000000 (err: INVALID_CMD) Push 0x00000000
[  187.954018] [drm] nouveau 0000:00:05.0: PFIFO_DMA_PUSHER - Ch 0 Get 0x00011000 Put 0x00001890 State 0x80000000 (err: INVALID_CMD) Push 0x00000000
[  187.954404] [drm] nouveau 0000:00:05.0: PFIFO_DMA_PUSHER - Ch 0 Get 0x00011000 Put 0x00001890 State 0x80000000 (err: INVALID_CMD) Push 0x00000000


--------------010103060903070301060204
Content-Type: text/plain; charset=windows-1252;
 name="version-grep.txt"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="version-grep.txt"


--------------010103060903070301060204
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--------------010103060903070301060204--
