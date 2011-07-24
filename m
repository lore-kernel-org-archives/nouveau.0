From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 39498] nouveau hangs on unresponsive black screen at
	startup
Date: Sun, 24 Jul 2011 16:52:27 -0700 (PDT)
Message-ID: <20110724235227.9E65113015F@annarchy.freedesktop.org>
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

--- Comment #17 from Guido Trentalancia <guido-D1bseh+SzQikhjTqA1DzBQ@public.gmane.org> 2011-07-24 16:52:24 PDT ---
>> - I have a different NVidia card (mine is GeForce GT 330M);
> It also happens with a much older GeForce2 MX400.

Yours is 'NOUVEAU(0): Chipset: "NVIDIA NV84"', mine is 'NOUVEAU(0): Chipset:
"NVIDIA NVa5"'.

The identification from the kernel is similar but not exactly the same: yours
is "Detected an NV50 generation card (0x084200a2)", mine is "Detected an NV50
generation card (0x0a5480a2)". The BIOS version is also very different.

It could be an issue with similar effects but due to a different bug.

I am not an expert, therefore I have nothing else to add. We should wait for
developers to get back, I suppose...

> Mine stopped blinking after switching to Jobermayr's drm-nouveau-kmp-desktop
> and 3.0.0-2 (both installed at same time).

Well, at least you can revert back to previous versions ! Mine has never been
working !!

> PS/2 connected, or USB?

I use an internal Touchpad from Synaptics, but external USB mouse also works
fine.

> I only have a vague notion of the inner workings of X as they appear in the
> logs, but I think you see the result of prioritization of drivers to try. It
> prefers nvidia, regardless whether installed (which is never the case on any of
> my systems), next tries nouveau, next nv, and last vesa. I always see their
> *.sos listed, but only that actually used shows up in the capitalized repeats
> show which is actually used, such as in this case (II) NOUVEAU(0):

The file that you attached
(https://bugs.freedesktop.org/attachment.cgi?id=49480) also shows "(II) NV:"
and not just "(II) NOUVEAU(0):".

But, it's up to you, if you think it's pointless to try adjusting that...

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
