From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 29846] NV4B startx results in black screen
Date: Sat, 28 Aug 2010 04:09:42 -0700 (PDT)
Message-ID: <20100828110942.0FDC01300B6@annarchy.freedesktop.org>
References: <bug-29846-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-29846-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=29846

--- Comment #1 from Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org> 2010-08-28 04:09:41 PDT ---
(In reply to comment #0)
> Created an attachment (id=38230)
 --> (https://bugs.freedesktop.org/attachment.cgi?id=38230)
> dmesg of nouveau module load and startx
> 
> My NV4b card starts X but it results in a black screen.
> I see a bunch of errors continually like:
> [drm:drm_edid_block_valid] *ERROR* Raw EDID:
> ...
> nouveau 0000:03:00.0: TV-1: EDID block 0 invalid.
> [drm] nouveau 0000:03:00.0: DDC responded, but no EDID for TV-1
> 
Uhm, I'd swear I had fixed this a couple of weeks ago... It seems the merge of
"v2.6.36-rc1" reverted half of the fix by accident, can you try again with
latest git?

> I am connecting the card to a vga display via a dvi+vga converter.  
> I tried disabling tv out by using tv_disable=1 at the command line but that
> doesn't seem to help.
> 
> This card has actually started X fine in the past and this is the same monitor
> I used before.
> 
> I am running the latest nouveau-linux-2.6 kernel
> (764e0885f987171030368a3f20993cd2855c4e40).

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
