From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 51477] bad/missing graphics with NV11 / GeForce
	2MX/MX400
Date: Sun, 10 Aug 2014 05:12:40 +0000
Message-ID: <bug-51477-8800-gZ5QdJgjo0@http.bugs.freedesktop.org/>
References: <bug-51477-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0985237100=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-51477-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0985237100==
Content-Type: multipart/alternative; boundary="1407647560.ECdB83.3633"; charset="us-ascii"


--1407647560.ECdB83.3633
Date: Sun, 10 Aug 2014 05:12:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=51477

--- Comment #24 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
I noticed a weird thing in the bisected commit... does this patch help?

index df2f561..47cf0ef 100644
--- a/src/nv10_exa.c
+++ b/src/nv10_exa.c
@@ -520,7 +520,7 @@ setup_picture(NVPtr pNv, PicturePtr pict, PixmapPtr pixmap,
int unit,
        if (pict && PICT_FORMAT_RGB(pict->format))
                *color = RCSEL_COLOR | source;
        else
-               *color = RCSEL_ALPHA | RCINP_ZERO;
+               *color = RCSEL_COLOR | RCINP_ZERO;

        if (pict && PICT_FORMAT_A(pict->format))
                *alpha = RCSEL_ALPHA | source;

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1407647560.ECdB83.3633
Date: Sun, 10 Aug 2014 05:12:40 +0000
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
   title="NEW --- - bad/missing graphics with NV11 / GeForce 2MX/MX400"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=51477#c24">Comment # 24</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - bad/missing graphics with NV11 / GeForce 2MX/MX400"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=51477">bug 51477</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>I noticed a weird thing in the bisected commit... does this patch help?

index df2f561..47cf0ef 100644
--- a/src/nv10_exa.c
+++ b/src/nv10_exa.c
&#64;&#64; -520,7 +520,7 &#64;&#64; setup_picture(NVPtr pNv, PicturePtr pict, PixmapPtr pixmap,
int unit,
        if (pict &amp;&amp; PICT_FORMAT_RGB(pict-&gt;format))
                *color = RCSEL_COLOR | source;
        else
-               *color = RCSEL_ALPHA | RCINP_ZERO;
+               *color = RCSEL_COLOR | RCINP_ZERO;

        if (pict &amp;&amp; PICT_FORMAT_A(pict-&gt;format))
                *alpha = RCSEL_ALPHA | source;</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1407647560.ECdB83.3633--

--===============0985237100==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0985237100==--
