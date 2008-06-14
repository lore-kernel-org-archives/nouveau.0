From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 16231] Xv vsync and backing store don't mix in new
	Xorg
Date: Sat, 14 Jun 2008 02:38:47 -0700 (PDT)
Message-ID: <20080614093847.45B0B130052@annarchy.freedesktop.org>
References: <bug-16231-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-16231-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=16231


Pierre Ossman <drzeus-bugzilla-p3sGCRWkH8CeZLLa646FqQ@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |ajax-TAsg7VrFCGc@public.gmane.org
            Summary|Xv tearing after upgrade to |Xv vsync and backing store
                   |Fedora 9                    |don't mix in new Xorg




--- Comment #6 from Pierre Ossman <drzeus-bugzilla-p3sGCRWkH8CeZLLa646FqQ@public.gmane.org>  2008-06-14 02:38:46 PST ---
The problem I want solved is to get mplayer to start working with vsync again.
That doesn't have to mean that backing store gets vsync behaviour. Altough
turning of composite works for my use case, it's probably not a good long term
solution.

I'm adding ajax as a cc here as he was the one that reimplemented the backing
store.

How did the backing store work before the rewrite? Did it track the damage of
the framebuffer and had a backup copy? If so, was the change of behaviour in
the new version fully realised?

If the easiest route is to get applications to change, then some arguments are
needed why this isn't a bug/regression in Xorg, but applications relying on
something they were never supposed to have.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
