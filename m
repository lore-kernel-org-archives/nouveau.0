From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 48742] [NV30 gallium] fbotexture -arb misrenders on
	nv43
Date: Tue, 27 Aug 2013 05:01:13 +0000
Message-ID: <bug-48742-8800-uDiUVkDqgN@http.bugs.freedesktop.org/>
References: <bug-48742-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0955998325=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-48742-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0955998325==
Content-Type: multipart/alternative; boundary="1377579673.b4fAB5F1.32415"; charset="us-ascii"


--1377579673.b4fAB5F1.32415
Date: Tue, 27 Aug 2013 05:01:13 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=48742

--- Comment #6 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
So while on the NV34 the rendering was bad with -ds, -arb, and -ds2, on NV42,
the rendering is only bad for -arb. Looking at what -arb does specially, it has
a "sizeFudge" parameter in the demo. If I avoid setting that, it all works fine
with -arb as well.

sizeFudge is used to reduce the size of the texture. Normally the texture is
512x512, but if I reduce it to 511x511, then things look much better (the 90
pixels that ought to be blacked out aren't, but at least the main stuff updates
seemingly correctly.)

And I'm seeing

[ 3360.231160] nouveau E[  PGRAPH][0000:02:00.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT
[ 3360.231173] nouveau E[  PGRAPH][0000:02:00.0] ch 3 [0x00118000
fbotexture[782]] subc 7 class 0x4097 mthd 0x0208 data 0x08080345

method 0x0208 = NV30_3D_RT_FORMAT. The problem is the type -- it's set to both
linear *and* swizzle. A bit of investigation shows that this happens in
nv30_clear. fb->cbufs[0]->texture is swizzled, but fb->zsbuf->texture is not.

Not really sure how to handle this properly... I think fb->zsbuf->texture is
not swizzled because it's a NPOT texture. (And if I make everything be 511x511,
then everything becomes NPOT, and so the copy/etc succeeds.)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1377579673.b4fAB5F1.32415
Date: Tue, 27 Aug 2013 05:01:13 +0000
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
   title="NEW --- - [NV30 gallium] fbotexture -arb misrenders on nv43"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=48742#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV30 gallium] fbotexture -arb misrenders on nv43"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=48742">bug 48742</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>So while on the NV34 the rendering was bad with -ds, -arb, and -ds2, on NV42,
the rendering is only bad for -arb. Looking at what -arb does specially, it has
a &quot;sizeFudge&quot; parameter in the demo. If I avoid setting that, it all works fine
with -arb as well.

sizeFudge is used to reduce the size of the texture. Normally the texture is
512x512, but if I reduce it to 511x511, then things look much better (the 90
pixels that ought to be blacked out aren't, but at least the main stuff updates
seemingly correctly.)

And I'm seeing

[ 3360.231160] nouveau E[  PGRAPH][0000:02:00.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT
[ 3360.231173] nouveau E[  PGRAPH][0000:02:00.0] ch 3 [0x00118000
fbotexture[782]] subc 7 class 0x4097 mthd 0x0208 data 0x08080345

method 0x0208 = NV30_3D_RT_FORMAT. The problem is the type -- it's set to both
linear *and* swizzle. A bit of investigation shows that this happens in
nv30_clear. fb-&gt;cbufs[0]-&gt;texture is swizzled, but fb-&gt;zsbuf-&gt;texture is not.

Not really sure how to handle this properly... I think fb-&gt;zsbuf-&gt;texture is
not swizzled because it's a NPOT texture. (And if I make everything be 511x511,
then everything becomes NPOT, and so the copy/etc succeeds.)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1377579673.b4fAB5F1.32415--

--===============0955998325==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0955998325==--
