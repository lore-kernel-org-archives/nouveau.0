From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 49727] [nv30 gallium] wine 1.5.2 and 3Dmark2001se
 displays only black screen with FPS, on nv43/AGP
Date: Sat, 07 Sep 2013 20:38:34 +0000
Message-ID: <bug-49727-8800-3LSzeEvTl9@http.bugs.freedesktop.org/>
References: <bug-49727-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1013593547=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-49727-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1013593547==
Content-Type: multipart/alternative; boundary="1378586314.bacf41d0.13795"; charset="us-ascii"


--1378586314.bacf41d0.13795
Date: Sat, 7 Sep 2013 20:38:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=49727

--- Comment #10 from Andrew Randrianasulu <randrik-JGs/UdohzUI@public.gmane.org> ---
(In reply to comment #9)
> I did send a patch to fix the crash (the ->user_priv wasn't being set
> correctly on init for some reason), but that just caused it to hang the
> gpu...

You  mean  GPU  hang  like  this?

[drm] nouveau 0000:01:00.0: PGRAPH - ERROR nsource: DATA_ERROR nstatus:
BAD_ARGUMENT
[drm] nouveau 0000:01:00.0: PGRAPH - ch 3 (0x0007b000) subc 7 class 0x4097 mthd
0x0208 data 0x04040242
[drm] nouveau 0000:01:00.0: PGRAPH - ERROR nsource: DATA_ERROR nstatus:
BAD_ARGUMENT
[drm] nouveau 0000:01:00.0: PGRAPH - ch 3 (0x0007b000) subc 7 class 0x4097 mthd
0x0208 data 0x04040243
[drm] nouveau 0000:01:00.0: PGRAPH - ERROR nsource: DATA_ERROR nstatus:
BAD_ARGUMENT
[drm] nouveau 0000:01:00.0: PGRAPH - ch 3 (0x0007b000) subc 7 class 0x4097 mthd
0x0208 data 0x04040242
[drm] nouveau 0000:01:00.0: PGRAPH - ERROR nsource: DATA_ERROR nstatus:
BAD_ARGUMENT
[drm] nouveau 0000:01:00.0: PGRAPH - ch 3 (0x0007b000) subc 7 class 0x4097 mthd
0x0208 data 0x04040242
[drm] nouveau 0000:01:00.0: PGRAPH - ERROR nsource: DATA_ERROR nstatus:
BAD_ARGUMENT
[drm] nouveau 0000:01:00.0: PGRAPH - ch 3 (0x0007b000) subc 7 class 0x4097 mthd
0x0208 data 0x04040243
[drm] nouveau 0000:01:00.0: PGRAPH - ERROR nsource: DATA_ERROR nstatus:
BAD_ARGUMENT
[drm] nouveau 0000:01:00.0: PGRAPH - ch 3 (0x0007b000) subc 7 class 0x4097 mthd
0x0208 data 0x04040242
[drm] nouveau 0000:01:00.0: PGRAPH - ERROR nsource: DATA_ERROR nstatus:
BAD_ARGUMENT
[drm] nouveau 0000:01:00.0: PGRAPH - ch 3 (0x0007b000) subc 7 class 0x4097 mthd
0x0208 data 0x04040242
[drm] nouveau 0000:01:00.0: PGRAPH - ERROR nsource: DATA_ERROR nstatus:
BAD_ARGUMENT
[drm] nouveau 0000:01:00.0: PGRAPH - ch 3 (0x0007b000) subc 7 class 0x4097 mthd
0x0208 data 0x04040243
[drm] nouveau 0000:01:00.0: PGRAPH - ERROR nsource: DATA_ERROR nstatus:
BAD_ARGUMENT
[drm] nouveau 0000:01:00.0: PGRAPH - ch 3 (0x0007b000) subc 7 class 0x4097 mthd
0x0208 data 0x04040242
[drm] nouveau 0000:01:00.0: PGRAPH - ERROR nsource: DATA_ERROR nstatus:
BAD_ARGUMENT
[drm] nouveau 0000:01:00.0: PGRAPH - ch 3 (0x0007b000) subc 7 class 0x4097 mthd
0x0208 data 0x04040242
[drm] nouveau 0000:01:00.0: PGRAPH - ERROR nsource: DATA_ERROR nstatus:
BAD_ARGUMENT
[drm] nouveau 0000:01:00.0: PGRAPH - ch 3 (0x0007b000) subc 7 class 0x4097 mthd
0x0208 data 0x04040243
[drm] nouveau 0000:01:00.0: PGRAPH - ERROR nsource: DATA_ERROR nstatus:
BAD_ARGUMENT
[drm] nouveau 0000:01:00.0: PGRAPH - ch 3 (0x0007b000) subc 7 class 0x4097 mthd
0x0208 data 0x04040242
[drm] nouveau 0000:01:00.0: PGRAPH - ERROR nsource: DATA_ERROR nstatus:
BAD_ARGUMENT
[drm] nouveau 0000:01:00.0: PGRAPH - ch 3 (0x0007b000) subc 7 class 0x4097 mthd
0x0208 data 0x04040242
[drm] nouveau 0000:01:00.0: PGRAPH - ERROR nsource: DATA_ERROR nstatus:
BAD_ARGUMENT
[drm] nouveau 0000:01:00.0: PGRAPH - ch 3 (0x0007b000) subc 7 class 0x4097 mthd
0x0208 data 0x04040243
[drm] nouveau 0000:01:00.0: PGRAPH - ERROR nsource: DATA_ERROR nstatus:
BAD_ARGUMENT
[drm] nouveau 0000:01:00.0: PGRAPH - ch 3 (0x0007b000) subc 7 class 0x4097 mthd
0x0208 data 0x04040242
[drm] nouveau 0000:01:00.0: PGRAPH - ERROR nsource: DATA_ERROR nstatus:
BAD_ARGUMENT
[drm] nouveau 0000:01:00.0: PGRAPH - ch 3 (0x0007b000) subc 7 class 0x4097 mthd
0x0208 data 0x04040242
[drm] nouveau 0000:01:00.0: PGRAPH - ERROR nsource: DATA_ERROR nstatus:
BAD_ARGUMENT
[drm] nouveau 0000:01:00.0: PGRAPH - ch 3 (0x0007b000) subc 7 class 0x4097 mthd
0x0208 data 0x04040243
[drm] nouveau 0000:01:00.0: PGRAPH - ERROR nsource: DATA_ERROR nstatus:
BAD_ARGUMENT
[drm] nouveau 0000:01:00.0: PGRAPH - ch 3 (0x0007b000) subc 7 class 0x4097 mthd
0x0208 data 0x04040242
[drm] nouveau 0000:01:00.0: PGRAPH - ERROR nsource: DATA_ERROR nstatus:
BAD_ARGUMENT
[drm] nouveau 0000:01:00.0: PGRAPH - ch 3 (0x0007b000) subc 7 class 0x4097 mthd
0x0208 data 0x04040242
[drm] nouveau 0000:01:00.0: PGRAPH - ERROR nsource: DATA_ERROR nstatus:
BAD_ARGUMENT
[drm] nouveau 0000:01:00.0: PGRAPH - ch 3 (0x0007b000) subc 7 class 0x4097 mthd
0x0208 data 0x04040243
nouveau_ratelimit: 4 callbacks suppressed
[drm] nouveau 0000:01:00.0: PGRAPH - ERROR nsource: DATA_ERROR nstatus:
BAD_ARGUMENT
[drm] nouveau 0000:01:00.0: PGRAPH - ch 3 (0x0007b000) subc 7 class 0x4097 mthd
0x0208 data 0x04040242
[drm] nouveau 0000:01:00.0: PGRAPH - ERROR nsource: DATA_ERROR nstatus:
BAD_ARGUMENT
[drm] nouveau 0000:01:00.0: PGRAPH - ch 3 (0x0007b000) subc 7 class 0x4097 mthd
0x0208 data 0x04040243
[drm] nouveau 0000:01:00.0: PGRAPH - ERROR nsource: DATA_ERROR nstatus:
BAD_ARGUMENT
[drm] nouveau 0000:01:00.0: PGRAPH - ch 3 (0x0007b000) subc 7 class 0x4097 mthd
0x0208 data 0x04040242
[drm] nouveau 0000:01:00.0: PGRAPH - ERROR nsource: LIMIT_COLOR nstatus:
BAD_ARGUMENT PROTECTION_FAULT
[drm] nouveau 0000:01:00.0: PGRAPH - ch 3 (0x0007b000) subc 7 class 0x4097 mthd
0x1d6c data 0x00000000
[drm] nouveau 0000:01:00.0: GPU lockup - switching to software fbcon
[drm] nouveau 0000:01:00.0: Failed to idle channel 1.
[drm] nouveau 0000:01:00.0: Failed to idle channel 2.
[drm] nouveau 0000:01:00.0: Failed to idle channel 3.
[drm] nouveau 0000:01:00.0: PFIFO_DMA_PUSHER - Ch 1 Get 0x00024528 Put
0x00024a18 State 0xc0000054 (err: MEM_FAULT) Push 0x00000000
[drm] nouveau 0000:01:00.0: PFIFO_INTR 0x00010000 - Ch 1
----------

It  happened  just after applying  your debug  patch  on top of  mesa-git Mesa
9.3.0-devel (git-18805b1)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1378586314.bacf41d0.13795
Date: Sat, 7 Sep 2013 20:38:34 +0000
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
   title="NEW --- - [nv30 gallium] wine 1.5.2 and 3Dmark2001se displays only black screen with FPS, on nv43/AGP"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=49727#c10">Comment # 10</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [nv30 gallium] wine 1.5.2 and 3Dmark2001se displays only black screen with FPS, on nv43/AGP"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=49727">bug 49727</a>
              from <span class="vcard"><a class="email" href="mailto:randrik&#64;mail.ru" title="Andrew Randrianasulu &lt;randrik&#64;mail.ru&gt;"> <span class="fn">Andrew Randrianasulu</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=49727#c9">comment #9</a>)
<span class="quote">&gt; I did send a patch to fix the crash (the -&gt;user_priv wasn't being set
&gt; correctly on init for some reason), but that just caused it to hang the
&gt; gpu...</span >

You  mean  GPU  hang  like  this?

[drm] nouveau 0000:01:00.0: PGRAPH - ERROR nsource: DATA_ERROR nstatus:
BAD_ARGUMENT
[drm] nouveau 0000:01:00.0: PGRAPH - ch 3 (0x0007b000) subc 7 class 0x4097 mthd
0x0208 data 0x04040242
[drm] nouveau 0000:01:00.0: PGRAPH - ERROR nsource: DATA_ERROR nstatus:
BAD_ARGUMENT
[drm] nouveau 0000:01:00.0: PGRAPH - ch 3 (0x0007b000) subc 7 class 0x4097 mthd
0x0208 data 0x04040243
[drm] nouveau 0000:01:00.0: PGRAPH - ERROR nsource: DATA_ERROR nstatus:
BAD_ARGUMENT
[drm] nouveau 0000:01:00.0: PGRAPH - ch 3 (0x0007b000) subc 7 class 0x4097 mthd
0x0208 data 0x04040242
[drm] nouveau 0000:01:00.0: PGRAPH - ERROR nsource: DATA_ERROR nstatus:
BAD_ARGUMENT
[drm] nouveau 0000:01:00.0: PGRAPH - ch 3 (0x0007b000) subc 7 class 0x4097 mthd
0x0208 data 0x04040242
[drm] nouveau 0000:01:00.0: PGRAPH - ERROR nsource: DATA_ERROR nstatus:
BAD_ARGUMENT
[drm] nouveau 0000:01:00.0: PGRAPH - ch 3 (0x0007b000) subc 7 class 0x4097 mthd
0x0208 data 0x04040243
[drm] nouveau 0000:01:00.0: PGRAPH - ERROR nsource: DATA_ERROR nstatus:
BAD_ARGUMENT
[drm] nouveau 0000:01:00.0: PGRAPH - ch 3 (0x0007b000) subc 7 class 0x4097 mthd
0x0208 data 0x04040242
[drm] nouveau 0000:01:00.0: PGRAPH - ERROR nsource: DATA_ERROR nstatus:
BAD_ARGUMENT
[drm] nouveau 0000:01:00.0: PGRAPH - ch 3 (0x0007b000) subc 7 class 0x4097 mthd
0x0208 data 0x04040242
[drm] nouveau 0000:01:00.0: PGRAPH - ERROR nsource: DATA_ERROR nstatus:
BAD_ARGUMENT
[drm] nouveau 0000:01:00.0: PGRAPH - ch 3 (0x0007b000) subc 7 class 0x4097 mthd
0x0208 data 0x04040243
[drm] nouveau 0000:01:00.0: PGRAPH - ERROR nsource: DATA_ERROR nstatus:
BAD_ARGUMENT
[drm] nouveau 0000:01:00.0: PGRAPH - ch 3 (0x0007b000) subc 7 class 0x4097 mthd
0x0208 data 0x04040242
[drm] nouveau 0000:01:00.0: PGRAPH - ERROR nsource: DATA_ERROR nstatus:
BAD_ARGUMENT
[drm] nouveau 0000:01:00.0: PGRAPH - ch 3 (0x0007b000) subc 7 class 0x4097 mthd
0x0208 data 0x04040242
[drm] nouveau 0000:01:00.0: PGRAPH - ERROR nsource: DATA_ERROR nstatus:
BAD_ARGUMENT
[drm] nouveau 0000:01:00.0: PGRAPH - ch 3 (0x0007b000) subc 7 class 0x4097 mthd
0x0208 data 0x04040243
[drm] nouveau 0000:01:00.0: PGRAPH - ERROR nsource: DATA_ERROR nstatus:
BAD_ARGUMENT
[drm] nouveau 0000:01:00.0: PGRAPH - ch 3 (0x0007b000) subc 7 class 0x4097 mthd
0x0208 data 0x04040242
[drm] nouveau 0000:01:00.0: PGRAPH - ERROR nsource: DATA_ERROR nstatus:
BAD_ARGUMENT
[drm] nouveau 0000:01:00.0: PGRAPH - ch 3 (0x0007b000) subc 7 class 0x4097 mthd
0x0208 data 0x04040242
[drm] nouveau 0000:01:00.0: PGRAPH - ERROR nsource: DATA_ERROR nstatus:
BAD_ARGUMENT
[drm] nouveau 0000:01:00.0: PGRAPH - ch 3 (0x0007b000) subc 7 class 0x4097 mthd
0x0208 data 0x04040243
[drm] nouveau 0000:01:00.0: PGRAPH - ERROR nsource: DATA_ERROR nstatus:
BAD_ARGUMENT
[drm] nouveau 0000:01:00.0: PGRAPH - ch 3 (0x0007b000) subc 7 class 0x4097 mthd
0x0208 data 0x04040242
[drm] nouveau 0000:01:00.0: PGRAPH - ERROR nsource: DATA_ERROR nstatus:
BAD_ARGUMENT
[drm] nouveau 0000:01:00.0: PGRAPH - ch 3 (0x0007b000) subc 7 class 0x4097 mthd
0x0208 data 0x04040242
[drm] nouveau 0000:01:00.0: PGRAPH - ERROR nsource: DATA_ERROR nstatus:
BAD_ARGUMENT
[drm] nouveau 0000:01:00.0: PGRAPH - ch 3 (0x0007b000) subc 7 class 0x4097 mthd
0x0208 data 0x04040243
[drm] nouveau 0000:01:00.0: PGRAPH - ERROR nsource: DATA_ERROR nstatus:
BAD_ARGUMENT
[drm] nouveau 0000:01:00.0: PGRAPH - ch 3 (0x0007b000) subc 7 class 0x4097 mthd
0x0208 data 0x04040242
[drm] nouveau 0000:01:00.0: PGRAPH - ERROR nsource: DATA_ERROR nstatus:
BAD_ARGUMENT
[drm] nouveau 0000:01:00.0: PGRAPH - ch 3 (0x0007b000) subc 7 class 0x4097 mthd
0x0208 data 0x04040242
[drm] nouveau 0000:01:00.0: PGRAPH - ERROR nsource: DATA_ERROR nstatus:
BAD_ARGUMENT
[drm] nouveau 0000:01:00.0: PGRAPH - ch 3 (0x0007b000) subc 7 class 0x4097 mthd
0x0208 data 0x04040243
nouveau_ratelimit: 4 callbacks suppressed
[drm] nouveau 0000:01:00.0: PGRAPH - ERROR nsource: DATA_ERROR nstatus:
BAD_ARGUMENT
[drm] nouveau 0000:01:00.0: PGRAPH - ch 3 (0x0007b000) subc 7 class 0x4097 mthd
0x0208 data 0x04040242
[drm] nouveau 0000:01:00.0: PGRAPH - ERROR nsource: DATA_ERROR nstatus:
BAD_ARGUMENT
[drm] nouveau 0000:01:00.0: PGRAPH - ch 3 (0x0007b000) subc 7 class 0x4097 mthd
0x0208 data 0x04040243
[drm] nouveau 0000:01:00.0: PGRAPH - ERROR nsource: DATA_ERROR nstatus:
BAD_ARGUMENT
[drm] nouveau 0000:01:00.0: PGRAPH - ch 3 (0x0007b000) subc 7 class 0x4097 mthd
0x0208 data 0x04040242
[drm] nouveau 0000:01:00.0: PGRAPH - ERROR nsource: LIMIT_COLOR nstatus:
BAD_ARGUMENT PROTECTION_FAULT
[drm] nouveau 0000:01:00.0: PGRAPH - ch 3 (0x0007b000) subc 7 class 0x4097 mthd
0x1d6c data 0x00000000
[drm] nouveau 0000:01:00.0: GPU lockup - switching to software fbcon
[drm] nouveau 0000:01:00.0: Failed to idle channel 1.
[drm] nouveau 0000:01:00.0: Failed to idle channel 2.
[drm] nouveau 0000:01:00.0: Failed to idle channel 3.
[drm] nouveau 0000:01:00.0: PFIFO_DMA_PUSHER - Ch 1 Get 0x00024528 Put
0x00024a18 State 0xc0000054 (err: MEM_FAULT) Push 0x00000000
[drm] nouveau 0000:01:00.0: PFIFO_INTR 0x00010000 - Ch 1
----------

It  happened  just after applying  your debug  patch  on top of  mesa-git Mesa
9.3.0-devel (git-18805b1)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1378586314.bacf41d0.13795--

--===============1013593547==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1013593547==--
