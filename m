From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 24710] nouveau KMS fails on NV11 - screen displays
	last input
Date: Sun,  1 Nov 2009 01:34:51 -0800 (PST)
Message-ID: <20091101093451.C0AD41300C5@annarchy.freedesktop.org>
References: <bug-24710-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-24710-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=24710





--- Comment #5 from Jan Buecken <jb.faq-Mmb7MZpHnFY@public.gmane.org>  2009-11-01 01:34:48 PST ---
Created an attachment (id=30875)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=30875)
forced kernel command line option

> Doesn't sound like nouveau's fault, your monitor probably reports a broken
> EDID. To workaround it you can manually set the framebuffer resolution in the
> kernel command line, like:
> > video=VGA-1:1024x768e
> (The trailing "e" forces the output to be enabled)

Tried this, but the problem still exists!

But the message

> > [drm:edid_is_valid] *ERROR* EDID checksum is invalid, remainder is 141

disappear (see new dmesg log)

New ideas?


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
