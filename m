From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 29455] Nouveau TV-out incorrectly detecting load on
	NV18
Date: Fri, 13 Aug 2010 07:47:57 -0700 (PDT)
Message-ID: <20100813144757.703A5130109@annarchy.freedesktop.org>
References: <bug-29455-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-29455-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=29455

--- Comment #11 from Vlado Plaga <rechner-dLI15PoULosb1SvskN2V4Q@public.gmane.org> 2010-08-13 07:47:56 PDT ---
> Yeah, the attached patch adds some debugging output that may be useful for you
> to see the effects of your changes, "output=2 sample=YXXXXXXX" with Y!=0 means
> load is incorrectly being detected in your tv output.

Debugging output still does not help me understand much... but nevertheless I
wanted to give it a try. 

The first problem with the patch was: I don't have the file "nv10_gpio.c". Is
that a problem? Ok, I guess I should be using latest nouveau git instead of a
stable kernel anyway... so I tried the out-of-tree build (alternative), but
there was a new problem:

In file included from
/usr/src/nouveau/master/drivers/gpu/drm/nouveau/nouveau_bios.c:31:
include/linux/io-mapping.h:25:23: error: asm/iomap.h: No such file or directory
make[3]: *** [/usr/src/nouveau/master/drivers/gpu/drm/nouveau/nouveau_bios.o]
Error 1
make[2]: *** [/usr/src/nouveau/master/drivers/gpu/drm/nouveau] Error 2
make[1]: *** [_module_/usr/src/nouveau/master/drivers/gpu/drm] Error 2
make[1]: Leaving directory `/usr/src/linux-source-2.6.35'
make: *** [modules] Error 2

I suppose it is an architecture-related problem. In kernel 2.6.35
nouveau_bios.c does not include "linux/io-mapping.h" yet, so "asm/iomap.h" is
not required either. The later file is in
"linux-source-2.6.35/arch/x86/include/asm/iomap.h" on my system, whis is
probably not good for a PPC. There is also a
"linux-source-2.6.35/include/asm-generic/iomap.h", which might be an
alternative.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
