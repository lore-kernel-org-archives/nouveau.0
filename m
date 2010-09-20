From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 30146] Horizontal Couloured Lines with Nvidia 6,
	800 GT (NV40)
Date: Sun, 19 Sep 2010 19:05:42 -0700 (PDT)
Message-ID: <20100920020542.E2767130060@annarchy.freedesktop.org>
References: <bug-30146-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-30146-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=30146

--- Comment #11 from Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org> 2010-09-19 19:05:42 PDT ---
(In reply to comment #8)
> Hi Francisco,
>             I'm sorry for the late reply,I had discussed my issue on the
> nouveau irc channel.I did do a git bisect on the linix-2.6 kernel module branch
> with not much success.I simply can't remember when the code broke for
> me,although it was around the start of 30-08-2010.
> 
> I think a different approach to solve the problem could be better.Since the
> kernel option of nouveau.noaccel=1,I can boot fine into the desktop  with no
> problems.
> 
Well, your kernel logs aren't very useful, because they end before the crash,
they don't even have a trace of the X server starting up. Your best bet is
still 'git-bisect', e.g. if you start bisecting from the 15 Aug it shouldn't
take you than 12 steps to get to the culprit.

> If I now leave out the parameter,I can get as far as the desktop,but the X
> server will freeze as soon as it does.
> 
> I will upload my latest dmesg and Xorg.0.log whenb that problem occurs.
> 
> Regards,
>         STEVE555

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
