From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 15675] Randr12: works from command-line but not in
	xorg.conf
Date: Wed, 23 Apr 2008 10:46:50 -0700 (PDT)
Message-ID: <20080423174650.6E55013030B@annarchy.freedesktop.org>
References: <bug-15675-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-15675-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=15675





--- Comment #3 from Andrew McNabb <amcnabb-2BOxfIlzoBpAfugRpC6u6w@public.gmane.org>  2008-04-23 10:46:49 PST ---
Created an attachment (id=16132)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=16132)
xorg.conf

I tried doing what you recommended, but it didn't seem to help.  Here's the new
xorg.conf.

By the way, the page you pointed to had an example that said:

# no need to specific Monitor-VGA-0, it uses the "VGA-0" identifier
automatically

This seems to be consistent with how things are working on the other machine,
where the RightOf, LeftOf, etc. were being respected even though there was no
Option "Monitor-DVI-D-0" "FOO"

Thanks again for your help.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
