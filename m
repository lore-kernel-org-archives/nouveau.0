From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 39530] Also after installing Obermayrs drm-nouveau
 driver booting succeeds only with nomodeset
Date: Tue, 26 Jul 2011 06:33:11 -0700 (PDT)
Message-ID: <20110726133311.7A9961300D3@annarchy.freedesktop.org>
References: <bug-39530-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-39530-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=39530

--- Comment #2 from Lee Matheson <lee_matheson-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org> 2011-07-26 06:33:10 PDT ---
@ Guido Trentalancia  - 'nomodeset' is a boot code that one enters on the
options line of the Grub menu in openSUSE, and its use is documented in the
openSUSE-11.3 and 11.4 release notes. It typically disables modesetting in the
kernel for that boot, and it also forces openSUSE to use the 'nv' driver.

To all, I encountered what I believe to be the same problem with the 3.0 RC7
kernel on a 32-bit openSUSE-12.1 milestone-3 on a GeForce FX5200 hardware
(which booted the nouveau driver fine with the latest 2.6.39 kernel on
Tumbleweed-11.4).  

Note I also applied the suggested fix on this 32-bit openSUSE-12.1 Milestone-3
with this FX5200 hardware with the 3.0 RC7 kernel as noted in
https://bugzilla.novell.com/show_bug.cgi?id=707110 installing the specially
packaged application drm-nouveau-kmp-desktop by Johannes Obermayr, but that was
insufficient.  I also had to install the updated xorg-x11-driver-video-nouveau
also packaged by Johannes Obermayr after which the nouveau driver did work on
my FX5200. I documented that in Comment#7 on that
https://bugzilla.novell.com/show_bug.cgi?id=707110 thread.

So with BOTH packages the nouveau driver works for me on the 3.0 rc7 kernel.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
