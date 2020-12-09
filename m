From: Mario Marietto <marietto2008-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [ 0.772389] nouveau 0000:1b:00.0: fifo: fault 01
 [VIRT_WRITE] at 00000000000bd000 engine c0 [BAR2] client 08
 [HUB/HOST_CPU_NB] reason 0d [REGION_VIOLATION] on channel -1 [02bfedf000
 unknown]
Date: Wed, 9 Dec 2020 13:20:26 +0100
Message-ID: <CA+1FSihnkp5XFvYd+8jANfKor=nPXTq2n9fqsGF_1aRnxf81iw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1264185503=="
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
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============1264185503==
Content-Type: multipart/alternative; boundary="000000000000d510d105b607176f"

--000000000000d510d105b607176f
Content-Type: text/plain; charset="UTF-8"

 Hello.

I'm trying to enable the nouveau driver in the linux os virtualized with
esxi 7,but I see a BUG like this :

BUG: unable to handle page fault for address:

ffffba5000d00000 when it tries to do:

[    0.772389] nouveau 0000:1b:00.0: fifo: fault 01 [VIRT_WRITE] at
00000000000bd000 engine c0 [BAR2] client 08 [HUB/HOST_CPU_NB] reason
0d [REGION_VIOLATION] on channel -1 [02bfedf000 unknown]

how to fix it ? thanks.

NB : my graphic card is the nvidia 2080 ti. I have passed it through to the
ARCH linux os

-- 
Mario.

--000000000000d510d105b607176f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">
<div><div>Hello.</div><div><br></div><div>I&#39;m trying to enable the nouv=
eau driver in the linux os virtualized with esxi 7,but I see a BUG like thi=
s :<br></div><div><br></div><div>BUG: unable to handle page fault for addre=
ss:</div><div><br>
</div><div>ffffba5000d00000 when it tries to do:</div><div><br>
</div><div>[=C2=A0 =C2=A0 0.772389] nouveau 0000:1b:00.0: fifo: fault 01 [V=
IRT_WRITE] at<span></span></div><div><span></span></div><span>
00000000000bd000 engine c0 [BAR2] client 08 [HUB/HOST_CPU_NB] reason<br>
0d [REGION_VIOLATION] on channel -1 [02bfedf000 unknown]<br>
</span>

<br clear=3D"all"></div><div>how to fix it ? thanks.</div><div><br></div><d=
iv>NB : my graphic card is the nvidia 2080 ti. I have passed it through to =
the ARCH linux os<font color=3D"#888888"><br></font></div>

<br>-- <br><div dir=3D"ltr" class=3D"gmail_signature">Mario.<br></div></div=
></div>

--000000000000d510d105b607176f--

--===============1264185503==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1264185503==--
