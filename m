From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Quadro NVS 420/450 regression
Date: Fri, 30 Aug 2013 11:47:32 -0400
Message-ID: <CAKb7UvjBPxK3pH4PUHYb=2wYkVtocWrurRRifq9xJ0x4yxKzSg@mail.gmail.com>
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
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Hi Ben,

Someone came in to the channel to report that the outputs on the
second gpu of the NVS 420 were not being detected properly. Emil
tracked it down to the pclass == PCI_CLASS_DISPLAY_VGA check in
nouveau_display that you added in e412e95a in order to avoid
modesetting on Tesla cards. This can be worked around by specifying
nouveau.modeset=1.

I think it's a little ridiculous to require all NVS420/450 users to
use nouveau.modeset=1, things should Just Work (tm). But I also don't
want to just break stuff for Tesla, and I don't really know what the
landscape of those "3d accelerator" cards is. So... what do you think
the best approach is here? A whitelist? A blacklist? Relying on
vbios's dcb.entries > 0 saving us (note that this check was not there
when you checked in that commit)?

  -ilia
