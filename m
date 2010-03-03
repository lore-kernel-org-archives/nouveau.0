From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 14859] External analog monitor does not show part of
 the output (Randr12)
Date: Wed,  3 Mar 2010 04:56:47 -0800 (PST)
Message-ID: <20100303125647.D49591300CD@annarchy.freedesktop.org>
References: <bug-14859-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-14859-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
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

http://bugs.freedesktop.org/show_bug.cgi?id=14859


graham.cole-N6BjORIo2pVBDgjK7y7TUQ@public.gmane.org changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |graham.cole-N6BjORIo2pVBDgjK7y7TUQ@public.gmane.org




--- Comment #28 from graham.cole-N6BjORIo2pVBDgjK7y7TUQ@public.gmane.org  2010-03-03 04:56:47 PST ---
I believe I'm seeing the same bug here on my 12" 1.5GHz PowerBook. I installed
Nouveau from git yesterday, and attaching my LCD monitor via VGA and enabling
via xrandr results in 20-30% of the left side of the screen coming up black.
Attaching via DVI works perfectly.

Looks like I have KMS enabled:
$ sudo cat /sys/module/nouveau/parameters/modeset
1

So I guess that doesn't help any. Let me know if there's anything I can provide
that could help this along. Sadly I don't have access to OSX at the moment
though.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
