From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 26349] nouveau_hybrid_setup: disables a discrete NVS
 3100m on ThinkPad T410
Date: Mon,  1 Feb 2010 03:49:38 -0800 (PST)
Message-ID: <20100201114938.28F1813006E@annarchy.freedesktop.org>
References: <bug-26349-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-26349-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=26349





--- Comment #2 from Pavel S. <pav_s-KuiJ5kEpwI6ELgA04lAiVw@public.gmane.org>  2010-02-01 03:49:37 PST ---
(In reply to comment #1)
> Is this a hybrid graphics system?
> 

Im' sorry, I forgot that last part of my post...

As far as I know it is something in between a real hybrid an just the discrete
graphics: the NVS 3100m is built on the mainboard, while there is Intel's GPU
on the Arrandale CPU (connected through QPI AFAIK). At lest it should be there
-  I have neither seen it in the device manager in windows, nor in lspci.
Windows 7 can switch to "low power graphics" though...

( Does anybody know about these Arrandale GPU's? )


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
