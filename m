From: Anders Eriksson <aeriksson-97jfqw80gc6171pxa8y+qA@public.gmane.org>
Subject: PGRAPH_NOTIFY - nSource: ILLEGAL_MTHD,
	nStatus: PROTECTION_FAULT
Date: Mon, 01 Feb 2010 10:05:55 +0100
Message-ID: <20100201090555.9A9E22DC03D@tippex.mynet.homeunix.org>
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


Switching focus to a previously idle firefox and starting to type in the 
google bar, the screen locked up (and the display went black and showed 'no 
signal').

Ssh'ing into the machine, I found this in dmesg:

[drm] nouveau 0000:01:00.0: Allocating FIFO number 1
[drm] nouveau 0000:01:00.0: nouveau_channel_alloc: initialised FIFO 1
[drm] nouveau 0000:01:00.0: Setting dpms mode 3 on vga encoder (output 0)
[drm] nouveau 0000:01:00.0: Setting dpms mode 0 on vga encoder (output 0)
[drm] nouveau 0000:01:00.0: Setting dpms mode 3 on vga encoder (output 0)
[drm] nouveau 0000:01:00.0: Setting dpms mode 0 on vga encoder (output 0)
[drm] nouveau 0000:01:00.0: Setting dpms mode 3 on vga encoder (output 0)
[drm] nouveau 0000:01:00.0: Setting dpms mode 0 on vga encoder (output 0)
[drm] nouveau 0000:01:00.0: Setting dpms mode 3 on vga encoder (output 0)
[drm] nouveau 0000:01:00.0: Setting dpms mode 0 on vga encoder (output 0)
[drm] nouveau 0000:01:00.0: Setting dpms mode 3 on vga encoder (output 0)
[drm] nouveau 0000:01:00.0: Setting dpms mode 0 on vga encoder (output 0)
[drm] nouveau 0000:01:00.0: Setting dpms mode 3 on vga encoder (output 0)
[drm] nouveau 0000:01:00.0: Setting dpms mode 0 on vga encoder (output 0)
[drm] nouveau 0000:01:00.0: Setting dpms mode 3 on vga encoder (output 0)
[drm] nouveau 0000:01:00.0: Setting dpms mode 0 on vga encoder (output 0)
[drm] nouveau 0000:01:00.0: Setting dpms mode 3 on vga encoder (output 0)
[drm] nouveau 0000:01:00.0: Setting dpms mode 0 on vga encoder (output 0)
[drm] nouveau 0000:01:00.0: Setting dpms mode 3 on vga encoder (output 0)
[drm] nouveau 0000:01:00.0: Setting dpms mode 0 on vga encoder (output 0)
[drm] nouveau 0000:01:00.0: Setting dpms mode 3 on vga encoder (output 0)
[drm] nouveau 0000:01:00.0: Setting dpms mode 0 on vga encoder (output 0)
[drm] nouveau 0000:01:00.0: Setting dpms mode 3 on vga encoder (output 0)
[drm] nouveau 0000:01:00.0: Setting dpms mode 0 on vga encoder (output 0)
[drm] nouveau 0000:01:00.0: Setting dpms mode 3 on vga encoder (output 0)
[drm] nouveau 0000:01:00.0: Setting dpms mode 0 on vga encoder (output 0)
[drm] nouveau 0000:01:00.0: Setting dpms mode 3 on vga encoder (output 0)
[drm] nouveau 0000:01:00.0: Setting dpms mode 0 on vga encoder (output 0)
[drm] nouveau 0000:01:00.0: Setting dpms mode 3 on vga encoder (output 0)
[drm] nouveau 0000:01:00.0: Setting dpms mode 0 on vga encoder (output 0)
[drm] nouveau 0000:01:00.0: Setting dpms mode 3 on vga encoder (output 0)
[drm] nouveau 0000:01:00.0: Setting dpms mode 0 on vga encoder (output 0)
[drm] nouveau 0000:01:00.0: PFIFO_DMA_PUSHER - Ch 1
[drm] nouveau 0000:01:00.0: PGRAPH_NOTIFY - nSource: ILLEGAL_MTHD, nStatus: PROTECTION_FAULT
[drm] nouveau 0000:01:00.0: PGRAPH_NOTIFY - Ch 1/4 Class 0x0039 Mthd 0x027c Data 0xdb192df0:0x007c827c
[drm] nouveau 0000:01:00.0: PGRAPH_NOTIFY - nSource: ILLEGAL_MTHD, nStatus: PROTECTION_FAULT
[drm] nouveau 0000:01:00.0: PGRAPH_NOTIFY - Ch 1/4 Class 0x0039 Mthd 0x0280 Data 0xdb192df0:0x007c827c
[drm] nouveau 0000:01:00.0: PGRAPH_NOTIFY - nSource: ILLEGAL_MTHD, nStatus: PROTECTION_FAULT
[drm] nouveau 0000:01:00.0: PGRAPH_NOTIFY - Ch 1/4 Class 0x0039 Mthd 0x0284 Data 0xdb192df0:0x007c827c
[drm] nouveau 0000:01:00.0: PGRAPH_NOTIFY - nSource: ILLEGAL_MTHD, nStatus: PROTECTION_FAULT
[drm] nouveau 0000:01:00.0: PGRAPH_NOTIFY - Ch 1/4 Class 0x0039 Mthd 0x0288 Data 0xdb192df0:0x007c827c
[drm] nouveau 0000:01:00.0: PGRAPH_NOTIFY - nSource: ILLEGAL_MTHD, nStatus: PROTECTION_FAULT
[drm] nouveau 0000:01:00.0: PGRAPH_NOTIFY - Ch 1/4 Class 0x0039 Mthd 0x028c Data 0xdb192df0:0x007c827c
[drm] nouveau 0000:01:00.0: PGRAPH_NOTIFY - nSource: ILLEGAL_MTHD, nStatus: PROTECTION_FAULT
[drm] nouveau 0000:01:00.0: PGRAPH_NOTIFY - Ch 1/4 Class 0x0039 Mthd 0x0290 Data 0xdb192df0:0x007c827c
[drm] nouveau 0000:01:00.0: PGRAPH_NOTIFY - nSource: ILLEGAL_MTHD, nStatus: PROTECTION_FAULT
[drm] nouveau 0000:01:00.0: PGRAPH_NOTIFY - Ch 1/4 Class 0x0039 Mthd 0x0294 Data 0xdb192df0:0x007c827c
[drm] nouveau 0000:01:00.0: PGRAPH_NOTIFY - nSource: ILLEGAL_MTHD, nStatus: PROTECTION_FAULT
[drm] nouveau 0000:01:00.0: PGRAPH_NOTIFY - Ch 1/4 Class 0x0039 Mthd 0x0298 Data 0xdb192df0:0x007c827c
[drm] nouveau 0000:01:00.0: PGRAPH_NOTIFY - nSource: ILLEGAL_MTHD, nStatus: PROTECTION_FAULT
[drm] nouveau 0000:01:00.0: PGRAPH_NOTIFY - Ch 1/4 Class 0x0039 Mthd 0x029c Data 0xdb192df0:0x007c827c
[drm] nouveau 0000:01:00.0: PGRAPH_NOTIFY - nSource: ILLEGAL_MTHD, nStatus: PROTECTION_FAULT
[drm] nouveau 0000:01:00.0: PGRAPH_NOTIFY - Ch 1/4 Class 0x0039 Mthd 0x02a0 Data 0xdb192df0:0x007c827c
[drm] nouveau 0000:01:00.0: PGRAPH_NOTIFY - nSource: ILLEGAL_MTHD, nStatus: PROTECTION_FAULT
[drm] nouveau 0000:01:00.0: PGRAPH_NOTIFY - Ch 1/4 Class 0x0039 Mthd 0x02a4 Data 0xdb192df0:0x007c827c
[drm] nouveau 0000:01:00.0: PGRAPH_NOTIFY - nSource: ILLEGAL_MTHD, nStatus: PROTECTION_FAULT
[drm] nouveau 0000:01:00.0: PGRAPH_NOTIFY - Ch 1/4 Class 0x0039 Mthd 0x02a8 Data 0xdb192df0:0x007c827c
[drm] nouveau 0000:01:00.0: PGRAPH_NOTIFY - nSource: ILLEGAL_MTHD, nStatus: PROTECTION_FAULT
[drm] nouveau 0000:01:00.0: PGRAPH_NOTIFY - Ch 1/4 Class 0x0039 Mthd 0x02ac Data 0xdb192df0:0x007c827c
[drm] nouveau 0000:01:00.0: PGRAPH_NOTIFY - nSource: ILLEGAL_MTHD, nStatus: PROTECTION_FAULT
[drm] nouveau 0000:01:00.0: PGRAPH_NOTIFY - Ch 1/4 Class 0x0039 Mthd 0x02b0 Data 0xdb192df0:0x007c827c
[drm] nouveau 0000:01:00.0: PGRAPH_NOTIFY - nSource: ILLEGAL_MTHD, nStatus: PROTECTION_FAULT
[drm] nouveau 0000:01:00.0: PGRAPH_NOTIFY - Ch 1/4 Class 0x0039 Mthd 0x02b4 Data 0xdb192df0:0x007c827c
[drm] nouveau 0000:01:00.0: PGRAPH_NOTIFY - nSource: ILLEGAL_MTHD, nStatus: PROTECTION_FAULT
[drm] nouveau 0000:01:00.0: PGRAPH_NOTIFY - Ch 1/4 Class 0x0039 Mthd 0x02b8 Data 0xdb192df0:0x007c827c
[drm] nouveau 0000:01:00.0: PGRAPH_NOTIFY - nSource: ILLEGAL_MTHD, nStatus: PROTECTION_FAULT
[drm] nouveau 0000:01:00.0: PGRAPH_NOTIFY - Ch 1/4 Class 0x0039 Mthd 0x02bc Data 0xdb192df0:0x007c827c
[drm] nouveau 0000:01:00.0: PGRAPH_NOTIFY - nSource: ILLEGAL_MTHD, nStatus: PROTECTION_FAULT
[drm] nouveau 0000:01:00.0: PGRAPH_NOTIFY - Ch 1/4 Class 0x0039 Mthd 0x02c0 Data 0xdb192df0:0x007c827c
[drm] nouveau 0000:01:00.0: PGRAPH_NOTIFY - nSource: ILLEGAL_MTHD, nStatus: PROTECTION_FAULT
[drm] nouveau 0000:01:00.0: PGRAPH_NOTIFY - Ch 1/4 Class 0x0039 Mthd 0x02c4 Data 0xdb192df0:0x007c827c
[drm] nouveau 0000:01:00.0: PGRAPH_NOTIFY - nSource: ILLEGAL_MTHD, nStatus: PROTECTION_FAULT
[drm] nouveau 0000:01:00.0: PGRAPH_NOTIFY - Ch 1/4 Class 0x0039 Mthd 0x02c8 Data 0xdb192df0:0x007c827c
[drm] nouveau 0000:01:00.0: PGRAPH_NOTIFY - nSource: ILLEGAL_MTHD, nStatus: PROTECTION_FAULT
[drm] nouveau 0000:01:00.0: PGRAPH_NOTIFY - Ch 1/4 Class 0x0039 Mthd 0x02cc Data 0xdb192df0:0x007c827c
[drm] nouveau 0000:01:00.0: PGRAPH_NOTIFY - nSource: ILLEGAL_MTHD, nStatus: PROTECTION_FAULT
[drm] nouveau 0000:01:00.0: PGRAPH_NOTIFY - Ch 1/4 Class 0x0039 Mthd 0x02d0 Data 0xdb192df0:0x007c827c
[drm] nouveau 0000:01:00.0: PGRAPH_NOTIFY - nSource: ILLEGAL_MTHD, nStatus: PROTECTION_FAULT
[drm] nouveau 0000:01:00.0: PGRAPH_NOTIFY - Ch 1/4 Class 0x0039 Mthd 0x02d4 Data 0xdb192df0:0x007c827c
[drm] nouveau 0000:01:00.0: PGRAPH_NOTIFY - nSource: ILLEGAL_MTHD, nStatus: PROTECTION_FAULT
[drm] nouveau 0000:01:00.0: PGRAPH_NOTIFY - Ch 1/4 Class 0x0039 Mthd 0x02d8 Data 0xdb192df0:0x007c827c
[drm] nouveau 0000:01:00.0: PGRAPH_NOTIFY - nSource: ILLEGAL_MTHD, nStatus: PROTECTION_FAULT
[drm] nouveau 0000:01:00.0: PGRAPH_NOTIFY - Ch 1/4 Class 0x0039 Mthd 0x02dc Data 0xdb192df0:0x007c827c
[drm] nouveau 0000:01:00.0: PGRAPH_NOTIFY - nSource: ILLEGAL_MTHD, nStatus: PROTECTION_FAULT
[drm] nouveau 0000:01:00.0: PGRAPH_NOTIFY - Ch 1/4 Class 0x0039 Mthd 0x02e0 Data 0xdb192df0:0x007c827c
[drm] nouveau 0000:01:00.0: PGRAPH_NOTIFY - nSource: ILLEGAL_MTHD, nStatus: PROTECTION_FAULT
[drm] nouveau 0000:01:00.0: PGRAPH_NOTIFY - Ch 1/4 Class 0x0039 Mthd 0x02e4 Data 0xdb192df0:0x007c827c
[drm] nouveau 0000:01:00.0: PGRAPH_NOTIFY - nSource: ILLEGAL_MTHD, nStatus: PROTECTION_FAULT
[drm] nouveau 0000:01:00.0: PGRAPH_NOTIFY - Ch 1/4 Class 0x0039 Mthd 0x02e8 Data 0xdb192df0:0x007c827c
[drm] nouveau 0000:01:00.0: PGRAPH_NOTIFY - nSource: ILLEGAL_MTHD, nStatus: PROTECTION_FAULT
[drm] nouveau 0000:01:00.0: PGRAPH_NOTIFY - Ch 1/4 Class 0x0039 Mthd 0x02ec Data 0xdb192df0:0x007c827c
[drm] nouveau 0000:01:00.0: PGRAPH_NOTIFY - nSource: ILLEGAL_MTHD, nStatus: PROTECTION_FAULT
[drm] nouveau 0000:01:00.0: PGRAPH_NOTIFY - Ch 1/4 Class 0x0039 Mthd 0x02f0 Data 0xdb192df0:0x007c827c
[drm] nouveau 0000:01:00.0: PGRAPH_NOTIFY - nSource: ILLEGAL_MTHD, nStatus: PROTECTION_FAULT
[drm] nouveau 0000:01:00.0: PGRAPH_NOTIFY - Ch 1/4 Class 0x0039 Mthd 0x02f4 Data 0xdb192df0:0x00020202
[drm] nouveau 0000:01:00.0: nouveau_channel_free: freeing fifo 1
[drm] nouveau 0000:01:00.0: Failed to idle channel 1.


2.6.33-rc2, userspace is git as of ~january. 

Known?
