From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 69768] [NVC1] [regression] machine is unable to
	suspend
Date: Tue, 22 Oct 2013 03:03:40 +0000
Message-ID: <bug-69768-8800-A1fwONqL7Q@http.bugs.freedesktop.org/>
References: <bug-69768-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1920318698=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-69768-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1920318698==
Content-Type: multipart/alternative; boundary="1382411020.AbF4CA1.5455"; charset="us-ascii"


--1382411020.AbF4CA1.5455
Date: Tue, 22 Oct 2013 03:03:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=69768

--- Comment #9 from Marc Collin <marccollin7379-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
ok i used bisect...

git bisect log
# bad: [6e4664525b1db28f8c4e1130957f70a94c19213e] Linux 3.11
# good: [8bb495e3f02401ee6f76d1b1d77f3ac9f079e376] Linux 3.10
git bisect start 'v3.11' 'v3.10' '--' 'drivers/gpu/drm/nouveau'
# bad: [b054aadfb0030b9717bb22f4283bfe5aec13440b] drm/nvf0/gr: magic sequence
that makes PGRAPH come out of hiding
git bisect bad b054aadfb0030b9717bb22f4283bfe5aec13440b
# good: [a8004a9edd8c6ee86c3e263c9082ddf64797a667] drm/nvc0-/gr: bump maximum
gpc/tpc limits
git bisect good a8004a9edd8c6ee86c3e263c9082ddf64797a667
# good: [0d4a1450c95801c21ba4db109303fbad62378b91] drm/nouveau/vdec: fork vp3
implementations from vp2
git bisect good 0d4a1450c95801c21ba4db109303fbad62378b91
# bad: [c03ff9e8fa5fc0186158b99a89f613325ff352cf] drm/nvc0-/gr: pull out a
group of separately context-switched gpc regs
git bisect bad c03ff9e8fa5fc0186158b99a89f613325ff352cf
# good: [05f9a5bc58381f58095d8789e1c2d4e18758c2bc] drm/nouveau/bsp/nv84:
initial vp2 engine implementation
git bisect good 05f9a5bc58381f58095d8789e1c2d4e18758c2bc
# good: [791dc143ed2c441f5202d8721609d94dce9fcf88] drm/nvd0-/disp: handle case
where display engine is missing/disabled
git bisect good 791dc143ed2c441f5202d8721609d94dce9fcf88


don't know if that help?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1382411020.AbF4CA1.5455
Date: Tue, 22 Oct 2013 03:03:40 +0000
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
   title="NEW --- - [NVC1] [regression] machine is unable to suspend"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69768#c9">Comment # 9</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVC1] [regression] machine is unable to suspend"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69768">bug 69768</a>
              from <span class="vcard"><a class="email" href="mailto:marccollin7379&#64;gmail.com" title="Marc Collin &lt;marccollin7379&#64;gmail.com&gt;"> <span class="fn">Marc Collin</span></a>
</span></b>
        <pre>ok i used bisect...

git bisect log
# bad: [6e4664525b1db28f8c4e1130957f70a94c19213e] Linux 3.11
# good: [8bb495e3f02401ee6f76d1b1d77f3ac9f079e376] Linux 3.10
git bisect start 'v3.11' 'v3.10' '--' 'drivers/gpu/drm/nouveau'
# bad: [b054aadfb0030b9717bb22f4283bfe5aec13440b] drm/nvf0/gr: magic sequence
that makes PGRAPH come out of hiding
git bisect bad b054aadfb0030b9717bb22f4283bfe5aec13440b
# good: [a8004a9edd8c6ee86c3e263c9082ddf64797a667] drm/nvc0-/gr: bump maximum
gpc/tpc limits
git bisect good a8004a9edd8c6ee86c3e263c9082ddf64797a667
# good: [0d4a1450c95801c21ba4db109303fbad62378b91] drm/nouveau/vdec: fork vp3
implementations from vp2
git bisect good 0d4a1450c95801c21ba4db109303fbad62378b91
# bad: [c03ff9e8fa5fc0186158b99a89f613325ff352cf] drm/nvc0-/gr: pull out a
group of separately context-switched gpc regs
git bisect bad c03ff9e8fa5fc0186158b99a89f613325ff352cf
# good: [05f9a5bc58381f58095d8789e1c2d4e18758c2bc] drm/nouveau/bsp/nv84:
initial vp2 engine implementation
git bisect good 05f9a5bc58381f58095d8789e1c2d4e18758c2bc
# good: [791dc143ed2c441f5202d8721609d94dce9fcf88] drm/nvd0-/disp: handle case
where display engine is missing/disabled
git bisect good 791dc143ed2c441f5202d8721609d94dce9fcf88


don't know if that help?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1382411020.AbF4CA1.5455--

--===============1920318698==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1920318698==--
