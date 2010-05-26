From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 26733] Full-screen XV causes graphics lockup
Date: Wed, 26 May 2010 05:40:36 -0700 (PDT)
Message-ID: <20100526124036.42D6213000D@annarchy.freedesktop.org>
References: <bug-26733-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-26733-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=26733

--- Comment #19 from Bastien <bastien0705-YDxpq3io04c@public.gmane.org> 2010-05-26 05:40:36 PDT ---
Created an attachment (id=35865)
 --> (https://bugs.freedesktop.org/attachment.cgi?id=35865)
Kernel log. The issue occurs at 19:02.

Sorry for the duplicate.
I attach my own log here so you don't have to check my report. Here are the
important lines :
... [drm] nouveau 0000:02:00.0: PFIFO_DMA_PUSHER - Ch 2
... [drm] nouveau 0000:02:00.0: PGRAPH_DATA_ERROR - Ch 2/5 Class 0x8397 Mthd
0x0e08 Data 0x00000000:0x3f4c0000
... [drm] nouveau 0000:02:00.0: PGRAPH_DATA_ERROR - INVALID_VALUE

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
