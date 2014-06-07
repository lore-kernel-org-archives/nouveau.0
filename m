From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: PROBLEM: new kernel 3.15.0-rc8 hangs completely with
 CONFIG_DRM_NOUVEAU enabled
Date: Sat, 7 Jun 2014 17:42:11 -0400
Message-ID: <CAKb7Uvjz0f5q35MY6jYhURT2DSVgFKm1dkLHD-bpdFD+gJcJRg@mail.gmail.com>
References: <53922B6D.8020004@gmx.de>
 <CAKb7UvjPjNC=3KeKa8YLWoRZiUtw8YAZcMXYSTfVBFCcT0kMQg@mail.gmail.com>
 <5393858D.1060509@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <5393858D.1060509-Mmb7MZpHnFY@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Christian Wehrmeyer <c.wehrmeyer-Mmb7MZpHnFY@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Sat, Jun 7, 2014 at 5:35 PM, Christian Wehrmeyer <c.wehrmeyer-Mmb7MZpHnFY@public.gmane.org> wrote:
> Yes, you are right - the Intel-chip is connected to the display, it just
> offloads 3D work to do to the nVidia-chip, which isn't even to tell how
> to get the EDID. I just wanted to try it out, simply for two reasons:
>
> 1. I heard that nouveau now "supports" the chip, and since I got the
> hardware, I wanted to try it out - just for the fun of it. :)

There are a lot of pieces to nouveau. The parts where GM107 is
supported are KMS and now the gallium3d driver in mesa. However in
order to actually make any use of that driver, the kernel driver has
to support acceleration, which it presently doesn't without blob
firmware. Also the DDX doesn't support the chip, which is required for
X to do anything useful with it, including 3d offloading.

> 2. As far as I am informed, a way to support you guys is to run the
> latest version and do status reports.

Yep, much appreciated.

>
> No, my Xorg log does not contain that line. That's because I forbid X to
> add any GPUs that were not defined in my /etc/X11/xorg.conf, and I just
> added the Intel driver, not the nouveau driver:
>
> Section "ServerLayout"
> ...
>         Option          "AutoAddGPU" "false"
> ...
> EndSection
>
> Section "Device"
> ...
>         Identifier      "Card0"
>         Driver          "intel"
>         BusID           "PCI:0:2:0"
>
>         Option          "AccelMethod"   "sna"
>         Option          "TearFree"      "true"
>         Option          "DRI"           "true"
> ...
> EndSection

Hm, OK. So then it's rather surprising that starting X has any effect
on anything related to nouveau... I guess it probably pokes the
/dev/dri nodes which is enough to get some sort of badness to happen?
Not sure.

  -ilia
