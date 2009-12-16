From: Jimmy Rentz <jedynamic-Bdlq13kUjeyLZ21kGMrzwg@public.gmane.org>
Subject: Re: [TEST REQUEST] nv40 "firmware" replacement
Date: Wed, 16 Dec 2009 01:05:51 -0500
Message-ID: <20091216010551.33185ec5@amd64linuxmsi.rentzhouse.lan>
References: <1260861250.5529.8.camel@nisroch>
	<20091215215445.51b514c4@amd64linuxmsi.rentzhouse.lan>
	<1260933551.2742.2.camel@araqiel>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1260933551.2742.2.camel@araqiel>
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

On Wed, 16 Dec 2009 13:19:11 +1000
Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> On Tue, 2009-12-15 at 21:54 -0500, Jimmy Rentz wrote:
> > On Tue, 15 Dec 2009 17:14:10 +1000
> > Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > 
> > > So, I've spent the last few days messing around with replacing
> > > our use of NVIDIA's context programs on GeForce 6/7 hardware and
> > > have something that works on the 4 (2xNV44, NV46, NV4B) cards I
> > > have.
> > > 
> > > The context programs are *much* less complex than NVIDIA's and
> > > don't handle nearly everything NVIDIA's do, however they do work
> > > for our needs, and it's as good a starting point as any.
> > > 
> > > I've attached the currently generated "firmware" in the same
> > > binary format we packages NVIDIA's in.  If people with the
> > > relevant hardware could install them, and report success/failure
> > > and the chipset they tested on (the whole "Detected an NVxx
> > > generation card" line from nouveau's dmesg output would be
> > > perfect), that'd be great!
> > > 
> > > I'm now working on moving the code that generated the firmware in
> > > the below tarball to the DRM, and after some testing before I do!
> > > 
> > > Ben.
> > 
> > I tested this on an nv4e and nv49 and kms+X works fine.
> Thank you!  Are you able to also install the gallium driver, and see
> if some 3D apps still work fine (where by fine I mean, as well as
> they do with NVIDIA's firmware) and don't cause corruption of your X
> session?
> 
> Ben.
glxgears+openarena work fine with both cards and with no X
corruption.  I saw no visible differences.
> 
> 
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
