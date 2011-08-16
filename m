From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 39866] Incorrectly detects Analog outputs as TV out
 on Apple Cards
Date: Mon, 15 Aug 2011 23:08:06 -0700 (PDT)
Message-ID: <20110816060806.62CE6130099@annarchy.freedesktop.org>
References: <bug-39866-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-39866-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=39866

--- Comment #7 from Jon Sturm <jonimoose-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> 2011-08-15 23:08:05 PDT ---
Created an attachment (id=50257)
 --> (https://bugs.freedesktop.org/attachment.cgi?id=50257)
dmesg after plug and unplug, no drmdebug

This is the dmesg from booting without drmdebug and I removed the adpater
before nouveau was loaded. I tried to just boot without it but it seemed to
force booting Mac OS X when no output was attached, I'm not sure why that was.  

I also started X without a display attached but xrandr claimed DVI-I-2 was
connected. Unpluging and replugging the display with X running caused xrandr to
say TV-1 disconnected but DVI-I-2 and DVI-I-1 never changed. I can run the
tests again with TV detection disabled if needed, assuming yaboot plays nicely.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
You are the assignee for the bug.
