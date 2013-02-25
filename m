From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 50121] [Regression] Since kernel v3.5 several cards
 fail to resume, introduced by: 'convert to exec engine,
 and improve channel sync'
Date: Mon, 25 Feb 2013 19:40:05 +0000
Message-ID: <bug-50121-8800-uTEV841jN6@http.bugs.freedesktop.org/>
References: <bug-50121-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1862276610=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-50121-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1862276610==
Content-Type: multipart/alternative; boundary="1361821206.3f0e26a35.3118"; charset="us-ascii"


--1361821206.3f0e26a35.3118
Date: Mon, 25 Feb 2013 19:40:06 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=50121

--- Comment #68 from Ronald <ronald645-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Is it consistent, git says 'no':

ronald@Alpha /usr/src/linux :) $ git log --oneline --no-merges v3.7.4...v3.7.9
-- drivers/gpu/drm
330b8ab drm/nouveau: add lockdep annotations
c7fc196 drm/radeon: Calling object_unrefer() when creating fb failure
b666341 drm/radeon: prevent crash in the ring space allocation
3e15c0b drm/radeon: protect against div by 0 in backend setup
f69c00e drm/radeon: fix backend map setup on 1 RB sumo boards
cb23301 drm/radeon: fix MC blackout on evergreen+
04589e1 drm/radeon: add quirk for RV100 board
4e370f5 drm/radeon: add WAIT_UNTIL to the non-VM safe regs list for cayman/TN
83f83a0 drm/radeon/evergreen+: wait for the MC to settle after MC blackout
ec8a7ca drm/i915: fix FORCEWAKE posting reads
710c8f5 drm/radeon: fix a rare case of double kfree
c140fec drm/radeon: fix error path in kpage allocation
72b56e8 efi: Make 'efi_enabled' a function to query EFI facilities
8a9d24b drm/i915: dump UTS_RELEASE into the error_state
36ce28c drm/i915: GFX_MODE Flush TLB Invalidate Mode must be '1' for scanline
waits
924782c drm/i915: Disable AsyncFlip performance optimisations
18c8e49 radeon_display: Use pointer return error codes
45bced1 drm/radeon: fix cursor corruption on DCE6 and newer
dd1b4df drm/i915: Implement WaDisableHiZPlanesWhenMSAAEnabled
5afeb70 drm/i915: Invalidate the relocation presumed_offsets along the slow
path

Don't think the lockdep annotations do anything that changes the code. But you
might want to give it a try...

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1361821206.3f0e26a35.3118
Date: Mon, 25 Feb 2013 19:40:06 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - [Regression] Since kernel v3.5 several cards fail to resume, introduced by: 'convert to exec engine, and improve channel sync'"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=50121#c68">Comment # 68</a>
              on <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - [Regression] Since kernel v3.5 several cards fail to resume, introduced by: 'convert to exec engine, and improve channel sync'"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=50121">bug 50121</a>
              from <span class="vcard"><a class="email" href="mailto:ronald645&#64;gmail.com" title="Ronald &lt;ronald645&#64;gmail.com&gt;"> <span class="fn">Ronald</span></a>
</span></b>
        <pre>Is it consistent, git says 'no':

ronald&#64;Alpha /usr/src/linux :) $ git log --oneline --no-merges v3.7.4...v3.7.9
-- drivers/gpu/drm
330b8ab drm/nouveau: add lockdep annotations
c7fc196 drm/radeon: Calling object_unrefer() when creating fb failure
b666341 drm/radeon: prevent crash in the ring space allocation
3e15c0b drm/radeon: protect against div by 0 in backend setup
f69c00e drm/radeon: fix backend map setup on 1 RB sumo boards
cb23301 drm/radeon: fix MC blackout on evergreen+
04589e1 drm/radeon: add quirk for RV100 board
4e370f5 drm/radeon: add WAIT_UNTIL to the non-VM safe regs list for cayman/TN
83f83a0 drm/radeon/evergreen+: wait for the MC to settle after MC blackout
ec8a7ca drm/i915: fix FORCEWAKE posting reads
710c8f5 drm/radeon: fix a rare case of double kfree
c140fec drm/radeon: fix error path in kpage allocation
72b56e8 efi: Make 'efi_enabled' a function to query EFI facilities
8a9d24b drm/i915: dump UTS_RELEASE into the error_state
36ce28c drm/i915: GFX_MODE Flush TLB Invalidate Mode must be '1' for scanline
waits
924782c drm/i915: Disable AsyncFlip performance optimisations
18c8e49 radeon_display: Use pointer return error codes
45bced1 drm/radeon: fix cursor corruption on DCE6 and newer
dd1b4df drm/i915: Implement WaDisableHiZPlanesWhenMSAAEnabled
5afeb70 drm/i915: Invalidate the relocation presumed_offsets along the slow
path

Don't think the lockdep annotations do anything that changes the code. But you
might want to give it a try...</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1361821206.3f0e26a35.3118--

--===============1862276610==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1862276610==--
