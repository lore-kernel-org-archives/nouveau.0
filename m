From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 54437] [NVC8] linux-nouveau2.6 (3.6.0-rc4) : GTX580
 : Xorg freezes when using accel
Date: Mon, 21 Jul 2014 16:42:31 +0000
Message-ID: <bug-54437-8800-kivkPZLewW@http.bugs.freedesktop.org/>
References: <bug-54437-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1639889630=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-54437-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1639889630==
Content-Type: multipart/alternative; boundary="1405960951.60C1C4.25592"; charset="us-ascii"


--1405960951.60C1C4.25592
Date: Mon, 21 Jul 2014 16:42:31 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=54437

--- Comment #13 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to comment #12)
> This bug is affecting me also, see the last duplicated bug. Any progress in
> fixing this? Maybe some help in testing (for ex.) required?

It's a bit of a mystery unfortunately. Adding to the annoyance, Ben said that
it does work just fine on his NVC8, although he has the less powerful versions.
Could be something with high ROP/TPC/GPC counts not being handled. (Or multiple
PARTs?)

That might actually be an interesting experiment -- before loading nouveau,
mask out a bunch of the units and see if it helps. If it does, find the
"breaking" point.

This is the code that computes that stuff:

http://cgit.freedesktop.org/~darktama/nouveau/tree/nvkm/engine/graph/nvc0.c#n1330

    priv->rop_nr = (nv_rd32(priv, 0x409604) & 0x001f0000) >> 16;
    priv->gpc_nr =  nv_rd32(priv, 0x409604) & 0x0000001f;
    for (i = 0; i < priv->gpc_nr; i++) {
        priv->tpc_nr[i]  = nv_rd32(priv, GPC_UNIT(i, 0x2608));
        priv->tpc_total += priv->tpc_nr[i];
    }

Step 1: Print out the various values (i.e. number of ROPs, GPCs, and the
per-GPC TPC counts).
Step 2: Artificially lower them (to, e.g., 1) and see if it helps. If it does,
figure out which of the values matter and where the breaking points are.

If it doesn't help, perhaps the units need to be disabled a little harder, e.g.
by setting 0x22584/0x22588.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1405960951.60C1C4.25592
Date: Mon, 21 Jul 2014 16:42:31 +0000
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
   title="NEW --- - [NVC8] linux-nouveau2.6 (3.6.0-rc4) : GTX580 : Xorg freezes when using accel"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=54437#c13">Comment # 13</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVC8] linux-nouveau2.6 (3.6.0-rc4) : GTX580 : Xorg freezes when using accel"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=54437">bug 54437</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=54437#c12">comment #12</a>)
<span class="quote">&gt; This bug is affecting me also, see the last duplicated bug. Any progress in
&gt; fixing this? Maybe some help in testing (for ex.) required?</span >

It's a bit of a mystery unfortunately. Adding to the annoyance, Ben said that
it does work just fine on his NVC8, although he has the less powerful versions.
Could be something with high ROP/TPC/GPC counts not being handled. (Or multiple
PARTs?)

That might actually be an interesting experiment -- before loading nouveau,
mask out a bunch of the units and see if it helps. If it does, find the
&quot;breaking&quot; point.

This is the code that computes that stuff:

<a href="http://cgit.freedesktop.org/~darktama/nouveau/tree/nvkm/engine/graph/nvc0.c#n1330">http://cgit.freedesktop.org/~darktama/nouveau/tree/nvkm/engine/graph/nvc0.c#n1330</a>

    priv-&gt;rop_nr = (nv_rd32(priv, 0x409604) &amp; 0x001f0000) &gt;&gt; 16;
    priv-&gt;gpc_nr =  nv_rd32(priv, 0x409604) &amp; 0x0000001f;
    for (i = 0; i &lt; priv-&gt;gpc_nr; i++) {
        priv-&gt;tpc_nr[i]  = nv_rd32(priv, GPC_UNIT(i, 0x2608));
        priv-&gt;tpc_total += priv-&gt;tpc_nr[i];
    }

Step 1: Print out the various values (i.e. number of ROPs, GPCs, and the
per-GPC TPC counts).
Step 2: Artificially lower them (to, e.g., 1) and see if it helps. If it does,
figure out which of the values matter and where the breaking points are.

If it doesn't help, perhaps the units need to be disabled a little harder, e.g.
by setting 0x22584/0x22588.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1405960951.60C1C4.25592--

--===============1639889630==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1639889630==--
