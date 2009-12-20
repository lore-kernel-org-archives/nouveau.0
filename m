From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 24996] Wrong display resolution in X,
 "windowed" console. FX 5600 XT
Date: Sun, 20 Dec 2009 03:43:16 -0800 (PST)
Message-ID: <20091220114316.5E644130083@annarchy.freedesktop.org>
References: <bug-24996-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-24996-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=24996





--- Comment #22 from ashtophet <galiza.ceive-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>  2009-12-20 03:43:14 PST ---
I'm just a plain user, no devel knowledge, so sorry if it's a stupid proposal,
wouldn't it be possible, as a workaround, to make this TV-out thingy optional,
either config time or load time?

I'm using kernel 2.6.33-rc1 (nv43), was suffering from the issue described here
(I need proper resolution on fb), and simply commenting a few lines on
nv04_display.c (OUTPUT_TV in case statements) made it work as I'm expecting. I
know it's not a solution, I know it doesn't help the nouveau driver effort, but
I'm not using TV-out (I've just used it once in eight yeras, just for the sake
of trying...), I don't want to use it, I cannot contribute a MMIO dump (no TV
here :P)... 

Thanks to you developers for hard working on nouveau!

Sorry for disturbing...


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
