From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 39099] two graphic cards and four monitors with
	Nouveau
Date: Sat,  9 Jul 2011 16:49:37 -0700 (PDT)
Message-ID: <20110709234938.092701300AA@annarchy.freedesktop.org>
References: <bug-39099-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-39099-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=39099

--- Comment #3 from Damian Nowak <nowaker-qMBiBlq7xnnVItvQsEIGlw@public.gmane.org> 2011-07-09 16:49:37 PDT ---
I tried combining ZaphotHeads on the first card and use one virtual-sized
Screen on the second card. http://wklej.org/id/559842/

As long as I have Xinerama off, it works. I get 3 independent X screens on four
monitors.

However, when I enable Xinerama, the strange behaviour from my first bug report
appears. The video is there. https://bugs.freedesktop.org/show_bug.cgi?id=38759


So there are two alternative ways of resolving the issue:

- fix ZaphodHeads work on two cards, four monitors
- fix the strange behaviour from the video when using virtual screens
- ...or tell me what I did wrong in xorg.conf so I get the error message:
  Screen(s) found, but none have a usable configuration.
  It's the preferred way. :)

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
