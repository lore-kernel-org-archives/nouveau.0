From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 71662] [nvd9 regression] 3d application hang
Date: Sat, 16 Nov 2013 03:23:17 +0000
Message-ID: <bug-71662-8800-bYabQUDYBl@http.bugs.freedesktop.org/>
References: <bug-71662-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1458237794=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-71662-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1458237794==
Content-Type: multipart/alternative; boundary="1384572197.c25f70.8499"; charset="us-ascii"


--1384572197.c25f70.8499
Date: Sat, 16 Nov 2013 03:23:17 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=71662

--- Comment #3 from Jan Vesely <jano.vesely-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to comment #2)
> A git bisect would be useful. You should be able to just run the bisect
> under drivers/gpu/drm/nouveau, i.e.
> 
> git bisect start v3.12 v3.11 -- drivers/gpu/drm/nouveau

$ git bisect log
# bad: [5e01dc7b26d9f24f39abace5da98ccbd6a5ceb52] Linux 3.12
# good: [6e4664525b1db28f8c4e1130957f70a94c19213e] Linux 3.11
git bisect start 'v3.12' 'v3.11' 'drivers/gpu/drm/nouveau/'
# bad: [bd9c5a2016307164c419c5e24a46921c10e620a0] drm/nouveau: require
contiguous bo for framebuffer
git bisect bad bd9c5a2016307164c419c5e24a46921c10e620a0
# bad: [0d69704ae348c03bc216b01e32a0e9a2372be419] gpu/vga_switcheroo: add
driver control power feature. (v3)
git bisect bad 0d69704ae348c03bc216b01e32a0e9a2372be419
# bad: [baa7094355a10b432bbccacb925da4bdac861c8d] drm: const'ify ioctls table
(v2)
git bisect bad baa7094355a10b432bbccacb925da4bdac861c8d
# good: [72525b3f333de54fa0c42ef87f27861e41478f1e] drm/ttm: convert to unified
vma offset manager
git bisect good 72525b3f333de54fa0c42ef87f27861e41478f1e
# bad: [43387b37fa2d0f368142b8fa8c9440da92e5381b] drm/gem: create
drm_gem_dumb_destroy
git bisect bad 43387b37fa2d0f368142b8fa8c9440da92e5381b
# first bad commit: [43387b37fa2d0f368142b8fa8c9440da92e5381b] drm/gem: create
drm_gem_dumb_destroy


note that the only good commit was a bit weird, plymouth won't run, gnome-shell
segfaults immediatelly, and DRI_PRIME=13d apps showed no output (both glxgears
and oa). However, both were running (displayed fps, ...) and the hang was
always casued by running oa (never glxgears) so I figured the black screen does
not matter.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1384572197.c25f70.8499
Date: Sat, 16 Nov 2013 03:23:17 +0000
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
   title="NEW --- - [nvd9 regression] 3d application hang"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71662#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [nvd9 regression] 3d application hang"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71662">bug 71662</a>
              from <span class="vcard"><a class="email" href="mailto:jano.vesely&#64;gmail.com" title="Jan Vesely &lt;jano.vesely&#64;gmail.com&gt;"> <span class="fn">Jan Vesely</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=71662#c2">comment #2</a>)
<span class="quote">&gt; A git bisect would be useful. You should be able to just run the bisect
&gt; under drivers/gpu/drm/nouveau, i.e.
&gt; 
&gt; git bisect start v3.12 v3.11 -- drivers/gpu/drm/nouveau</span >

$ git bisect log
# bad: [5e01dc7b26d9f24f39abace5da98ccbd6a5ceb52] Linux 3.12
# good: [6e4664525b1db28f8c4e1130957f70a94c19213e] Linux 3.11
git bisect start 'v3.12' 'v3.11' 'drivers/gpu/drm/nouveau/'
# bad: [bd9c5a2016307164c419c5e24a46921c10e620a0] drm/nouveau: require
contiguous bo for framebuffer
git bisect bad bd9c5a2016307164c419c5e24a46921c10e620a0
# bad: [0d69704ae348c03bc216b01e32a0e9a2372be419] gpu/vga_switcheroo: add
driver control power feature. (v3)
git bisect bad 0d69704ae348c03bc216b01e32a0e9a2372be419
# bad: [baa7094355a10b432bbccacb925da4bdac861c8d] drm: const'ify ioctls table
(v2)
git bisect bad baa7094355a10b432bbccacb925da4bdac861c8d
# good: [72525b3f333de54fa0c42ef87f27861e41478f1e] drm/ttm: convert to unified
vma offset manager
git bisect good 72525b3f333de54fa0c42ef87f27861e41478f1e
# bad: [43387b37fa2d0f368142b8fa8c9440da92e5381b] drm/gem: create
drm_gem_dumb_destroy
git bisect bad 43387b37fa2d0f368142b8fa8c9440da92e5381b
# first bad commit: [43387b37fa2d0f368142b8fa8c9440da92e5381b] drm/gem: create
drm_gem_dumb_destroy


note that the only good commit was a bit weird, plymouth won't run, gnome-shell
segfaults immediatelly, and DRI_PRIME=13d apps showed no output (both glxgears
and oa). However, both were running (displayed fps, ...) and the hang was
always casued by running oa (never glxgears) so I figured the black screen does
not matter.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1384572197.c25f70.8499--

--===============1458237794==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1458237794==--
