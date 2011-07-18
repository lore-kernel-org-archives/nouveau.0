From: "Emil Velikov" <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Mistake in Gallium how-to in wiki?
Date: Tue, 19 Jul 2011 00:23:24 +0100
Message-ID: <op.vyt8lasb8t7z9u@localhost.localdomain>
References: <4E249AA8.5090703@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"; DelSp="yes"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <4E249AA8.5090703-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Andrew Green <andrew.green.df-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Mon, 18 Jul 2011 21:42:16 +0100, Andrew Green  
<andrew.green.df-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> Hi,
>
> I think I've found a mistake in the Gallium instructions in the Nouveau  
> wiki (http://nouveau.freedesktop.org/wiki/GalliumHowto).
>
> According to that page, one should run ./configure like this:
>
> ./configure --enable-debug --enable-glx-tls --disable-asm \
> --with-dri-drivers= --enable-gallium-nouveau \
> --disable-gallium-i915 --disable-gallium-i965 \
> --disable-gallium-r300 --disable-gallium-r600 --disable-gallium-svga \
> --with-state-trackers=glx,dri
>
>
> But when I compiled using that configuration, nouveau_dri.so was not  
> built. Also, a few of the configuration options were not recognized.  
> However, this configure command did work, at least for me:
>
> ./configure --enable-debug --enable-glx-tls --disable-asm \
> --with-dri-drivers --enable-glx --enable-dri --enable-xorg \
> --with-state-trackers=glx,dri --with-gallium-drivers="nouveau
>
>
> Hope this is helpful. (I'm completely "new" to "nouveau", so I guess I  
> may be completely off.) Thanks to the developers for their work on this,  
> greetings,
> Andrew

Note the "--with-state-trackers" options is soon(ish) to be depreciated

My current config (correct according to the latest changes) is

	./autogen.sh \
		--prefix=/usr \
		--with-dri-drivers= \
		--with-gallium-drivers=swrast,nouveau \
		--enable-debug \
		--enable-texture-float \
		--disable-asm \
		--enable-opengl \
		--disable-gles2 \
		--disable-openvg \
		--enable-dri \
		--enable-glx \
		--enable-xvmc \
		--disable-va \
		--disable-vdpau \
		--disable-osmesa \
		--disable-egl \
		--disable-xorg \
		--disable-d3d1x \
		--disable-xa \
		--disable-gbm \
		--disable-xlib-glx \
		--disable-gallium-egl \
		--disable-gallium-gbm \
		--disable-gallium-llvm \
		--disable-xcb \
		--enable-driglx-direct \
		--enable-glx-tls \
		--enable-glu \
		--enable-glw \
		--disable-motif

The above builds, nouveau and swrast drivers and uses the
opengl and xvmc state-trackers

NOTE: Consult yourself with the documentation regarding
"--enable-texture-float"

Emil

> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
