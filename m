From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 29810] Blank screen on nouveau module load
Date: Tue,  7 Sep 2010 20:54:34 -0700 (PDT)
Message-ID: <20100908035434.266A22DC101@annarchy.freedesktop.org>
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

--- Comment #33 from Zoltan Varnagy <doi-Y8qEzhMunLyT9ig0jae3mg@public.gmane.org> 2010-09-07 20:54:33 PDT ---
(In reply to comment #31)
> (In reply to comment #29)
> This is a long and complicated bug report, so I'd be grateful for a brief
> summary of the steps you took to get everything working.  In particular, which
> git repos did you actually need?

Well the way it worked is very close to one written at 
http://nouveau.freedesktop.org/wiki/DebianInstall
In the large frame. Roughly it was:
a) I checked out the nouveau kernel and applied the patch given in comment #15
. I compiled and installed the new kernel.
b) instead of compiling libdrm i used the debian packaged one (2.4.21)
c) i also checked out the mesa driver
git://anongit.freedesktop.org/git/mesa/mesa
configured with 
./configure --enable-debug --enable-glx-tls --disable-asm
--with-dri-drivers=nouveau --disable-gallium-i915 --disable-gallium-i965
--disable-gallium-radeon --disable-gallium-r600 --disable-gallium-svga
--with-state-trackers=glx,dri
and put the resulting lib/nouveau_vieux_dri.so to /usr/lib/dri
d) Checked out the ddx and installed as written

> I'm confused about the need for gallium to run 3d software -- I read somewhere
> that it's needed for 3d support, but Francisco told you to use the other flag.

Yes as far as i know for this card the nouveau_vieux_dri driver is needed
instead, which was created in step c)

> Thanks!

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
