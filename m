From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 21536] Accelerated 2D Does Not Work On HP tx2000z
 (Geforce 6150 Go)
Date: Mon, 25 Jan 2010 19:30:13 -0800 (PST)
Message-ID: <20100126033013.CC5D91300AF@annarchy.freedesktop.org>
References: <bug-21536-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-21536-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=21536





--- Comment #14 from Jeremy Uchitel <circular-AMv+oqoGJ4vR7s880joybQ@public.gmane.org>  2010-01-25 19:30:09 PST ---
An update for anyone interested... probably my last on this ticket, but I seem
to have things mostly working.

The snapshots I loaded on from 2009-12-29 may have been ok, but I don't think I
had the drm modules loading properly from the init ram disk.

So, I tried again with the drm mod snapshot from 15 January and also compiled
the mesa libdrm and xorg nouveau drivers from about that time.  I've been
running with them since then and things seem generally stable on my laptop. 
The only trouble I have seen so far is when I try to turn on Xrender in KDE,
but I'll save that for debugging later.

As of now, however, I can report that kms, exa, and xvideo seem to be working
generally ok on my hp tx2000.

So, should anyone be tracking things on this almost year-old bug still marked
as "NEW," please close it out if you wish. If I have new bugs to report, I'll
open a new one.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
