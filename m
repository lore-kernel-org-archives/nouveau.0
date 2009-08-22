From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 23200] nv50/NVS135M: no working suspend yet
Date: Sat, 22 Aug 2009 06:54:43 -0700 (PDT)
Message-ID: <20090822135443.9E5902DC001@annarchy.freedesktop.org>
References: <bug-23200-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-23200-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=23200





--- Comment #2 from Stefan Neufeind <freedesktop.org-Rkx4Xfb3x/xKcvNr4i3U6IQuADTiUCJX@public.gmane.org>  2009-08-22 06:54:42 PST ---
Got some problems using KMS, but that's another issue I guess. Basic startup
works though. I can login and see a KDE-desktop.

With KMS:
When trying to Suspend to RAM the system seems to flush diskcache etc. and
screen goes blank. However the machine doesn't suspend. Moving the mouse I get
the password-prompt of the screensaver and can login again.
After that login various graphics-errors occur (horizontal stripes, looks like
maybe charsets are a bit messed up etc.). However if you know where in the
menue e.g. "Restart" is you're at least able to find that.

Without KMS:
I can suspend-to-RAM fine. When powering on the machine again the
laptop-screen-backlight also goes on but the screen stays black. It looks like
you're able to control the system (pressing the power-button it e.g. seems to
go to suspend again) etc., but no output on the screen whatsoever.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
