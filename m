From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 40406] Nouveau NVIDIA NV46: Freeze
Date: Sat,  1 Oct 2011 08:11:40 -0700 (PDT)
Message-ID: <20111001151140.E5ADC1300CC@annarchy.freedesktop.org>
References: <bug-40406-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-40406-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=40406

--- Comment #13 from Marco <marco-w08N04152XNe4xh82S9ftw@public.gmane.org> 2011-10-01 08:11:40 PDT ---
Ok, now, it gets weird.

I upgraded xorg-server a few days ago:
Thu Sep 29 10:14:50 2011 >>> x11-base/xorg-drivers-1.11
Thu Sep 29 10:21:09 2011 >>> x11-base/xorg-server-1.11.0
Thu Sep 29 10:25:48 2011 >>> x11-drivers/xf86-input-synaptics-1.4.0
Thu Sep 29 10:26:14 2011 >>> x11-drivers/xf86-input-evdev-2.6.0
Thu Sep 29 10:27:10 2011 >>> x11-drivers/xf86-video-nouveau 0.0.16_pre20110801

The result is a completely new behaviour. Instead of a beginning sluggishness
of the system and a system lock after SYSRQ, I got an immediate system freeze.
My music stopped working, no X, no mouse, no keyboard, no log files. Just a
screenshot (attached).

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
