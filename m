From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [TEST REQUEST] fermi (GeForce 4xx/5xx) ucode
Date: Wed, 25 May 2011 16:57:07 +1000
Message-ID: <1306306631.6559.6.camel@nisroch>
Reply-To: skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
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

Hey,

I've just committed, to nouveau git, an initial attempt at a replacement
for NVIDIA's PGRAPH ucode.  It's been tested on NVC0 and NVC4 thus far,
but in theory has support for NVC1, NVC3, NVC8 and NVCE also, it'd be
good to see how people with these chipsets fare.

If you're on NVC1/NVC8/NVCE, current nouveau git will disable
acceleration by default anyway, as NVC1 is known broken, and NVC8/NVCE
I'm not sure has ever been tested.  To force nouveau to attempt
acceleration, simply pass "noaccel=0" as an option to the nouveau kernel
module.

Also, if there's someone out there reading this with a GF119 (NVD9)
chipset, I'd love to get a mmiotrace of the NVIDIA binary driver on your
card.

Nouveau can be configured to use NVIDIA's ucode ("ctxfw=1" module
option), I thought it might be useful to switch back and forth to
compare stablity/bugs/etc, at least initially.

There's likely going to be a number of issues to sort out, so please let
me know if you spot any!

Thanks!
Ben.
