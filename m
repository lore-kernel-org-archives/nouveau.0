From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 10927] segmentation fault in NVUploadToScreen,
	called from exaPutImage
Date: Sun, 10 Jun 2007 15:15:23 -0700 (PDT)
Message-ID: <20070610221523.41F6C13006E@annarchy.freedesktop.org>
References: <bug-10927-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-10927-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=10927





------- Comment #3 from chris-fdbugs-OsFVWbfNK3isTnJN9+BGXg@public.gmane.org  2007-06-10 15:15 PST -------
My backtrace isn't quite the same as pq's.  His:

#5  0x000000000061161e in Xfree (ptr=0xc9cc50) at utils.c:1470
#6  0x00002ac5fbfa612c in fbDestroyPixmap (pPixmap=0xc9cc50) at fbpixmap.c:105
#7  0x00002ac5fc0cb7f3 in exaDestroyPixmap (pPixmap=0xc9cc50) at exa.c:218

Mine:

#6  0x081bb591 in Xfree (ptr=0x0) at utils.c:1470
#7  0x00fd5a4a in fbDestroyPixmap (pPixmap=0x6) at fbpixmap.c:105
#8  0x001f066b in exaDestroyPixmap (pPixmap=0x8d2c760) at exa.c:218

I can't see where the pointer's being lost.  I added debugging to
exaDestroyPixmap(), printing pPixmap, and I get a valid pointer right up to the
return line:

 195     return fbDestroyPixmap (pPixmap);

(WW) in exaDestroyPixmap, pPixmap = 8648e30
(WW) after ExaPixmapPriv, pPixmap = 8648e30
-- 0x0x400122 (0x500000) (398x50)
Free 0x13880 -> 0x500000 (0x500000)
        done freeing
(WW) after exaOffscreenFree, pPixmap = 8648e30
(WW) after REGION_UNINIT, pPixmap = 8648e30
(WW) returning, pPixmap = 8648e30

Yet when we enter fbDestroyPixmap, we have pPixmap=0x6?


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
