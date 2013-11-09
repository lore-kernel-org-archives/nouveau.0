From: Roy Spliet <rspliet-pPYjZ15w/Xhulxpn9UvDqw@public.gmane.org>
Subject: [PATCH] drm/nouveau/clk: Initial implementation for
	reclocking NVAA/NVAC
Date: Sat,  9 Nov 2013 19:51:58 +0100
Message-ID: <1384023120-11958-1-git-send-email-rspliet@eclipso.eu>
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
To: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Nouveau Mailinglist <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Reclocking of NVAA/NVAC is substantially different from NV50+, enough to justify a separate clock implementation. This code is a forward-port of reclocking code that has been sitting in a branch for a while, and has been tested on my NVAC. Traces show no significant reasons why this shouldn't work on NVAA, but testers are always welcome. And since these are IGPs without dedicated RAM to reclock, I'm quite confident this should work on the majority of machines (if not all).

In order to reclock, PFIFO must be paused. The first patch hooks up the corrent pausing method for NV50/NV84. Unfortunately, SUBDEV_CLOCK is initialised before ENFINE_FIFO, leading to a nullptr dereference when trying to reclock using config="NvClkMode=xx". Although "failure" on other cards is not as explicit, they do seem to stir up some registers in the PFIFO space as well. I am therefore led to believe the proper fix is initialising PFIFO earlier. However, although I can simply reorder some bits in device.h, I don't oversee the consequences of doing so. May I ask you to look into this for me Ben?

Apart from that, all works fine! Reclocking through the sysfs interface is as stable as I can hope for... at least on my machine.
