From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 34554] Nouveau seems to have corrupted my laptop
 screen's EDID info
Date: Wed, 23 Feb 2011 15:59:16 -0800 (PST)
Message-ID: <20110223235916.2CA64130009@annarchy.freedesktop.org>
References: <bug-34554-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-34554-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=34554

--- Comment #4 from Thibaut GIRKA <thib-QrglDn8ccD4xJeROf7iEAA@public.gmane.org> 2011-02-23 15:59:15 PST ---
Created an attachment (id=43734)
 --> (https://bugs.freedesktop.org/attachment.cgi?id=43734)
Kernel log of the working kernel with drm.debug=1

I'm now sure it's an EDID corruption, and nothing else.
The reason why the "old" nouveau works has nothing to do with nouveau, but with
drm: as you can see in the kern.log.drm.debug file, the EDID header got
corrected by drm.

Extracting the EDID dumps from kern.log.unstable reveals some pattern in the
"corruption" (see edid-changes).
I have to add that the EDID information corrected by DRM (as found in the
"edid" sysfs node) is the same as the last dump of the kern.log.unstable logs
except for the first byte (corrected to right EDID header).

Since the crash occurred as the exact time I've started my game, I guess
something in pygame's initialisation might have caused the "corruption". It
would partially explain the corruption "cycles".

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
