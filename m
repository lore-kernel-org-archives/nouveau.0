From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 51144] significant pixel corruption in text ;
 driver nouveau - GF116 [GeForce GTS 450]
Date: Thu, 12 Jul 2012 01:29:24 +0000
Message-ID: <bug-51144-8800-xq6FCxHWMN@http.bugs.freedesktop.org/>
References: <bug-51144-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-51144-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=51144

--- Comment #15 from Str8bs <str8bslinux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> 2012-07-11 18:29:24 PDT ---
(In reply to comment #14)
> (In reply to comment #12)
> > I'm still occasionally seeing it with 1:1.0.1-1 for Debian.
> 
> Okay, I can confirm there are still issues. Now mostly menus that don't appear
> at all or incompletely until the mouse is moved over it to highlight items.
> Additionally, borders of floating windows do not appear (mouse-over tips in
> Eclipse in my case). Again GTK-apps only.

This sounds like what I see on PPC Nvidia FX5200 with the addition of half the
screen being corrupt or black. An oversize image as desktop seems to
replicate/exaggerate the problem. Increasing ydim of Virtual is one workaround
that works for PPC nouveau users with this card. Moves corruption off screen?

Not sure, but I thought it may be same as:
https://bugs.freedesktop.org/show_bug.cgi?id=47266

References: 
http://ubuntuforums.org/showthread.php?t=1937940&page=2
http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=668828

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
