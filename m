From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 14858] Build fix for FreeBSD
Date: Thu, 17 Jul 2008 21:28:04 -0700 (PDT)
Message-ID: <20080718042804.6DB80130056@annarchy.freedesktop.org>
References: <bug-14858-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-14858-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=14858





--- Comment #3 from Brad Smith <brad-BUbV6I797GxWk0Htik3J/w@public.gmane.org>  2008-07-17 21:28:03 PST ---
The patch is hackish at best. What should be done is copy the bits from the X
server to properly detect the macros to use as was done with the Radeon driver
recently..

http://gitweb.freedesktop.org/?p=xorg/driver/xf86-video-ati.git;a=commitdiff_plain;h=52459745ec05de88adbc087e9566fe6d97ef424b;hp=67a6ac0001bc9d062aa426384a11a41fa7a1c09a

http://gitweb.freedesktop.org/?p=xorg/driver/xf86-video-ati.git;a=commitdiff_plain;h=32e1d1daf4f68ea37624afaa2bc1ea7742e1163b;hp=dca522355a9039eca6efaba3b36397b246800f94

This will ensure proper portability and fix Nouveau on OpenBSD, DragonFlyBSD,
Solaris and other OS's at least with regard to the endian swapping macros.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
