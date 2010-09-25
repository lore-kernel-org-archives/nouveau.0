From: =?ISO-8859-2?Q?Grzesiek_S=F3jka?= <pld-t9zbU3WrWHI@public.gmane.org>
Subject: GeForce FX5200 dual DVI & Samsung 204b
Date: Sat, 25 Sep 2010 16:04:23 +0200
Message-ID: <4C9E0167.8000507@pfu.pl>
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

Hi there,

Im using GeForce FX5200 dual DVI graphics adapter connected with two
Samsung 204b monitors. At the moment I'm using binary nvidia drivers and
everything works fine but I'm forced to switch to nouveau. Unfortunately
there are problems. It seems that nouveau.ko wrongly detects the
PixelClock of my monitors. More precisely, after loading of nouveu.ko
the screen starts to blink. According to my experience the problem is
too hight PixelClock. Moreover, in the /var/log/Xorg.0.log you can find
the line:

NOUVEAU(0): Ranges: V min: 56 V max: 75 Hz, H min: 30 H max: 81 kHz,
PixClock max 175 MHz

which is false. The maximum PixClk for Sumsung 204b is 162MHz. I was
trying to play with the video= kernel parameter but there is no way to
force the PixClk. I was also trying to edit the suitable ModeLine in the
drivers/gpu/drm/drm_edid_modes.h but I thing nouveau.ko ignores it. So
my question is what to change (in the kernel source) to override the
detection and force MaxPixelClock to 162MHz just to make sure that the
problem is related to PixelClock. To build the kernel I used the kernel
tree downloaded from nouveau about one week ago.

Thanks in advance for any help.
