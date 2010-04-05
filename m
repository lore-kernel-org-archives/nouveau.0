From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Blank screen at startup (conflict with VESA VGA)
Date: Mon, 5 Apr 2010 23:45:59 +0200
Message-ID: <20100405214559.GA4230@joi.lan>
References: <4BBA4F3C.9070606@epsm.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4BBA4F3C.9070606-GqzDj6/B2j8@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Didier Spaier <didier.spaier-GqzDj6/B2j8@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Mon, Apr 05, 2010 at 10:59:40PM +0200, Didier Spaier wrote:
> Hi all,
> 
> new to this list ;)
> 
> I have a Lenovo Thinkpad T61. lspci|grep VGA says:
> 01:00.0 VGA compatible controller: nVidia Corporation Quadro NVS 140M (rev a1)
> 
> I have Slacware64-13.0 and Slackware64-current installed.
> 
> Nouveau is modularized in all my kernels for -current.
> 
> A problem arise even if I don't want to use nouveau under X: unless nouveau be blacklisted in /etc/modprobe.d/blacklist.conf at startup,
> - when using one of the VESA modes at startup after a while screen goes blank and I get a warning in syslog e.g:
>    Apr  2 18:58:56 darkstar kernel: fb: conflicting fb hw usage nouveaufb vs VESA VGA - removing generic driver,

It should work. Please provide full kernel log.

> - no problem when using a VGA mode (text only),

But Nouveau framebuffer activates without errors, right?

> 
> this disregarding which X driver I use afterwards (I always start in console mode).
> 
> But according to this page:
> http://nouveau.freedesktop.org/wiki/KernelModeSetting
> I thought nouveaufb shouldn't conflict with vesafb ? Am I wrong ?
> 
> I tried with modules shipped in vanilla 2.6.33.1 as well as the last Nouveau kernel repository pulled from git: no luck in both cases.
> 
> I know there are easy workarounds: either use "VGA=ask", "VGA=ext" or "VGA=normal" as a lilo.conf option or blacklist nouveau -- which doesn't hurt anyway as nouveau will be loaded at X startup anyhow.
> 
> But this is still is an annoyance for newcomers as when they are trapped all they can do if they have a VESA mode in lilo.conf is launch another system or live CD/DVD and either edit lilo.conf and run lilo again or edit blacklist.conf to blacklist nouveau.
> 
> But still, before kindly requesting Patrick Volkerding to blacklist nouveau in -current for the time being, I wanted to now of another way to go if possible.
> 
> Thanks in advance for your answers,
> 
> Didier
