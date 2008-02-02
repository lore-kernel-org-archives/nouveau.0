From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 14025] The X11 / X Server Exhibits Jitters in the
 Display after it is on for many hours
Date: Fri,  1 Feb 2008 17:18:58 -0800 (PST)
Message-ID: <20080202011858.98A92130051@annarchy.freedesktop.org>
References: <bug-14025-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-14025-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=14025


Shlomi Fish <shlomif-ik1l9ssToec+JF/nGntIXQ@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |shlomif-ik1l9ssToec+JF/nGntIXQ@public.gmane.org




--- Comment #3 from Shlomi Fish <shlomif-ik1l9ssToec+JF/nGntIXQ@public.gmane.org>  2008-02-01 17:18:58 PST ---
(In reply to comment #2)
> Does this still occur with current git?
> 

I saw it exhibited in one of the latest Nouveaus. At least those that were
present as of kernel-2.6.24-rc8 or -rc7. I'm not sure if I had it since I
upgraded to kernel-2.6.24 and updated Nouveau with it.

> I think i once saw my screen in a similar state, some regions more than others,
> were the letters were shaking a bit. Like watching a bad crt, when in fact it
> was a digital flat panel.
> 
> Does it occur consistently, is there anything you can do to speed it up?
> 

It doesn't occur consistently, and I wasn't able to find anything to speed it
up. However, sometimes it appears shortly after I restart X from the command
line (K -> Logout and then startx again).

Regards,

       Shlomi Fish


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
