From: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Bug 31676] garbled text after loading nouveau module
 on EFI boot; X driver thinks there are no connected outputs
Date: Wed, 23 Mar 2011 18:04:47 -0000
Message-ID: <op.vss5t9pw7cbmmg@emo>
References: <bug-31676-8800@http.bugs.freedesktop.org/>
	<20110323125339.90BD713004F@annarchy.freedesktop.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"; DelSp="yes"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20110323125339.90BD713004F-4GnqB8vgsbnwRzGw0Gvu8Q/tdpCO6/zZ@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Cc: gschwind-1YmjpbiIw0bR7s880joybQ@public.gmane.org
List-Id: nouveau.vger.kernel.org

Benoit Gschwind

Your system has an IGP  - integrated graphics processor, with no
memory chips. Thus no memory clk is used nor set.

nvidia-settings reports the frequency of your system memory.
In some vbioses the memory clk for IGPs is set to 0 just to explicitly
confirm the above statement.

On nva[3|5|8|f] systems the get_clock() function does not always the
clocks correctly (looking at your shader frequency)
