From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 23593] nouveau hangs after a few minutes
Date: Thu, 17 Sep 2009 03:09:52 -0700 (PDT)
Message-ID: <20090917100952.177C313005B@annarchy.freedesktop.org>
References: <bug-23593-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-23593-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=23593





--- Comment #25 from Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>  2009-09-17 03:09:51 PST ---
(In reply to comment #24)
> (In reply to comment #23)
> > (In reply to comment #22)
> > > I applied the patch and let it sit in X overnight. The machine was still up
> > > when I checked it this morning. This is definetly a good sign. I'll keep you
> > > posted.
> > > 
> > > Machine details:
> <snip>
> > > bogomips        : 601.32
> > > clflush size    : 32
> > > power management:
> > > 
> > Ok, so that's it.
> > 
> Hmm. What do you mean? That this is a relatively fast machine? 
> 
I meant your odds are worse with such a slow machine :-)

> 
> > Another annoying thing I realized:
> > > (II) NOUVEAU(0): Allocated 1MiB VRAM for offscreen pixmaps
> > 
> > FWIW you can just enable driver pixmaps if you want take advantage of the whole
> > VRAM.
> > 
> I'd be happy to do so. How? Searching the man pages & web gave me nothing.
> 

You need a newer X server, at least a 1.7.0 release candidate, if you're using
KMS it's then enabled automatically.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
