From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 12825] TvTime shows only the upper left corner (~
 1280x1024) in Randr1 .2
Date: Sun, 16 Mar 2008 12:08:06 -0700 (PDT)
Message-ID: <20080316190806.DAE5A130177@annarchy.freedesktop.org>
References: <bug-12825-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-12825-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=12825





--- Comment #18 from Stuart Bennett <sb476-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org>  2008-03-16 12:08:05 PST ---
I've tracked this down, and found two(ish) fixes.

The problem is that currently the video overlay gets clipped to the screen
viewport in xf86XVClipVideoHelper(), the viewport having been determined (as
"clipBoxes" in DDX parlance) by xf86XVPutStill in the xserver before calling
back into NVPutImage and then NV_set_dimensions where xf86XVClipVideoHelper is
called. This would all be fine except that xf86XVPutStill uses pScrn->frameX1
and pScrn->frameY1 which are wrong (they don't map well to the randr12
world-view). I'd argue therefore for this being an xserver issue.

Unfortunately fixes to the xserver take time, so a driver work-around is
required:
1a) do something like
pScrn->frameX1 = xf86_config->crtc[pPriv->overlayCRTC]->x +
xf86_config->crtc[pPriv->overlayCRTC]->mode.HDisplay - 1;
(and similarly for frameY1) when the overlay CRTC is known, to provide a
sensible value for clipping
1b) do something like pScrn->frameX1 = pScrn->virtualX - 1; (and similarly for
frameY1)  to provide a sensible (if large) value for clipping
2) remove the flag VIDEO_CLIP_TO_VIEWPORT from nv_video.c to remove the
clipping altogether. Depending how the rest of the code works, this could be a
bad move due to excessive bandwidth usage and very-very-large frames being
larger than the overlay can handle

(an xserver bug ought to be filed once a suitable resolution is found)


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
