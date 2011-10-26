From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 42280] NVc0 generation card (0x0c1000a1) not working
Date: Wed, 26 Oct 2011 13:50:35 +0000
Message-ID: <bug-42280-8800-ZrD9csCeTz@http.bugs.freedesktop.org/>
References: <bug-42280-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-42280-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=42280

--- Comment #1 from Bruno Antunes <sardaukar.siet-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> 2011-10-26 06:50:35 PDT ---
Hello.

I have an eVGA GT440 PCI-e card, and nouveau does not work. The card in
question has 1024MB of DDR3 memory.

Attached is the dmesg log.

Arch Linux
uname -a output:

Linux beast 3.1.0-mainline #1 SMP PREEMPT Mon Oct 24 12:18:09 UTC 2011 x86_64
Intel(R) Core(TM) i7 CPU 960 @ 3.20GHz GenuineIntel GNU/Linux

I tried passing noaccel=0 on the kernel args, but Gnome 3.2 still boots up in
fallback mode saying my driver is llvmpipe Gallium 0.4.

Please help, really wanna know how I can make this work!


Thanks,


Bruno Antunes

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
