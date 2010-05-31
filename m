From: Stephane Marchesin <stephane.marchesin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau: reduce usage of fence spinlock
	to when absolutely necessary
Date: Sun, 30 May 2010 19:14:05 -0700
Message-ID: <AANLkTinpR2n_Gnd_Uhd8zr3_o1W1kbrEYqm3qSCNz_rI@mail.gmail.com>
References: <1275271292-5650-1-git-send-email-skeggsb@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0648744111=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1275271292-5650-1-git-send-email-skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Mime-version: 1.0
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

--===============0648744111==
Content-Type: multipart/alternative; boundary=001636c5a2f547032b0487da6972

--001636c5a2f547032b0487da6972
Content-Type: text/plain; charset=ISO-8859-1

The update of last_sequence_irq is still racy with this patch...

So let me explain:
- non-interrupt context starts reading last_sequence_irq
- irq happens in the middle (because it is not an atomic read, it's
possible, albeit it doesn't happen on x86 so just saying "it works on my
x86" isn't enough)
- last_sequence_irq is modified in interrupt context
- second half of last_sequence_irq happens in normal context and results in
a bogus value

Stephane

--001636c5a2f547032b0487da6972
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

The update of last_sequence_irq is still racy with this patch...<div><br></=
div><div><div>So let me explain:</div><div>- non-interrupt context starts r=
eading=A0last_sequence_irq</div><div>- irq happens in the middle (because i=
t is not an atomic read, it&#39;s possible, albeit it doesn&#39;t happen on=
 x86 so just saying &quot;it works on my x86&quot; isn&#39;t enough)</div>
<div>-=A0last_sequence_irq is modified in interrupt context</div><div>- sec=
ond half of=A0last_sequence_irq happens in normal context and results in a =
bogus value</div><div><br></div><div>Stephane</div><div><br></div>
</div>

--001636c5a2f547032b0487da6972--

--===============0648744111==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0648744111==--
