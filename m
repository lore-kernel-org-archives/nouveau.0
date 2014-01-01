From: Michele Baldessari <michele-Vrs1pLNSz9odnm+yROfE0A@public.gmane.org>
Subject: Re: drm-nouveau-next - write trapped by fbcon
Date: Wed, 1 Jan 2014 20:53:06 +0000
Message-ID: <20140101205306.5fed80d6@fante.int.rhx>
References: <20131205161724.204d6585@pluto.restena.lu>
	<CAKb7UviUWrYPww1R3r1CdX4R8nrnQpqopojcRSxqQDAvwthNMA@mail.gmail.com>
	<20131206095858.6dcac328@pluto.restena.lu>
	<20131211124311.016c005f@neptune.home>
	<CAKb7UvjcgYkPeU8gTegSOCaWM99g=-Eo832aanpVGv7g=SfFoA@mail.gmail.com>
	<20140101202950.GB25483@fante.int.rhx>
	<CAKb7UvhcLMZYZ8upTOQ7SA_NfS0mySyMRkCkx3agNyr=OKjQrQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAKb7UvhcLMZYZ8upTOQ7SA_NfS0mySyMRkCkx3agNyr=OKjQrQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Bruno =?UTF-8?B?UHLDqW1vbnQ=?= <bonbons-ud5FBsm0p/xEiooADzr8i9i2O/JbrIOy@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Wed, 1 Jan 2014 15:43:16 -0500
Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> wrote:

> On Wed, Jan 1, 2014 at 3:29 PM, Michele Baldessari
> > FWIW a Fedora user got those messages on stock 3.13-rc6 with and
> > without the "nouveau.config=nvMSI=0" boot option:
> > [   10.812029] nouveau E[     PFB][0000:01:00.0] trapped write at
> > 0x0000525500 on channel 0x0001fed0 [unknown] BAR/PFIFO_WRITE/FB
> > reason: PAGE_NOT_PRESENT
> >
> > This is via BZ https://bugzilla.redhat.com/show_bug.cgi?id=927451
> 
> That bug is about someone with a NV84, so my comment about NVAA/NVAC
> similarities doesn't apply. But it's good to know that MSI isn't at
> fault (probably). I guess it's bisect time.

ACK. I'll try to bisect with the user and report back.

Thanks,
Michele
