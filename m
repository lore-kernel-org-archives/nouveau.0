From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 60680] [NV96] HDMI is connected and has mode,
 TV says "no signal"
Date: Fri, 06 Sep 2013 12:55:07 +0000
Message-ID: <bug-60680-8800-EavrYRO05Q@http.bugs.freedesktop.org/>
References: <bug-60680-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1398251290=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-60680-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1398251290==
Content-Type: multipart/alternative; boundary="1378472107.Baa5d1.21085"; charset="us-ascii"


--1378472107.Baa5d1.21085
Date: Fri, 6 Sep 2013 12:55:07 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=60680

--- Comment #10 from Pekka Paalanen <ppaalanen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Bisection complete:

cb75d97e9c77743ecfcc43375be135a55a4d9b25 is the first bad commit
commit cb75d97e9c77743ecfcc43375be135a55a4d9b25
Author: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Date:   Wed Jul 11 10:44:20 2012 +1000

    drm/nouveau: implement devinit subdev, and new init table parser

    v2:
    - make sure not to execute display scripts unless resuming

    Signed-off-by: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>


The results during bisection were consistent:
- if good, fbcon appears cloned to HDMI at boot, X appears cloned to HDMI by
default, and the HDMI-only full-HD setup works
- if bad, TV always reports "no signal"


$ git bisect log
# bad: [19f949f52599ba7c3f67a5897ac6be14bfcb1200] Linux 3.8
# good: [684012d815c70359162d8b9cc9879b83855e59bf] Linux 3.5.2
git bisect start 'v3.8' 'v3.5.2' '--' 'drivers/gpu/drm/nouveau'
# good: [28a33cbc24e4256c143dce96c7d93bf423229f92] Linux 3.5
git bisect good 28a33cbc24e4256c143dce96c7d93bf423229f92
# bad: [ae168d973f5fa3f3467dc5600f74a0f03e3cafe7] Merge branch
'drm-nouveau-fixes' of git://git.freedesktop.org/git/nouveau/linux-2.6 into
drm-fixes
git bisect bad ae168d973f5fa3f3467dc5600f74a0f03e3cafe7
# bad: [c4837d27945b9b607b5a7274a33059e73d1a7831] drm/nouveau/core: remove some
left-over pieces from the porting process
git bisect bad c4837d27945b9b607b5a7274a33059e73d1a7831
# good: [70c0f263cc2eb12e02506eb75f0a71490e7dea4d] drm/nouveau/bios: pull in
basic vbios subdev, more to come later
git bisect good 70c0f263cc2eb12e02506eb75f0a71490e7dea4d
# bad: [3863c9bc887e9638a9d905d55f6038641ece78d6] drm/nouveau/instmem:
completely new implementation, as a subdev module
git bisect bad 3863c9bc887e9638a9d905d55f6038641ece78d6
# bad: [0134a97979a0abc1c756b0fe491e074693c2bdf5] drm/nv50-/instmem: allocate
vram for kernel objects from end of vram
git bisect bad 0134a97979a0abc1c756b0fe491e074693c2bdf5
# good: [70790f4f819875e8f390871fd15bbbf823f28e1b] drm/nouveau/clock: pull in
the implementation from all over the place
git bisect good 70790f4f819875e8f390871fd15bbbf823f28e1b
# bad: [7d9115dee978e8540734c456c925d71a37752b8d] drm/nouveau/mc: port to
subdev interfaces
git bisect bad 7d9115dee978e8540734c456c925d71a37752b8d
# bad: [cb75d97e9c77743ecfcc43375be135a55a4d9b25] drm/nouveau: implement
devinit subdev, and new init table parser
git bisect bad cb75d97e9c77743ecfcc43375be135a55a4d9b25

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1378472107.Baa5d1.21085
Date: Fri, 6 Sep 2013 12:55:07 +0000
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
   title="NEW --- - [NV96] HDMI is connected and has mode, TV says &quot;no signal&quot;"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=60680#c10">Comment # 10</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV96] HDMI is connected and has mode, TV says &quot;no signal&quot;"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=60680">bug 60680</a>
              from <span class="vcard"><a class="email" href="mailto:ppaalanen&#64;gmail.com" title="Pekka Paalanen &lt;ppaalanen&#64;gmail.com&gt;"> <span class="fn">Pekka Paalanen</span></a>
</span></b>
        <pre>Bisection complete:

cb75d97e9c77743ecfcc43375be135a55a4d9b25 is the first bad commit
commit cb75d97e9c77743ecfcc43375be135a55a4d9b25
Author: Ben Skeggs &lt;<a href="mailto:bskeggs&#64;redhat.com">bskeggs&#64;redhat.com</a>&gt;
Date:   Wed Jul 11 10:44:20 2012 +1000

    drm/nouveau: implement devinit subdev, and new init table parser

    v2:
    - make sure not to execute display scripts unless resuming

    Signed-off-by: Ben Skeggs &lt;<a href="mailto:bskeggs&#64;redhat.com">bskeggs&#64;redhat.com</a>&gt;


The results during bisection were consistent:
- if good, fbcon appears cloned to HDMI at boot, X appears cloned to HDMI by
default, and the HDMI-only full-HD setup works
- if bad, TV always reports &quot;no signal&quot;


$ git bisect log
# bad: [19f949f52599ba7c3f67a5897ac6be14bfcb1200] Linux 3.8
# good: [684012d815c70359162d8b9cc9879b83855e59bf] Linux 3.5.2
git bisect start 'v3.8' 'v3.5.2' '--' 'drivers/gpu/drm/nouveau'
# good: [28a33cbc24e4256c143dce96c7d93bf423229f92] Linux 3.5
git bisect good 28a33cbc24e4256c143dce96c7d93bf423229f92
# bad: [ae168d973f5fa3f3467dc5600f74a0f03e3cafe7] Merge branch
'drm-nouveau-fixes' of git://git.freedesktop.org/git/nouveau/linux-2.6 into
drm-fixes
git bisect bad ae168d973f5fa3f3467dc5600f74a0f03e3cafe7
# bad: [c4837d27945b9b607b5a7274a33059e73d1a7831] drm/nouveau/core: remove some
left-over pieces from the porting process
git bisect bad c4837d27945b9b607b5a7274a33059e73d1a7831
# good: [70c0f263cc2eb12e02506eb75f0a71490e7dea4d] drm/nouveau/bios: pull in
basic vbios subdev, more to come later
git bisect good 70c0f263cc2eb12e02506eb75f0a71490e7dea4d
# bad: [3863c9bc887e9638a9d905d55f6038641ece78d6] drm/nouveau/instmem:
completely new implementation, as a subdev module
git bisect bad 3863c9bc887e9638a9d905d55f6038641ece78d6
# bad: [0134a97979a0abc1c756b0fe491e074693c2bdf5] drm/nv50-/instmem: allocate
vram for kernel objects from end of vram
git bisect bad 0134a97979a0abc1c756b0fe491e074693c2bdf5
# good: [70790f4f819875e8f390871fd15bbbf823f28e1b] drm/nouveau/clock: pull in
the implementation from all over the place
git bisect good 70790f4f819875e8f390871fd15bbbf823f28e1b
# bad: [7d9115dee978e8540734c456c925d71a37752b8d] drm/nouveau/mc: port to
subdev interfaces
git bisect bad 7d9115dee978e8540734c456c925d71a37752b8d
# bad: [cb75d97e9c77743ecfcc43375be135a55a4d9b25] drm/nouveau: implement
devinit subdev, and new init table parser
git bisect bad cb75d97e9c77743ecfcc43375be135a55a4d9b25</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1378472107.Baa5d1.21085--

--===============1398251290==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1398251290==--
