From: Andy Ritger <aritger-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: offer to help, DCB
Date: Tue, 24 Sep 2013 11:19:38 -0700
Message-ID: <20130924181938.GD27823@parker.nvidia.com>
References: <20130924044457.GA25785@parker.nvidia.com>
	<52413B42.9050101@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <52413B42.9050101-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Maarten Lankhorst <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Tue, Sep 24, 2013 at 12:12:02AM -0700, Maarten Lankhorst wrote:
> Hey,
> 
> Op 24-09-13 06:44, Andy Ritger schreef:
> > Hi Nouveau developers,
> >
> > NVIDIA is releasing public documentation on certain aspects of our GPUs,
> > with the intent to address areas that impact the out-of-the-box usability
> > of NVIDIA GPUs with Nouveau.  We intend to provide more documentation
> > over time, and guidance in additional areas as we are able.
> >
> > As a first step towards that, we've posted a document here:
> >
> >     ftp://download.nvidia.com/open-gpu-doc/DCB/1/DCB-4.0-Specification.html
> >
> > that documents the Device Control Block ("DCB") layout in the VBIOS.
> > The DCB describes board topology and the board's display connectors.
> >
> > I suspect much of the information in that document is not news for
> > the Nouveau community, but hopefully it will be helpful to confirm your
> > understanding or flesh out the implementation of a few unhandled cases.
> >
> > A few of us who work on NVIDIA's proprietary Linux GPU driver will pay
> > attention to nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org and try to chime in when
> > we can.
> >
> > If there are specific areas of documentation that would most help you, that
> > feedback would help NVIDIA prioritize our documentation efforts.
> >
> > If you have specific questions for NVIDIA, you can ask here, or direct
> > them to: open-gpu-doc-DDmLM1+adcqXj1p+fO2waQ@public.gmane.org

Sorry, I got the email address wrong.  The right address is:

gpu-public-documentation-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org

sorry I didn't double check the address before sending the announcement.

> > I can't promise we'll be able to answer
> > everything, but we'll provide best-effort in areas where we are able.
> You rock! :D

:)  Thanks, Maarten.

> Our biggest struggle at the moment is the video clocking and power management, which is highly device specific
> and depends on configuration too.

Those will be two of the more difficult areas for us to address, but
we'll see what can be done.

> A complete video bios documentation would be nice too, I understand that will
> take a bit longer than just the dcb. :)

BIOS-related information should be a bit easier to get through the
pipeline than other things, so we'll focus on that to start.

I'm looking forward to collaborating with you guys,
- Andy

> ~Maarten
