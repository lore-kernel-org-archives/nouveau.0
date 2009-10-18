From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 24370] nouveau and xorg-server-1.7 does not work
 without NoAccel
Date: Sun, 18 Oct 2009 11:05:15 -0700 (PDT)
Message-ID: <20091018180515.81E4213005D@annarchy.freedesktop.org>
References: <bug-24370-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-24370-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=24370





--- Comment #7 from Peter Hjalmarsson <xake-ca8b1Tj3MiseIZ0/mPfg9Q@public.gmane.org>  2009-10-18 11:05:14 PST ---
I tried getting vanilla kernel sources, and applying
http://cvs.fedoraproject.org/viewvc/rpms/kernel/F-12/drm-nouveau.patch?revision=1.64
and
http://cvs.fedoraproject.org/viewvc/rpms/kernel/F-12/drm-next-d4ac6a05.patch?revision=1.2
to get the former to compile.

Then I applied 
http://cvs.fedoraproject.org/viewvc/rpms/xorg-x11-drv-nouveau/F-12/nouveau-tile7000.patch?revision=1.7
to my xf86-video-nouveau.

And after this gtk+ applications were working like they should in
xorg-server-1.7.

By disabling the semi-transparent background on gnome-panels also the Assert
(ret==0) crash went away.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
