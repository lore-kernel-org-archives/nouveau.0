From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: drm-nouveau-next - write trapped by fbcon
Date: Wed, 1 Jan 2014 15:43:16 -0500
Message-ID: <CAKb7UvhcLMZYZ8upTOQ7SA_NfS0mySyMRkCkx3agNyr=OKjQrQ@mail.gmail.com>
References: <20131205161724.204d6585@pluto.restena.lu>
	<CAKb7UviUWrYPww1R3r1CdX4R8nrnQpqopojcRSxqQDAvwthNMA@mail.gmail.com>
	<20131206095858.6dcac328@pluto.restena.lu>
	<20131211124311.016c005f@neptune.home>
	<CAKb7UvjcgYkPeU8gTegSOCaWM99g=-Eo832aanpVGv7g=SfFoA@mail.gmail.com>
	<20140101202950.GB25483@fante.int.rhx>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20140101202950.GB25483-S0+YfJpb8SRPart8M9ItPQ@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Michele Baldessari <michele-Vrs1pLNSz9odnm+yROfE0A@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, =?ISO-8859-1?Q?Bruno_Pr=E9mont?= <bonbons-ud5FBsm0p/xEiooADzr8i9i2O/JbrIOy@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Wed, Jan 1, 2014 at 3:29 PM, Michele Baldessari <michele-Vrs1pLNSz9odnm+yROfE0A@public.gmane.org> wro=
te:
> On Wed, Dec 11, 2013 at 07:21:05AM -0500, Ilia Mirkin wrote:
>> >> On Thu, 5 Dec 2013 10:55:06 -0500 Ilia Mirkin wrote:
>> >> > On Thu, Dec 5, 2013 at 10:17 AM, Bruno Pr=E9mont wrote:
>> >> > > With drm-nouveau-next branch on top of 3.13-rc2 and a few sound c=
ommits
>> >> > > I get following errors in kernel log (repeating much more often).
>> >> > > (once there was a corrupted fbcon with matrix-like strings of
>> >> > > unrecognizable glyph-strings hanging down from screen top border)
>> >> > >
>> >> > > These errors do stop once I switch to Xorg.
>> >> > >
>> >> > > [   13.825627] nouveau E[     PFB][0000:02:00.0] trapped write at=
 0x0000408280 on channel 0x0000fee0 [unknown] BAR/PFIFO_WRITE/FB reason: PA=
GE_NOT_PRESENT
>> >> > > [   13.826506] nouveau E[     PFB][0000:02:00.0] trapped write at=
 0x0000408280 on channel 0x0000fee0 [unknown] BAR/PFIFO_WRITE/FB reason: PA=
GE_NOT_PRESENT
>> >> > > [   13.827319] nouveau E[     PFB][0000:02:00.0] trapped write at=
 0x0000408280 on channel 0x0000fee0 [unknown] BAR/PFIFO_WRITE/FB reason: PA=
GE_NOT_PRESENT
>> >> > > [   13.828139] nouveau E[     PFB][0000:02:00.0] trapped write at=
 0x0000408280 on channel 0x0000fee0 [unknown] BAR/PFIFO_WRITE/FB reason: PA=
GE_NOT_PRESENT
>> >> > > [   13.828957] nouveau E[     PFB][0000:02:00.0] trapped write at=
 0x0000400300 on channel 0x0000fee0 [unknown] BAR/PFIFO_WRITE/FB reason: PA=
GE_NOT_PRESENT
>> >> > >
>> >> > > System MBA2,1 with:
>> >> > > 02:00.0 VGA compatible controller [0300]: NVIDIA Corporation C79 =
[GeForce 9400M] [10de:0870] (rev b1)
>> >> >
>> >> > Do you also see these in 3.13-rc2 +
>> >> > http://cgit.freedesktop.org/nouveau/linux-2.6/commit/?h=3Ddrm-nouve=
au-next&id=3Da7e4201f0f7d47e03b851f06f8987856e8d33083
>> >> > ? If not, you can reorder the patches (git rebase -i) and bisect the
>> >> > rest. Basically the GPU is trying to write to some address that is
>> >> > either completely bogus or is stale, and its internal MMU won't let
>> >> > it.
>> >>
>> >> If I remember correctly these did not happen with Linus' rc2 but only
>> >> do happen with drm-nouveau-next on top of it.
>> >>
>> >> I will check and bisect though probably will not get time to complete
>> >> bisect before late Saturday.
>> >>
>> >>
>> >> A display glitch during kernel boot with fbcon might be related to th=
is.
>> >> (very wild guess based on when the trapped writes happen)
>> >> The penguin logo shown by fbcon looks like memcopy'ed to a tiled
>> >> framebuffer without respecting the fact that framebuffer is tiled.
>> >
>> > It was introduced somewhere between 3.12 and 3.13-rc2 though does not =
happen
>> > on every boot and when it happens it might be only a couple of trapped=
 writes
>> > or a whole lot flooding complete log buffer.
>> >
>> > Visually it manifests itself as a scrambled framebuffer
>> > (looking like tiled versus untiled writing to framebuffer).
>> > When it happens, it seem to be correlated to call to dialog to ask for
>> > luks password and screen scrambling happens when boot messages
>> > (kernel/userspace) show/scroll by [they wipe out some scrambled area
>> > when scrolling by].
>> >
>> > Unfortunately it will be rather hard to bisect because sometimes it do=
es not
>> > happen.
>> > Adding drm-nouveau-next on top of rc2/rc3 does no apparent difference.
>>
>> A shot in the dark -- try booting with nouveau.config=3DNvMSI=3D0. We
>> already disable MSI for NVAA, perhaps we should do it for NVAC as
>> well. Although the blob drivers have it enabled... but we could be
>> doing something wrong.
>
> Hi Ilia,
>
> FWIW a Fedora user got those messages on stock 3.13-rc6 with and without =
the
> "nouveau.config=3DnvMSI=3D0" boot option:
> [   10.812029] nouveau E[     PFB][0000:01:00.0] trapped write at 0x00005=
25500 on channel 0x0001fed0 [unknown] BAR/PFIFO_WRITE/FB reason: PAGE_NOT_P=
RESENT
>
> This is via BZ https://bugzilla.redhat.com/show_bug.cgi?id=3D927451

That bug is about someone with a NV84, so my comment about NVAA/NVAC
similarities doesn't apply. But it's good to know that MSI isn't at
fault (probably). I guess it's bisect time.

  -ilia
