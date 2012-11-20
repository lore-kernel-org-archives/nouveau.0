From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 56615] [NVD9] Unable to start X on ThinkPad T420s
	laptop
Date: Tue, 20 Nov 2012 13:11:22 +0000
Message-ID: <bug-56615-8800-7MqAwgrNlJ@http.bugs.freedesktop.org/>
References: <bug-56615-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1762457002=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-56615-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1762457002==
Content-Type: multipart/alternative; boundary="1353417082.0B2a1.13930"; charset="us-ascii"


--1353417082.0B2a1.13930
Date: Tue, 20 Nov 2012 13:11:22 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=56615

--- Comment #10 from Mark Cave-Ayland <mark.cave-ayland-r2/yp8inhXLQXOPxS62xeg@public.gmane.org> ---
Based upon the suggestions that this is a problem with the kernel module, I've
now setup and built a full dev environment.

With this in place, I've just done a build of git master (commit
cd55d81fdb49c9113792c3b361c125e82091d6c4) from
git://anongit.freedesktop.org/nouveau/linux-2.6 and unfortunately I see exactly
the same problem as before :/

Incidentally can anyone explain what the following items in dmesg represent?

[   26.204990] nouveau W[  PGRAPH][0000:01:00.0] disabled, PGRAPH=1 to enable
[   29.873280] nouveau  [     DRM] EvoCh: chid 1 mthd 0x0080 data 0x00000000
0x00005080 0x0000000d
[   29.876287] [sched_delayed] sched: RT throttling activated
[   33.870186] nouveau  [     DRM] EvoCh: chid 2 mthd 0x0080 data 0x00000000
0x10005080 0x0000000d
[   57.731616] nouveau  [     DRM] EvoCh: chid 1 mthd 0x0080 data 0x00000000
0x10005080 0x0000000d
[   73.691785] nouveau  [     DRM] EvoCh: chid 1 mthd 0x0080 data 0x00000000
0x10005080 0x0000000d
[  118.486621] nouveau W[  PGRAPH][0000:01:00.0] disabled, PGRAPH=1 to enable
[  120.491687] nouveau  [     DRM] EvoCh: chid 1 mthd 0x0080 data 0x00000000
0x10005080 0x0000000d
[  127.921298] nouveau E[     DRM] evo 0 dma stalled

Are they any debugging kernel module parameters that can be enabled in order to
provide more information?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1353417082.0B2a1.13930
Date: Tue, 20 Nov 2012 13:11:22 +0000
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
   title="NEW --- - [NVD9] Unable to start X on ThinkPad T420s laptop"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=56615#c10">Comment # 10</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVD9] Unable to start X on ThinkPad T420s laptop"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=56615">bug 56615</a>
              from <span class="vcard"><a class="email" href="mailto:mark.cave-ayland&#64;ilande.co.uk" title="Mark Cave-Ayland &lt;mark.cave-ayland&#64;ilande.co.uk&gt;"> <span class="fn">Mark Cave-Ayland</span></a>
</span></b>
        <pre>Based upon the suggestions that this is a problem with the kernel module, I've
now setup and built a full dev environment.

With this in place, I've just done a build of git master (commit
cd55d81fdb49c9113792c3b361c125e82091d6c4) from
git://anongit.freedesktop.org/nouveau/linux-2.6 and unfortunately I see exactly
the same problem as before :/

Incidentally can anyone explain what the following items in dmesg represent?

[   26.204990] nouveau W[  PGRAPH][0000:01:00.0] disabled, PGRAPH=1 to enable
[   29.873280] nouveau  [     DRM] EvoCh: chid 1 mthd 0x0080 data 0x00000000
0x00005080 0x0000000d
[   29.876287] [sched_delayed] sched: RT throttling activated
[   33.870186] nouveau  [     DRM] EvoCh: chid 2 mthd 0x0080 data 0x00000000
0x10005080 0x0000000d
[   57.731616] nouveau  [     DRM] EvoCh: chid 1 mthd 0x0080 data 0x00000000
0x10005080 0x0000000d
[   73.691785] nouveau  [     DRM] EvoCh: chid 1 mthd 0x0080 data 0x00000000
0x10005080 0x0000000d
[  118.486621] nouveau W[  PGRAPH][0000:01:00.0] disabled, PGRAPH=1 to enable
[  120.491687] nouveau  [     DRM] EvoCh: chid 1 mthd 0x0080 data 0x00000000
0x10005080 0x0000000d
[  127.921298] nouveau E[     DRM] evo 0 dma stalled

Are they any debugging kernel module parameters that can be enabled in order to
provide more information?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1353417082.0B2a1.13930--

--===============1762457002==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1762457002==--
