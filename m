From: =?ISO-8859-2?Q?Grzesiek_S=F3jka?= <pld-t9zbU3WrWHI@public.gmane.org>
Subject: Re: GeForce FX5200 dual DVI & Samsung 204b
Date: Tue, 05 Oct 2010 12:17:30 +0200
Message-ID: <4CAAFB3A.8010804@pfu.pl>
References: <4C9E0167.8000507@pfu.pl>	<20100928004117.0a0ae0ca@daedalus.pq.iki.fi>
	<4CA1C6C0.1000709@pfu.pl>	<20100928170227.00665f76@daedalus.pq.iki.fi>
	<4CA21515.4030903@pfu.pl>	<20100929193136.644e0d68@daedalus.pq.iki.fi>	<878w2jike0.fsf@riseup.net>
	<4CA4A934.4080109@pfu.pl>	<87zkuzgqsv.fsf@riseup.net>
	<4CA4D199.8010403@pfu.pl>	<87pqvuhksw.fsf@riseup.net>
	<4CA5B64D.8000608@pfu.pl> <871v88hgam.fsf@riseup.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <871v88hgam.fsf-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
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
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On 10/02/10 15:31, Francisco Jerez wrote:
> Ah, I think you're hitting the bandwidth limitation of the nv34
> integrated TMDS transmitter. The attached patch should help with the
> console modesetting problem, but you'll still need to set the modelines
> manually (and force panel rescaling) if you want to go up to 1600x1200,
> because your GPU *cannot* handle the video mode your monitor is asking
> for.

Your patch works fine. Now I have clear image at both displays. Only 
disadvantage is that the resolution is 1280x1024 (PixClk 135MHz). So I 
was wondering if it is possible to force particular modeline (by editing 
the kernel source tree??). The mode:

Modeline "1600x1200_def" 144  1600 1628 1788 1920  1200 1201 1204 1250

works fine with the XServer. Is it possible to force it at the console??

Thanks again!

PS. I'm afraid that my system is not very stable when the AGP support is 
turned on both using the nouveau kernel source tree and the PLD patched 
2.6.35-5 version with an extra amd-k7-agp patch. The Xserver uses the 
driver:
[    38.842] (II) Module nouveau: vendor="X.Org Foundation"
[    38.842]    compiled for 1.9.0, module version = 0.0.16
[    38.842]    Module class: X.Org Video Driver
[    38.842]    ABI class: X.Org Video Driver, version 8.0
