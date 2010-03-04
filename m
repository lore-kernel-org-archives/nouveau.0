From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 26797] GeForce 6150SE: DVI-connector not detected
Date: Thu,  4 Mar 2010 07:52:25 -0800 (PST)
Message-ID: <20100304155225.40AEB1300D4@annarchy.freedesktop.org>
References: <bug-26797-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-26797-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
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

http://bugs.freedesktop.org/show_bug.cgi?id=26797





--- Comment #3 from Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>  2010-03-04 07:52:24 PST ---
Created an attachment (id=33758)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=33758)
dcb_type_4_hack.patch

Bad news... The TMDS tables in your BIOS are stale and do *not* describe how to
set up this external TMDS encoder (instead they describe an integrated encoder
that doesn't really exist in your card). 

It could still be that the modesetting process is encoded somewhere else using
a different bytecode format but I seriously doubt it, the output from this
command might give us a clearer answer:
# ./vbtracetool -l -d -s 317 2>trace.log

You can get vbtracetool here [1]. If you're very lucky the patch I'm attaching
will improve things, but probably not: most likely your encoder chip will need
its own stand-alone driver.

[1] http://cgit.freedesktop.org/~stuart/vbtracetool/


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
