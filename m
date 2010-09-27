From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: Re: GeForce FX5200 dual DVI & Samsung 204b
Date: Tue, 28 Sep 2010 00:41:17 +0300
Message-ID: <20100928004117.0a0ae0ca@daedalus.pq.iki.fi>
References: <4C9E0167.8000507@pfu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <4C9E0167.8000507-t9zbU3WrWHI@public.gmane.org>
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

On Sat, 25 Sep 2010 16:04:23 +0200
Grzesiek S=F3jka <pld-t9zbU3WrWHI@public.gmane.org> wrote:

> Im using GeForce FX5200 dual DVI graphics adapter connected with
> two Samsung 204b monitors. At the moment I'm using binary nvidia
> drivers and everything works fine but I'm forced to switch to
> nouveau. Unfortunately there are problems. It seems that
> nouveau.ko wrongly detects the PixelClock of my monitors. More
> precisely, after loading of nouveu.ko the screen starts to blink.
> According to my experience the problem is too hight PixelClock.
> Moreover, in the /var/log/Xorg.0.log you can find the line:
> =

> NOUVEAU(0): Ranges: V min: 56 V max: 75 Hz, H min: 30 H max: 81
> kHz, PixClock max 175 MHz
> =

> which is false. The maximum PixClk for Sumsung 204b is 162MHz. I
> was trying to play with the video=3D kernel parameter but there is
> no way to force the PixClk.

Are you saying that forcing a low-refresh-rate mode via video=3D
kernel argument does not help?

But you still do get a good picture on the framebuffer console,
do you not? In that case, X is overriding what kernel thinks is
the best mode, so you should clean up the X config.

If wiping the X config does not help, post kernel and X logs.


Cheers.

-- =

Pekka Paalanen
http://www.iki.fi/pq/
