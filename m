From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 20006] powerpc64: Black screen using RandR12
Date: Fri, 13 Feb 2009 07:51:06 -0800 (PST)
Message-ID: <20090213155106.5D638130057@annarchy.freedesktop.org>
References: <bug-20006-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-20006-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=20006





--- Comment #20 from bmaass <bmaass-o02PS0xoJP/7u6qtEXMtuoQuADTiUCJX@public.gmane.org>  2009-02-13 07:51:05 PST ---
BIG CORRECTION!!!

As the picture error didn't get corrected when killing the server, I didn't
notice that patches 1+2+3 actually give a GOOD PICTURE, until I retested after
a reboot.

Your other suggestion, concerning FPScale, didn't seem to have any effect. I
tested:

patches 1+2+3, FPScale on: good picture
patches 1+2, FPScale on: bad picture
patches 1+2, FPScale off: bad picture
no patches, FPScale on: no picture
no patches, FPScale off: no picture

Are you still interested in a photo of the screen distortion?


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
