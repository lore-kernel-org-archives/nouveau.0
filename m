From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [TEST REQUEST] nv40 "firmware" replacement
Date: Tue, 15 Dec 2009 20:12:59 +1000
Message-ID: <1260871979.5529.10.camel@nisroch>
References: <1260861250.5529.8.camel@nisroch>
	<BAY107-W70C91C43CFE090B3D0E42E6880@phx.gbl>
Reply-To: skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <BAY107-W70C91C43CFE090B3D0E42E6880-MsuGFMq8XAE@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: STEVEN WARD <stevenward666-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Tue, 2009-12-15 at 10:09 +0000, STEVEN WARD wrote:
> Dear Ben,
>                  I would like to test the "firmware" for you,but where
> do I exactly put them into?
Ah sorry, I should've been clearer about that.  Make sure you're running
the latest nouveau DRM (from either nouveau git, or latest linux git)
and the driver will look for the firmware in /usr/lib/firmware/nouveau.

Ben.
> Regards,
>                STEVE555
> 
> > From: skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
> > To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> > Date: Tue, 15 Dec 2009 17:14:10 +1000
> > Subject: [Nouveau] [TEST REQUEST] nv40 "firmware" replacement
> > 
> > So, I've spent the last few days messing around with replacing our
> use
> > of NVIDIA's context programs on GeForce 6/7 hardware and have
> something
> > that works on the 4 (2xNV44, NV46, NV4B) cards I have.
> > 
> > The context programs are *much* less complex than NVIDIA's and don't
> > handle nearly everything NVIDIA's do, however they do work for our
> > needs, and it's as good a starting point as any.
> > 
> > I've attached the currently generated "firmware" in the same binary
> > format we packages NVIDIA's in. If people with the relevant hardware
> > could install them, and report success/failure and the chipset they
> > tested on (the whole "Detected an NVxx generation card" line from
> > nouveau's dmesg output would be perfect), that'd be great!
> > 
> > I'm now working on moving the code that generated the firmware in
> the
> > below tarball to the DRM, and after some testing before I do!
> > 
> > Ben.
> 
> 
> ______________________________________________________________________
> Use Hotmail to send and receive mail from your different email
> accounts. Find out how.
