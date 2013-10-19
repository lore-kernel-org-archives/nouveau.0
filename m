From: Eugene Shatokhin <euspectre-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: MmioTrace: Using the Instruction Decoder, etc.
Date: Sat, 19 Oct 2013 17:16:25 +0400
Message-ID: <CAL5fWtDNd2aBix32ZgH4tgRUs5s-uXcOhNHJ=65XMQhkCeMh8Q@mail.gmail.com>
References: <CAL5fWtDBJUT0sK+rT9fD+BbFtwPuF4oBCUo8Gs+_aRMH4R_p=w@mail.gmail.com>
	<20131017194614.64a6b70e@farn.lan>
	<CAL5fWtBS88Ni3bUiUgmaj32PQ7QHTnnRd9GEKW5uRJycxYY4Hg@mail.gmail.com>
	<20131019101417.50a33eaf@farn.lan>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0494774522=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20131019101417.50a33eaf-DA5HUFbJnAM@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

--===============0494774522==
Content-Type: multipart/alternative; boundary=001a1133eacaabe4cd04e917db9f

--001a1133eacaabe4cd04e917db9f
Content-Type: text/plain; charset=ISO-8859-1

Oh, messed up the registers in the example. Should be like this:

If some original function of the driver contained, say,

mov 0xabcd (%rax), %rsi
mov %rdx, 0xbeeffeed (%rsi)

that will be transformed to something like

lea 0xabcd (%rax), %rbx
mov %rbx, <local_storage1>
mov 0xabcd (%rax), %rsi
lea 0xbeeffeed (%rsi), %rbx
mov %rbx, <local_storage2>
mov %rdx, 0xbeeffeed (%rsi)
...
<send the local_storage to the output system>

Regards,
Eugene

--001a1133eacaabe4cd04e917db9f
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div>Oh, messed up the registers in the example. Shoul=
d be like this:</div><div><br></div><div>If some original function of the d=
river contained, say,<br><br>  mov 0xabcd (%rax), %rsi<br>mov %rdx, 0xbeeff=
eed (%rsi)<br>
<br>that will be transformed to something like <br><br>  lea  0xabcd (%rax)=
, %rbx<br>  mov %rbx, &lt;local_storage1&gt;<br>  mov 0xabcd (%rax), %rsi <=
br>  lea  0xbeeffeed (%rsi), %rbx<br>  mov %rbx, &lt;local_storage2&gt; <br=
>
mov %rdx, 0xbeeffeed (%rsi)=A0<br>  ...<br>  &lt;send the local_storage to =
the output system&gt;</div><div><br></div><div>Regards,</div><div>Eugene</d=
iv></div>

--001a1133eacaabe4cd04e917db9f--

--===============0494774522==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0494774522==--
