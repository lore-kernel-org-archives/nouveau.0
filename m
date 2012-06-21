From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 51018] kernel >=3.4.0: nouveau triggers kernel BUG
 in slub.c on GTX 560 Ti
Date: Thu, 21 Jun 2012 05:45:49 +0000
Message-ID: <bug-51018-8800-G7a9Gctlax@http.bugs.freedesktop.org/>
References: <bug-51018-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-51018-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=51018

--- Comment #4 from Vlad K <vlad.kvs-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> 2012-06-20 22:45:49 PDT ---
I had similar problems with my GTX 560 as well after switch to 3.4.X. Monitor
would go blank, or machine would reboot, or BUG screen appeared randomly (never
bothered to save it). After bisecting, issue is due to a removed variable in
drm code (https://bugzilla.kernel.org/show_bug.cgi?id=43353). Can you guys
check if you are having same issue? 


include/drm/drm_fb_helper.h:

struct drm_fb_helper_crtc {
        uint32_t crtc_id;
        struct drm_mode_set mode_set;
        struct drm_display_mode *desired_mode;
};

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
