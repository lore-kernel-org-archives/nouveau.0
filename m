From: Daniel Melo Jorge da Cunha <dmjcunha-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: nouveau.c
Date: Wed, 26 Mar 2014 16:37:29 -0400
Message-ID: <CANbfre5w0dTR_jPsKrV=0H-iDhumeVwNp_CE214uBLXetRCb3g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1098071963=="
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

--===============1098071963==
Content-Type: multipart/alternative; boundary=047d7b86efc8f4728a04f5886f0a

--047d7b86efc8f4728a04f5886f0a
Content-Type: text/plain; charset=ISO-8859-1

Hi, I am inspecting the file nouveau.c...
In the function nouveau_client_new there is the
following:

for (i = 0; i < nvdev->nr_client; i++) {

but "nr_client" has no previous assignment

so it has scrambled data. Is this expected behaviour
or am I missing something (the most probable :)?

And someone please tell me where do I find that ffs function.

Thanks in advance!!

--047d7b86efc8f4728a04f5886f0a
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><div><span style=3D"font-family:arial,helve=
tica,sans-serif">Hi, I am inspecting the file nouveau.c...<br></span></div>=
<span style=3D"font-family:arial,helvetica,sans-serif">In the function nouv=
eau_client_new there is the<br>
</span></div><span style=3D"font-family:arial,helvetica,sans-serif">followi=
ng:<br><br></span>for (i =3D 0; i &lt; nvdev-&gt;nr_client; i++) {<br><br>b=
ut &quot;nr_client&quot; has no previous assignment<br><br>so it has scramb=
led data. Is this expected behaviour<br>
or am I missing something (the most probable :)?<br><code><br></code></div>=
And someone please tell me where do I find that ffs function<code>.<br><br>=
</code></div>Thanks in advance!!<code><br></code></div>

--047d7b86efc8f4728a04f5886f0a--

--===============1098071963==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1098071963==--
