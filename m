From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 17138] Randr12 on nv34m causes colour corruption on
 laptop panel.
Date: Thu, 14 Aug 2008 12:06:08 -0700 (PDT)
Message-ID: <20080814190608.CC76A131105@annarchy.freedesktop.org>
References: <bug-17138-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-17138-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=17138





--- Comment #3 from Murray Campbell <murray-Xhi4+0Yxd7rk1uMJSBkQmQ@public.gmane.org>  2008-08-14 12:06:08 PST ---
Created an attachment (id=18286)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=18286)
Xorg.0.log with patch

This is the Xorg.0.log with Randr12 enabled and nv_bios.c modified by applying
the patch:

--- nv_bios.c   2008-08-14 19:56:33.000000000 +0100
+++ nv_bios.c.altered   2008-08-14 19:56:02.000000000 +0100
@@ -3154,6 +3154,8 @@
                         * lvdsmanufacturerindex in this case; we don't */
                }

+               lvdsmanufacturerindex=3;
+
                headerlen = 2;
                recordlen = bios->data[bios->fp.lvdsmanufacturerpointer + 1];



-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
