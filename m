From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 14703] On NV17 on laptop screen: certain resolutions
 are scrambled
Date: Fri, 29 Feb 2008 08:11:58 -0800 (PST)
Message-ID: <20080229161159.089F11300AB@annarchy.freedesktop.org>
References: <bug-14703-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-14703-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=14703





--- Comment #7 from Phillip Ezolt <phillipezolt-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>  2008-02-29 08:11:58 PST ---
Alright I've run the battery of scaling options on all of the resolutions that
randr 1.2 reports. 

            Aspect        No Scale       Fullscreen
1360x768     Works         Corrupt            Works
1280x800     Works         Corrupt            Works 
1152x864     Corrupt       Corrupt            Works
1280x768     Works         Corrupt            Works
1280x720     Works         Corrupt            Works
1024x724     Corrupt       Corrupt            SquiggleFont
800x600      Works         Clipped            SquiggleFont
640x480      Works         Clipped            SquiggleFont


'Corrupt' means the screen is corrupted and the lines are shifted as described
above. 

'Clipped' means the screen is looks correct, but it has been (significantly)
clipped.  Like I am looking into a small window in the screen. (Centered, btw)

'SquiggleFont' means that I can see the screen as it should be. (everything is
aligned properly), but the fonts seem to have pixels shifted around.

So, in other words, it is readable, there are definite corruptions. 


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
