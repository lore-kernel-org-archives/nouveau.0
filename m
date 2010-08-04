From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 29171] Garbled console on Macbook 13" (6,
 1 9400M]) when using EFI
Date: Wed,  4 Aug 2010 10:54:50 -0700 (PDT)
Message-ID: <20100804175450.580CB130128@annarchy.freedesktop.org>
References: <bug-29171-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-29171-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=29171

--- Comment #17 from Felix Leimbach <felix.leimbach-hi6Y0CQ0nG0@public.gmane.org> 2010-08-04 10:54:50 PDT ---
OK, I've used nouveau on this configuration for some weeks now and here are my
findings:

What is great:
1) Suspend & Resume works beautifully
2) X feels snappy and KDE 4.4's composite effects work very well
3) Dual-screen configuration works (also on-the-fly plugging and unplugging)
except:
3a) When setting the external monitor's native resolution of 1600x1200 that
monitor flickers badly and moving mouse or windows there is very very sluggy.
3b) If I use 1200x1024 instead then all works well except that there is an
occasional flicker. I.e. it flickers once and all is fine for 10 minutes until
it flickers once again

But there is problem too:

4) X.org freezes always after roughly 1 day of uptime. In just hangs and not
even switching to the console is possible. However network login through ssh is
possible and the Xorg.log contains a stacktrace which I will post below.

How shall we proceed? I can test anything you throw at me ...

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
