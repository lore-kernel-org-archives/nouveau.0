From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 26534] nouveau does not fetch edid from connected
 monitor on nforce1 (nv1a)
Date: Sat, 20 Feb 2010 09:14:05 -0800 (PST)
Message-ID: <20100220171405.649D0130087@annarchy.freedesktop.org>
References: <bug-26534-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-26534-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=26534





--- Comment #12 from Bruno <bonbons67-H4aWS73dXupiYsDpGMXq6A@public.gmane.org>  2010-02-20 09:14:04 PST ---
Created an attachment (id=33451)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=33451)
Compressed log from vbtracetool

(In reply to comment #11)
> (In reply to comment #10)
> > An i/o trace of your BIOS posting the card might be useful, to do it you would
> > have to download [1], compile it and run (as root and in text mode, i.e.
> > neither X nor fb drivers running):
> > # ./vbtracetool -p -l 2>nv1a_post.log
> > 
> > [1] git://people.freedesktop.org/~stuart/vbtracetool


> ./vbtracetool -p -l
> mmap /dev/zero: Operation not permitted
> Failed to initialise LRMI (Linux Real-Mode Interface).

This was caused by /dev being mounted noexec

Note, the posting done by VBTraceTool is not perfect, display show just kind of
garbage (mostly black but a few fancy colored character placeholders)


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
