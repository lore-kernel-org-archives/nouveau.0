From: Pierre Pronchery <khorben-tmMSDyayuCodnm+yROfE0A@public.gmane.org>
Subject: Re: External monitor is blank with nouveau driver
Date: Sun, 21 Jun 2009 13:25:30 +0200
Message-ID: <4A3E18AA.1060908@defora.org>
References: <4A3D17EF.3090003@irbisnet.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <4A3D17EF.3090003-Ru+gAU1lvYpWk0Htik3J/w@public.gmane.org>
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

Andriy Bakay wrote:
> 
> I have the following hardware/software spec:

In my case:
Sun Ultra 24
NetBSD 5.0_STABLE (XEN3_DOM0) i386
NVIDIA Quadro FX370
X driver nouveau
Two LCD monitors over DVI

> I am connecting external monitor through VGA interface. I was able to
> detect it using command 'xrandr -q' and even turn it on:
> 
> $ xrandr --output VGA-0 --auto --below LVDS-0
> 
> the geometry of my desktop changed, but monitor remain blank.

I have a similar problem: when I start X, it defaults to clone mode but 
my secondary monitor remains blank. Playing with xrandr doesn't fix it.

Running X with the nv driver beforehand helps though: I get both heads 
working, and then if I restart X it works with nouveau as well.

Unfortunately I can't test fixes at the moment, or only against the 
driver as it was in May 7th (because I'm not tracking Mesa or DRM 
repositories atm).

I hope this helps anyway,
-- 
khorben
