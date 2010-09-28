From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: Re: GeForce FX5200 dual DVI & Samsung 204b
Date: Tue, 28 Sep 2010 17:02:27 +0300
Message-ID: <20100928170227.00665f76@daedalus.pq.iki.fi>
References: <4C9E0167.8000507@pfu.pl>
	<20100928004117.0a0ae0ca@daedalus.pq.iki.fi>
	<4CA1C6C0.1000709@pfu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <4CA1C6C0.1000709-t9zbU3WrWHI@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Grzesiek =?ISO-8859-1?Q?S=F3jka?= <pld-t9zbU3WrWHI@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Tue, 28 Sep 2010 12:43:12 +0200
Grzesiek S=F3jka <pld-t9zbU3WrWHI@public.gmane.org> wrote:

> On 09/27/10 23:41, Pekka Paalanen wrote:
> > Are you saying that forcing a low-refresh-rate mode via video=3D
> > kernel argument does not help?
> > =

> > But you still do get a good picture on the framebuffer console,
> > do you not? In that case, X is overriding what kernel thinks is
> > the best mode, so you should clean up the X config.
> > =

> > If wiping the X config does not help, post kernel and X logs.
> =

> 1. At the moment I try to get a proper image on the console. I
> put the comment about the X-log only to explain why I thing that
> there is something wrong with PixClk. Actually the screen blinks
> in the some way at the console and when I run the X-server. I was
> trying to play with the ModeLine but it seems to be ignored. For
> example whatever i put +hsync +vsync or -hsync -vsync I always
> get at the OSD info that both polarisation are positive. So it
> looks like all the timings and etc. are set by the nouveau.ko not
> by the xorg nouveau driver.

Are you sure X even runs and doesn't die too soon?
Anyway, one thing at a time, better disable X for now to debug this.

You said you have dual monitors, does the problem occur with only one?

> 2. Whatever I put to the video=3D I always get the some problem. It
> looks a little bit like only the resolutions is taken and all the
> rest is ignored. I do not have the way to check it but my LCD
> always claims that the mode is 1600x1200@60 horizontal 74.9KHz
> and both polarizations positive. It does not display the PixClk.

I forgot about the dual monitors. When you have more than one
output active, it is best to be explicit on which output is being
set via video=3D argument, see Forcing Modes at
http://nouveau.freedesktop.org/wiki/KernelModeSetting

My idea with video=3D was the timings are (sometimes?) computed
with a standard formula, CVT or GTF.
I would expect lower resolution or refresh to produce lower
pixel clock. Experimenting with non-standard modes might be
interesting.

> So the situation is very strange. I think that the good start
> would be checking what are the current rates of the vertical,
> horizontal and pixclk. Is it a way to force nouveau.ko to put it
> into the dmesg?? If not then maybe I could just hard-code
> something like: printk("h=3D%d,V=3D%d,P=3D%d, ???
> into the source tree. The question is where to put it and what
> are the names of the appropriate variables.

Nouveau kernel module has reg_debug option which would show
the raw values being programmed to hardware. drm.ko has the
debug parameter, for which I don't have the documentation at
hand here. It is a bitmask, too. Someone else should guide
you with the source tree.

I think it would be best to make a report in bugzilla,
where you can attach kernel and X logs. X is by default
more verbose, like you said. In X, Option "ModeDebug" "true"
in the Device section will give even more information. This
should be done with otherwise minimal xorg.conf.

Did you ever need anything special with the proprietary
driver, like ModeLines or EDID data from file in xorg.conf?


Thanks.

PS. samsung syncmaster 204b, eh? I got one today, I just need
to replace all the capacitors to get it working. Cheap caps
syndrome, I assume.

-- =

Pekka Paalanen
http://www.iki.fi/pq/
