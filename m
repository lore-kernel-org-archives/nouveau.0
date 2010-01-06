From: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Removal of Non-KMS support
Date: Wed, 6 Jan 2010 23:20:15 +0100
Message-ID: <6d4bc9fc1001061420ieb0ed36p3f2f8bf703c6ee47@mail.gmail.com>
References: <1262755950.2346.5.camel@araqiel> <87iqbfhrvr.fsf@riseup.net>
	<6d4bc9fc1001061416h39a64a13r7b2d5c4efde1f868@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <6d4bc9fc1001061416h39a64a13r7b2d5c4efde1f868-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

It should be Acked-by (notice the lack of capital b):

Acked-by: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

And curro_ =3D=3D Francisco Jerez, i was thinking in irc mode.

On Wed, Jan 6, 2010 at 11:16 PM, Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wr=
ote:
> I had a quick look, and i have nothing to add. I must say a signed off
> is inappropriate here, since we are neither the original copyright
> holder or any of the subsequent "gateways". Depending on the level of
> checking either an acked-by or reviewed-by is the right thing to do.
> Since i did not check the patch line by line, and only agree with the
> intention of the patch:
>
> Acked-By: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>
> Assuming curro_ concerns are dealt with.
>
> On Wed, Jan 6, 2010 at 9:59 PM, Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org> w=
rote:
>> Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:
>>
>>> I did a very quick pass at removing all the non-KMS support from the
>>> DDX. =A0It's tested on G80 but nowhere else currently, I thought some
>>> discussion would be a good idea rather than just ripping it out :)
>>>
>>> The non-KMS paths are messy, and lets face it, rotting badly. =A0IMO the
>>> KMS code is stable enough now that we can continue without the UMS
>>> crutch, and indeed, the KMS code supports a lot more chipsets
>>> (particularly on GF8 and up) than the UMS code ever will.
>>>
>>> I've left the Xv overlay code intact, but ifdef'd out. =A0I want to bri=
ng
>>> support back with KMS enabled (thinking of older chipsets where the
>>> blitter sucks), so it made sense to leave the old code there for now.
>>>
>>> So, who has some Signed-off-by's :)
>>
>> I'm very happy that we're finally getting rid of this :), besides a few
>> comments, you got my blessing:
>> Signed-off-by: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
>>
>>>
>>> Ben.
>>>
>>>
>>> _______________________________________________
>>> Nouveau mailing list
>>> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
>>> http://lists.freedesktop.org/mailman/listinfo/nouveau
>>
>> Some snips from the patch in question:
>>
>>> [...]
>>> diff --git a/src/drmmode_display.c b/src/drmmode_display.c
>>> index e37e7c1..3d2df8d 100644
>>> --- a/src/drmmode_display.c
>>> +++ b/src/drmmode_display.c
>>> [...]
>>> +#define SOURCE_MASK_INTERLEAVE 32
>>> +#define TRANSPARENT_PIXEL =A0 0
>>> +
>>> +/*
>>> + * Convert a source/mask bitmap cursor to an ARGB cursor, clipping or
>>> + * padding as necessary. source/mask are assumed to be alternated each
>>> + * SOURCE_MASK_INTERLEAVE bits.
>>> + */
>>> +static void
>>> +nv_cursor_convert_cursor(uint32_t *src, void *dst, int src_stride,
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0int dst_stride, int bpp, u=
int32_t fg, uint32_t bg)
>>> +{
>>> + =A0 =A0 int width =3D min(src_stride, dst_stride);
>>> + =A0 =A0 uint32_t b, m, pxval;
>>> + =A0 =A0 int i, j, k;
>>> +
>>> + =A0 =A0 for (i =3D 0; i < width; i++) {
>>> + =A0 =A0 =A0 =A0 =A0 =A0 for (j =3D 0; j < width / SOURCE_MASK_INTERLE=
AVE; j++) {
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 int src_off =3D i*src_stride/=
SOURCE_MASK_INTERLEAVE + j;
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 int dst_off =3D i*dst_stride =
+ j*SOURCE_MASK_INTERLEAVE;
>>> +
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 b =3D src[2*src_off];
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 m =3D src[2*src_off + 1];
>>> +
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 for (k =3D 0; k < SOURCE_MASK=
_INTERLEAVE; k++) {
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pxval =3D TRA=
NSPARENT_PIXEL;
>>> +#if X_BYTE_ORDER =3D=3D X_BIG_ENDIAN
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (m & 0x800=
00000)
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 pxval =3D (b & 0x80000000) ? fg : bg;
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 b <<=3D 1;
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 m <<=3D 1;
>>> +#else
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (m & 1)
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 pxval =3D (b & 1) ? fg : bg;
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 b >>=3D 1;
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 m >>=3D 1;
>>> +#endif
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (bpp =3D=
=3D 32)
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 ((uint32_t *)dst)[dst_off + k] =3D pxval;
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 else
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 ((uint16_t *)dst)[dst_off + k] =3D pxval;
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
>>> + =A0 =A0 =A0 =A0 =A0 =A0 }
>>> + =A0 =A0 }
>>> +}
>>> +
>>
>> I'm quite sure that, without UMS, this function doesn't make sense
>> anymore, you could leave this fun for the X server (we can use the
>> load_cursor_argb hook even on the cards we don't advertise ARGB
>> support). As a bonus that would probably solve Craig's rotated cursor
>> issue.
>>
>>> [...]
>>> diff --git a/src/nv_setup.c b/src/nv_setup.c
>>> deleted file mode 100644
>>> index f0478ca..0000000
>>> --- a/src/nv_setup.c
>>> +++ /dev/null
>>> [...]
>>> - =A0 =A0 pNv->alphaCursor =3D (pNv->NVArch >=3D 0x11);
>>> -
>>> - =A0 =A0 pNv->twoHeads =3D (pNv->Architecture >=3D NV_ARCH_10) &&
>>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (implementation !=3D CHIPSET_=
NV10) &&
>>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (implementation !=3D CHIPSET_=
NV15) &&
>>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (implementation !=3D CHIPSET_=
NFORCE) &&
>>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (implementation !=3D CHIPSET_=
NV20);
>>> -
>>> - =A0 =A0 pNv->gf4_disp_arch =3D pNv->twoHeads && implementation !=3D C=
HIPSET_NV11;
>>> -
>>> - =A0 =A0 /* nv30 and nv35 have two stage PLLs, but use only one regist=
er; they are dealt with separately */
>>> - =A0 =A0 pNv->two_reg_pll =3D (implementation =3D=3D CHIPSET_NV31) ||
>>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(implementation =3D=3D=
 CHIPSET_NV36) ||
>>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(pNv->Architecture >=
=3D NV_ARCH_40);
>>> -
>>> - =A0 =A0 pNv->WaitVSyncPossible =3D (pNv->Architecture >=3D NV_ARCH_10=
) &&
>>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(implement=
ation !=3D CHIPSET_NV10);
>>> -
>>
>> The accel code still has some bogus checks for WaitVSyncPossible, and
>> bad things will happen if it's left uninitialized. Anyway, it would be
>> nice to kill all this crap from NVRec.
>>
>>> - =A0 =A0 pNv->BlendingPossible =3D ((pNv->Chipset & 0xffff) > CHIPSET_=
NV04);
>>> [...]
>>
>> _______________________________________________
>> Nouveau mailing list
>> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
>> http://lists.freedesktop.org/mailman/listinfo/nouveau
>>
>>
>
