From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 23445] NV46: GPU lockup on VT switch
Date: Fri, 21 Aug 2009 16:53:48 -0700 (PDT)
Message-ID: <20090821235348.849E5130058@annarchy.freedesktop.org>
References: <bug-23445-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-23445-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=23445





--- Comment #5 from Renato Caldas <seventhguardian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>  2009-08-21 16:53:47 PST ---
(In reply to comment #4)
> Why do you have 4 channels, normally you have channel 0 for the kernel and
> channel 1 for xorg. Have you installed the (unsupported) nv40 gallium driver?
Not anymore, but the problem seems to remain, except a bit different:

Aug 22 00:47:44 pinguinus login[5527]: pam_unix(login:session): session opened
for user root by LOGIN(uid=0)
Aug 22 00:47:44 pinguinus login[5569]: ROOT LOGIN  on '/dev/tty2'
Aug 22 00:47:48 pinguinus [   40.444285] nouveau 0000:01:00.0: Unhandled
PFIFO_INTR - 0x00010000
Aug 22 00:47:48 pinguinus [   40.444292] nouveau 0000:01:00.0: Unhandled
PFIFO_INTR - 0x00010000
Aug 22 00:47:48 pinguinus [   40.444298] nouveau 0000:01:00.0: Unhandled
PFIFO_INTR - 0x00010000

(...)

Aug 22 00:47:48 pinguinus [   40.445339] nouveau 0000:01:00.0: Unhandled
PFIFO_INTR - 0x00010000
Aug 22 00:47:48 pinguinus [   40.445344] nouveau 0000:01:00.0: Unhandled
PFIFO_INTR - 0x00010000
Aug 22 00:47:48 pinguinus [   40.685178] nouveau 0000:01:00.0: GPU lockup -
switching to software fbcon
Aug 22 00:48:04 pinguinus [   56.864228] SysRq : Emergency Sync
Aug 22 00:48:04 pinguinus [   56.866521] Emergency Sync complete
Aug 22 00:48:16 pinguinus [   68.854374] SysRq : Emergency Sync
Aug 22 00:48:16 pinguinus [   68.854854] Emergency Sync complete
Aug 22 00:48:59 pinguinus syslog-ng[5235]: syslog-ng starting up;
version='2.1.4'


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
