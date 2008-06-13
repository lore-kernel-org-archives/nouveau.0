From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 16231] Xv tearing after upgrade to Fedora 9
Date: Fri, 13 Jun 2008 13:52:47 -0700 (PDT)
Message-ID: <20080613205247.C9F5F130056@annarchy.freedesktop.org>
References: <bug-16231-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-16231-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=16231





--- Comment #3 from Pierre Ossman <drzeus-bugzilla-p3sGCRWkH8CeZLLa646FqQ@public.gmane.org>  2008-06-13 13:52:47 PST ---
One solution is also to make sure things are vsync:ed when they are transferred
on screen by the X server. I did a quick hack in NVExaCopy() that solved the
issue:

        if (NVExaPixmapIsOnscreen(pDstPixmap)) {
                uint8_t crtcs = nv_window_belongs_to_crtc(pScrn, dstX, dstY,
width, height);

                FIRE_RING();
                if (crtcs & 0x1)
                        NVWaitVSync(pScrn, 0);
                else if (crtcs & 0x2)
                        NVWaitVSync(pScrn, 1);
        }

It slows down a whole bunch of operations though, so it would need to be a bit
more clever.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
