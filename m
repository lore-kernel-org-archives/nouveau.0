From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: Framebuffer double buffering (via FBIOPAN_DISPLAY)
Date: Sun, 5 Jul 2020 15:45:00 -0400
Message-ID: <CAKb7Uvi5=H3pNO4eKT37jsN8+KUS6a7dLKOpYsOwkc44pVc6Xg@mail.gmail.com>
References: <CAKb7UvjHqAtH4+R70VbpE-dXe3y0=ZWdvRdWpQC1m-gK=NxoDw@mail.gmail.com>
 <f4f3a042-78a3-46d9-b452-bb1d251a7391@email.android.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <f4f3a042-78a3-46d9-b452-bb1d251a7391-2ueSQiBKiTY7tOexoI0I+QC/G2K4zDHf@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: "Michael T. Kloos" <michael-RKkoRtUCbzKq0/6D4rpXzw@public.gmane.org>
Cc: nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Try booting with drm_kms_helper.drm_fbdev_overalloc=200 and see if it
works with that. (There's also CONFIG_DRM_FBDEV_OVERALLOC which sets
the default.)

Cheers,

  -ilia

On Sun, Jul 5, 2020 at 3:41 PM <michael-RKkoRtUCbzKq0/6D4rpXzw@public.gmane.org> wrote:
>
> I am not familiar with that setting, but I have really struggled to find documentation on dealing with the framebuffer.  Referring to this guide, "http://betteros.org/tut/graphics1.php#doublebuffer", I attempted to set the mmap allocation size to double, but it caused the mmap to fail.  I no longer believe that it is a driver issue, though, because I just tried it again on a dell laptop with Intel HD Graphics 4400 to the same failure.
>
> On Jul 5, 2020 12:35, Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> wrote:
>
> Are you setting the overallocation to 200?
>
> On Sun, Jul 5, 2020 at 3:41 AM Michael T. Kloos
> <michael-RKkoRtUCbzKq0/6D4rpXzw@public.gmane.org> wrote:
> >
> > Does NOUVEAU support mmaping a double-sized Framebuffer?
> > When attempting to run, where fd refers to "/dev/fb0":
> >
> > mmap(ptr, screensize * 2, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
> >
> > I get back an invalid argument error.  This doesn't happen if I only
> > request a single screensize.  Is this a limitation of the driver?
> >
> > _______________________________________________
> > Nouveau mailing list
> > Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> > https://lists.freedesktop.org/mailman/listinfo/nouveau
>
>
