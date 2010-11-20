From: Anders Eriksson <aeriksson-97jfqw80gc6171pxa8y+qA@public.gmane.org>
Subject: Re: "(EE) NOUVEAU(0): Unable to allocate GART memory"
	(TNT-2)
Date: Sat, 20 Nov 2010 11:32:56 +0100
Message-ID: <20101120103256.8D3423BC00E@tippex.mynet.homeunix.org>
References: <20101116214015.15A3C940003@tippex.mynet.homeunix.org>
	<87wrocvobd.fsf@riseup.net>
	<20101117212826.016CF3BC00E@tippex.mynet.homeunix.org>
	<87lj4ptd5p.fsf@riseup.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-reply-to: <87lj4ptd5p.fsf-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Anders Eriksson <aeriksson-97jfqw80gc6171pxa8y+qA@public.gmane.org>
List-Id: nouveau.vger.kernel.org


currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org said:
> Weird, nouveau_bo_new() is returning -ENOMEM even though you should have
> plenty of GART space available. To rule out an AGP backend issue, can you try
> to reproduce it with "nouveau.noagp=1" in the kernel command line? (attach
> full kernel logs if you can) 

Actually, I ended up doing a kernel upgrade 2.6.35.7 to 2.6.37-rc2 and it went 
away

- (EE) NOUVEAU(0): Unable to allocate GART memory
+ (II) NOUVEAU(0): GART: Allocated 16MiB as a scratch buffer


I don't mind running a newer kernel. Any idea to bisect it kernel side for you 
guys?

BTW, I'm looking for a new card to replace this one as it has developed gray 
bands across the full screen for all fonts (i.e. black stuff on otherwise 
white background "leaks"). Some googling indicates that it's a common issue 
with TNT2 cards. So, now it's mostly if can help improve the driver for this 
rarely used/tested card. I should have a replacement in a month or so. 

/Anders
