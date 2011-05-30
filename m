From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 35562] Nouveau fails to link in Mesa 7.10.1
Date: Mon, 30 May 2011 10:18:34 -0700 (PDT)
Message-ID: <20110530171834.A99EF13005E@annarchy.freedesktop.org>
References: <bug-35562-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-35562-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

https://bugs.freedesktop.org/show_bug.cgi?id=35562

--- Comment #5 from ridai.govinda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org 2011-05-30 10:18:33 PDT ---
David,

I tried mesa-7.10.2 and it fails with the same message. I have a NVidia card to
test, does that patch work on mesa-7.10.2?

Thanks!

(In reply to comment #4)
> Thank you Bernhard for the patch. I tested it and it initially worked for the
> gallium nouveau driver, however it did not work when i tried to enable building
> the non-gallium nouveau driver. I found that it needed an additional reference
> to the header in nouveau_driver.h:
> (the error references Mesa 7.10.1, but I'm compiling 7.10.2 and get the same
> error)
> 
> --- Mesa-7.10.1/src/mesa/drivers/dri/nouveau/nouveau_driver-orig.h   
> 2011-01-26 01:52:45.000000000 +0200
> +++ Mesa-7.10.1/src/mesa/drivers/dri/nouveau/nouveau_driver.h    2011-05-03
> 13:04:57.000000000 +0300
> @@ -37,6 +37,7 @@
>  #undef NDEBUG
>  #include <assert.h>
> 
> +#include <nouveau/nv04_pushbuf.h>
>  #include "nouveau_device.h"
>  #include "nouveau_pushbuf.h"
>  #include "nouveau_grobj.h"
> 
> I added these lines to your patch and now Mesa builds smoothly.
> Kernel 2.6.38.4
> libdrm 2.4.25
> Mesa 7.10.2
> (Slackware 13.37)
> 
> My config:
> 
> ./configure \
>   --prefix=/usr \
>   --sysconfdir=/etc \
>   --libdir=/usr/lib \
>   --mandir=/usr/man \
>   --docdir=/usr/doc/mesa-7.10.2 \
>   --with-dri-driverdir=/usr/lib/xorg/modules/dri \
>  
> --with-dri-drivers="i810,i915,i965,mach64,mga,nouveau,r128,r200,r300,r600,radeon,savage,sis,tdfx,unichrome,swrast"
> \
>   --enable-xcb \
>   --enable-gallium-nouveau \
>   --build=i486-slackware-linux
> 
> 
> I don't own any NVIDIA cards either, so a test from someone who does would be
> welcome.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
