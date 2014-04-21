From: Patrick Baggett <baggett.patrick-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: BO page shift?
Date: Mon, 21 Apr 2014 15:17:16 -0500
Message-ID: <CAEk2St=Jdj7QNm0x+zeOFfAkgje6YPkmG8d7wiaAov+xaZgX1Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1064382846=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

--===============1064382846==
Content-Type: multipart/alternative; boundary=001a113398108e844404f7932fb6

--001a113398108e844404f7932fb6
Content-Type: text/plain; charset=UTF-8

I'm looking at nouveau_bo.c in nouveau_bo_new() and I see some code like:

line 230:

nvbo->bo.mem.num_pages = size >> PAGE_SHIFT;


and

line 236

ret = ttm_bo_init(&drm->ttm.bdev, &nvbo->bo, size,
			  type, &nvbo->placement,
			  align >> PAGE_SHIFT, false, NULL, acc_size, sg,
			  nouveau_bo_del_ttm);


It doesn't seem to handle the case that {value} >> PAGE_SHIFT could
result in 0. I think "size >> PAGE_SHIFT" may be OK, but I'm not so
sure about "align >> PAGE_SHIFT".



Shouldn't these have something like MIN( ... ,1), i.e. it must be at
least one page of memory? Is there something else that is going on
that I'm missing?


Patrick

--001a113398108e844404f7932fb6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><font face=3D"courier new, monospace">I&#39;m looking at n=
ouveau_bo.c in nouveau_bo_new() and I see some code like:</font><div><font =
face=3D"courier new, monospace"><br></font></div><div><font face=3D"courier=
 new, monospace">line 230:</font></div>
<div><pre style=3D"padding:0px;margin-top:0px;margin-bottom:0px;color:rgb(0=
,0,0);font-size:13px"><code><font face=3D"courier new, monospace">nvbo<span=
 class=3D"">-&gt;</span>bo<span class=3D"">.</span>mem<span class=3D"">.</s=
pan>num_pages <span class=3D"">=3D</span> size <span class=3D"">&gt;&gt;</s=
pan> PAGE_SHIFT<span class=3D"">;</span></font></code></pre>
<pre style=3D"padding:0px;margin-top:0px;margin-bottom:0px;color:rgb(0,0,0)=
;font-size:13px"><code><span class=3D""><font face=3D"courier new, monospac=
e"><br></font></span></code></pre><pre style=3D"padding:0px;margin-top:0px;=
margin-bottom:0px;color:rgb(0,0,0);font-size:13px">
<code><span class=3D""><font face=3D"courier new, monospace">and </font></s=
pan></code></pre><pre style=3D"padding:0px;margin-top:0px;margin-bottom:0px=
;color:rgb(0,0,0);font-size:13px"><code><span class=3D""><font face=3D"cour=
ier new, monospace">line 236</font></span></code></pre>
<pre style=3D"padding:0px;margin-top:0px;margin-bottom:0px;color:rgb(0,0,0)=
;font-size:13px"><code><span class=3D""><font face=3D"courier new, monospac=
e"><pre style=3D"padding:0px;margin-top:0px;margin-bottom:0px"><code>ret <s=
pan class=3D"">=3D</span> <span class=3D"" style=3D"color:rgb(1,1,129)">ttm=
_bo_init</span><span class=3D"">(&amp;</span>drm<span class=3D"">-&gt;</spa=
n>ttm<span class=3D"">.</span>bdev<span class=3D"">, &amp;</span>nvbo<span =
class=3D"">-&gt;</span>bo<span class=3D"">,</span> size<span class=3D"">,</=
span>
			  type<span class=3D"">, &amp;</span>nvbo<span class=3D"">-&gt;</span>pl=
acement<span class=3D"">,</span>
			  align <span class=3D"">&gt;&gt;</span> PAGE_SHIFT<span class=3D"">,</s=
pan> <span class=3D"" style=3D"font-weight:bold">false</span><span class=3D=
"">,</span> NULL<span class=3D"">,</span> acc_size<span class=3D"">,</span>=
 sg<span class=3D"">,</span>
			  nouveau_bo_del_ttm<span class=3D"">);</span></code></pre><pre style=3D=
"padding:0px;margin-top:0px;margin-bottom:0px"><code><span class=3D""><br><=
/span></code></pre><pre style=3D"padding:0px;margin-top:0px;margin-bottom:0=
px">
It doesn&#39;t seem to handle the case that {value} &gt;&gt; PAGE_SHIFT cou=
ld result in 0. I think &quot;size &gt;&gt; PAGE_SHIFT&quot; may be OK, but=
 I&#39;m not so sure about &quot;align &gt;&gt; PAGE_SHIFT&quot;.</pre>
<pre style=3D"padding:0px;margin-top:0px;margin-bottom:0px"><br></pre><pre =
style=3D"padding:0px;margin-top:0px;margin-bottom:0px"><br></pre><pre style=
=3D"padding:0px;margin-top:0px;margin-bottom:0px">Shouldn&#39;t these have =
something like MIN( ... ,1), i.e. it must be at least one page of memory? I=
s there something else that is going on that I&#39;m missing?</pre>
<pre style=3D"padding:0px;margin-top:0px;margin-bottom:0px"><br></pre><pre =
style=3D"padding:0px;margin-top:0px;margin-bottom:0px">Patrick</pre></font>=
</span></code></pre></div></div>

--001a113398108e844404f7932fb6--

--===============1064382846==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1064382846==--
