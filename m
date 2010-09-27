From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [drm] failed to open device
Date: Mon, 27 Sep 2010 18:42:29 +1000
Message-ID: <1285576949.2360.4.camel@nisroch>
References: <AANLkTim1Qp9Wd_P=rQEKh3Mp8zukPLwqkrg-nY7u3SU2@mail.gmail.com>
	<1285566262.2360.0.camel@nisroch>
	<AANLkTinqXrW0zeBX-nu_W7O5ic6mY4EHi=mLRvdDqd_v@mail.gmail.com>
	<1285568554.2360.3.camel@nisroch>
	<AANLkTimvaY9VHm6Ov=q8T+DtDJghSMWoCycAMXC5C8hg@mail.gmail.com>
Reply-To: skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <AANLkTimvaY9VHm6Ov=q8T+DtDJghSMWoCycAMXC5C8hg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Dmitri Sosnik <dimavs-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Mon, 2010-09-27 at 16:43 +1000, Dmitri Sosnik wrote:
> > That's the problem.  Nouveau requires KMS enabled.
> 
> Ah, ok, got it.
> 
> > Does the NVIDIA binary driver work?  If so, if you could trace it
> > (http://nouveau.freedesktop.org/wiki/MmioTrace) that'd be very helpful
> > to figure out what to do.
> >
> 
> Nope, it fails with "failed to copy vbios to system memory" message.
Right.  The equivilant to what you're seeing nouveau fail with!

I'm not sure what to suggest from here.

> 
> Cheers,
> D
