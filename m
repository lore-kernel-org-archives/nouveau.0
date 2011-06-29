From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 38759] three monitors,
 two graphic cards and Xinerama - almost working
Date: Wed, 29 Jun 2011 12:46:24 -0700 (PDT)
Message-ID: <20110629194624.A133D13004D@annarchy.freedesktop.org>
References: <bug-38759-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-38759-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=38759

--- Comment #2 from Damian Nowak <nowaker-qMBiBlq7xnnVItvQsEIGlw@public.gmane.org> 2011-06-29 12:46:24 PDT ---
Thanks for your suggestion. I will google for ZaphodHeads examples and give it
a try.

In meantime, let me provide some new insights.

Just after X start:
http://upload.nowaker.net/nwkr/dualcard-xinerama-after-startup.jpg As you can
see, everything looks OK! (I don't care the window popping up in the middle of
two monitors) When I move the pointer on the front screen or left screen,
everything is still OK. When I move the pointer back to the right screen, the
story from the last video begins. Have a look:
http://upload.nowaker.net/nwkr/dualcard-xinerama-fail-2.3gp

I believe something trivial is broken here. It's almost working - starts OK but
moving a pointer to the right screen starts the fail story.

I will also take a look at the source - but I won't be too optimistic as I am a
Java developer and don't really know the X or Linux stuff.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
