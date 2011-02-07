From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 33887] nouveau causes graphic corruption were you
 cant do anything
Date: Sun,  6 Feb 2011 21:20:54 -0800 (PST)
Message-ID: <20110207052054.6744E13004D@annarchy.freedesktop.org>
References: <bug-33887-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-33887-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=33887

--- Comment #22 from zeruke <oninekoze-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> 2011-02-06 21:20:53 PST ---
(In reply to comment #21)
> (In reply to comment #20)
> > (In reply to comment #19)
> > > Created an attachment (id=43011)
 View: https://bugs.freedesktop.org/attachment.cgi?id=43011
 Review: https://bugs.freedesktop.org/review?bug=33887&attachment=43011

[details]
> > > possible fix for nv4x/nv6x chipsets
> > > 
> > > I don't know these cards as well as curro, but, we do this wrong on at least
> > > NV67, quite possible some others too.  Can anyone on nv4x experiencing this
> > > give this patch a shot?
> > 
> > i tried but im guessing im doing something wrong because i get this when trying
> > to patch
> > 
> > patching file nv40_graph.c
> > Hunk #1 FAILED at 223.
> > Hunk #2 FAILED at 230.
> > Hunk #3 FAILED at 239.
> > 3 out of 3 hunks FAILED -- saving rejects to file nv40_graph.c.rej
> 
> i found out what i did wrong and about to go through the whole set-up in a bit
 and i cant seem to get anything to work how it should no matter where i get
the instructions and such

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
