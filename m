From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 40406] Nouveau NVIDIA NV46: Freeze
Date: Thu, 29 Sep 2011 01:59:55 -0700 (PDT)
Message-ID: <20110929085955.CC9201301B9@annarchy.freedesktop.org>
References: <bug-40406-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-40406-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=40406

--- Comment #11 from Marco <marco-w08N04152XNe4xh82S9ftw@public.gmane.org> 2011-09-29 01:59:55 PDT ---
Ok, I removed nouveau_dri.so. Unfortunately, it didn't help. I know that
probability theory can be tricky. :) But the system lock occurred three times
within a period of 24 hours, whereas the past frequency was approximately once
a week. One could conclude that removing nouveau_dri.so made it worse.

Here is a short log of uptimes that were affected by this bug.
0 days, 01:49:19  | Linux 3.0.4-gentoo        Thu Sep 29 09:59:24 2011
(running)
9 days, 14:39:05  | Linux 3.0.3-gentoo        Thu Sep  8 22:38:29 2011
11 days, 08:28:40 | Linux 3.0.3-gentoo        Fri Aug 26 22:53:11 2011
6 days, 14:00:20  | Linux 3.0.1-gentoo        Mon Aug 15 19:39:40 2011

Thus, I moved nouveau_dri.so to /usr/lib/mesa again.

This bug is not that bad since I am still be able to work. But I am a little
bit concerned about data loss after a crash.

> Now that sounds unusual, any chance of a serial console?

No, unfortunately not. I work abroad at the moment and I just have this laptop
without additional equipment. I might check it, when I'll be back home in
January, though. ;)

Is there anything else I can do?
I tried to save Xorg.log after a crash. I am not 100% sure if the log file is
complete, but I attached it nevertheless. I can't see anything unusual.

> A number of people have worked on the 3d/mesa/gallum driver for nv30/40
> 
> The latest person Luca Barbieri (lb1) did quite an impressive/substantial work
> but vanished after that.
> Since then no one has stepped in to develop/bugfix (with some exceptions) that
> code, thus the lack of support

No problem. I have no experience in writing drivers. I guess, I am of little
help here. But the drivers are very impressive. Thanks anyway.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
