From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 31957] Video Noise on HDMI output
Date: Fri, 10 Dec 2010 04:04:21 -0800 (PST)
Message-ID: <20101210120422.119BD13004E@annarchy.freedesktop.org>
References: <bug-31957-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-31957-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=31957

--- Comment #16 from James <buzzbuzz22-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org> 2010-12-10 04:04:20 PST ---
It seems that the "noise" is not actually output by the graphics card. It is
created by the TV.
Changing the contrast and brightness using TV menus changes the pattern of the
noise.
My guess is this is caused by HDCP.
I.e. The nouveau driver somehow fails to set the HDCP as "not being needed", so
the TV adds a "degraded picture".
Maybe the nvidia drivers somehow manage to set the HDCP as "not being needed",
or the nvidia drivers correctly do HDCP.
Unfortunately, my TV does not tell me if HDCP has been negotiated or not, so I
cannot tell if the nvidia driver is doing HDCP or not.

Does anyone have any ideas?

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
