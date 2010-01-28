From: Stephane Marchesin <stephane.marchesin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: 2.6.33 vs. NVIDIA GForce GT 220
Date: Wed, 27 Jan 2010 18:28:06 -0800
Message-ID: <6a89f9d51001271828t54a28002k21ec96692af196b9@mail.gmail.com>
References: <20100112134335.GA21783@atrey.karlin.mff.cuni.cz>
	<20100123181817.GA2909@joi.lan> <201001231828.00557.koriakin@0x04.net>
	<20100126094740.GC10858@atrey.karlin.mff.cuni.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20100126094740.GC10858-jyMamyUUXNJG4ohzP4jBZS1Fcj925eT/@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Tue, Jan 26, 2010 at 01:47, Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org> wrote:
> Hi!
>
>> > > I tried enabling staging nvidia driver on GT220, but apparently driv=
er
>> > > does not know about it. Unfortunately, I have one of those cards her=
e.
>> > >
>> > > (I wonder... is there better mailing list? MAINTAINERS only lists
>> > > linux-fbdev....)
>>
>> The list is nouveau-PD4FTy7X32lNgt0PjOBp9xlNPtJONSTn@public.gmane.org And driver knows about GT220 =
just
>> fine, I've been using it for a month or two on GT220 already. Don't
>> bother
>
> Perhaps nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org should be added to MAINTAINERS?
>
>> about the "supported cards" lists in xf86-video-nouveau or wherever else=
, the
>> driver will happily bind to any nvidia video card with known generation,=
 even
>> if nobody has seen that precise model before.
>
> Unfortunately, the driver does not seem happy:
>
> Jan 18 12:56:38 pma kernel: [ =A0 =A00.491073] nvidiafb 0000:01:00.0: PCI
> INT A -> GSI 16 (level, low) -> IRQ 16
> Jan 18 12:56:38 pma kernel: [ =A0 =A00.491507] nvidiafb: Device ID:
> 10de0a20
> Jan 18 12:56:38 pma kernel: [ =A0 =A00.491546] Chipset is 10de0a20
> Jan 18 12:56:38 pma kernel: [ =A0 =A00.491584] nvidiafb: unknown NV_ARCH
> Jan 18 12:56:38 pma kernel: [ =A0 =A00.492119] vga16fb: initializing
>

Hmm, but this is not nouveau, this is nvidiafb...

Stephane
