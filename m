From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 26790] NV40 - Not center screen
Date: Sat, 27 Feb 2010 14:39:50 -0800 (PST)
Message-ID: <20100227223950.25F7F1300AB@annarchy.freedesktop.org>
References: <bug-26790-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-26790-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
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

http://bugs.freedesktop.org/show_bug.cgi?id=26790





--- Comment #3 from Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>  2010-02-27 14:39:49 PST ---
(In reply to comment #2)
> (In reply to comment #1)
> > Your monitor is connected through a VGA cable, right?
> 
> Yes, See:
> http://traepaca.files.wordpress.com/2008/08/vga-plug.jpg
> 
> > Doesn't it have h/v
> > position controls?
> 
> Yes, have position controls.
> 
> Problem:
> 
> == Use Case ==
> 1) Start Ubuntu with driver nouveau and click button adjust automatic
> possition.
> 2) Reboot
> 3) Start Windows and click button adjust automatic possition
> 4) Reboot
> 5) Start Ubuntu with driver nouveau and click button adjust automatic
> possition.
> 6) Reboot
> 
> Problem change manuality poss
> 
> Driver Private work fine with Ubuntu and Windows, not necesary press button
> adjust automatic possition.
> 

Most likely the blob defaults to a mode different from ours, could you attach
Xorg logs from both nouveau and nvidia?

IIRC the blob usually doesn't print out any timings, so you'll have to run your
X server with some high verbosity level, like:
# Xorg -logverbose 7


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
