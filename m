From: Rhys Kidd <rhyskidd-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: valgrind-mmt: rebased against latest upstream valgrind
 release v3.16.1
Date: Tue, 23 Jun 2020 09:47:57 +1000
Message-ID: <CA+iOQUHn1x8HQ1+_QrSb9wEiH8m2G7mmd2Q3V4Gz6WAPnp8TWw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2146040201=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

--===============2146040201==
Content-Type: multipart/alternative; boundary="000000000000f36d6405a8b4df77"

--000000000000f36d6405a8b4df77
Content-Type: text/plain; charset="UTF-8"

As an update to the nouveau development community, the downstream fork of
Valgrind with a mmap tracing tool ("mmt") we maintain has been rebased
against the latest upstream release of Valgrind, v3.16.1

Code branch: https://github.com/envytools/valgrind/tree/mmt-3.16.1

Features of upstream Valgrind 3.16.x:
https://www.valgrind.org/docs/manual/dist.news.html

In selected highlights, the benefits of tracking the latest version of
Valgrind is added support for AArch64 v8.1 and reduced memcheck false
positive rate on highly optimised code. There are, as ever, many smaller
refinements and bug fixes. v3.16.1 includes two bugs fixed after 3.16.0 was
frozen. As our downstream valgrind-mmt was last released against v3.14, we
also get the benefit of all bug fixes and features since then, including
that the RDRAND and F16C insn set extensions are now supported.

For anyone unfamiliar with valgrind-mmt, it is a userspace mmio tracer that
assists nouveau reverse engineering efforts by tracing the commands sent to
the card. There is an accompanying demmt tool within the enytools repo to
better understand these trace logs.

I would like to thank all the other nouveau developers who have worked on
mmt over many years, including specifically airlied, mslusarz and kherbst.

Best,
Rhys

--000000000000f36d6405a8b4df77
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>As an update to the nouveau development community, th=
e downstream fork of Valgrind with a mmap tracing tool (&quot;mmt&quot;) we=
 maintain has been rebased against the latest upstream release of Valgrind,=
 v3.16.1</div><div><br></div><div>Code branch: <a href=3D"https://github.co=
m/envytools/valgrind/tree/mmt-3.16.1">https://github.com/envytools/valgrind=
/tree/mmt-3.16.1</a></div><div><br></div><div>Features of upstream Valgrind=
 3.16.x: <a href=3D"https://www.valgrind.org/docs/manual/dist.news.html">ht=
tps://www.valgrind.org/docs/manual/dist.news.html</a></div><div><br></div><=
div>In selected highlights, the benefits of tracking the latest version of =
Valgrind is added support for AArch64
    v8.1 and reduced memcheck false positive rate on highly optimised code.
    There are, as ever, many smaller refinements and bug fixes. v3.16.1 inc=
ludes two bugs fixed after 3.16.0 was frozen. As our downstream valgrind-mm=
t was last released against v3.14, we also get the benefit of all bug fixes=
 and features since then, including that the=C2=A0RDRAND=C2=A0and=C2=A0F16C=
=C2=A0insn=C2=A0set=C2=A0extensions=C2=A0are=C2=A0now=C2=A0supported.</div>=
<div><br></div><div>For anyone unfamiliar with valgrind-mmt, it is a usersp=
ace mmio tracer that assists nouveau reverse engineering efforts by tracing=
 the commands sent to the card. There is an accompanying demmt tool within =
the enytools repo to better understand these trace logs.<br></div><div><br>=
</div><div>I would like to thank all the other nouveau developers who have =
worked on mmt over many years, including specifically airlied, mslusarz and=
 kherbst.</div><div><br></div><div>Best,</div><div>Rhys<br></div></div>

--000000000000f36d6405a8b4df77--

--===============2146040201==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2146040201==--
