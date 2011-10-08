From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 40502] Ability to assign arbitrary CRTC to an output
	is broken
Date: Sat,  8 Oct 2011 02:46:43 -0700 (PDT)
Message-ID: <20111008094643.5447A1300F0@annarchy.freedesktop.org>
References: <bug-40502-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-40502-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=40502

--- Comment #1 from maximlevitsky-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org 2011-10-08 02:46:42 PDT ---
So, I understand now what is going on.
Its actually a feature, very unusual and strange one.

When I execute:
'xrandr --output LVDS-1 --auto --crtc 1'

System does switch LVDS to CRTC1, however, xrandr also marks said CRTC as
primary, which brings it to first position of crtc list in
XRRGetScreenResources.
and therefore on next invocation xrandr insists that output is once again
connected to CRTC 0, which is technicaly true, but its different '0'.

Also except reporting actual atom values, there is no way for xrandr to undo
this feature which granted is to support backward compatability with older (and
current?) desktops.

Yet, at least xrandr could sort the crtc list and assuming that atom values for
each crtc don't change (and they seem not) it'll fix this problem.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
