From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: =?utf-8?q?=5BBug_23291=5D_nv50=5Fprogram=2Ec=3A__In_fun?=
 =?utf-8?b?Y3Rpb24g4oCYY3Rvcl9pbW1k4oCZICwgIOKAmHLigJkgdW5kZWNsYXJlZCAo?=
 =?utf-8?q?first_use_in_this_function=29?=
Date: Fri, 14 Aug 2009 07:26:38 -0700 (PDT)
Message-ID: <20090814142638.19DD6130058@annarchy.freedesktop.org>
References: <bug-23291-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-23291-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=23291





--- Comment #5 from Renato Caldas <seventhguardian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>  2009-08-14 07:26:36 PST ---
Created an attachment (id=28632)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=28632)
Patch that fixes nv50_program.c compilation

Here's the patch.

This seems to be an ancient bug, where one instance of "r" should have been
replaced by "4" but wasn't. It never caused any problems before, because the
second REALLOC argument was discarded. This changed with this commit:

[120e76866b4b0d136ae4ed377c6ff96454e39b95] util: silence warnings for third
REALLOC argument


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
