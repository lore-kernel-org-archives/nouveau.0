From: Bruno =?UTF-8?B?UHLDqW1vbnQ=?= <bonbons-ud5FBsm0p/xEiooADzr8i9i2O/JbrIOy@public.gmane.org>
Subject: drm-nouveau-next - write trapped by fbcon
Date: Thu, 5 Dec 2013 16:17:24 +0100
Message-ID: <20131205161724.204d6585@pluto.restena.lu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
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

Hi,

With drm-nouveau-next branch on top of 3.13-rc2 and a few sound commits
I get following errors in kernel log (repeating much more often).
(once there was a corrupted fbcon with matrix-like strings of
unrecognizable glyph-strings hanging down from screen top border)

These errors do stop once I switch to Xorg.

[   13.825627] nouveau E[     PFB][0000:02:00.0] trapped write at 0x0000408280 on channel 0x0000fee0 [unknown] BAR/PFIFO_WRITE/FB reason: PAGE_NOT_PRESENT
[   13.826506] nouveau E[     PFB][0000:02:00.0] trapped write at 0x0000408280 on channel 0x0000fee0 [unknown] BAR/PFIFO_WRITE/FB reason: PAGE_NOT_PRESENT
[   13.827319] nouveau E[     PFB][0000:02:00.0] trapped write at 0x0000408280 on channel 0x0000fee0 [unknown] BAR/PFIFO_WRITE/FB reason: PAGE_NOT_PRESENT
[   13.828139] nouveau E[     PFB][0000:02:00.0] trapped write at 0x0000408280 on channel 0x0000fee0 [unknown] BAR/PFIFO_WRITE/FB reason: PAGE_NOT_PRESENT
[   13.828957] nouveau E[     PFB][0000:02:00.0] trapped write at 0x0000400300 on channel 0x0000fee0 [unknown] BAR/PFIFO_WRITE/FB reason: PAGE_NOT_PRESENT


System MBA2,1 with:
00:00.0 Host bridge [0600]: NVIDIA Corporation MCP79 Host Bridge [10de:0a82] (rev b1)
00:00.1 RAM memory [0500]: NVIDIA Corporation MCP79 Memory Controller [10de:0a88] (rev b1)
00:03.0 ISA bridge [0601]: NVIDIA Corporation MCP79 LPC Bridge [10de:0aaf] (rev b2)
00:03.1 RAM memory [0500]: NVIDIA Corporation MCP79 Memory Controller [10de:0aa4] (rev b1)
00:03.2 SMBus [0c05]: NVIDIA Corporation MCP79 SMBus [10de:0aa2] (rev b1)
00:03.3 RAM memory [0500]: NVIDIA Corporation MCP79 Memory Controller [10de:0a89] (rev b1)
00:03.4 RAM memory [0500]: NVIDIA Corporation MCP79 Memory Controller [10de:0a98] (rev b1)
00:03.5 Co-processor [0b40]: NVIDIA Corporation MCP79 Co-processor [10de:0aa3] (rev b1)
00:04.0 USB controller [0c03]: NVIDIA Corporation MCP79 OHCI USB 1.1 Controller [10de:0aa5] (rev b1)
00:04.1 USB controller [0c03]: NVIDIA Corporation MCP79 EHCI USB 2.0 Controller [10de:0aa6] (rev b1)
00:06.0 USB controller [0c03]: NVIDIA Corporation MCP79 OHCI USB 1.1 Controller [10de:0aa7] (rev b1)
00:06.1 USB controller [0c03]: NVIDIA Corporation MCP79 EHCI USB 2.0 Controller [10de:0aa9] (rev b1)
00:08.0 Audio device [0403]: NVIDIA Corporation MCP79 High Definition Audio [10de:0ac0] (rev b1)
00:09.0 PCI bridge [0604]: NVIDIA Corporation MCP79 PCI Bridge [10de:0aab] (rev b1)
00:0b.0 SATA controller [0106]: NVIDIA Corporation MCP79 AHCI Controller [10de:0ab9] (rev b1)
00:10.0 PCI bridge [0604]: NVIDIA Corporation MCP79 PCI Express Bridge [10de:0aa0] (rev b1)
00:15.0 PCI bridge [0604]: NVIDIA Corporation MCP79 PCI Express Bridge [10de:0ac6] (rev b1)
02:00.0 VGA compatible controller [0300]: NVIDIA Corporation C79 [GeForce 9400M] [10de:0870] (rev b1)
03:00.0 Network controller [0280]: Broadcom Corporation BCM4321 802.11a/b/g/n [14e4:4328] (rev 05)

The drm-nouveau-next branch was merged on 2013-12-04 18:34 UTC when most
recent commit was:

Author: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Date:   Thu Nov 28 01:18:47 2013 +0300

    drm/nv50/disp: min/max are reversed in nv50_crtc_gamma_set()
    
    We should be taking the minimum here instead of the max.  It could lead
    to a buffer overflow.
    
    Fixes: 438d99e3b175 ('drm/nvd0/disp: initial crtc object implementation')
    Signed-off-by: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
    
    a/drm/nv50_display.c b/drm/nv50_display.c
    index f8e66c08b11a..4e384a2f99c3 100644
