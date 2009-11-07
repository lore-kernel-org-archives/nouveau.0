From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 24820] [nv15] Vertical screen corruption in X when
 KMS is enabled
Date: Sat,  7 Nov 2009 02:43:08 -0800 (PST)
Message-ID: <20091107104308.BB45E1300BB@annarchy.freedesktop.org>
References: <bug-24820-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-24820-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=24820





--- Comment #6 from Johannes Obermayr <johannesobermayr-Mmb7MZpHnFY@public.gmane.org>  2009-11-07 02:43:08 PST ---
(In reply to comment #5)
> > 
> Do you get the same effect with smaller resolutions/clocks? (e.g.
> 1024x768@60Hz).

Yes, it is with all resolutions.
800x600   -> 2 corrupted bars
1024x768  -> 3 corrupted bars
1280x720  -> 4 corrupted bars
1920x1080 -> 6 corrupted bars

> > Console (init 3) looks fine.
> > 
> You mean it looks fine before loading nouveau.ko, right?

No, I boot with "nouveau.modeset=1 3" and can work on a KMS enabled console
without any problems...

I tried it with "1...2...3...3...4...5...6...7" to see whether something is
moved to another position (as in X/KDE) -> but all is on right place...

Btw. I use git20091105

Btw2. if I use my TNT2 M64 KMS works also fine but X/kdm login manager displays
only a black background and a white (login) box...

If you want pictures/logs I will provide them...


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
