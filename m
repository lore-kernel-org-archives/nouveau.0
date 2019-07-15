From: Fernando Sahmkow <fsahmkow27-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Questions on Maxwell 2nd Gen Compute Kernels/Shaders
Date: Mon, 15 Jul 2019 14:34:23 -0400
Message-ID: <CA+MSTo-nX8MeHiGHveJ0GPO3okSEbKgzmcu_Z0J5w015T+e5qQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1301323434=="
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

--===============1301323434==
Content-Type: multipart/alternative; boundary="000000000000fc6311058dbc8276"

--000000000000fc6311058dbc8276
Content-Type: text/plain; charset="UTF-8"

So we have been busy implementing the compute engine lately but we have
discovered a few issues with Compute Shaders. I hope you guys can answer
some questions.

1st How do I determine the size of Compute Shaders/Kernel Local Memory ? In
Pipeline shaders the size is included in the header but Compute Kernels
don't have a header, so how do I determine how much local memory it uses?
In case I can't is there a limit?

2nd I backtrack directions for LDG from the constbuffer that stores them. I
then use this directions then to compute the adress in my emulated SSBO.
For fragment, geometry and vertex shaders I got no problems with this
directions. For compute shaders the directions seem to be invalid, I
imagine there's a base adress that's added to this directions. Where can I
obtain that base adress?

3rd SUATOM instraction CAS is similar to CompareAndSwap except it may add 1
or 2 to the data register on store. How do I know when it adds 1 or 2?

Thanks in advance.

--000000000000fc6311058dbc8276
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">So we have been busy implementing the compute engine latel=
y but we have discovered a few issues with Compute Shaders. I hope you guys=
 can answer some questions.<div><br></div><div>1st How do I determine the s=
ize of Compute Shaders/Kernel Local Memory ? In Pipeline shaders the size i=
s included in the header but Compute Kernels don&#39;t have a header, so ho=
w do I determine how much local memory it uses? In case I can&#39;t is ther=
e a limit?</div><div><br></div><div>2nd I backtrack directions for LDG from=
 the constbuffer that stores them. I then use this directions then to compu=
te the adress in my emulated SSBO. For fragment, geometry and vertex shader=
s I got no problems with this directions. For compute shaders the direction=
s seem to be invalid, I imagine there&#39;s a base adress that&#39;s added =
to this directions. Where can I obtain that base adress?</div><div><br></di=
v><div>3rd SUATOM instraction CAS is similar to CompareAndSwap except it ma=
y add 1 or 2 to the data register on store. How do I know when it adds 1 or=
 2?</div><div><br></div><div>Thanks in advance.</div></div>

--000000000000fc6311058dbc8276--

--===============1301323434==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1301323434==--
