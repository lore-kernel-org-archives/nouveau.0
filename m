From: Xavier <shiningxc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Removal of Non-KMS support
Date: Wed, 13 Jan 2010 22:22:20 +0100
Message-ID: <91752841001131322s6b899029pb8dac24c2e18b1ca@mail.gmail.com>
References: <1262755950.2346.5.camel@araqiel> <87iqbfhrvr.fsf@riseup.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <87iqbfhrvr.fsf-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
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

On Wed, Jan 6, 2010 at 9:59 PM, Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org> wro=
te:
>> [...]
>> diff --git a/src/drmmode_display.c b/src/drmmode_display.c
>> index e37e7c1..3d2df8d 100644
>> --- a/src/drmmode_display.c
>> +++ b/src/drmmode_display.c
>> [...]
>> +#define SOURCE_MASK_INTERLEAVE 32
>> +#define TRANSPARENT_PIXEL =A0 0
>> +
>> +/*
>> + * Convert a source/mask bitmap cursor to an ARGB cursor, clipping or
>> + * padding as necessary. source/mask are assumed to be alternated each
>> + * SOURCE_MASK_INTERLEAVE bits.
>> + */
>> +static void
>> +nv_cursor_convert_cursor(uint32_t *src, void *dst, int src_stride,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0int dst_stride, int bpp, ui=
nt32_t fg, uint32_t bg)
>> +{
>> + =A0 =A0 int width =3D min(src_stride, dst_stride);
>> + =A0 =A0 uint32_t b, m, pxval;
>> + =A0 =A0 int i, j, k;
>> +
>> + =A0 =A0 for (i =3D 0; i < width; i++) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 for (j =3D 0; j < width / SOURCE_MASK_INTERLEA=
VE; j++) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 int src_off =3D i*src_stride/S=
OURCE_MASK_INTERLEAVE + j;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 int dst_off =3D i*dst_stride +=
 j*SOURCE_MASK_INTERLEAVE;
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 b =3D src[2*src_off];
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 m =3D src[2*src_off + 1];
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 for (k =3D 0; k < SOURCE_MASK_=
INTERLEAVE; k++) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pxval =3D TRAN=
SPARENT_PIXEL;
>> +#if X_BYTE_ORDER =3D=3D X_BIG_ENDIAN
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (m & 0x8000=
0000)
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 pxval =3D (b & 0x80000000) ? fg : bg;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 b <<=3D 1;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 m <<=3D 1;
>> +#else
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (m & 1)
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 pxval =3D (b & 1) ? fg : bg;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 b >>=3D 1;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 m >>=3D 1;
>> +#endif
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (bpp =3D=3D=
 32)
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 ((uint32_t *)dst)[dst_off + k] =3D pxval;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 else
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 ((uint16_t *)dst)[dst_off + k] =3D pxval;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
>> + =A0 =A0 =A0 =A0 =A0 =A0 }
>> + =A0 =A0 }
>> +}
>> +
>
> I'm quite sure that, without UMS, this function doesn't make sense
> anymore, you could leave this fun for the X server (we can use the
> load_cursor_argb hook even on the cards we don't advertise ARGB
> support). As a bonus that would probably solve Craig's rotated cursor
> issue.
>

This patch has been pushed 2 days ago but that function is apparently
still there.
If it could solve the rotated cursor issue, could you provide a patch
to kill that function ?
A second user reported it :
http://bbs.archlinux.org/viewtopic.php?pid=3D687656#p687656
