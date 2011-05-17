From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 37284] some applications crash the x server in
	multiscreen mode
Date: Tue, 17 May 2011 05:45:06 -0700 (PDT)
Message-ID: <20110517124506.63D1813004F@annarchy.freedesktop.org>
References: <bug-37284-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-37284-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=37284

--- Comment #1 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> 2011-05-17 05:45:05 PDT ---
Hi Tim,

First of all the bug report you linked is about a issue relating both the
blob (nvidia's proprietary driver) and nouveau

Thus:
* Most likely the issue is not nouveau related, but nevertheless take a
look further down

1. We do *not* handle bug reports of the blob
2. The bug report contains almost no information about nouveau.
There are logs of the blob (non relevant to us)
3. Please take a look at "How to report bugs" [1]
4. But beforehand drop by our FAQ [2] and troubleshooting [3] section
5. It appears that the "bug: [mi] EQ overflowing" is already covered [4]

Note:
We are *not* the maintainers of Ubuntu's stack nor the xorg-edgers.
Therefore if you mention them please use the corresponding commits they
are based on.

Therefore:

I'm closing this bug as NOTOURBUG, and please do provide a reasonable
bug report, after you have checked that one does not exist

[1] http://nouveau.freedesktop.org/wiki/Bugs
[2] http://nouveau.freedesktop.org/wiki/FAQ
[3] http://nouveau.freedesktop.org/wiki/TroubleShooting
[4]
http://nouveau.freedesktop.org/wiki/TroubleShooting#Igetthe.22EQoverflowing.22error

P.S. I'm a Ubuntu user, to the extent that I do not want to configure
all the userspace by myself. I do configure and build the kernel, libdrm,
ddx and mesa by myself (simple script does the job for me)

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
