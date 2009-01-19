From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 19620] At first start of X,
 secondary display doesn't come up properly  .
Date: Mon, 19 Jan 2009 09:59:06 -0800 (PST)
Message-ID: <20090119175906.33227130054@annarchy.freedesktop.org>
References: <bug-19620-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-19620-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=19620





--- Comment #5 from Stuart Bennett <sb476-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org>  2009-01-19 09:59:05 PST ---
Thanks, for the video, that explains it really well.

1) it would seem you are using an FB for the console.  Certainly this can cause
problems if it's nvidiafb.  Even if it's vesafb it may be worth trying a boot
with "vga=0" added to the end of your kernel parameters to force a text-mode
only boot.

2) assuming this doesn't fix it, please make register dumps while in X, both
before (broken) and after (working) the switch to and from VT.

Use my version of radeontool to make these.  It can be acquired by:

git clone git://anongit.freedesktop.org/~stuart/radeontool
cd radeontool; make

then dumps made by

./radeontool regs > logfile


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
