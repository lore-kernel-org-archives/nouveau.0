From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 15792] nv04 (TNT2) video blitter problem.
Date: Mon, 19 Jan 2009 23:06:42 -0800 (PST)
Message-ID: <20090120070642.6F610130058@annarchy.freedesktop.org>
References: <bug-15792-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-15792-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=15792





--- Comment #11 from Stephane Marchesin <marchesin-YynmYXH4S6491FlJP1ih0VAUjnlXr6A1@public.gmane.org>  2009-01-19 23:06:41 PST ---
(In reply to comment #10)
> Created an attachment (id=22105)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=22105) [details]
> patch which avoids passing sysmem addresses to the gpu when dest pixmap cannot
> be migrated into offscreen memory
> 
> I've reproduced this by hobbling my card to believe it only has 16Mb VRAM. 
> Under such a constraint the pNv->FB bo is only 8Mb, and with a larger virtual
> size it is used up with the viewable FB, leaving little (or no) room for EXA
> offscreen allocation (the viewable FB being pinned such that EXA can't migrate
> it out for obvious reasons).
> 
> Into this scenario the blitter comes with a large screen-sized destination
> pixmap.  The PutImage hook in nouveau_xv.c tries to ensure that the pixmap is
> in offscreen memory:
> 
> /* Ensure pixmap is in offscreen memory */
> exaMoveInPixmap(ppix);
> 
> and later ppix is passed to OUT_PIXMAPl where a relocation is performed. 
> Sadly, the migration has failed (insufficient available space as the fullscreen
> pixmap is large) and a sys mem address is passed in at the relocation, and the
> GPU subsequently barfs.
> 
> The attached patch checks if the call to exaMoveInPixmap is successful by
> testing:
> if (exaGetPixmapOffset(ppix) >= pNv->FB->size)
> which gets the offset in memory of the pixmap from the start of pNv->FB->map;
> if the pixmap offset is less than the size of pNv->FB it is necessarily in
> offscreen memory.  This is the same test as applied in exaPixmapIsOffscreen,
> which only recently was exported as xorg api as exaDrawableIsOffscreen and
> hence cannot be used while maintaining compat with older xservers.  A call to
> the driver-supplied IsOffscreen function is included for the
> NOUVEAU_EXA_PIXMAPS case.  By returning BadAlloc here the XV client gets the
> error and no invalid memory locations reach the GPU.
> 
> After some further investigation whether this can/should be caught earlier, it
> seems to me it can't, as exaOffscreenAlloc is only called by exaDoMoveInPixmap
> which is the migration function.  In the event that exaOffscreenAlloc fails,
> exaDoMoveInPixmap simply returns, and as a void function no indication is given
> of the failure.  I'd welcome being told I've misunderstood this though.
> 

Ok, indeed it seems we can't catch the failing allocation itself. But still,
doing:
if (exaGetPixmapOffset(ppix) >= pNv->FB->size)
totally assumes that the FB is at the beggining of the EXA area. We've done
such asumptions before and they always break in the end. Is there no other way
?
If all else fails, at least make it check agains FB->size and FB->offset.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
