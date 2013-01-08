From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 57777] lcd screen of a laptop does not wake up after
	sleep
Date: Tue, 08 Jan 2013 13:06:41 +0000
Message-ID: <bug-57777-8800-aFybVIedsu@http.bugs.freedesktop.org/>
References: <bug-57777-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0779603418=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-57777-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0779603418==
Content-Type: multipart/alternative; boundary="1357650401.FbB0641.6857"; charset="us-ascii"


--1357650401.FbB0641.6857
Date: Tue, 8 Jan 2013 13:06:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=57777

--- Comment #7 from Alin M Elena <alinm.elena-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Hi Marcin,

unless I do something very silly I did not manage to compile the two commits
indicated against 3.8rc2
Here what I have done

git clone --depth 0 git://anongit.freedesktop.org/nouveau/linux-2.6 nouveau
cd nouveau
git checkout 186ecad21

extracted the needed folders and compiled... 
got the error...
[   37s]
/home/abuild/rpmbuild/BUILD/drm-nouveau-1357654062/master/obj/desktop/drivers/gpu/drm/nouveau/nouveau_bo.c:
In function 'nouveau_bo_validate':
[   37s]
/home/abuild/rpmbuild/BUILD/drm-nouveau-1357654062/master/obj/desktop/drivers/gpu/drm/nouveau/nouveau_bo.c:400:10:
error: too many arguments to function 'ttm_bo_validate'
[   37s] In file included from
/home/abuild/rpmbuild/BUILD/drm-nouveau-1357654062/master/obj/desktop/drivers/gpu/drm/nouveau/nouveau_drm.h:22:0,
[   37s]                  from
/home/abuild/rpmbuild/BUILD/drm-nouveau-1357654062/master/obj/desktop/drivers/gpu/drm/nouveau/nouveau_bo.c:36:
[   37s] /usr/src/linux-3.8.0-rc2-2/include/drm/ttm/ttm_bo_api.h:350:12: note:
declared here
[   37s]
/home/abuild/rpmbuild/BUILD/drm-nouveau-1357654062/master/obj/desktop/drivers/gpu/drm/nouveau/nouveau_bo.c:
In function 'nouveau_bo_move_accel_cleanup':
[   37s]
/home/abuild/rpmbuild/BUILD/drm-nouveau-1357654062/master/obj/desktop/drivers/gpu/drm/nouveau/nouveau_bo.c:570:6:
error: incompatible type for argument 5 of 'ttm_bo_move_accel_cleanup'
[   37s] In file included from
/home/abuild/rpmbuild/BUILD/drm-nouveau-1357654062/master/obj/desktop/drivers/gpu/drm/nouveau/nouveau_drm.h:23:0,
[   37s]                  from
/home/abuild/rpmbuild/BUILD/drm-nouveau-1357654062/master/obj/desktop/drivers/gpu/drm/nouveau/nouveau_bo.c:36:
[   37s] /usr/src/linux-3.8.0-rc2-2/include/drm/ttm/ttm_bo_driver.h:968:12:
note: expected 'struct ttm_mem_reg *' but argument is of type 'bool'
[   37s]
/home/abuild/rpmbuild/BUILD/drm-nouveau-1357654062/master/obj/desktop/drivers/gpu/drm/nouveau/nouveau_bo.c:570:6:
error: too many arguments to function 'ttm_bo_move_accel_cleanup'


I am blocked..

Alin

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1357650401.FbB0641.6857
Date: Tue, 8 Jan 2013 13:06:41 +0000
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
   title="NEW --- - lcd screen of a laptop does not wake up after sleep"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=57777#c7">Comment # 7</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - lcd screen of a laptop does not wake up after sleep"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=57777">bug 57777</a>
              from <span class="vcard"><a class="email" href="mailto:alinm.elena&#64;gmail.com" title="Alin M Elena &lt;alinm.elena&#64;gmail.com&gt;"> <span class="fn">Alin M Elena</span></a>
</span></b>
        <pre>Hi Marcin,

unless I do something very silly I did not manage to compile the two commits
indicated against 3.8rc2
Here what I have done

git clone --depth 0 git://anongit.freedesktop.org/nouveau/linux-2.6 nouveau
cd nouveau
git checkout 186ecad21

extracted the needed folders and compiled... 
got the error...
[   37s]
/home/abuild/rpmbuild/BUILD/drm-nouveau-1357654062/master/obj/desktop/drivers/gpu/drm/nouveau/nouveau_bo.c:
In function 'nouveau_bo_validate':
[   37s]
/home/abuild/rpmbuild/BUILD/drm-nouveau-1357654062/master/obj/desktop/drivers/gpu/drm/nouveau/nouveau_bo.c:400:10:
error: too many arguments to function 'ttm_bo_validate'
[   37s] In file included from
/home/abuild/rpmbuild/BUILD/drm-nouveau-1357654062/master/obj/desktop/drivers/gpu/drm/nouveau/nouveau_drm.h:22:0,
[   37s]                  from
/home/abuild/rpmbuild/BUILD/drm-nouveau-1357654062/master/obj/desktop/drivers/gpu/drm/nouveau/nouveau_bo.c:36:
[   37s] /usr/src/linux-3.8.0-rc2-2/include/drm/ttm/ttm_bo_api.h:350:12: note:
declared here
[   37s]
/home/abuild/rpmbuild/BUILD/drm-nouveau-1357654062/master/obj/desktop/drivers/gpu/drm/nouveau/nouveau_bo.c:
In function 'nouveau_bo_move_accel_cleanup':
[   37s]
/home/abuild/rpmbuild/BUILD/drm-nouveau-1357654062/master/obj/desktop/drivers/gpu/drm/nouveau/nouveau_bo.c:570:6:
error: incompatible type for argument 5 of 'ttm_bo_move_accel_cleanup'
[   37s] In file included from
/home/abuild/rpmbuild/BUILD/drm-nouveau-1357654062/master/obj/desktop/drivers/gpu/drm/nouveau/nouveau_drm.h:23:0,
[   37s]                  from
/home/abuild/rpmbuild/BUILD/drm-nouveau-1357654062/master/obj/desktop/drivers/gpu/drm/nouveau/nouveau_bo.c:36:
[   37s] /usr/src/linux-3.8.0-rc2-2/include/drm/ttm/ttm_bo_driver.h:968:12:
note: expected 'struct ttm_mem_reg *' but argument is of type 'bool'
[   37s]
/home/abuild/rpmbuild/BUILD/drm-nouveau-1357654062/master/obj/desktop/drivers/gpu/drm/nouveau/nouveau_bo.c:570:6:
error: too many arguments to function 'ttm_bo_move_accel_cleanup'


I am blocked..

Alin</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1357650401.FbB0641.6857--

--===============0779603418==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0779603418==--
