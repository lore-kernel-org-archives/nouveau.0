From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 34220] Detects Load on output and blinks screen
	every ~30secs
Date: Wed, 23 Mar 2011 06:59:30 -0700 (PDT)
Message-ID: <20110323135930.EDD9413000C@annarchy.freedesktop.org>
References: <bug-34220-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-34220-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=34220

--- Comment #3 from noviktor-9Vj9tDbzfuSlVyrhU4qvOw@public.gmane.org 2011-03-23 06:59:29 PDT ---
I have same problem, card is
01:00.0 VGA compatible controller: nVidia Corporation NV25 [GeForce4 Ti 4200]
(rev a3)
OS is Gentoo.
I tried
Nouveau kernels 2.6.38-rc8-g7972f91 and 2.6.37-rc3-gd095e23,
xorg-servers 1.9.4, 1.9.5 and 1.10.0,
xf86-video-nouveau 0.0.16_pre20101130 and git 92db2bc.

Nothing helped, so I tried proprietary drivers 96.43.19 and noticed line
[    30.567] (WW) NVIDIA(GPU-0): Unable to read EDID for display device CRT-1
This lead me to trying i2cdetect and indeed on all 3 i2c adapters there is
nothing on adress 0x50, where EDID should be. Any ideas?

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
