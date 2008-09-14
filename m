From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 16148] primary display is borked with RandR12 enabled
Date: Sun, 14 Sep 2008 10:25:22 -0700 (PDT)
Message-ID: <20080914172522.A5FEB13000B@annarchy.freedesktop.org>
References: <bug-16148-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-16148-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=16148





--- Comment #9 from Stuart Bennett <sb476-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org>  2008-09-14 10:25:21 PST ---
(In reply to comment #7)
> > 1) starting from a non-corrupted state, start nouveau with
> > nv_bios.c:call_lvds_script patched out:
> > --- a/src/nv_bios.c
> > +++ b/src/nv_bios.c
> > ...
> > and check whether the picture in X is ok, and whether the picture on returning
> > to console is ok.
> 
> Nope. All i see is blank black screen. Switching to console and back to X, i
> end up with a image of console ( translucent) on X. 

Hmm, a blank screen is surprising :-) As regards this translucent console, I
don't understand -- how is it different to the normal console display? what
indication is there that you are in X and not still at the console?

> The console works fine.

I assume by this you mean that the console is fine after leaving X; correct me
if I misunderstood.

> > 2) Make register dumps while in X, and attach them here -- one with randr12
> attached.

There seems to be a problem here -- all four of the nouveau dumps appear to be
made from the console, rather than from within X. If you were doing them blind,
is it possible that X had crashed? If you were doing them from the console
while X was running in order to see, could you instead leave the computer *in
X* and run the dump commands from another computer over ssh?


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
