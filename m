From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 25036] KMS + multihead leaves ghost mouse pointer
Date: Mon, 18 Jan 2010 07:14:08 -0800 (PST)
Message-ID: <20100118151408.47CC41300C2@annarchy.freedesktop.org>
References: <bug-25036-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-25036-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=25036





--- Comment #1 from Francis Galiegue <fgaliegue-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>  2010-01-18 07:14:06 PST ---
I confirm the bug, I observe the same here. My card is reported as such by
lspci:

01:00.0 VGA compatible controller: nVidia Corporation G86 [GeForce 8500 GT]
(rev a1)

(lspci reports: 01:00.0 0300: 10de:0421 (rev a1))

I use git libdrm and xf86-video-nouveau. This is a Gentoo unstable amd64
machine.

I boot with drm.debug=6 and I notice that there is a sequence of calls as this:


* nv50_cursor_set_offset;
* nv50_cursor_show;
* this last sequence repeated many times;
* then nv50_cursor_hide.

But when the bug appears, the nv50_cursor_hide show is nowhere to be seen.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
