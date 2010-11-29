From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 31961] [drm:drm_crtc_helper_set_config] *ERROR*
 failed to set mode on [CRTC:6]
Date: Mon, 29 Nov 2010 04:54:06 -0800 (PST)
Message-ID: <20101129125406.4B55813004D@annarchy.freedesktop.org>
References: <bug-31961-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-31961-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=31961

--- Comment #3 from Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org> 2010-11-29 04:54:05 PST ---
(In reply to comment #0)
> I noticed in dmesg these lines;
> 
> [drm:drm_crtc_helper_set_config] *ERROR* failed to set mode on [CRTC:6]
> fbcon_init: detected unhandled fb_set_par error, error code -22
> [drm:drm_crtc_helper_set_config] *ERROR* failed to set mode on [CRTC:6]
> Console: switching to colour frame buffer device 90x36
> [drm:drm_crtc_helper_set_config] *ERROR* failed to set mode on [CRTC:6]
> fb0: nouveaufb frame buffer device
> drm: registered panic notifier
> 

Any chance you could run the nvidia binary driver in that box with no outputs
connected and no output-related options in xorg.conf? (e.g. make sure you don't
have "UseDisplayDevice" or "ConnectedMonitor" lines) Then can you ssh in from
another machine and grab a register dump (running this program as root:
http://cgit.freedesktop.org/~currojerez/tvdump/) and your Xorg log?

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
