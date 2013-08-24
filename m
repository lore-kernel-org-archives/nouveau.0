From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 57660] [NVA3:NVC0] Turn on support for
	PIPE_CAP_CUBE_MAP_ARRAY
Date: Sat, 24 Aug 2013 04:06:15 +0000
Message-ID: <bug-57660-8800-FQEUQKCfwD@http.bugs.freedesktop.org/>
References: <bug-57660-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0965030519=="
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


--===============0965030519==
Content-Type: multipart/alternative; boundary="1377317175.8B18C1.8984"; charset="us-ascii"


--1377317175.8B18C1.8984
Date: Sat, 24 Aug 2013 04:06:15 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=57660

--- Comment #9 from Martin Peres <martin.peres-Iz16wY1oaNPLSKGbIzaifA@public.gmane.org> ---
(In reply to comment #8)
> Sounds like what's left to be done is to test it. Just need to apply the
> below patch and see if it works (looks like there are a couple of piglit
> tests... ls bin/*cube_map_array* -- they ought to pass on the nva3+
> hardware).
> 
> --- a/src/gallium/drivers/nv50/nv50_screen.c
> +++ b/src/gallium/drivers/nv50/nv50_screen.c
> @@ -114,10 +114,7 @@ nv50_screen_get_param(struct pipe_screen *pscreen, enum
> pipe_cap param)
>     case PIPE_CAP_SEAMLESS_CUBE_MAP_PER_TEXTURE:
>        return 0;
>     case PIPE_CAP_CUBE_MAP_ARRAY:
> -      return 0;
> -      /*
>        return nv50_screen(pscreen)->tesla->oclass >= NVA3_3D_CLASS;
> -      */
>     case PIPE_CAP_TWO_SIDED_STENCIL:
>     case PIPE_CAP_DEPTH_CLIP_DISABLE:
>     case PIPE_CAP_POINT_SPRITE:

I tested this patch with piglit, it doesn't look good :D

* arb_texture_cube_map_array-get: PASS
* arb_texture_cube_map_array-teximage3d-invalid-values: PASS
* arb_texture_cube_map_array-cubemap: FAIL (http://codepad.org/sZpx3ajS)
* arb_texture_cube_map_array-cubemap-lod: FAIL (http://codepad.org/5E8EPmpx)
* arb_texture_cube_map_array-fbo-cubemap-array: FAIL
(http://codepad.org/0QqPUEAE)
* arb_texture_cube_map_array-sampler-cube-array-shadow: FAIL
(http://codepad.org/orzd5RoU)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1377317175.8B18C1.8984
Date: Sat, 24 Aug 2013 04:06:15 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=57660#c9">Comment # 9</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVA3:NVC0] Turn on support for PIPE_CAP_CUBE_MAP_ARRAY"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=57660">bug 57660</a>
              from <span class="vcard"><a class="email" href="mailto:martin.peres&#64;ensi-bourges.fr" title="Martin Peres &lt;martin.peres&#64;ensi-bourges.fr&gt;"> <span class="fn">Martin Peres</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=57660#c8">comment #8</a>)
<span class="quote">&gt; Sounds like what's left to be done is to test it. Just need to apply the
&gt; below patch and see if it works (looks like there are a couple of piglit
&gt; tests... ls bin/*cube_map_array* -- they ought to pass on the nva3+
&gt; hardware).
&gt; 
&gt; --- a/src/gallium/drivers/nv50/nv50_screen.c
&gt; +++ b/src/gallium/drivers/nv50/nv50_screen.c
&gt; &#64;&#64; -114,10 +114,7 &#64;&#64; nv50_screen_get_param(struct pipe_screen *pscreen, enum
&gt; pipe_cap param)
&gt;     case PIPE_CAP_SEAMLESS_CUBE_MAP_PER_TEXTURE:
&gt;        return 0;
&gt;     case PIPE_CAP_CUBE_MAP_ARRAY:
&gt; -      return 0;
&gt; -      /*
&gt;        return nv50_screen(pscreen)-&gt;tesla-&gt;oclass &gt;= NVA3_3D_CLASS;
&gt; -      */
&gt;     case PIPE_CAP_TWO_SIDED_STENCIL:
&gt;     case PIPE_CAP_DEPTH_CLIP_DISABLE:
&gt;     case PIPE_CAP_POINT_SPRITE:</span >

I tested this patch with piglit, it doesn't look good :D

* arb_texture_cube_map_array-get: PASS
* arb_texture_cube_map_array-teximage3d-invalid-values: PASS
* arb_texture_cube_map_array-cubemap: FAIL (<a href="http://codepad.org/sZpx3ajS">http://codepad.org/sZpx3ajS</a>)
* arb_texture_cube_map_array-cubemap-lod: FAIL (<a href="http://codepad.org/5E8EPmpx">http://codepad.org/5E8EPmpx</a>)
* arb_texture_cube_map_array-fbo-cubemap-array: FAIL
(<a href="http://codepad.org/0QqPUEAE">http://codepad.org/0QqPUEAE</a>)
* arb_texture_cube_map_array-sampler-cube-array-shadow: FAIL
(<a href="http://codepad.org/orzd5RoU">http://codepad.org/orzd5RoU</a>)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1377317175.8B18C1.8984--

--===============0965030519==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0965030519==--
