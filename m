From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: drm-nouveau-next - write trapped by fbcon
Date: Thu, 5 Dec 2013 10:55:06 -0500
Message-ID: <CAKb7UviUWrYPww1R3r1CdX4R8nrnQpqopojcRSxqQDAvwthNMA@mail.gmail.com>
References: <20131205161724.204d6585@pluto.restena.lu>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20131205161724.204d6585-I2t2yFIzmohO7ya8xxV06g@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: =?ISO-8859-1?Q?Bruno_Pr=E9mont?= <bonbons-ud5FBsm0p/xEiooADzr8i9i2O/JbrIOy@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Thu, Dec 5, 2013 at 10:17 AM, Bruno Pr=E9mont
<bonbons-ud5FBsm0p/xEiooADzr8i9i2O/JbrIOy@public.gmane.org> wrote:
> Hi,
>
> With drm-nouveau-next branch on top of 3.13-rc2 and a few sound commits
> I get following errors in kernel log (repeating much more often).
> (once there was a corrupted fbcon with matrix-like strings of
> unrecognizable glyph-strings hanging down from screen top border)
>
> These errors do stop once I switch to Xorg.
>
> [   13.825627] nouveau E[     PFB][0000:02:00.0] trapped write at 0x00004=
08280 on channel 0x0000fee0 [unknown] BAR/PFIFO_WRITE/FB reason: PAGE_NOT_P=
RESENT
> [   13.826506] nouveau E[     PFB][0000:02:00.0] trapped write at 0x00004=
08280 on channel 0x0000fee0 [unknown] BAR/PFIFO_WRITE/FB reason: PAGE_NOT_P=
RESENT
> [   13.827319] nouveau E[     PFB][0000:02:00.0] trapped write at 0x00004=
08280 on channel 0x0000fee0 [unknown] BAR/PFIFO_WRITE/FB reason: PAGE_NOT_P=
RESENT
> [   13.828139] nouveau E[     PFB][0000:02:00.0] trapped write at 0x00004=
08280 on channel 0x0000fee0 [unknown] BAR/PFIFO_WRITE/FB reason: PAGE_NOT_P=
RESENT
> [   13.828957] nouveau E[     PFB][0000:02:00.0] trapped write at 0x00004=
00300 on channel 0x0000fee0 [unknown] BAR/PFIFO_WRITE/FB reason: PAGE_NOT_P=
RESENT
>
> System MBA2,1 with:
> 02:00.0 VGA compatible controller [0300]: NVIDIA Corporation C79 [GeForce=
 9400M] [10de:0870] (rev b1)

Do you also see these in 3.13-rc2 +
http://cgit.freedesktop.org/nouveau/linux-2.6/commit/?h=3Ddrm-nouveau-next&=
id=3Da7e4201f0f7d47e03b851f06f8987856e8d33083
? If not, you can reorder the patches (git rebase -i) and bisect the
rest. Basically the GPU is trying to write to some address that is
either completely bogus or is stale, and its internal MMU won't let
it.

  -ilia
