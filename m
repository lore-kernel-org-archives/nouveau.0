From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: Re: Blank screen at startup (conflict with VESA VGA)
Date: Tue, 6 Apr 2010 01:43:38 +0300
Message-ID: <20100406014338.752ab0a3@daedalus.pq.iki.fi>
References: <4BBA4F3C.9070606@epsm.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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

On Mon, 05 Apr 2010 22:59:40 +0200
Didier Spaier <didier.spaier-GqzDj6/B2j8@public.gmane.org> wrote:

> I have a Lenovo Thinkpad T61. lspci|grep VGA says:
> 01:00.0 VGA compatible controller: nVidia Corporation Quadro NVS
> 140M (rev a1)
> 
> I have Slacware64-13.0 and Slackware64-current installed.
> 
> Nouveau is modularized in all my kernels for -current.
> 
> A problem arise even if I don't want to use nouveau under X:
> unless nouveau be blacklisted in /etc/modprobe.d/blacklist.conf
> at startup,
> - when using one of the VESA modes at startup after a while
> screen goes blank and I get a warning in syslog e.g: Apr  2
> 18:58:56 darkstar kernel: fb: conflicting fb hw usage nouveaufb
> vs VESA VGA - removing generic driver,

This message is the expected behaviour. It is not an error.
It means the vesafb hand-over is working, or at least it
is attempted.

At what stage does the screen go blank? At X startup?

> - no problem when using a VGA mode (text only),
> 
> this disregarding which X driver I use afterwards (I always start
> in console mode).

Are you trying to use nouveau.ko in kernel, and a non-Nouveau
X driver at the same time? That cannot work.

If nouveau.ko is loaded, the only option for X is to use
the nouveau driver (or perhaps fbdev). Any other driver,
e.g. "vesa" or "nv", will lead to trouble.

What kind of setup are you trying to run in this regard?

> But according to this page:
> http://nouveau.freedesktop.org/wiki/KernelModeSetting
> I thought nouveaufb shouldn't conflict with vesafb ? Am I wrong ?

The hand-over should work: when nouveaufb initialises, vesafb
gets automatically deactivated.

In any case, complete kernel and X logs will help to diagnose
your situation.

-- 
Pekka Paalanen
http://www.iki.fi/pq/
