From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 15650] Hard freeze when starting X with GeForce 6800
	GS (NV43)
Date: Tue, 22 Apr 2008 08:39:52 -0700 (PDT)
Message-ID: <20080422153952.A3429130105@annarchy.freedesktop.org>
References: <bug-15650-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-15650-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=15650


Andrew McNabb <amcnabb-2BOxfIlzoBpAfugRpC6u6w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |amcnabb-2BOxfIlzoBpAfugRpC6u6w@public.gmane.org




--- Comment #2 from Andrew McNabb <amcnabb-2BOxfIlzoBpAfugRpC6u6w@public.gmane.org>  2008-04-22 08:39:51 PST ---
I just tried installing from source to see if it made any difference.  I
checked out the latest sources from git (following the InstallNouveau
instructions on the wiki).  Unfortunately, the same problem occurred.

I also tried doing `startx` instead of using gdm.  It turns out that I can move
the mouse until the first X client connects to the server, at which point the
machine locks up.  Even a simple X client like `xterm` is enough to freeze the
computer.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
