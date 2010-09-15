From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 30158] nouveau fails to display on external monitor
Date: Tue, 14 Sep 2010 23:06:09 -0700 (PDT)
Message-ID: <20100915060609.9A7CB130076@annarchy.freedesktop.org>
References: <bug-30158-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-30158-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

https://bugs.freedesktop.org/show_bug.cgi?id=30158

--- Comment #4 from Michael Boehm <varp-b-Mmb7MZpHnFY@public.gmane.org> 2010-09-14 23:06:08 PDT ---
(In reply to comment #1)
> Can you provide Xorg and kernel logs from the failure?

I am adding attachments to my bug report. I don't know if this is the correct
way? But I can't find an other way to do it. So please see for attachments to
the original bug report to find the files you requested. BTW I am a almost
complete linux newbie (just learned the basics but 20 years ago) so please bear
with me if acting like a noob.

[ logs-X-starting.tar ] are the Kernel and X log files if X comes up (i.e. X
throws an error and restarts after that everything fine). I have included the
corresponding xorg.conf. Please note that X generates 5 log files for this
case, I have included them all.

[ logs-X-blankscreen.tar ] are the Kernel and X log files if X doesn't come up
and I receive that blank screen with a non-blinking cursor in the upper left. I
can open a console, though, and have access to the log files for this case,
too. X generates only 2 log files in this case. I have included the
corresponding xorg.conf for this case, too. Please note: A non-existing
xorg.conf leads to exactly the same result.

Best regards & thanks for taking care of this issue, Michael

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
