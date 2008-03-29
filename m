From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 14859] External analog monitor does not show part of
 the output ( Randr12)
Date: Sat, 29 Mar 2008 06:24:39 -0700 (PDT)
Message-ID: <20080329132439.681FA130120@annarchy.freedesktop.org>
References: <bug-14859-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-14859-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=14859





--- Comment #19 from Jacopo <sbriglie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>  2008-03-29 06:24:38 PST ---
There has been a regression in the last two or so weeks: the secondary head is
still missing the left third and furthermore the image is flickering, like a
wrong frequency is set. Comparing a regdump with a previous one the culprit is
found to be the value of NV_RAMDAC_SEL_CLK0: the driver recently sets the wrong
value of
 0x00040014, whereas the old one was 0x00040044. Setting it manually with
radeontool fixes the flickering, but of course the left third stays black.

I did not manage to test dvi output, but I was however able to obtain a regdump
from OSX in the same configuration, i.e. secondary head connected and working
in mirror mode. I used airlied's hacked osx radeontool to do so, I'm attaching
the file in case you might find some source of inspiration in it


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
