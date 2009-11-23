From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 25148] random crashes on NV4B, PGRAPH_ERROR
Date: Mon, 23 Nov 2009 07:59:15 -0800 (PST)
Message-ID: <20091123155915.A0BD41300A1@annarchy.freedesktop.org>
References: <bug-25148-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-25148-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=25148





--- Comment #2 from Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>  2009-11-23 07:59:14 PST ---
(In reply to comment #0)
> Created an attachment (id=31278)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=31278) [details]
> relevant part of syslog
> 
> Hi, 
> 
> X crashes (a few times per day), mostly when switching virtual desktops on NV4B
> nouveau. I run debian testing  with nouveau git kernel and git
> xf86-video-nouveau from the latest git. Most times the screen freezes and there
> is no respondence from mouse-clicks or keyboard, but I can move the mouse.
> Sysrq works. Sometimes X just crashes and restarts.
> 
> I did not observe this in October, so some early November commits
> (unfortunately I did not check which one) must be the responsible.
> 

It would be helpful if you tried git-bisect to find out which commit broke it
exactly.

> I attach syslog and Xorg.log, if more is needed or testing required please let
> me know. Thanks for your great work, cheers
> 

Could you attach the full output from dmesg instead of a snippet? (It's fine if
it doesn't show the crash, just make sure it hasn't wrapped around since last
boot).

> Andi
> 


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
