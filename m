From: Patrick Baggett <baggett.patrick-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: nouveau on Linux/sparc64 -- almost!
Date: Wed, 23 Nov 2011 10:23:40 -0600
Message-ID: <CAEk2St=_thpkwT4vjozJutwZ_1=sztzWRqonum9NsX2YW_GKGA@mail.gmail.com>
References: <4ECC47F8.6020802@gmail.com>
	<CAMVNhxRcM4B0eBLQo+k0UmGxaS1y7jt=V042T65a2nQRkope8Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0186375296=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAMVNhxRcM4B0eBLQo+k0UmGxaS1y7jt=V042T65a2nQRkope8Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Younes Manton <younes.m-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============0186375296==
Content-Type: multipart/alternative; boundary=f46d0417015bc594cb04b26957b4

--f46d0417015bc594cb04b26957b4
Content-Type: text/plain; charset=ISO-8859-1

> Are unaligned accesses actually errors on Sparc or just trapped and
> emulated and therefore slow?


I'm not 100% sure. Architecturally, they are errors on SPARC. Userspace
applications that do unaligned accesses are sent SIGBUS and usually killed.
For a driver, I would imagine that the kernel would catch this trap and
emulate or ignore it rather than go down in a blaze of glory. It should
generally be treated as an error, and every time I've seen the C code that
does it, it is usually straight forward to fix it.



> If you can start X, does that mean fbcon
> works?
>
I don't really know a whole lot about fbcon in general. I know that I
definitely get fbcon on the ATI chip (fb0), but I haven't really researched
how to get a console going on the NVidia one. I'd be happy to try it and
report results if you give me a bit of direction.

Patrick

--f46d0417015bc594cb04b26957b4
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><div class=3D"gmail_quote"><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x;">Are unaligned accesses actually errors on Sparc or just trapped and<br>
emulated and therefore slow?</blockquote><div><br></div><div>I&#39;m not 10=
0% sure. Architecturally, they are errors on SPARC. Userspace applications =
that do unaligned accesses are sent SIGBUS and usually killed. For a driver=
, I would imagine that the kernel would catch this trap and emulate or igno=
re it rather than go down in a blaze of glory. It should generally be treat=
ed as an error, and every time I&#39;ve seen the C code that does it, it is=
 usually straight forward to fix it.</div>
<div><br></div><div>=A0</div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex;"> If you can st=
art X, does that mean fbcon<br>
works?<br>
</blockquote></div>I don&#39;t really know a whole lot about fbcon in gener=
al. I know that I definitely get fbcon on the ATI chip (fb0), but I haven&#=
39;t really researched how to get a console going on the NVidia one. I&#39;=
d be happy to try it and report results if you give me a bit of direction.<=
/div>
<div><br></div><div>Patrick</div>

--f46d0417015bc594cb04b26957b4--

--===============0186375296==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0186375296==--
