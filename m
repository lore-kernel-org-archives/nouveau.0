From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Removal of Non-KMS support
Date: Thu, 14 Jan 2010 08:24:43 +1000
Message-ID: <1263421483.8033.2.camel@nisroch>
References: <1262755950.2346.5.camel@araqiel> <87iqbfhrvr.fsf@riseup.net>
	<91752841001131322s6b899029pb8dac24c2e18b1ca@mail.gmail.com>
Reply-To: skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <91752841001131322s6b899029pb8dac24c2e18b1ca-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Xavier <shiningxc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Wed, 2010-01-13 at 22:22 +0100, Xavier wrote:
> On Wed, Jan 6, 2010 at 9:59 PM, Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org> wrote:
> >> [...]
> >> diff --git a/src/drmmode_display.c b/src/drmmode_display.c
> >> index e37e7c1..3d2df8d 100644
> >> --- a/src/drmmode_display.c
> >> +++ b/src/drmmode_display.c
> >> [...]
> >> +#define SOURCE_MASK_INTERLEAVE 32
> >> +#define TRANSPARENT_PIXEL   0
> >> +
> >> +/*
> >> + * Convert a source/mask bitmap cursor to an ARGB cursor, clipping or
> >> + * padding as necessary. source/mask are assumed to be alternated each
> >> + * SOURCE_MASK_INTERLEAVE bits.
> >> + */
> >> +static void
> >> +nv_cursor_convert_cursor(uint32_t *src, void *dst, int src_stride,
> >> +                      int dst_stride, int bpp, uint32_t fg, uint32_t bg)
> >> +{
> >> +     int width = min(src_stride, dst_stride);
> >> +     uint32_t b, m, pxval;
> >> +     int i, j, k;
> >> +
> >> +     for (i = 0; i < width; i++) {
> >> +             for (j = 0; j < width / SOURCE_MASK_INTERLEAVE; j++) {
> >> +                     int src_off = i*src_stride/SOURCE_MASK_INTERLEAVE + j;
> >> +                     int dst_off = i*dst_stride + j*SOURCE_MASK_INTERLEAVE;
> >> +
> >> +                     b = src[2*src_off];
> >> +                     m = src[2*src_off + 1];
> >> +
> >> +                     for (k = 0; k < SOURCE_MASK_INTERLEAVE; k++) {
> >> +                             pxval = TRANSPARENT_PIXEL;
> >> +#if X_BYTE_ORDER == X_BIG_ENDIAN
> >> +                             if (m & 0x80000000)
> >> +                                     pxval = (b & 0x80000000) ? fg : bg;
> >> +                             b <<= 1;
> >> +                             m <<= 1;
> >> +#else
> >> +                             if (m & 1)
> >> +                                     pxval = (b & 1) ? fg : bg;
> >> +                             b >>= 1;
> >> +                             m >>= 1;
> >> +#endif
> >> +                             if (bpp == 32)
> >> +                                     ((uint32_t *)dst)[dst_off + k] = pxval;
> >> +                             else
> >> +                                     ((uint16_t *)dst)[dst_off + k] = pxval;
> >> +                     }
> >> +             }
> >> +     }
> >> +}
> >> +
> >
> > I'm quite sure that, without UMS, this function doesn't make sense
> > anymore, you could leave this fun for the X server (we can use the
> > load_cursor_argb hook even on the cards we don't advertise ARGB
> > support). As a bonus that would probably solve Craig's rotated cursor
> > issue.
> >
> 
> This patch has been pushed 2 days ago but that function is apparently
> still there.
> If it could solve the rotated cursor issue, could you provide a patch
> to kill that function ?
> A second user reported it :
> http://bbs.archlinux.org/viewtopic.php?pid=687656#p687656
It's on the list.  I didn't do it yet as I hadn't gotten around to
testing on hw where it could possible break things :)

Ben.
