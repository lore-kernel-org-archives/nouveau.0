From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 29553] corrupted output on KDE status bar
Date: Mon, 16 Aug 2010 03:26:52 -0700 (PDT)
Message-ID: <20100816102652.B5B5413011B@annarchy.freedesktop.org>
References: <bug-29553-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-29553-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=29553

--- Comment #7 from Stefan Mathe <mstefan-26n5VD7DAF2Tm46uYYfjYg@public.gmane.org> 2010-08-16 03:26:52 PDT ---
(In reply to comment #6)
> (In reply to comment #5)
> > it's probably not nouveau bug, see:
> > https://bugs.kde.org/show_bug.cgi?id=224666
> 
> Thanks Marcin!
> 
> Yes, it could be a KDE problem (it defintely looks like the one described on
> their forum). It is probably something more subtle related to the interaction
> of KDE with the drivers, since:
> 
> 1) It goes away if I install the proprietary NVidia drivers
> 2) It never occurs on my laptop with Intel graphic card
> 
> I'm going to try KDE 4.5 and report back on this.
> 
> Many thanks,
> Stefan,

Yep, I installed KDE 4.5 and it went away. So indeed, it seems to be a KDE bug
that only surfaces in conjunction with the nouveau drivers.

I've closed the bug report. Thanks Marcin for the useful feedback!

All the best,
Stefan.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
