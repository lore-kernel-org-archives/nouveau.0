From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 41585] X freeze and PGRAPH errors in dmesg
Date: Mon, 10 Oct 2011 01:25:14 -0700 (PDT)
Message-ID: <20111010082514.A56551300B9@annarchy.freedesktop.org>
References: <bug-41585-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-41585-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=41585

--- Comment #4 from Marco Albarelli <motosauro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> 2011-10-10 01:25:13 PDT ---
(In reply to comment #3)
> How reproducible is this?
> 
> It's not clear based just on the backtrace if we're spinning in kernel land in 
> the ioctl or if that's just where we happened to be at the time.  Could you use 
> strace to see what syscalls are being generated.  That will give an idea if 
> it's spinning in the kernel or somewhere in userland:
> 
> sudo strace -p <pid of server process>

Thanks for the suggestion, but strace dumps a huge amount of data and the bug
is very random
Once it happened when watching a movie via VLC, another time when using the
videochat function of google plus through firefox 7
Bith cases happened after a couple of days of uptime (and suspension: I never
turn the pc off)
(In reply to comment #3)
> How reproducible is this?
> 
> It's not clear based just on the backtrace if we're spinning in kernel land in 
> the ioctl or if that's just where we happened to be at the time.  Could you use 
> strace to see what syscalls are being generated.  That will give an idea if 
> it's spinning in the kernel or somewhere in userland:
> 
> sudo strace -p <pid of server process>

I've been able to reproduce the freeze
I have a full strace for that but it's ~500mb uncompressed so I guess it's not
really the case to post it. Is tehere a specific part you'll need?

This is the point where the freeze happened

setitimer(ITIMER_REAL, {it_interval={0, 20000}, it_value={0, 20000}}, NULL) = 0
read(43,
"\211\10\10\0\3\0\200\3\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0", 4096)
= 32
ioctl(8, 0x40086482, 0x7fff7b42b790)    = 0
ioctl(8, 0x40046483, 0x7fff7b42b7c0)    = 0
ioctl(8, 0xc0406481, 0x7fff7b42b2f0)    = 0
ioctl(8, 0xc0406481, 0x7fff7b42b920)    = 0
writev(26,
[{"f\0d\0\371\231p\1\10\232p\1\266(.\0\355\1Z\1\330\0\207\0\0\0@\1\262\4\0\4",
32}], 1) = 32
writev(43,
[{"J%\220\3\2\0\0\0\3\0\200\3\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"...,
96}], 1) = 96
read(43, 0x1887520, 4096)               = -1 EAGAIN (Resource temporarily
unavailable)
setitimer(ITIMER_REAL, {it_interval={0, 0}, it_value={0, 0}}, NULL) = 0
select(256, [1 3 6 8 9 10 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 33 34
35 36 37 38 39 40 41 42 43 44 45 47 48], NULL, NULL, {0, 0}) = 0 (Timeout)
setitimer(ITIMER_REAL, {it_interval={0, 20000}, it_value={0, 20000}}, NULL) = 0
ioctl(8, 0xc0406481, 0x7fff7b42b6a0)    = 0
ioctl(8, 0x40086482, 0x7fff7b42b730)    = ? ERESTARTSYS (To be restarted)
--- SIGALRM (Alarm clock) @ 0 (0) ---
rt_sigreturn(0xe)                       = -1 EINTR (Interrupted system call)
ioctl(8, 0x40086482, 0x7fff7b42b730)    = ? ERESTARTSYS (To be restarted)
--- SIGALRM (Alarm clock) @ 0 (0) ---
rt_sigreturn(0xe)                       = -1 EINTR (Interrupted system call)
ioctl(8, 0x40086482, 0x7fff7b42b730)    = ? ERESTARTSYS (To be restarted)


attaching desg and xorg.log

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
