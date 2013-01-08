From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 59069] nouveau E[     DRM] fail ttm_validate
Date: Tue, 08 Jan 2013 15:19:55 +0000
Message-ID: <bug-59069-8800-uAzOctzeVB@http.bugs.freedesktop.org/>
References: <bug-59069-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0357121803=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-59069-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0357121803==
Content-Type: multipart/alternative; boundary="1357658396.E7A8b52.25523"; charset="us-ascii"


--1357658396.E7A8b52.25523
Date: Tue, 8 Jan 2013 15:19:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=59069

--- Comment #9 from Kees Bakker <kees.bakker-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org> ---
Created attachment 72680
  --> https://bugs.freedesktop.org/attachment.cgi?id=72680&action=edit
Another dmesg with an early PROTECTION_FAULT but still functional X

Today no reboot boot yet. The X server is still up, but for a moment I thought
it got stuck. Last messages are:

[20361.350868] nouveau E[     DRM] fail ttm_validate
[20361.350875] nouveau E[     DRM] validate vram_list, vram_list_size:
183160832, gart_list_size: 4780032, both_list_size: 0
[20361.350959] nouveau E[     DRM] validate: -12 [compiz[5399]]
[20364.892611] nouveau E[     DRM] reloc wait_idle failed: -16
[20364.892618] nouveau E[     DRM] reloc apply: -16 [compiz[5399]]
[20365.091459] nouveau E[     DRM] fail ttm_validate
[20365.091465] nouveau E[     DRM] vram
[20365.091491] nouveau E[     DRM] validate: -16 [compiz[5399]]
[20374.260008] nouveau E[     DRM] reloc wait_idle failed: -16
[20374.260015] nouveau E[     DRM] reloc apply: -16 [Xorg[3542]]
[20377.261006] nouveau E[     DRM] reloc wait_idle failed: -16
[20377.261013] nouveau E[     DRM] reloc apply: -16 [Xorg[3542]]
[20377.262000] [sched_delayed] sched: RT throttling activated
[20380.951008] nouveau E[     DRM] reloc wait_idle failed: -16
[20380.951015] nouveau E[     DRM] reloc apply: -16 [Xorg[3542]]

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1357658396.E7A8b52.25523
Date: Tue, 8 Jan 2013 15:19:56 +0000
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
          bz_status_NEW "
   title="NEW --- - nouveau E[ DRM] fail ttm_validate"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=59069#c9">Comment # 9</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - nouveau E[ DRM] fail ttm_validate"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=59069">bug 59069</a>
              from <span class="vcard"><a class="email" href="mailto:kees.bakker&#64;xs4all.nl" title="Kees Bakker &lt;kees.bakker&#64;xs4all.nl&gt;"> <span class="fn">Kees Bakker</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=72680" name="attach_72680" title="Another dmesg with an early PROTECTION_FAULT but still functional X">attachment 72680</a> <a href="attachment.cgi?id=72680&amp;action=edit" title="Another dmesg with an early PROTECTION_FAULT but still functional X">[details]</a></span>
Another dmesg with an early PROTECTION_FAULT but still functional X

Today no reboot boot yet. The X server is still up, but for a moment I thought
it got stuck. Last messages are:

[20361.350868] nouveau E[     DRM] fail ttm_validate
[20361.350875] nouveau E[     DRM] validate vram_list, vram_list_size:
183160832, gart_list_size: 4780032, both_list_size: 0
[20361.350959] nouveau E[     DRM] validate: -12 [compiz[5399]]
[20364.892611] nouveau E[     DRM] reloc wait_idle failed: -16
[20364.892618] nouveau E[     DRM] reloc apply: -16 [compiz[5399]]
[20365.091459] nouveau E[     DRM] fail ttm_validate
[20365.091465] nouveau E[     DRM] vram
[20365.091491] nouveau E[     DRM] validate: -16 [compiz[5399]]
[20374.260008] nouveau E[     DRM] reloc wait_idle failed: -16
[20374.260015] nouveau E[     DRM] reloc apply: -16 [Xorg[3542]]
[20377.261006] nouveau E[     DRM] reloc wait_idle failed: -16
[20377.261013] nouveau E[     DRM] reloc apply: -16 [Xorg[3542]]
[20377.262000] [sched_delayed] sched: RT throttling activated
[20380.951008] nouveau E[     DRM] reloc wait_idle failed: -16
[20380.951015] nouveau E[     DRM] reloc apply: -16 [Xorg[3542]]</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1357658396.E7A8b52.25523--

--===============0357121803==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0357121803==--
