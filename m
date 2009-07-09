From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 21124] nouveau: fonts "chipped" on NV44
Date: Wed,  8 Jul 2009 20:26:13 -0700 (PDT)
Message-ID: <20090709032613.5B70613005B@annarchy.freedesktop.org>
References: <bug-21124-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-21124-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=21124





--- Comment #6 from Patrick <mail-Hgn/qBBDvdx9j6dlVq79qF6hYfS7NtTn@public.gmane.org>  2009-07-08 20:26:12 PST ---
Created an attachment (id=27508)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=27508)
Changes with different sub-pixel rendering and hinting style settings

I have the exact same problem on Fedora 11 (just upgraded from Fedora 10).

Hardware:
01:00.0 VGA compatible controller: nVidia Corporation GeForce 7100 GS (rev a1)

Fedora's version string:
0.0.12-40.20090528git0c17b87.fc11

It changed when I played around with KDE's "sub-pixel rendering" and "hinting
style" settings, see for yourself in the attached PNG.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
