From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 16736] NVS 135M not supported
Date: Wed, 16 Jul 2008 08:44:14 -0700 (PDT)
Message-ID: <20080716154415.03A34130F71@annarchy.freedesktop.org>
References: <bug-16736-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-16736-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=16736





--- Comment #1 from Stefan Neufeind <freedesktop.org-Rkx4Xfb3x/xKcvNr4i3U6IQuADTiUCJX@public.gmane.org>  2008-07-16 08:44:14 PST ---
(==) Using config file: "/etc/X11/xorg.conf"
(EE) NOUVEAU(0): ========== unknown reg 0x0002130C ==========
(EE) NOUVEAU(0): ========== unknown reg 0x00021218 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x0002004C ==========
(EE) NOUVEAU(0): ========== unknown reg 0x00020060 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x00020018 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x00020018 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x00020060 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x00089008 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x00089008 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x00089028 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x00089028 ==========
(EE) NOUVEAU(0): LVDS table revision not currently supported
(EE) NOUVEAU(0): Pointers to flat panel table invalid
Raw DCB entry 0: 01000323 00010034
(EE) NOUVEAU(0): Unknown LVDS configuration bits, please report
(EE) NOUVEAU(0): 1346: No valid modes.
(EE) Screen(s) found, but none have a usable configuration.



might be related to bug #15502 ... just found that one :-( sorry. In which
would you like to track this?


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
