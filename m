From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 57660] [NVA3:NVC0] Turn on support for
	PIPE_CAP_CUBE_MAP_ARRAY
Date: Tue, 20 Aug 2013 15:00:36 +0000
Message-ID: <bug-57660-8800-qCRxeetx0Y@http.bugs.freedesktop.org/>
References: <bug-57660-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1759292402=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-57660-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1759292402==
Content-Type: multipart/alternative; boundary="1377010836.BF443fB1.6392"; charset="us-ascii"


--1377010836.BF443fB1.6392
Date: Tue, 20 Aug 2013 15:00:36 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=57660

--- Comment #8 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Sounds like what's left to be done is to test it. Just need to apply the below
patch and see if it works (looks like there are a couple of piglit tests... ls
bin/*cube_map_array* -- they ought to pass on the nva3+ hardware).

--- a/src/gallium/drivers/nv50/nv50_screen.c
+++ b/src/gallium/drivers/nv50/nv50_screen.c
@@ -114,10 +114,7 @@ nv50_screen_get_param(struct pipe_screen *pscreen, enum
pipe_cap param)
    case PIPE_CAP_SEAMLESS_CUBE_MAP_PER_TEXTURE:
       return 0;
    case PIPE_CAP_CUBE_MAP_ARRAY:
-      return 0;
-      /*
       return nv50_screen(pscreen)->tesla->oclass >= NVA3_3D_CLASS;
-      */
    case PIPE_CAP_TWO_SIDED_STENCIL:
    case PIPE_CAP_DEPTH_CLIP_DISABLE:
    case PIPE_CAP_POINT_SPRITE:

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1377010836.BF443fB1.6392
Date: Tue, 20 Aug 2013 15:00:36 +0000
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
   title="NEW --- - [NVA3:NVC0] Turn on support for PIPE_CAP_CUBE_MAP_ARRAY"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=57660#c8">Comment # 8</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVA3:NVC0] Turn on support for PIPE_CAP_CUBE_MAP_ARRAY"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=57660">bug 57660</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Sounds like what's left to be done is to test it. Just need to apply the below
patch and see if it works (looks like there are a couple of piglit tests... ls
bin/*cube_map_array* -- they ought to pass on the nva3+ hardware).

--- a/src/gallium/drivers/nv50/nv50_screen.c
+++ b/src/gallium/drivers/nv50/nv50_screen.c
&#64;&#64; -114,10 +114,7 &#64;&#64; nv50_screen_get_param(struct pipe_screen *pscreen, enum
pipe_cap param)
    case PIPE_CAP_SEAMLESS_CUBE_MAP_PER_TEXTURE:
       return 0;
    case PIPE_CAP_CUBE_MAP_ARRAY:
-      return 0;
-      /*
       return nv50_screen(pscreen)-&gt;tesla-&gt;oclass &gt;= NVA3_3D_CLASS;
-      */
    case PIPE_CAP_TWO_SIDED_STENCIL:
    case PIPE_CAP_DEPTH_CLIP_DISABLE:
    case PIPE_CAP_POINT_SPRITE:</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1377010836.BF443fB1.6392--

--===============1759292402==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1759292402==--
