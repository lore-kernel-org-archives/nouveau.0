From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 23792] Getting inverted colors after having launched
 Virtualbox with Nouveau driver
Date: Fri, 18 Sep 2009 05:04:54 -0700 (PDT)
Message-ID: <20090918120454.58E6F130058@annarchy.freedesktop.org>
References: <bug-23792-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-23792-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=23792





--- Comment #6 from Thomas PEGEOT <thomas.pegeot-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>  2009-09-18 05:04:53 PST ---
Here are the different logs you ask for. ;)

After having launched Virtualbox, the following lines are added to the kern.log
: 
gentoo thomas # diff kern.log /var/log/kern.log
8936a8937,8940
> Sep 18 13:57:16 gentoo kernel: [  349.772788] warning: `VirtualBox' uses 32-bit capabilities (legacy support in use)
> Sep 18 13:57:18 gentoo kernel: [  351.947281] nouveau 0000:05:00.0: Allocating FIFO number 2
> Sep 18 13:57:18 gentoo kernel: [  351.948771] nouveau 0000:05:00.0: nouveau_channel_alloc: initialised FIFO 2
> Sep 18 13:57:18 gentoo kernel: [  352.103528] nouveau 0000:05:00.0: nouveau_channel_free: freeing fifo 2

Thank you in advance! ;)

Regards.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
