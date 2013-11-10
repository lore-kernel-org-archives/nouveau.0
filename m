From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 71438] [NV10/nouveau_vieux] Application Konqueror
 crashes when connecting to asus.com
Date: Sun, 10 Nov 2013 02:27:45 +0000
Message-ID: <bug-71438-8800-gJcfu1q8s4@http.bugs.freedesktop.org/>
References: <bug-71438-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0719806166=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-71438-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0719806166==
Content-Type: multipart/alternative; boundary="1384050465.a3B02.27254"; charset="us-ascii"


--1384050465.a3B02.27254
Date: Sun, 10 Nov 2013 02:27:45 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=71438

--- Comment #6 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
OK, well it seems like eventually you start getting allocation errors. This
could mean that we're somehow leaking video memory, or just not using it
wisely, or that there's just not enough to go 'round. Modern applications will
want a lot more 3d than this card can provide anyways... unless you plan on
using it for 3d activities, you could set LIBGL_ALWAYS_SOFTWARE=1 somewhere in
your environment which will cause mesa to fall back on llvmpipe or swrast.

Another possibility is that you're being bitten by the libdrm bug that was
exposed by gcc-4.8 (which I see your kernel is compiled with). Try a libdrm
with commit
http://cgit.freedesktop.org/mesa/drm/commit/?id=482abbfafb56cbceaf5355c026434e638cddd0f1
applied and see if it helps.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1384050465.a3B02.27254
Date: Sun, 10 Nov 2013 02:27:45 +0000
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
   title="NEW --- - [NV10/nouveau_vieux] Application Konqueror crashes when connecting to asus.com"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71438#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV10/nouveau_vieux] Application Konqueror crashes when connecting to asus.com"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71438">bug 71438</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>OK, well it seems like eventually you start getting allocation errors. This
could mean that we're somehow leaking video memory, or just not using it
wisely, or that there's just not enough to go 'round. Modern applications will
want a lot more 3d than this card can provide anyways... unless you plan on
using it for 3d activities, you could set LIBGL_ALWAYS_SOFTWARE=1 somewhere in
your environment which will cause mesa to fall back on llvmpipe or swrast.

Another possibility is that you're being bitten by the libdrm bug that was
exposed by gcc-4.8 (which I see your kernel is compiled with). Try a libdrm
with commit
<a href="http://cgit.freedesktop.org/mesa/drm/commit/?id=482abbfafb56cbceaf5355c026434e638cddd0f1">http://cgit.freedesktop.org/mesa/drm/commit/?id=482abbfafb56cbceaf5355c026434e638cddd0f1</a>
applied and see if it helps.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1384050465.a3B02.27254--

--===============0719806166==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0719806166==--
