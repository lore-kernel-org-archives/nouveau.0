From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 28039] nouveau can't display preview
Date: Sat, 25 Sep 2010 02:57:39 -0700 (PDT)
Message-ID: <20100925095740.08ACE1300FD@annarchy.freedesktop.org>
References: <bug-28039-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-28039-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=28039

--- Comment #10 from Alex <strangebrew-o+MxOtu4lMCHXe+LvDLADg@public.gmane.org> 2010-09-25 02:57:39 PDT ---
(In reply to comment #9)
> *** Bug 26057 has been marked as a duplicate of this bug. ***

I have some info about this bug and mentioned duplicate.
Problems with nouveau driver occured in Fedora 13 and Ubuntu 10.10 (I filed
similar bug at Launchpad https://bugs.launchpad.net/bugs/636319).
BUT! Everything works fine in Mandriva 2010.1. No artifacts in tray! No
artifacts at all!
Kernel (uname -r):
2.6.33.7-desktop-2mnb
Xorg and nouveau versions:
x11-server-xorg-1.7.7-1mdv2010.1
x11-driver-video-nouveau-0.0.15-0.20100316.1mdv2010.1
lib64drm_nouveau1-2.4.20-2mdv2010.1
My card (lspci | grep -i nvidia):
01:00.0 VGA compatible controller: nVidia Corporation G92 [GeForce 9800 GT]
(rev a2).

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
