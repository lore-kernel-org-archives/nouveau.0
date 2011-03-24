From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 35609] Mesa DRI fails to build for nouveau
Date: Wed, 23 Mar 2011 18:57:22 -0700 (PDT)
Message-ID: <20110324015722.D433F13004E@annarchy.freedesktop.org>
References: <bug-35609-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-35609-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=35609

--- Comment #2 from jordan.yelloz+fdo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org 2011-03-23 18:57:22 PDT ---
(In reply to comment #1)
> Hm, this doesn't make much sense to me. Did you remember to run "autogen.sh"
> and "configure" after that commit?

Well, in general I build it using Gentoo Portage and that does autoreconf
(http://git.overlays.gentoo.org/gitweb/?p=proj/x11.git;a=blob;f=media-libs/mesa/mesa-9999.ebuild;h=bd4d163649427051aec4b9c771b671503b7f695c;hb=HEAD#l155)
on a clean git export every time a build is attempted and that is where I first
experienced this.

I then cloned my own copy of mesa and ran all of the autotools (autogen.sh and
configure with the previously stated options) and I was able to reproduce the
issue.

The problem I see is that src/mesa/drivers/dri/nouveau/Makefile modifies CFLAGS
but it includes ../Makefile.template .
I'm not very experienced with make but it looks like that commit
(d1e28b22673777fe1290cda899abf73aad02e4aa) redefined compiling C files without
respecting the CFLAGS, instead using the new DRI_CFLAGS (see
src/mesa/drivers/dri/Makefile.template:39).
This change seems to make src/mesa/drivers/dri/nouveau/Makefile:6 useless with
regard to compiling each source file in the nouveau directory since libdrm' and
libdrm_nouveau's includes directories are not searched anymore.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
