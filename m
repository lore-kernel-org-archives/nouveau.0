From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 30158] nouveau fails to display on external monitor
Date: Thu, 16 Sep 2010 13:49:55 -0700 (PDT)
Message-ID: <20100916204955.45FC01300F5@annarchy.freedesktop.org>
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

--- Comment #10 from Michael Boehm <varp-b-Mmb7MZpHnFY@public.gmane.org> 2010-09-16 13:49:55 PDT ---
(In reply to comment #5)
> try to blacklist vga16fb first - see
> https://wiki.ubuntu.com/X/Troubleshooting/Nouveau#Disable%20vga16fb
> 
> (the log says it is "not registering due to another framebuffer present", but
> it's not completely true)

Well, I was a too quick. If I don't disable kernel mode setting for nouveau
(omit nouveau.modeset=0) and set X to nv as in Message #8 X does come up, but I
don't have terminals and the system might crash on shutting down. To be
specific what I see is a random pattern of colored ascii signs when opening a
terminal with for example CTRL+ALT+F1, and I see the same kind of pattern on
shutdown.

I went back to the state of Message #7 - I disable nouveau kernel mode setting
on boot and configure xorg.conf to use nv. This works fine, though I still
don't know if I am running nouveau or nv (nouveau is reported to be active and
can't find a trace of nv). Maybe you could help me on this matter, please.

Best regards, Michael

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
