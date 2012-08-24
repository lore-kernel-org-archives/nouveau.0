From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 53101] Fedora 17 "PFIFO - playlist update failed" on
	boot
Date: Fri, 24 Aug 2012 02:34:33 +0000
Message-ID: <bug-53101-8800-cbLx61uSmo@http.bugs.freedesktop.org/>
References: <bug-53101-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-53101-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

https://bugs.freedesktop.org/show_bug.cgi?id=53101

--- Comment #11 from Kelly Doran <kel.p.doran-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> 2012-08-24 02:34:33 UTC ---
I have been playing around with this a bit and made some progress.  It seems to
affect any nvc0 card (I have a GTX 580).  I went through the commits between
3.4.0 and 3.5.0-rc1 and determined that the cause of the error is
http://cgit.freedesktop.org/nouveau/linux-2.6/commit/?id=1a46098e910b96337f0fe3838223db43b923bad4

The cards work fine with the latest nouveau git tree if you comment out:
        { "COPY1", 5, 0x90b8, nvc0_bo_move_copy, nvc0_bo_move_init },
        { "COPY0", 4, 0x90b5, nvc0_bo_move_copy, nvc0_bo_move_init },

which seems to imply that the nvc0_bo_move_copy function is not working
correctly.  I don't know nearly enough about nouveau to try to fix this
function or know what consequence commenting out these lines has, but hopefully
this helps.

On a possibly related note, running glxinfo seems to crash xorg and produce
some more PFIFO errors in dmesg, I have no idea if this is related to those
lines being commented out or not (this is the first time I have ever gotten
nouveau working on this computer).  Everything else seems stable... so far...

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
