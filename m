From: Michael Breuer <mbreuer-P//MSfjsEjDQT0dZR+AlfA@public.gmane.org>
Subject: nouveau current git/2.6.32rc8 git dma/iommu errors?
Date: Tue, 24 Nov 2009 16:37:12 -0500
Message-ID: <4B0C5208.60601@majjas.com>
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

Hi,

Newbie to this list. I've been using 2.6.32 & nouveau on F12. Things 
seem stable (although 3D performance is not great).

I do see kernel error messages whenever I change window focus. The 
specific fault numbers vary, however the sequence is always:

Nov 24 16:32:05 mail kernel: DRHD: handling fault status reg 702
Nov 24 16:32:05 mail kernel: DMAR:[DMA Read] Request device [02:00.0] 
fault addr 0
Nov 24 16:32:05 mail kernel: DMAR:[fault reason 06] PTE Read access is 
not set

The fault status reg cycles from from 2 to 702 by 100 with each set of 
messages.

I'm guessing this is a nouveau error as 2:00:0 is my Nvidia card (8800gts).

I'm also guessing that this is deeply intertwined with intel_iommu. I do 
have vt-d enabled.

I can enter this as a bug report, but wanted to see if anyone had 
suggestions first for resolving this (aside from disabling iommu).

Thanks,

Mike
