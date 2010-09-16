From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 30158] nouveau fails to display on external monitor
Date: Thu, 16 Sep 2010 00:11:28 -0700 (PDT)
Message-ID: <20100916071128.E802C1300DA@annarchy.freedesktop.org>
References: <bug-30158-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-30158-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=30158

--- Comment #7 from Michael Boehm <varp-b-Mmb7MZpHnFY@public.gmane.org> 2010-09-16 00:11:28 PDT ---
(In reply to comment #5)
> try to blacklist vga16fb first - see
> https://wiki.ubuntu.com/X/Troubleshooting/Nouveau#Disable%20vga16fb
> 
> (the log says it is "not registering due to another framebuffer present", but
> it's not completely true)

Thanks to your link I have now tried to enable nv. I had thought this would be
very difficult and hard to undo but with your link it wasn't at all. Means I
blacklisted nouveau on startup with nouveau.modeset=0 and tell X to use nv
instead of nouveau. Result: nv runs without problems, and the performance is
quite ok (sufficient for my needs, actually). So with nv I don't need to force
an error in X anymore to bring X up.

Maybe this helps with circling the problem - nouveau runs fine on my internal
monitor but fails with my external monitor whereas nv runs fine both on the
internal monitor as the external monitor.

Again, if you need the log-files for this case, too, please give a note.

Best regards, Michael

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
