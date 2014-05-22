From: Daniel Melo Jorge da Cunha <dmjcunha-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: nouveau_object_new beginner question
Date: Thu, 22 May 2014 10:37:50 -0400
Message-ID: <CANbfre7VJESGRGj117npShqdk2kH6eoBecftwcX5WN-0uVP6UQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1572290595=="
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

--===============1572290595==
Content-Type: multipart/alternative; boundary=f46d044400e4ad474904f9fe0e3b

--f46d044400e4ad474904f9fe0e3b
Content-Type: text/plain; charset=UTF-8

I'm sorry for this beginner question but I can't understand.
File ../nouveau/nouveau.c, function nouveau_object_new.
Assuming data has content. First, obj->data = obj + 1. This is perfect
after the memcpy call.
But when: *(struct nouveau_object **)obj->data = obj;
I can't understand because now obj and obj->data has the same address,
while previously obj->data pointed exactly to the contents of data.
What am I missing?
Thanks in advance.

--f46d044400e4ad474904f9fe0e3b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><div><div><div><div><div>I&#39;m sorry for =
this beginner question but I can&#39;t understand.<br></div>File ../nouveau=
/nouveau.c, function nouveau_object_new.<br></div>Assuming data has content=
. First, obj-&gt;data =3D obj + 1. This is perfect<br>
</div>after the memcpy call.<br></div>But when<code>: *(struct nouveau_obje=
ct **)obj-&gt;data =3D obj;<br></code></div><code>I can&#39;t understand be=
cause now obj and obj-&gt;data has the same address,<br></code></div><code>=
while previously obj-&gt;data pointed exactly to the contents of data.<br>
</code></div><code>What am I missing?<br></code></div><code>Thanks in advan=
ce.<br></code></div>

--f46d044400e4ad474904f9fe0e3b--

--===============1572290595==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1572290595==--
