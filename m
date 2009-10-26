From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 24710] nouveau KMS fails on NV11 - screen displays
	last input
Date: Mon, 26 Oct 2009 11:53:08 -0700 (PDT)
Message-ID: <20091026185308.E60521300CD@annarchy.freedesktop.org>
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


Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |NOTOURBUG




--- Comment #4 from Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>  2009-10-26 11:53:08 PST ---
(In reply to comment #3)
> Now I compiled fbcon as module, git today, branch master.
> I booted the new kernel, unload nouveau, modprobe fbcon, modprobe nouveau
> modeset=1
> 
> The problem still holds.
> 
> More precisely I see my frozen VT, but today I recognized the Cursor is
> blinking (this is not a different to fbcon builtin, I just recognized it
> today). But I don't know if this makes any differences.
> 
> greetings
> 

From your logs:
> [drm:edid_is_valid] *ERROR* EDID checksum is invalid, remainder is 141

Doesn't sound like nouveau's fault, your monitor probably reports a broken
EDID. To workaround it you can manually set the framebuffer resolution in the
kernel command line, like:
> video=VGA-1:1024x768e
(The trailing "e" forces the output to be enabled)


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
