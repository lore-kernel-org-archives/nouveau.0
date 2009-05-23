From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 21869] Chroma mismatch using XV
Date: Sat, 23 May 2009 05:32:50 -0700 (PDT)
Message-ID: <20090523123250.5593C130058@annarchy.freedesktop.org>
References: <bug-21869-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-21869-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=21869





--- Comment #13 from Ancoron <ancoron-gfoo8dC7XAXddJNmlsFzeA@public.gmane.org>  2009-05-23 05:32:49 PST ---
(In reply to comment #12)
> What should i be looking at exactly? Is it that the buttons are visible
> transparently through the hand?
> 
> In that case, i see it as well (nv34M@ppc). Only with the overlay. Now I do
> admit that I have for a long time suspected some of the changes darktama made
> to the overlay code a few months ago reduced the image quality, but I could
> never really pinpoint it. Perhaps it is this. I will try to see if i can bisect
> it with this testcase.
> 
> Danny
> 

Yes, exactly. In addition as soon as I move the video window around the screen
it gets updated and this seems to bring the chroma back in line.

I've just reproduced the issue in a picture.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
