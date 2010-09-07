From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 29810] Blank screen on nouveau module load
Date: Tue,  7 Sep 2010 08:58:39 -0700 (PDT)
Message-ID: <20100907155839.C22F71300E0@annarchy.freedesktop.org>
References: <bug-29810-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-29810-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=29810

--- Comment #26 from Zoltan Varnagy <doi-Y8qEzhMunLyT9ig0jae3mg@public.gmane.org> 2010-09-07 08:58:39 PDT ---
(In reply to comment #25)
> Sigh... so it seems OF is the only way to get an EDID for your monitor, new
> patch attached, try it *without* "video=VGA-1:e".

I am not sure i am doing the thing you thought about. I appended your third
patch to the second and got black screen again. Should i have used only the
third? I try these with the 2.6.33 kernel. I hope its not a problem (it went
fine with it with your first patch). 

> > seems to be present in the nouveau feature matrix at NV10.
> 
> Xmoto uses OpenGL to draw itself, so yes, it's 3d. And by the way, your card
> needs the classic mesa drivers instead of gallium, to build them pass
> "--with-dri-drivers=nouveau" instead of "--enable-gallium-nouveau" to the mesa
> configure script.

Well ... that means i should compile mesa as well? Check out from git not only
the mesa/drm part as written on the page but the whole mesa branch and compile
somehow? I feel like it would be really great to have a Makefile somewhere
which does all this checkout/compile/package/install stuff. The Xorg log says
something about nouveau_vieux_dri.so. The mesa compiling would produce that?

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
