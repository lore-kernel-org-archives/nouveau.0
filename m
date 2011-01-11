From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 32959] X fails to set mode on NV11 and dies.
Date: Tue, 11 Jan 2011 06:23:48 -0800 (PST)
Message-ID: <20110111142348.85D0913004F@annarchy.freedesktop.org>
References: <bug-32959-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-32959-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=32959

--- Comment #9 from Alex Buell <alex.buell-XLQCo7u1tb3e9xe1eoZjHA@public.gmane.org> 2011-01-11 06:23:48 PST ---
Ok, 2.6.37 is a total disaster. 

Booting w/o video=LVDS-1:d resulted in a solid kernel lockup. Not able to ssh
in and look for myself what was wrong.

Booting /w video=LVDS-1:d, resulted in a booting 2.6.37 kernel, looks OK but X
wouldn't start. 

(==) Log file: "/var/log/Xorg.0.log", Time: Tue Jan 11 14:23:10 2011
(==) Using system config directory "/usr/share/X11/xorg.conf.d"
(EE) Failed to load module "vesa" (module does not exist, 0)
(EE) Failed to load module "fbdev" (module does not exist, 0)
(EE) NOUVEAU(0): Error allocating scanout buffer: 0

Fatal server error:
AddScreen/ScreenInit failed for driver 0

dmesg and Xorg.0.log attached.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
