From: Guido Trentalancia <guido-D1bseh+SzQikhjTqA1DzBQ@public.gmane.org>
Subject: Problem with acceleration on NV50 generation card (hangs
 on black screen)
Date: Sun, 24 Jul 2011 16:14:20 +0200
Message-ID: <1311516860.3479.9.camel@vortex>
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

Hello !

I have recently filed a bug against the Nouveau driver:

https://bugs.freedesktop.org/show_bug.cgi?id=39498

The problem is that unfortunately it only works without acceleration by
using the NoAccel option set to "True" in xorg.conf (and it works very
slow, much slower than the "nv" driver and software rasterizer).

When the acceleration is not disabled (default NoAccel or explicitly set
to "False"), the X server hangs with an unresponsive black screen and
does not react to any of the combinations ctrl-alt-del or ctrl-alt-Fx
(although it seems that there is some hard-disk activity or sync) so
that the computer can only be powered off by pressing the power button.

The card that I have is an NVidia GeForce GT 330M detected as "NV50
generation card (0x0a5480a2)". Any binary NVidia driver from the
manufacturer does not work on Linux (up to latest version 280.11).

Can anybody please help out ?

Thanks very much. I would be very grateful because I have never been
able to use my graphic card properly (with acceleration) under Linux
since I bought the machine !

Regards,

Guido
