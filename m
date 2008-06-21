From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 15206] [dualhead, randr12,
	ppc] Second head displays nothing
Date: Sat, 21 Jun 2008 14:39:35 -0700 (PDT)
Message-ID: <20080621213935.819E8130056@annarchy.freedesktop.org>
References: <bug-15206-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-15206-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=15206





--- Comment #13 from Robin Johnson <robbat2-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>  2008-06-21 14:39:34 PST ---
Ok, I made some very significant progress now. The memory allocation issue was
a bug in x11-drm, and was fixed by commit
1915de2c56d71bbd04a7c085cbd35fbe8e33af9d.

The display does come up [1], and xrandr thinks that both outputs work.
However, when I do "xrandr --output DVI-D-1 --right-of DVI-D-0", while the
taskbar etc all expand, nothing goes onto the second display. The power LED
continues it's blinking to indicate there is no signal.

[1] Additionally, the bswap hack seems to have mucked up colors. White comes
out as yellow. Magenta and cyan are reversed. Red and green are reversed.
Attachment coming soon.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
