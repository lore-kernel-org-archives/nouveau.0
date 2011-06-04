From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 37894] After sleep/hibernate,
	X crashes after a few minutes
Date: Sat,  4 Jun 2011 12:58:45 -0700 (PDT)
Message-ID: <20110604195845.8D19013004E@annarchy.freedesktop.org>
References: <bug-37894-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-37894-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=37894

--- Comment #2 from pablo <pablo-3clbbMySrdFF6kxbq+BtvQ@public.gmane.org> 2011-06-04 12:58:45 PDT ---
Hi Emil,

I apologize for not being clear.  Johannes did mention that I install the four
components.  I ended up installing the following (and including some of the
-devel packages simply because I have the Dev environment on this laptop):

o Mesa
o Mesa-devel
o Mesa-nouveau3d
o drm-nouveau-kmp-desktop
o libdrm
o libva1
o libllvm
o xorg-x11-driver-video
o xorg-x11-driver-video-nouveau
o xorg-x11-proto-devel

I don't see `ddx' but a little googling seems to imply that'd be the
`xorg-x11-driver*' packages.  I hope so.  :D

Thank you for the hints on narrowing the issue.  I'll try them and report back.
 Unfortunately it's a bit like painting the cuckoo in a cuckoo clock, without
the benefit of advancing time, it takes a few hours for the problem to manifest
itself.

Thanks again!
-pablo

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
