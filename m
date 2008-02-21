From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 14597] randr12 failures on 12" powerbooks,
	and workarounds
Date: Thu, 21 Feb 2008 00:08:18 -0800 (PST)
Message-ID: <20080221080818.2362B13006F@annarchy.freedesktop.org>
References: <bug-14597-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-14597-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=14597





--- Comment #5 from Danny <obiwan-ajv+KCCKUOlAfugRpC6u6w@public.gmane.org>  2008-02-21 00:08:17 PST ---
Created an attachment (id=14474)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=14474)
patch to provisionally work around the randr12 problems

I tried to have the registers match the values provided by OF better. Although
for some reason, the calculated ppls are very different from OF (and also
different from the kernel rivafb framebuffer driver) they do seem to work.

It would be nice if there be some was as to at least set some sensible virtualX
value (ie matching the native size?). But perhaps it is just my old X server
being broken.

The other thing is I wonder if once could not calculate a Vrefresh from DDC as
to prevent the need to remove the ranges from xorg.conf.

The rest of the patch:
1) sets the manufacturerindex to 1 to get to the correct offset
2) prevents the setting of a high bit of fp_control[1] which makes my screen
black if set
3) prevents running of the LVDS_RESET script. This changes the content of many
registers leading again to a black screen. Perhaps we do not run the script
correctly (some code there use again values got from the bios, which may be
incorrect and leading to problems in both 2 and 3)

With the patch i can resize and rotate modes. Switch to console works most of
the time, with the exception that the screen is slightly shifted to the left
(ie, in text mode, login: appears somewhere (ca 6 chars from) the right of the
display.

I have not tested the analog output yet with this patch (will do soon).

d.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
