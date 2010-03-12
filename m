From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: Re: Gallium driver and compatibility issues
Date: Fri, 12 Mar 2010 12:52:39 +0200
Message-ID: <20100312125239.4a29011c@farn>
References: <1268329369.2107.14.camel@brian.bconsult.de>
	<586c2acd1003111023y72ca711at32b69b88252673f3@mail.gmail.com>
	<1268336434.2397.3.camel@brian.bconsult.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1268336434.2397.3.camel-nwZTc+tSiniYW16jBriTx7NAH6kLmebB@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Uwe Bugla <uwe.bugla-Mmb7MZpHnFY@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Thu, 11 Mar 2010 20:40:34 +0100
Uwe Bugla <uwe.bugla-Mmb7MZpHnFY@public.gmane.org> wrote:

> Am Donnerstag, den 11.03.2010, 13:23 -0500 schrieb Younes Manton:
> > On Thu, Mar 11, 2010 at 12:42 PM, Uwe Bugla <uwe.bugla-Mmb7MZpHnFY@public.gmane.org>
> > wrote:
> > > Hi,
> > >
> > > I use two nv34 cards and I would like to test / try out / use
> > > the Gallium driver without drawbacks.

A multicard setup? According to
http://nouveau.freedesktop.org/wiki/FeatureMatrix
that is not supported yet.

What do you mean "without drawbacks"? Have only the apps
you select to use the experimental driver and all other
apps to use the stable software renderer? Do not install
nouveau_dri.so system-wide, then.

Note, that the Nvidia proprietary driver simply cannot live
together with Nouveau like this.

> > > Unfortunately this has not been working since I decided to
> > > install / compile nouveau drivers.

Problems are expected on the OpenGL front, if you install any
of the experimental, unreleased 3D drivers.

> > > My system is Debian Squeeze, my kernel is 2.6.34-rc1.
> > >
> > > The problem is:
> > >
> > > Every time I load nouveau_dri.so into RAM existing
> > > applications are broken / unusable (Example: gnome-games).

Without logs we cannot help at all.

> > > It does not matter if I overwrite existing versions of
> > > libglut*, libGLw*, libGLU*, libGL*, libEGL* or not - that
> > > does not make any difference.

Did you forget libglx? The X log would tell.

> > > The center of the problem is nouveau_dri.so and nothing else.
> > >
> > > Could it please be possible to modify this driver file so
> > > that it does NOT continue to break existing applications??

Yes. That is called "development". It is what people are
doing all the time. You whining about it does not make it
happen faster. Quite the contrary.

> > Don't install nouveau_dri.so globally. When you want to try it
> > with a specific application set
> > LIBGL_DRIVERS_PATH=/path/to/nouveau_dri.so in your env.
> 
> Thanks. Sounds plausible.
> 
> But:
> 1. Udev decides which driver is being loaded into memory at boot
> time. 2. I was asking for a _long term_ solution, not for a quick
> short term workaround without changing the driver itself.

udev has nothing to do with this. Udev only loads the kernel
modules. The 3D driver is not a kernel module, though it depends
on Nouveau DRM.

The long term solution is *long term*. Nouveau still does not
officially support 3D, although some reports of some 3D apps
working exist.

The current advice is to *never* install nouveau_dri.so
system-wide.

Also, you have failed to provide any logs nor descriptions
about what is broken and how. Therefore we cannot help.
My best guess is that you have parts of the prorietary Nvidia
driver still in your system (e.g. libglx).

If you want to try things, do follow
http://nouveau.freedesktop.org/wiki/GalliumHowto
and do not install the Gallium3D driver system-wide.

-- 
Pekka Paalanen
http://www.iki.fi/pq/
