From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 15792] nv04 (TNT2) video blitter problem.
Date: Fri,  6 Mar 2009 07:17:49 -0800 (PST)
Message-ID: <20090306151749.E393113005A@annarchy.freedesktop.org>
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





--- Comment #14 from Stephane Marchesin <marchesin-YynmYXH4S6491FlJP1ih0VAUjnlXr6A1@public.gmane.org>  2009-03-06 07:17:49 PST ---
(In reply to comment #12)
> (In reply to comment #11)
> > Ok, indeed it seems we can't catch the failing allocation itself. But still,
> > doing:
> > if (exaGetPixmapOffset(ppix) >= pNv->FB->size)
> > totally assumes that the FB is at the beggining of the EXA area. We've done
> > such asumptions before and they always break in the end. Is there no other way
> > ?
> > If all else fails, at least make it check agains FB->size and FB->offset.
> 
> As I understand it pNv->FB includes the entire EXA area, not just the visible
> fb, exaGetPixmapOffset returns an offset relative to pExaScr->info->memoryBase
> (set to pNv->FB->map in nouveau_exa.c), so to see if a pixmap is in VRAM isn't
> testing if the (unsigned) offset is bigger than pNv->FB->size [*] correct,
> regardless of the positioning of the visible fb?
> 
> [*] or equivalently pNv->EXADriverPtr->memorySize which is perhaps more robust
> to changes in nouveau
> 

Hmm right. Yea I suppose pNv->EXADriverPtr->memorySize is a better choice.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
