From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 82152] any OpenGL application crashes X,
 locks up machine with nouveau and PRIME
Date: Mon, 04 Aug 2014 21:41:28 +0000
Message-ID: <bug-82152-8800-Y3Je3MA5bs@http.bugs.freedesktop.org/>
References: <bug-82152-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0416531133=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-82152-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0416531133==
Content-Type: multipart/alternative; boundary="1407188487.DACf70.2103"; charset="us-ascii"


--1407188487.DACf70.2103
Date: Mon, 4 Aug 2014 21:41:27 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=82152

--- Comment #4 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
There are two issues:

(a) The null deref in the kernel when putting the card back to sleep
(b) The fact that init of the card fails

To mitigate the first, you could boot with "nouveau.runpm=0". However you still
wouldn't get working accel with nouveau.

The claim by NVIDIA was that the graph-not-powered-up problem was restricted to
GK104/GK106. But looking at the latest code, it seems like it runs on GK107 as
well (not in Ben's repo anymore, but still in linux-3.16) and perhaps has the
reverse effect there.

I wonder if a patch like

diff --git a/nvkm/engine/graph/nve4.c b/nvkm/engine/graph/nve4.c
index 51e0c07..4dd376e 100644
--- a/nvkm/engine/graph/nve4.c
+++ b/nvkm/engine/graph/nve4.c
@@ -350,7 +350,7 @@ nve4_graph_oclass = &(struct nvc0_graph_oclass) {
                .ctor = nvc0_graph_ctor,
                .dtor = nvc0_graph_dtor,
                .init = nve4_graph_init,
-               .fini = nve4_graph_fini,
+               .fini = _nouveau_graph_fini,
        },
        .cclass = &nve4_grctx_oclass,
        .sclass = nve4_graph_sclass,

will help you out. (You'll need to apply it with care... cd into
drivers/gpu/drm/nouveau/core and apply it with patch -p2 )

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1407188487.DACf70.2103
Date: Mon, 4 Aug 2014 21:41:27 +0000
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
   title="NEW --- - any OpenGL application crashes X, locks up machine with nouveau and PRIME"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=82152#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - any OpenGL application crashes X, locks up machine with nouveau and PRIME"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=82152">bug 82152</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>There are two issues:

(a) The null deref in the kernel when putting the card back to sleep
(b) The fact that init of the card fails

To mitigate the first, you could boot with &quot;nouveau.runpm=0&quot;. However you still
wouldn't get working accel with nouveau.

The claim by NVIDIA was that the graph-not-powered-up problem was restricted to
GK104/GK106. But looking at the latest code, it seems like it runs on GK107 as
well (not in Ben's repo anymore, but still in linux-3.16) and perhaps has the
reverse effect there.

I wonder if a patch like

diff --git a/nvkm/engine/graph/nve4.c b/nvkm/engine/graph/nve4.c
index 51e0c07..4dd376e 100644
--- a/nvkm/engine/graph/nve4.c
+++ b/nvkm/engine/graph/nve4.c
&#64;&#64; -350,7 +350,7 &#64;&#64; nve4_graph_oclass = &amp;(struct nvc0_graph_oclass) {
                .ctor = nvc0_graph_ctor,
                .dtor = nvc0_graph_dtor,
                .init = nve4_graph_init,
-               .fini = nve4_graph_fini,
+               .fini = _nouveau_graph_fini,
        },
        .cclass = &amp;nve4_grctx_oclass,
        .sclass = nve4_graph_sclass,

will help you out. (You'll need to apply it with care... cd into
drivers/gpu/drm/nouveau/core and apply it with patch -p2 )</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1407188487.DACf70.2103--

--===============0416531133==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0416531133==--
