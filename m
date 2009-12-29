From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 21536] Accelerated 2D Does Not Work On HP tx2000z
 (Geforce 6150 Go)
Date: Tue, 29 Dec 2009 11:37:20 -0800 (PST)
Message-ID: <20091229193720.73B671300DF@annarchy.freedesktop.org>
References: <bug-21536-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-21536-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=21536





--- Comment #12 from Jeremy Uchitel <circular-AMv+oqoGJ4vR7s880joybQ@public.gmane.org>  2009-12-29 11:37:19 PST ---
Hi Pekka,

Thanks so much for responding.  I've done as you asked:

1) Booted with kernel 2.6.32.2
2) replaced xorg.conf with the minimal version you referenced
3) checked out and compiled libdrm from git
4) downloaded nightly nouveau drm mods and compiled
5) checked out and compiled the nouveau ddx from git

At first, I got some nasty results (the first three new attachments) but that's
because I forgot to actually -install- the kernel nouveau drm mods...

After fixing that, I produced the latest three logfiles.  With KMS enabled,
everything works perfectly--for one X login. With KDM running, logging out gets
you a blank screen and there doesn't seem to be a way to restore the local
display.  Restarting from ssh, and trying again gets the same result, a single
good login and then a blank screen.

If I disable KMS, however with nomodeset, (and for now, just trying things from
init 3), I can start and stop X as many times as I like.  I do notice that on
line 636 of the dmesg from a KMS-enabled boot, we have this message:

[drm] nouveau 0000:00:05.0: GPU lockup - switching to software fbcon

Suggestions on where to go from here would be welcome!

Thanks again,
Jeremy


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
