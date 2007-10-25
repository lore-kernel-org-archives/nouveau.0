From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 12833] Geforce 8400M GS (id 0x427): won't start
Date: Thu, 25 Oct 2007 02:21:38 -0700 (PDT)
Message-ID: <20071025092138.901E4130009@annarchy.freedesktop.org>
References: <bug-12833-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-12833-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=12833


debian-E6TheL+NHo3k1uMJSBkQmQ@public.gmane.org changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|Geforce 8400M GS (id 0x427):|Geforce 8400M GS (id 0x427):
                   |stick to 800x600            |won't start




------- Comment #1 from debian-E6TheL+NHo3k1uMJSBkQmQ@public.gmane.org  2007-10-25 02:25 PST -------
My mistake, X didn't start at all, and Ubuntu started in fail-safe (VESA) mode.
I don't think you're interested in VESA bugs.

The kernel module failed to insert because of unresolved symbols. I will drop
the Ubuntu packages and compile it myself for a more accurate bug report.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
