From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 58806] failed to create kernel channel, -12 on G4 PPC
Date: Thu, 27 Dec 2012 14:53:47 +0000
Message-ID: <bug-58806-8800-r1a1PuslfL@http.bugs.freedesktop.org/>
References: <bug-58806-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0549548411=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-58806-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0549548411==
Content-Type: multipart/alternative; boundary="1356620027.71e21.24267"; charset="us-ascii"


--1356620027.71e21.24267
Date: Thu, 27 Dec 2012 14:53:47 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=58806

--- Comment #2 from Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
What we found so far:

Acceleration set up fails like that:
Stacktrace:
nouveau_drm_load
nouveau_accel_init
nouveau_channel_new
nouveau_channel_ind
nouveau_channel_prep
nouveau_bo_map
ttm_bo_kmap
ttm_bo_ioremap
ioremap_wc

ioremap_wc returns NULL. bo->mem.bus.base and bo->mem.bus.offset are 0.
Probably because of this code:
http://git.kernel.org/?p=linux/kernel/git/torvalds/linux.git;a=blob;f=drivers/char/agp/uninorth-agp.c;h=a32c492baf5cc15001ad6882dc25a14d1be86419;hb=29594404d7fe73cd80eaa4ee8c43dcc53970c60e#l125
and ioremap fails because of this:
http://git.kernel.org/?p=linux/kernel/git/torvalds/linux.git;a=blob;f=arch/powerpc/mm/pgtable_32.c;h=6c856fb8c15b01705fb6cf5ff28c0a232d85d3bd;hb=29594404d7fe73cd80eaa4ee8c43dcc53970c60e#l204

Booting with nouveau.agpmode=0 works.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1356620027.71e21.24267
Date: Thu, 27 Dec 2012 14:53:47 +0000
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
   title="NEW --- - failed to create kernel channel, -12 on G4 PPC"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58806#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - failed to create kernel channel, -12 on G4 PPC"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58806">bug 58806</a>
              from <span class="vcard"><a class="email" href="mailto:marcin.slusarz&#64;gmail.com" title="Marcin Slusarz &lt;marcin.slusarz&#64;gmail.com&gt;"> <span class="fn">Marcin Slusarz</span></a>
</span></b>
        <pre>What we found so far:

Acceleration set up fails like that:
Stacktrace:
nouveau_drm_load
nouveau_accel_init
nouveau_channel_new
nouveau_channel_ind
nouveau_channel_prep
nouveau_bo_map
ttm_bo_kmap
ttm_bo_ioremap
ioremap_wc

ioremap_wc returns NULL. bo-&gt;mem.bus.base and bo-&gt;mem.bus.offset are 0.
Probably because of this code:
<a href="http://git.kernel.org/?p=linux/kernel/git/torvalds/linux.git;a=blob;f=drivers/char/agp/uninorth-agp.c;h=a32c492baf5cc15001ad6882dc25a14d1be86419;hb=29594404d7fe73cd80eaa4ee8c43dcc53970c60e#l125">http://git.kernel.org/?p=linux/kernel/git/torvalds/linux.git;a=blob;f=drivers/char/agp/uninorth-agp.c;h=a32c492baf5cc15001ad6882dc25a14d1be86419;hb=29594404d7fe73cd80eaa4ee8c43dcc53970c60e#l125</a>
and ioremap fails because of this:
<a href="http://git.kernel.org/?p=linux/kernel/git/torvalds/linux.git;a=blob;f=arch/powerpc/mm/pgtable_32.c;h=6c856fb8c15b01705fb6cf5ff28c0a232d85d3bd;hb=29594404d7fe73cd80eaa4ee8c43dcc53970c60e#l204">http://git.kernel.org/?p=linux/kernel/git/torvalds/linux.git;a=blob;f=arch/powerpc/mm/pgtable_32.c;h=6c856fb8c15b01705fb6cf5ff28c0a232d85d3bd;hb=29594404d7fe73cd80eaa4ee8c43dcc53970c60e#l204</a>

Booting with nouveau.agpmode=0 works.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1356620027.71e21.24267--

--===============0549548411==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0549548411==--
