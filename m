From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 41588] suspend/resume with active CRTC,
 but disconnected output causes problems
Date: Mon, 10 Sep 2012 19:56:32 +0000
Message-ID: <bug-41588-8800-Mu6C1BRJq5@http.bugs.freedesktop.org/>
References: <bug-41588-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-41588-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=41588

--- Comment #5 from Carsten Pfeiffer <pfeiffer-RoXCvvDuEio@public.gmane.org> 2012-09-10 19:56:32 UTC ---
I Lenovo notebook W510 with a GT216 [Quadro FX 880M] (rev a2) running
xserver-xorg-video-nouveau 1.0.1-3 (Debian unstable), Kernel 3.2.0-3-amd64.

My problem is that after resuming from ram, I cannot re-activate the LVDS-1
display if it had been disabled once before suspending.

To reproduce, do the following:
1. plug in external monitor (DVI here)
2. use xrandr or e.g. krandrtray to enable external display and disable
internal display (LVDS-1)
3. suspend to ram
4. resume
5. => LVDS-1 stays black forever, no way to reactivate it

I tried to disable the external display and re-enable LVDS-1 *before*
suspending, which works fine (LVDS-1 works). But after suspend&resume, LVDS-1
is black and cannot be reactivated.

A workaround is to keep LVDS-1 always on, but then you cannot use two external
displays anymore. For using two external displays, you *have* to disable
LVDS-1.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
