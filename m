From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 20130] GT200: nv50 chipset 0xa0 2D corruption
Date: Thu, 28 May 2009 12:53:19 -0700 (PDT)
Message-ID: <20090528195319.7E12F13005A@annarchy.freedesktop.org>
References: <bug-20130-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-20130-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=20130


Peter Hjalmarsson <xake-ca8b1Tj3MiseIZ0/mPfg9Q@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |xake-ca8b1Tj3MiseIZ0/mPfg9Q@public.gmane.org




--- Comment #15 from Peter Hjalmarsson <xake-ca8b1Tj3MiseIZ0/mPfg9Q@public.gmane.org>  2009-05-28 12:53:18 PST ---
How is this going?

Looking at the last screenshot that is what I currently gets on my:
02:00.0 VGA compatible controller [0300]: nVidia Corporation GT200b [GeForce
GTX 285] [10de:05e3] (rev a1)

(i.e. nearly everything seems to draw nice exept my icons and my fonts)

That is with latest x11-drm, libdrm and xf86-video-nouveau checked out from git
fresh today.

Is there anything I can provide to get this going? (I have Xorg and dmesg of
drm debug=1 when it fails)

Oh, nearly forgot to tell that everything looks perfect when using NoAccel True
in xorg.conf.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
