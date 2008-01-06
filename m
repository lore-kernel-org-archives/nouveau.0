From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 13944] nouveau video blitter gives tearing with two
	outputs
Date: Sun,  6 Jan 2008 07:35:27 -0800 (PST)
Message-ID: <20080106153527.830A3130009@annarchy.freedesktop.org>
References: <bug-13944-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-13944-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

http://bugs.freedesktop.org/show_bug.cgi?id=13944





------- Comment #1 from drzeus-bugzilla-p3sGCRWkH8CeZLLa646FqQ@public.gmane.org  2008-01-06 07:35 PST -------
The problem is this part of NVWaitVSync():

        /* If crtc1 is active, this will produce one, otherwise zero */
        /* The assumption is that at least one is active */
        OUT_RING  (pNv->crtc_active[1]);

What happens is that it will wait for vsync on CRTC 1 if it's active, and CRTC
0 otherwise. I assume this was added because bad things happen if you wait for
an inactive CRTC.

This is of course very incorrect in dual-head as it means it will always wait
for CRTC 1. And the vsync of the two CRTCs are unlikely to occur at the same
time.

To fix this, the NVWaitVSync() function needs to wait on the relevant CRTC. But
pScrn seems to be card global, so I guess another parameter needs to be added.
I'm not sure how the callers can determine it either though.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
