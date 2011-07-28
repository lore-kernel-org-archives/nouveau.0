From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 38074] Dual head doesn't work for some combination
 of monitors (second screen still off)
Date: Thu, 28 Jul 2011 15:56:01 -0700 (PDT)
Message-ID: <20110728225601.BA3711301B3@annarchy.freedesktop.org>
References: <bug-38074-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-38074-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=38074

--- Comment #9 from Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> 2011-07-28 15:56:01 PDT ---
(In reply to comment #5)
> 
> That means ... DVI-I-1 always works, DVI-I-2 never works

Okay.  That's interesting to know.  There's nothing too immediately obvious as
to why that'd be the case so far..


(In reply to comment #7)
> I'm just guessing... it seems that the driver was tuned/developed for
> variations of cards, which had 1xDVI and 1xDSUB connector and thus two DVI
> outputs were not expected.

No, that's definitely supposed to work.  This problem is a board-specific
problem, and not a general issue with nouveau.

Okay.  Can you get me 2 logs.  Firstly, can you plug a single display into the
working port and boot with "log_buf_len=1M drm.debug=15 nouveau.reg_debug=0x400
3", and save the dmesg output.  Then, can you plug a single display into the
non-working port and ssh (or blindly login) and grab the dmesg output from that
also.

Can you also attach your vbios image, which can be retrieved by:

mount -t debugfs debugfs /sys/kernel/debug

And the vbios (if nouveau is loaded) will be accessible at
/sys/kernel/debug/dri/0/vbios.rom.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
