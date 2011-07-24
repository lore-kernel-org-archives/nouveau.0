From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 39498] nouveau hangs on unresponsive black screen at
	startup
Date: Sun, 24 Jul 2011 12:08:27 -0700 (PDT)
Message-ID: <20110724190828.4D06A1300EB@annarchy.freedesktop.org>
References: <bug-39498-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-39498-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=39498

--- Comment #9 from Guido Trentalancia <guido-D1bseh+SzQikhjTqA1DzBQ@public.gmane.org> 2011-07-24 12:08:25 PDT ---
Emil, I tried following your advice, using the original driver which comes with
kernel 3.0.0-git3 but the problem is still there (it gets stuck on an
unresponsive black screen which only displays a small underscore "_" in the top
left corner and I do not get the gdm greeter).

I am going to attach the logs (as file
nouveau-discrete-with_Accel-kernel_3.0.0-git3-driver-no-aiglx-do_not_require_glx.txt),
but I am sure they are very similar to the previous ones except from AIGLX
being disabled and GLX loading only once (by default).

I will keep those two settings as you suggested from now on, but so far nothing
has changed unfortunately !

Next I will try the kernel driver from the snapshot (commit
4fc2e2fc0157433883f10e0d7327c73069c66d63) on the 3.0.0-git3, but at this point
I really doubt it would sort things out.

I am not sure but perhaps the only difference between the kernel module shipped
with the upstream kernel and the out-of-place kernel module from the snapshot
is that the following line is missing in the snapshot:

[drm] nouveau 0000:01:00.0: Pointer to BIT loadval table invalid

Other than that with kernel 3.0.0 there was no practical difference between the
two kernel drivers (upstream and freedesktop snapshot).

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
