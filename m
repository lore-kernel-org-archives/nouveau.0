From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 14859] External analog monitor does not show part of
 the output ( Randr12)
Date: Sat,  7 Feb 2009 16:12:45 -0800 (PST)
Message-ID: <20090208001245.50546130057@annarchy.freedesktop.org>
References: <bug-14859-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-14859-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=14859





--- Comment #26 from Stuart Bennett <sb476-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org>  2009-02-07 16:12:44 PST ---
Hi, looking at the regdumps again, the programmed monitor sizes are very
different; it's possible this is related to what's going wrong, but it seems
more likely the osx and linux radeontool dumps were made with different
monitors attached or had the same monitor running in different resolutions - do
you happen to recall if this was the case?  If it was, would you be able to
make new comparative dumps, of the same monitor (attempting) to run at the same
resolution (perhaps check in the xorg log for what res nouveau is setting, then
do the same in osx?).

The other issue is that there's something odd with the linux-made radeontool
dumps, causing the CRTC reads to be mis-indexed by one, such that the value of
CR(n) is printed in position CR(n+1).  Can you check please that there's no
modifications to your copy of radeontool before making any new dumps?  (or
clone a clean copy from git://anongit.freedesktop.org/~stuart/radeontool )


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
