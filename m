From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 51798] Cannot enable second video card on nvidia
	quadro NVS420
Date: Fri, 06 Jul 2012 19:49:14 +0000
Message-ID: <bug-51798-8800-vPzx1IoQ8b@http.bugs.freedesktop.org/>
References: <bug-51798-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-51798-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=51798

--- Comment #2 from Ilya Ilyin <ilyin-qar0IOKqGHQ@public.gmane.org> 2012-07-06 12:49:14 PDT ---
Created attachment 63905
  --> https://bugs.freedesktop.org/attachment.cgi?id=63905
Xorg log

As the result, X server opens only the first two monitors of card0. Any
experiments without xorg.conf or with it have no positive outcome: the last two
monitors are always blank as disabled.

With the commercial nvidia driver everything works from a scratch on four
displays as one long screen with Xinerama extension, but it has no proper ARGB
support for Quardro NVS.

How to enable /dev/dri/card1? Is there another way for manual tuning with KMS?
I tried video=DP-1:e video=DP-2:e video=DP-3:e video=DP-4:e, but the result is
the same.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
