From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 74992] [NVAA] gnome-shell freezes with vram_list
 validate fail, texture traps
Date: Fri, 14 Feb 2014 19:16:41 +0000
Message-ID: <bug-74992-8800-svWWUf1otV@http.bugs.freedesktop.org/>
References: <bug-74992-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1058568500=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-74992-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
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


--===============1058568500==
Content-Type: multipart/alternative; boundary="1392405401.ee3acD612.32464"; charset="us-ascii"


--1392405401.ee3acD612.32464
Date: Fri, 14 Feb 2014 19:16:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=74992

Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|display freeze              |[NVAA] gnome-shell freezes
                   |                            |with vram_list validate
                   |                            |fail, texture traps

--- Comment #4 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
[30028.608886] nouveau E[gnome-shell[1661]] fail ttm_validate
[30028.608894] nouveau E[gnome-shell[1661]] validate vram_list
[30028.608938] nouveau E[gnome-shell[1661]] validate: -12
[30029.187282] nouveau E[gnome-shell[1661]] fail ttm_validate
[30029.187290] nouveau E[gnome-shell[1661]] validate vram_list
[30029.187306] nouveau E[gnome-shell[1661]] validate: -12
[30029.706353] nouveau E[  PGRAPH][0000:02:00.0] magic set 0:
[30029.706364] nouveau E[  PGRAPH][0000:02:00.0]     0x00408604: 0x20081401
[30029.706368] nouveau E[  PGRAPH][0000:02:00.0]     0x00408608: 0x00000000
[30029.706372] nouveau E[  PGRAPH][0000:02:00.0]     0x0040860c: 0x40000432
[30029.706376] nouveau E[  PGRAPH][0000:02:00.0]     0x00408610: 0x00000000
[30029.706380] nouveau E[  PGRAPH][0000:02:00.0] TRAP_TEXTURE - TP0: Unhandled
ustatus 0x00000003
[30029.706383] nouveau E[  PGRAPH][0000:02:00.0]  TRAP
[30029.706390] nouveau E[  PGRAPH][0000:02:00.0] ch 4 [0x000797f000
gnome-shell[1661]] subc 3 class 0x8397 mthd 0x15e0 data 0x00000000
[30029.706400] nouveau E[     PFB][0000:02:00.0] trapped read at 0x0000000000
on channel 0x0000797f [gnome-shell[1661]] PGRAPH/TEXTURE/00 reason:
PT_NOT_PRESENT
[30029.706563] nouveau E[  PGRAPH][0000:02:00.0] magic set 0:
[30029.706566] nouveau E[  PGRAPH][0000:02:00.0]     0x00408604: 0x20086701
[30029.706570] nouveau E[  PGRAPH][0000:02:00.0]     0x00408608: 0x00000000
[30029.706573] nouveau E[  PGRAPH][0000:02:00.0]     0x0040860c: 0x40000432
[30029.706577] nouveau E[  PGRAPH][0000:02:00.0]     0x00408610: 0x00000000
[30029.706580] nouveau E[  PGRAPH][0000:02:00.0] TRAP_TEXTURE - TP0: Unhandled
ustatus 0x00000003
[30029.706583] nouveau E[  PGRAPH][0000:02:00.0]  TRAP
[30029.706588] nouveau E[  PGRAPH][0000:02:00.0] ch 4 [0x000797f000
gnome-shell[1661]] subc 3 class 0x8397 mthd 0x15e0 data 0x00000000


To me, this reads like "you ran out of vram and the driver did not handle this
at all gracefully". "Unhandled ustatus 3" means "FAULT" as best I can tell. And
of course since gnome-shell also acts as a compositor, that means your display
is shot.

The question is how can this happen though... I guess something was requested
to be migrated to vram and that request failed, but the driver didn't notice?
Not sure. Your second log shows a pushbuf submission failure that caused a
validate fail. I don't remember if that means that something was claimed to be
in VRAM and wasn't or if it means that something was requested to be moved to
vram and the move failed.

The fact that you can even go to another TTY and restart GS indicates that the
card is in no way hung, which is nice.

You don't mention what version of mesa you're using... but I'm assuming
something pretty recent, like 10.0.3 or maybe even 10.1-rc1?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1392405401.ee3acD612.32464
Date: Fri, 14 Feb 2014 19:16:41 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVAA] gnome-shell freezes with vram_list validate fail, texture traps"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=74992">bug 74992</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Summary</td>
           <td>display freeze
           </td>
           <td>[NVAA] gnome-shell freezes with vram_list validate fail, texture traps
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVAA] gnome-shell freezes with vram_list validate fail, texture traps"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=74992#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVAA] gnome-shell freezes with vram_list validate fail, texture traps"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=74992">bug 74992</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>[30028.608886] nouveau E[gnome-shell[1661]] fail ttm_validate
[30028.608894] nouveau E[gnome-shell[1661]] validate vram_list
[30028.608938] nouveau E[gnome-shell[1661]] validate: -12
[30029.187282] nouveau E[gnome-shell[1661]] fail ttm_validate
[30029.187290] nouveau E[gnome-shell[1661]] validate vram_list
[30029.187306] nouveau E[gnome-shell[1661]] validate: -12
[30029.706353] nouveau E[  PGRAPH][0000:02:00.0] magic set 0:
[30029.706364] nouveau E[  PGRAPH][0000:02:00.0]     0x00408604: 0x20081401
[30029.706368] nouveau E[  PGRAPH][0000:02:00.0]     0x00408608: 0x00000000
[30029.706372] nouveau E[  PGRAPH][0000:02:00.0]     0x0040860c: 0x40000432
[30029.706376] nouveau E[  PGRAPH][0000:02:00.0]     0x00408610: 0x00000000
[30029.706380] nouveau E[  PGRAPH][0000:02:00.0] TRAP_TEXTURE - TP0: Unhandled
ustatus 0x00000003
[30029.706383] nouveau E[  PGRAPH][0000:02:00.0]  TRAP
[30029.706390] nouveau E[  PGRAPH][0000:02:00.0] ch 4 [0x000797f000
gnome-shell[1661]] subc 3 class 0x8397 mthd 0x15e0 data 0x00000000
[30029.706400] nouveau E[     PFB][0000:02:00.0] trapped read at 0x0000000000
on channel 0x0000797f [gnome-shell[1661]] PGRAPH/TEXTURE/00 reason:
PT_NOT_PRESENT
[30029.706563] nouveau E[  PGRAPH][0000:02:00.0] magic set 0:
[30029.706566] nouveau E[  PGRAPH][0000:02:00.0]     0x00408604: 0x20086701
[30029.706570] nouveau E[  PGRAPH][0000:02:00.0]     0x00408608: 0x00000000
[30029.706573] nouveau E[  PGRAPH][0000:02:00.0]     0x0040860c: 0x40000432
[30029.706577] nouveau E[  PGRAPH][0000:02:00.0]     0x00408610: 0x00000000
[30029.706580] nouveau E[  PGRAPH][0000:02:00.0] TRAP_TEXTURE - TP0: Unhandled
ustatus 0x00000003
[30029.706583] nouveau E[  PGRAPH][0000:02:00.0]  TRAP
[30029.706588] nouveau E[  PGRAPH][0000:02:00.0] ch 4 [0x000797f000
gnome-shell[1661]] subc 3 class 0x8397 mthd 0x15e0 data 0x00000000


To me, this reads like &quot;you ran out of vram and the driver did not handle this
at all gracefully&quot;. &quot;Unhandled ustatus 3&quot; means &quot;FAULT&quot; as best I can tell. And
of course since gnome-shell also acts as a compositor, that means your display
is shot.

The question is how can this happen though... I guess something was requested
to be migrated to vram and that request failed, but the driver didn't notice?
Not sure. Your second log shows a pushbuf submission failure that caused a
validate fail. I don't remember if that means that something was claimed to be
in VRAM and wasn't or if it means that something was requested to be moved to
vram and the move failed.

The fact that you can even go to another TTY and restart GS indicates that the
card is in no way hung, which is nice.

You don't mention what version of mesa you're using... but I'm assuming
something pretty recent, like 10.0.3 or maybe even 10.1-rc1?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1392405401.ee3acD612.32464--

--===============1058568500==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1058568500==--
