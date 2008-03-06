From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 14703] On NV17 on laptop screen: certain resolutions
 are scrambled
Date: Thu,  6 Mar 2008 06:23:39 -0800 (PST)
Message-ID: <20080306142339.93EB013015F@annarchy.freedesktop.org>
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





--- Comment #12 from Phillip Ezolt <phillipezolt-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>  2008-03-06 06:23:38 PST ---
Alright, I've tried the patch.  It completely fixes all of the "non-scaled"
resolutions. (None of them are corrupt.) 

I still have to:
1) Take a Picture of squiggle font
2) Try the other fix you suggested for aspect. 

Here's my status with head+your patch: 

            Aspect        No Scale       Fullscreen
1360x768     Bottom Clip    Works             Works
1280x800     Works          Works             Works 
1152x864     Corrupt        Works             Works
1280x768     Works          Works             Works
1280x720     Bottom Clip    Works             Works
1024x768     Corrupt        Works             SquiggleFont
800x600      Right Clip     Works             SquiggleFont
640x480      Right Clip     Works             SquiggleFont


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
