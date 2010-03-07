From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 26800] Nouveau TV-out incorrectly detecting load
Date: Sun,  7 Mar 2010 10:24:33 -0800 (PST)
Message-ID: <20100307182433.7248E13009D@annarchy.freedesktop.org>
References: <bug-26800-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-26800-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=26800





--- Comment #5 from Andy Rink <personman_145-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org>  2010-03-07 10:24:32 PST ---
(In reply to comment #4)
> 
> 'Option "UseDisplayDevice" "TV"' in 'Section "Device"' should do it.
> 

If I understand the mmiotrace thing correctly, I will need to:

1.) stop X

2.) unload the nouveau modules

3.) plug in the TV

4.) start the trace

5.) load the nouveau modules

6.) end the trace, compress the results and send them to "mmio dot dumps at
gmail dot com"

So correct me if I'm wrong, but xorg.conf shouldn't really come in to play
here?

The problem does exhibit itself without even loading X.

-Andy


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
