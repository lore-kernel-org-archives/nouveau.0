From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 15350] randr12: VGA-0 always reported as
	"disconnected"
Date: Fri,  4 Apr 2008 14:10:07 -0700 (PDT)
Message-ID: <20080404211007.AC08013009E@annarchy.freedesktop.org>
References: <bug-15350-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-15350-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=15350





--- Comment #7 from Joe Orton <jorton-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>  2008-04-04 14:10:06 PST ---
Earlier I tried changing that very function to return XF86OutputStatusUnknown
in the fall-through case rather than Disconnected; would you expect that to
have a similar effect?

It seemed a little better; the monitor displayed a blank screen rather than
screaming "omg no input"; it didn't fetch the EDID info though.  I added
debugging printfs to nv_get_edid to see where it was falling out, and it was:

        ddc_mon = xf86OutputGetEDID(output, nv_output->pDDCBus);
        if (!ddc_mon) {

returning ddc_mon == NULL here.  I'm off to a conference for all of next week
so may not be able to play with this any more for a while.  Suggestions on how
to debug further (or to tell me I'm simply screwing up the config!) welcome.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
