From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 34554] Nouveau seems to have corrupted my laptop
 screen's EDID info
Date: Thu, 24 Feb 2011 15:24:29 -0800 (PST)
Message-ID: <20110224232429.55C1A13000B@annarchy.freedesktop.org>
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

--- Comment #6 from Thibaut GIRKA <thib-QrglDn8ccD4xJeROf7iEAA@public.gmane.org> 2011-02-24 15:24:27 PST ---
Created an attachment (id=43772)
 --> (https://bugs.freedesktop.org/attachment.cgi?id=43772)
Xorg logs with blob

I've tried the nvidia blob, and as expected it kept failing (see
Xorg.0.log.blob) until I passed it the "fixed" EDID info using the "CustomEDID"
option.

I've made sure the EDID is loaded from I2C (and not VBIOS or anything else) by
adding a few debug statements.

I've also figured out exactly why "new" DRM doesn't fix the header: it doesn't
check the whole record in one go, and tries to determine whether the current
block is the first by checking the first byte.
In my case, the first byte is wrong (0x1a instead of 0x00), so, it doesn't get
corrected.
I've modified the code and forced the first byte (of the whole EDID data) to 0
so I can use my laptop's screen with 2.6.37-1.

Running linux 2.6.37-1 again, I've had 3 different bad EDID reports, but I
haven't found a way to reproduce it yet.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
