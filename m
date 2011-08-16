From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 38860] nouveau driver with Asus ENGT430 says
 unsupported chipset, please report
Date: Tue, 16 Aug 2011 11:12:33 -0700 (PDT)
Message-ID: <20110816181233.708681300E3@annarchy.freedesktop.org>
References: <bug-38860-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-38860-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=38860

--- Comment #8 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> 2011-08-16 11:12:33 PDT ---
Hi networker

By nouveau/kernel and linus 3.1 I meant the actual tree your kernel is based on
e.g.
* nouveau/kernel - the main development repo [1]
* linus 3.1 - the latest (unreleased) linux kernel[2]. It includes only some of
the new features that can be found in [1]

AFAIK the nvc1(your card) support is introduced in the linux 3.1 (rather than
3.0) thus you see the message in your log.
Currently it's known to have some issues (acceleration related), nevertheless
feel free to give it a try.

If you wish to test the acceleration (mesa/gallium as well), make sure that
you're using [1] or [2], and append "nouveau.noaccel=0" to your kernel command
line

For more information about testing[3] and/or bugs[4] please visit our wiki

Cheers
Emil

[1] http://cgit.freedesktop.org/nouveau/linux-2.6/
[2] http://git.kernel.org/?p=linux/kernel/git/torvalds/linux.git
[3] http://nouveau.freedesktop.org/wiki/InstallNouveau
[4] http://nouveau.freedesktop.org/wiki/Bugs

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
