From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 24820] [nv15] Vertical screen corruption in X when
 KMS is enabled
Date: Fri, 27 Nov 2009 10:19:24 -0800 (PST)
Message-ID: <20091127181924.BC14C1300D6@annarchy.freedesktop.org>
References: <bug-24820-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-24820-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=24820





--- Comment #25 from Johannes Obermayr <johannesobermayr-Mmb7MZpHnFY@public.gmane.org>  2009-11-27 10:19:23 PST ---
A new friday - a new status report:

(In reply to comment #23)
> last patch but this one should fix it.
> 

I tried it with arb_rewrite2.patch and also with

[PATCH 1/3] drm/nouveau: Update the CRTC arbitration parameters on FB depth
switch
[PATCH 2/3] drm/nouveau: Clean up the arbitration parameters calculation code.
[PATCHv2 3/3] drm/nv10-nv20: CRTC arbitration code rewrite.

X works but console has flickering artifacts with both.
(see http://www.freeimagehosting.net/uploads/0f34a8e515.jpg)

(In reply to comment #24)
>> With a Snapshot via KSnapshot I can see the artifacts, too. (If visible on
>> "normal" screen at time when "KSnapshotting").
>> 
>
>Does it go away if you set this Section "Device" option in your xorg.conf?
>> Option "EXANoComposite" "on"

Yes, but there are other artifacts: E. g. bottom left and bottom right
"Position" line or "Gamma" with corrupted last "a" and "Mehrere Monitore" with
corrupted last "e". 
(see http://www.freeimagehosting.net/uploads/d94750f7aa.png)

Do you need a current dmesg?


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
