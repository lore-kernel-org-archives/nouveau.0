From: koriakim-mP9o5jsk0RY@public.gmane.org
Subject: Re: CCACHE and VFETCH FAULTs causing lockups
Date: Tue, 01 Mar 2011 23:06:15 +0100
Message-ID: <1299017175.4061.6.camel@bandersnatch>
References: <AANLkTik0CkbQz=PoXNG7bQEn_5ssAfp7cr=Z=3qJz6h2@mail.gmail.com>
	<1299016269.1822.3.camel@nisroch>
	<AANLkTimiy=U04vfiXRAqDj_eT+zxSN2_3NvmF4jRQWxc@mail.gmail.com>
Reply-To: koriakim-mP9o5jsk0RY@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0815110071=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <AANLkTimiy=U04vfiXRAqDj_eT+zxSN2_3NvmF4jRQWxc-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0815110071==
Content-Type: multipart/alternative; boundary="=-M4zmqYfuCbN+yU2EmvfX"


--=-M4zmqYfuCbN+yU2EmvfX
Content-Type: text/plain; charset=utf-8
Content-ID: <1299017175.4061.3.camel@bandersnatch>
Content-Transfer-Encoding: quoted-printable

> So these faults are just generic errors? Unrelated to page faults?

These faults *are* page faults, in a way.

On nv50, page faults are quite weird. When a fault happens, the MMU's fau=
lt reporting registers at 0x100c90 are filled with fault information, and=
 the 'fault pending' flag is set. This is what nouveau reports as VM FAUL=
T.

However, this does NOT trigger any specific interrupt - the fault is inst=
ead reported to requesting engine, which in turn reports an engine-specif=
ic interrupt, like VFETCH FAULT or CCACHE FAULT. These interrupts sometim=
es [eg for TPROP traps] also report some more useful information in engin=
e-specific registers.

Usually getting an engine fault implies getting a VM fault, but not alway=
s, so nouveau reports them separately - it only uses the engine fault as =
a trigger to check for new VM faults, but does not associate them in any =
way. The reasons for mismatches could be:

- Interrupts that trigger VM fault in some cases, but not in others: DMA_=
PUSHER/MEM_FAULT can happen due to DMA_LIMIT overrun, or due to VM fault
- Multiple VM faults in quick succession will result in only one of them =
being reported as VM fault, but all of them as engine faults

Hope this clears things up.

Marcin Ko=C5=9Bcielnicki
--=-M4zmqYfuCbN+yU2EmvfX
Content-Type: text/html; charset=utf-8
Content-ID: <1299017175.4061.5.camel@bandersnatch>
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://ww=
w.w3.org/TR/html4/loose.dtd">
<html><head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf=
-8">
    <meta name=3D"generator" content=3D"Osso Notes">
    <title></title></head>
<body>
<p>&gt; So these faults are just generic errors? Unrelated to page faults=
?
<br>
<br>These faults *are* page faults, in a way.
<br>
<br>On nv50, page faults are quite weird. When a fault happens, the MMU's=
 fault reporting registers at 0x100c90 are filled with fault information,=
 and the 'fault pending' flag is set. This is what nouveau reports as VM =
FAULT.
<br>
<br>However, this does NOT trigger any specific interrupt - the fault is =
instead reported to requesting engine, which in turn reports an engine-sp=
ecific interrupt, like VFETCH FAULT or CCACHE FAULT. These interrupts som=
etimes [eg for TPROP traps] also report some more useful information in e=
ngine-specific registers.
<br>
<br>Usually getting an engine fault implies getting a VM fault, but not a=
lways, so nouveau reports them separately - it only uses the engine fault=
 as a trigger to check for new VM faults, but does not associate them in =
any way. The reasons for mismatches could be:
<br>
<br>- Interrupts that trigger VM fault in some cases, but not in others: =
DMA_PUSHER/MEM_FAULT can happen due to DMA_LIMIT overrun, or due to VM fa=
ult
<br>- Multiple VM faults in quick succession will result in only one of t=
hem being reported as VM fault, but all of them as engine faults
<br>
<br>Hope this clears things up.
<br>
<br>Marcin Ko=C5=9Bcielnicki</p>
</body>
</html>

--=-M4zmqYfuCbN+yU2EmvfX--


--===============0815110071==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0815110071==--
