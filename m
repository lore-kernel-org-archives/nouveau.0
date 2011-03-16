From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 29766] suspend-to-ram problem on GF7600 notebook
Date: Wed, 16 Mar 2011 12:42:42 -0700 (PDT)
Message-ID: <20110316194242.60DDF13004F@annarchy.freedesktop.org>
References: <bug-29766-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-29766-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=29766

--- Comment #5 from Michael Tokarev <mjt-XAri/EZa3C4vJsYlp49lxw@public.gmane.org> 2011-03-16 12:42:42 PDT ---
This problem still exists with current 2.6.38 kernel.  Here's some more
information about it.

The most important part is that the notebook can suspend+resume just fine (and
fast!) when _external_ monitor is connected to its VGA output.  The only
annoyance in this case (besides the whole fact that it needs external monitor
to function properly) is that only external monitor shows anything at all up
until the nouveau driver is loaded or when it finishes the resume-from-disk
cycle.  So it appears that the whole thing works with external VGA attached.

When only internal (LVDS) panel is connected, the machine never resumes
correctly: it works, it's visible from the network, all processes are working,
but the screen stays blank, even after re-connecting the external monitor.

Attached are two dmesgs with 2.6.38 kernel from bootup.  First,
dmesg-2.6.32-good-extvga, shows 2 successful suspend-resume (ram) cycles with
external monitor connected.  Another, dmesg-bad-noextvga, shows one
unsuccessful attempt to suspend-resume it, with quite some errors/warnings from
nouveau driver at the end.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
