From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: VAAPI on GeForce GT 620M
Date: Tue, 1 Sep 2020 09:29:12 -0400
Message-ID: <CAKb7UvhE8i9E7XxxwrpQX1rSvLHk63tFt7dyv_0XAAxu4O5=iA@mail.gmail.com>
References: <CAKiGokHoArQcnVAPs0HWzJSFXhwCSLfQAirOQ-zTq=0C-97neQ@mail.gmail.com>
 <CAKb7Uvh4cdg0=dGJqQVXx_p4O2c5BJbG3JRnjznwjsMQwc505Q@mail.gmail.com>
 <CAKiGokGj8pfm1tmH0aN7de5FVvrszAA93_e9-Zq05oqw46GnRg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAKiGokGj8pfm1tmH0aN7de5FVvrszAA93_e9-Zq05oqw46GnRg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Analabha Roy <hariseldon99-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Tue, Sep 1, 2020 at 9:10 AM Analabha Roy <hariseldon99-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Any suggestions on how to trace the config issues? Do I have to debug the va_openDriver() function?

My guess, without reading any code, is that DRI_PRIME isn't doing what
you want it to, and the nouveau driver is being handed an intel
device. This does not work well. Fixing this will require tracing
through the va winsys code which to figure out how it invokes the
loader.

https://cgit.freedesktop.org/mesa/mesa/tree/src/gallium/frontends/va/context.c#n111

For the DRM/rendernodes "platform", it will just take whatever fd it
is given. vainfo appears to give it a fixed device:

https://github.com/intel/libva-utils/blob/master/common/va_display_drm.c#L39

However it looks like you can pass in --device /dev/dri/renderD129 or
whatever the right one is, which should pass in the right render node,
as seen here:

https://github.com/intel/libva-utils/blob/master/common/va_display.c#L80

Note that I've never tried this, just did a few google searches to
find this stuff.

Cheers,

  -ilia
